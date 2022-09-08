// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:netflix_flutter/auth/auth.dart';

import '../models/models.dart';
import '../screens/cast&crew.dart';

class ScrollingArtists extends StatefulWidget {
  final ThemeData? themeData;
  final String? api, title, tapButtonText;
  final Function(Cast)? onTap;
  const ScrollingArtists(
      {Key? key, this.themeData, this.api, this.title, this.tapButtonText, this.onTap}) : super(key: key);
  @override
  _ScrollingArtistsState createState() => _ScrollingArtistsState();
}

class _ScrollingArtistsState extends State<ScrollingArtists> {
  Credits? credits;
  @override
  void initState() {
    super.initState();
    fetchCredits(widget.api!).then((value) {
      setState(() {
        credits = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        credits == null
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Text(widget.title!,
                        style: widget.themeData!.textTheme.bodyLarge),
                  ],
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.title!,
                        style: widget.themeData!.textTheme.bodyLarge),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CastAndCrew(
                                    themeData: widget.themeData,
                                    credits: credits,
                                  )));
                    },
                    child: Text(widget.tapButtonText!,
                        style: widget.themeData!.textTheme.bodySmall),
                  ),
                ],
              ),
        SizedBox(
          width: double.infinity,
          height: 120,
          child: credits == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: credits!.cast!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          widget.onTap!(credits!.cast![index]);
                        },
                        child: SizedBox(
                          width: 80,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: SizedBox(
                                  width: 70,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: credits!.cast![index].profilePath ==
                                            null
                                        ? Image.asset(
                                            'assets/images/na.jpg',
                                            fit: BoxFit.cover,
                                          )
                                        : FadeInImage(
                                            image: NetworkImage(
                                                '${baseImageURL}w500/${credits!.cast![index]
                                                        .profilePath!}'),
                                            fit: BoxFit.cover,
                                            placeholder: const AssetImage(
                                                'assets/images/loading.gif'),
                                          ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  credits!.cast![index].name!,
                                  style: widget.themeData!.textTheme.bodySmall,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
