import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final VideoPlayerController _videoPlayerController;
  ChewieController? chewieController;
  @override
  void initState() {
    super.initState();
  }
    void _initPLayer() async {
    _videoPlayerController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');

    await _videoPlayerController.initialize();
    chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        autoPlay: true,
        looping: true,
        additionalOptions: (context) {
          return <OptionItem>[
            OptionItem(
                onTap: () => debugPrint('My option works'),
                iconData: Icons.home,
                title: 'titile'),
            OptionItem(
                onTap: () => debugPrint('2nd'),
                iconData: Icons.access_alarm,
                title: 'hello')
          ];
        });
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _videoPlayerController.dispose();
    chewieController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: chewieController!=null?Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Chewie(controller: chewieController!),
      ):const Center(child: CircularProgressIndicator(),)
      )
      );
  }


}
