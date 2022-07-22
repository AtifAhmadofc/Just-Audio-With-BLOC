import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_with_block/Screens/Widgets/radio_controlls.dart';
import 'Widgets/radio_button.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {

  final _player = AudioPlayer();
  @override
  void initState() {
    super.initState();

    // _init();
  }

  // Future<void> _init() async {
  //   // Inform the operating system of our app's audio attributes etc.
  //   // We pick a reasonable default for an app that plays speech.
  //   final session = await AudioSession.instance;
  //   await session.configure(const AudioSessionConfiguration.speech());
  //   // Listen to errors during playback.
  //   _player.playbackEventStream.listen((event) {},
  //       onError: (Object e, StackTrace stackTrace) {
  //         print('A stream error occurred: $e');
  //       });
  //   // Try to load audio from a source and catch any errors.
  //   // try {
  //   //   await _player.setAudioSource(AudioSource.uri(
  //   //       Uri.parse("https://stream-uk1.radioparadise.com/aac-320")));
  //   // } catch (e) {
  //   //   print("Error loading audio source: $e");
  //   // }
  // }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _player.stop();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder<IcyMetadata?>(
                stream: _player.icyMetadataStream,
                builder: (context, snapshot) {
                  final metadata = snapshot.data;
                  final title = metadata?.info?.title ?? '';
                  final url = metadata?.info?.url;
                  return Column(
                    children: [
                      if (url != null) Image.network(url),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(title,
                            style: Theme.of(context).textTheme.headline6),
                      ),
                    ],
                  );
                },
              ),
              // Display play/pause button and volume/speed sliders.
              ControlButtons(_player),
              Radio_Controls(player: _player,radioUrlList:["a","b","c","d"])
            ],
          ),
        ),
      ),
    );
  }
}
