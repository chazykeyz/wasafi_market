import 'dart:math' as math;

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:transformer_page_view/transformer_page_view.dart';
import 'package:vector_math/vector_math_64.dart';

final transformers = [
  AccordionTransformer(),
  ThreeDTransformer(),
  ZoomInPageTransformer(),
  ZoomOutPageTransformer(),
  DeepthPageTransformer(),
];

class AccordionTransformer extends PageTransformer {
  @override
  Widget transform(Widget child, TransformInfo info) {
    double position = info.position;
    if (position < 0.0) {
      return Transform.scale(
        scale: 1 + position,
        alignment: Alignment.topRight,
        child: child,
      );
    } else {
      return Transform.scale(
        scale: 1 - position,
        alignment: Alignment.bottomLeft,
        child: child,
      );
    }
  }
}

class ThreeDTransformer extends PageTransformer {
  @override
  Widget transform(Widget child, TransformInfo info) {
    double position = info.position;
    double height = info.height;
    double width = info.width;
    double pivotX = 0.0;
    if (position < 0 && position >= -1) {
      // left scrolling
      pivotX = width;
    }
    return Transform(
      transform: Matrix4.identity()
        ..rotate(Vector3(0.0, 2.0, 0.0), position * 1.5),
      origin: Offset(pivotX, height / 2),
      child: child,
    );
  }
}

class ZoomInPageTransformer extends PageTransformer {
  static const double zoomMax = 0.5;
  @override
  Widget transform(Widget child, TransformInfo info) {
    double position = info.position;
    double width = info.width;
    if (position > 0 && position <= 1) {
      return Transform.translate(
        offset: Offset(-width * position, 0.0),
        child: Transform.scale(
          scale: 1 - position,
          child: child,
        ),
      );
    }
    return child;
  }
}

class ZoomOutPageTransformer extends PageTransformer {
  static const double minScale = 0.85;
  static const double minAlpha = 0.5;

  @override
  Widget transform(Widget child, TransformInfo info) {
    double position = info.position;
    double pageWidth = info.width;
    double pageHeight = info.height;

    if (position < -1) {
      // [-Infinity,-1)
      // This page is way off-screen to the left.
      //view.setAlpha(0);
    } else if (position <= 1) {
      // [-1,1]
      // Modify the default slide transition to
      // shrink the page as well
      double scaleFactor = math.max(minScale, 1 - position.abs());
      double vertMargin = pageHeight * (1 - scaleFactor) / 2;
      double horzMargin = pageWidth * (1 - scaleFactor) / 2;
      double dx;
      if (position < 0) {
        dx = (horzMargin - vertMargin / 2);
      } else {
        dx = (-horzMargin + vertMargin / 2);
      }
      // Scale the page down (between minScale and 1)
      double opacity =
          minAlpha + (scaleFactor - minScale) / (1 - minScale) * (1 - minAlpha);

      return Opacity(
        opacity: opacity,
        child: Transform.translate(
          offset: Offset(dx, 0.0),
          child: Transform.scale(
            scale: scaleFactor,
            child: child,
          ),
        ),
      );
    } else {
      // (1,+Infinity]
      // This page is way off-screen to the right.
      // view.setAlpha(0);
    }

    return child;
  }
}

class DeepthPageTransformer extends PageTransformer {
  DeepthPageTransformer() : super(reverse: true);

  @override
  Widget transform(Widget child, TransformInfo info) {
    double position = info.position;
    if (position <= 0) {
      return Opacity(
        opacity: 1.0,
        child: Transform.translate(
          offset: const Offset(0.0, 0.0),
          child: Transform.scale(
            scale: 1.0,
            child: child,
          ),
        ),
      );
    } else if (position <= 1) {
      const double minScale = 0.75;
      // Scale the page down (between minScale and 1)
      double scaleFactor = minScale + (1 - minScale) * (1 - position);

      return Opacity(
        opacity: 1.0 - position,
        child: Transform.translate(
          offset:
              Offset(0.0, -position * info.height), // info.width * -position
          child: Transform.scale(
            scale: scaleFactor,
            child: child,
          ),
        ),
      );
    }

    return child;
  }
}
