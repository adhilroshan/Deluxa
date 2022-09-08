import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoList extends StatefulWidget {
  const VideoList({
    Key? key,
    required this.trailerKey,
  }) : super(key: key);
  final String trailerKey;

  @override
  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  YoutubePlayerController? _ytbPlayerController;

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = YoutubePlayerController(
  //     initialVideoId: 'tcodrIK2P_I',
  //     params: YoutubePlayerParams(
  //       playlist: [
  //         'nPt8bK2gbaU',
  //         'K18cpp_-gP8',
  //         'iLnmTe5Q2Qw',
  //         '_WoCV4c6XOE',
  //         'KmzdUe0RSJo',
  //         '6jZDSSZZxjQ',
  //         'p2lYr3vM_1w',
  //         '7QUtEmBT_-w',
  //         '34_PXCzGw1M',
  //       ],
  //       startAt: const Duration(minutes: 1, seconds: 36),
  //       showControls: true,
  //       showFullscreenButton: true,
  //       desktopMode: Responsive.isDesktop(context) ? true : false,
  //       privacyEnhanced: true,
  //       useHybridComposition: true,
  //     ),
  //   );
  //   _controller.onEnterFullscreen = () {
  //     SystemChrome.setPreferredOrientations([
  //       DeviceOrientation.landscapeLeft,
  //       DeviceOrientation.landscapeRight,
  //     ]);
  //     print('Entered Fullscreen');
  //   };
  //   _controller.onExitFullscreen = () {
  //     print('Exited Fullscreen');
  //   };
  // }
  @override
  void initState() {
    super.initState();

    // _setOrientation([
    //   DeviceOrientation.landscapeRight,
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _ytbPlayerController = YoutubePlayerController(
          initialVideoId: widget.trailerKey,
          params: const YoutubePlayerParams(
            showFullscreenButton: true,
            autoPlay: false,
            // useHybridComposition: true,
            enableJavaScript: true,
            enableKeyboard: true,
            privacyEnhanced: true,

            // playlist: widget.trailerPlaylist,
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: _ytbPlayerController == null
          ? const CircularProgressIndicator()
          : YoutubePlayerControllerProvider(
              controller: _ytbPlayerController!,
              child: YoutubePlayerIFrame(
                controller: _ytbPlayerController,
                aspectRatio: 16 / 9,
              ),
            ),
    );
  }

  @override
  void dispose() {
    _ytbPlayerController?.close();
    super.dispose();
  }
}
