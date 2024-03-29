import 'dart:math';

import 'package:flutter/material.dart';
import '../assets.dart';
import '../auth/auth.dart';
import '../models/function.dart';
import '../models/trending.dart';

class DeluxaAppBar extends StatefulWidget {
  final String? api;
  final ThemeData themeData;


  const DeluxaAppBar({
    Key? key,
    this.api, required this.themeData,
  }) : super(key: key);

  @override
  State<DeluxaAppBar> createState() => _DeluxaAppBarState();
}

class _DeluxaAppBarState extends State<DeluxaAppBar> {
  List<TrendingResults>? trendingResults;

  @override
  void initState() {
    fetchTrending(widget.api!).then((value) => {
          setState(() {
            trendingResults = value;
          })
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    int randomNumber;
    trendingResults != null
        ? randomNumber = random.nextInt(trendingResults!.length)
        : randomNumber = 1;
    String? img, text, overview;
    trendingResults == null
        ? img = "/pdfCr8W0wBCpdjbZXSxnKhZtosP.jpg"
        : img = trendingResults![randomNumber].backdropPath;
    if (trendingResults != null) {
      if (trendingResults![randomNumber].name == null) {
        text = trendingResults![randomNumber].title;
      } else if (trendingResults![randomNumber].title == null) {
        text = trendingResults![randomNumber].name;
      } else {
        text = "Movie Name";
      }
      overview= trendingResults![randomNumber].overview;
    }

    return SliverAppBar(
      expandedHeight: 300,
      foregroundColor: const Color(0xfff4d35e),
      backgroundColor: const Color(0xff1f271b),
      pinned: true,
      // snap: true,

      shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(60),
              bottomRight: Radius.circular(60))),
      flexibleSpace: headerWidget(text: text, img: img,theme: widget.themeData, overview: overview,),
    );
  }
}

// ignore: camel_case_types
class headerWidget extends StatelessWidget {
  // var themeData;
  final ThemeData theme;

  const headerWidget({
    Key? key,
    required this.text,
    required this.img, required this.theme, required this.overview,
  }) : super(key: key);

  final String? text;
  final String? img;
  final String? overview;

  @override
  Widget build(BuildContext context) {
    double sigmaX = 4.0; // from 0-10
    double sigmaY = 4.0; // from 0-10
    double opacity = 0.2; // from 0-1.0
    double width = MediaQuery.of(context).size.width;
    double height = 100;
    double blurWidth = width;
    double blurHeight = height / 2;
    return FlexibleSpaceBar(
      // titlePadding:
      //     const EdgeInsetsDirectional.only(start: 16.0, bottom: 16.0),
      centerTitle: true,
      title: Text("Deluxa", style: TextStyle(color: theme.colorScheme.onPrimary)),

      // ClipRRect added here for rounded corners
      background: Stack(
        alignment: AlignmentDirectional.center,
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
            child: img == null
                ? Image.asset(
                    'assets/images/na.jpg',
                    fit: BoxFit.cover,
                  )
                : FadeInImage(
                  width: double.infinity,
                    height: double.infinity,
                    image: NetworkImage(
                      '${baseImageURL}original/$img',
                    ),
                    fit: BoxFit.cover,
                    placeholder: const AssetImage(Assets.loading),

                  ),
          ),
          // Positioned(
          //   top: 20,
          //   left: 0,
          //   width: blurWidth,
          //   height: blurHeight,
          //   // Note: without ClipRect, the blur region will be expanded to full
          //   // size of the Image instead of custom size
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 50),
          //     child: ClipRRect(
          //       borderRadius: const BorderRadius.all(Radius.circular(10)),
          //       child: BackdropFilter(
          //         filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
          //         child: Container(
          //           color: const Color(0xff1f271b).withOpacity(opacity),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // text == null
          //     ? Image.asset(Assets.loading)
          //     : Container(
          //         alignment: Alignment.topCenter,
          //         child: Padding(
          //           padding: const EdgeInsets.only(top: 30.0),
          //           child: Text(
          //             text!,
          //             style: TextStyle(color: theme.colorScheme.onPrimary),
          //           ),
          //         ),
          //       ),
          // overview == null
          //     ? Image.asset(Assets.loading)
          //     : Container(
          //         alignment: Alignment.topCenter,
          //         child: Padding(
          //           padding: const EdgeInsets.all(60.0),
          //           child: Text(
          //             overview!,
          //             style: theme.textTheme.displayMedium,
          //           ),
          //         ),
          //       ),
          // ContentList(title: 'Trending',  api: Endpoints.getTrendingUrl(), genres: [], themeData: theme)
        ],
      ),
    );
  }
}
