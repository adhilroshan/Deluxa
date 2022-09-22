import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../widgets/video_list.dart';

class VideoSlider extends StatelessWidget {
  const VideoSlider({Key? key, required this.list}) : super(key: key);
  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 250.0,
        pageSnapping: true,
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
        clipBehavior: Clip.antiAliasWithSaveLayer,
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
