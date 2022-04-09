import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Swiper(
        autoplay: true,
        autoplayDelay: 2000,
        loop: true,
        itemWidth: MediaQuery.of(context).size.width,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              "https://images.unsplash.com/photo-1649291550638-0dec4995db3a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2232&q=80",
              fit: BoxFit.fill,
            ),
          );
        },
        itemCount: 3,
        itemHeight: 250.0,
        layout: SwiperLayout.TINDER,
      ),
    );
  }
}
