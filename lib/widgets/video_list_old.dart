// import 'package:flutter/material.dart';
// import 'package:chewie/chewie.dart';
// import 'package:video_player/video_player.dart';

// class VideoList extends StatefulWidget {
//   const VideoList({Key? key, required this.videoPlayerController})
//       : super(key: key);

//   final VideoPlayerController videoPlayerController;

//   @override
//   _VideoListState createState() => _VideoListState();
// }

// class _VideoListState extends State<VideoList> {
//   late ChewieController _chewieController;
//   // late VideoPlayerController _controller;
//   // late Future<void> _initializeVideoPlayerFuture;

//   @override
//   void initState() {
//     super.initState();
//     _chewieController = ChewieController(
//         videoPlayerController: widget.videoPlayerController,
//         aspectRatio: widget.videoPlayerController.value.aspectRatio,
//         // autoInitialize: true,
//         errorBuilder: (context, errorMsg) {
//           return Center(
//             child: Text(
//               errorMsg,
//               style: Theme.of(context).textTheme.bodyText2,
//             ),
//           );
//         });
//     // _controller = widget.videoPlayerController;
//     // _initializeVideoPlayerFuture = _controller.initialize();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Chewie(
//         controller: _chewieController,
//       ),
//     );
//   }

//   // @override
//   // Widget build(BuildContext context) {
//   //   return // Use a FutureBuilder to display a loading spinner while waiting for the
//   //       // VideoPlayerController to finish initializing.
//   //       FutureBuilder(
//   //     future: _initializeVideoPlayerFuture,
//   //     builder: (context, snapshot) {
//   //       if (snapshot.connectionState == ConnectionState.done) {
//   //         // If the VideoPlayerController has finished initialization, use
//   //         // the data it provides to limit the aspect ratio of the video.
//   //         return AspectRatio(
//   //           aspectRatio: _controller.value.aspectRatio,
//   //           // Use the VideoPlayer widget to display the video.
//   //           child: VideoPlayer(_controller),
//   //         );
//   //       } else {
//   //         // If the VideoPlayerController is still initializing, show a
//   //         // loading spinner.
//   //         return const Center(
//   //           child: CircularProgressIndicator(),
//   //         );
//   //       }
//   //     },
//   //   );
//   // }

//   @override
//   void dispose() {
//     super.dispose();
//     widget.videoPlayerController.dispose();
//     // _controller.dispose();
//     _chewieController.dispose();
//   }
// }
