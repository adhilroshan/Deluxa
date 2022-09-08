import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflix_flutter/widgets/video_list.dart';

class VideoSlider extends StatelessWidget {
  const VideoSlider({Key? key, required this.list}) : super(key: key);
  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 300.0,
        enlargeCenterPage: true,
        // autoPlay: true,
        initialPage: 0,
        scrollDirection: Axis.horizontal,
        scrollPhysics: const BouncingScrollPhysics(),
        // pauseAutoPlayOnTouch: true,
        aspectRatio: 16 / 9,
        // autoPlayCurve: Curves.fastOutSlowIn,
        // enableInfiniteScroll: true,
        // autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
      items: list.map((element) {
        return Builder(
          builder: (BuildContext context) {
            return VideoList(trailerKey: element);
          },
        );
      }).toList(),
    );
  }
}
