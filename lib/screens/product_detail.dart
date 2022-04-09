import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          backgroundColor: Colors.black,
          leading: const Icon(CupertinoIcons.chevron_back),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.hand_thumbsup))
          ],
          pinned: true,
          collapsedHeight: 400,
          flexibleSpace: Swiper(
            autoplay: true,
            autoplayDelay: 2000,
            loop: true,
            itemWidth: MediaQuery.of(context).size.width,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: Image.network(
                  "https://images.pexels.com/photos/7679682/pexels-photo-7679682.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                  fit: BoxFit.fill,
                ),
              );
            },
            itemCount: 3,
          ),
        )
      ]),
    );
  }
}
