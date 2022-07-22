import 'package:audio_session/audio_session.dart';
import 'package:just_audio/just_audio.dart';



class RadioRepo{

  Future<void> init( AudioPlayer _player) async {
    // Inform the operating system of our app's audio attributes etc.
    // We pick a reasonable default for an app that plays speech.
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    // Listen to errors during playback.
    _player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
          print('A stream error occurred: $e');
        });
    // Try to load audio from a source and catch any errors.
    // try {
    //   await _player.setAudioSource(AudioSource.uri(
    //       Uri.parse("https://stream-uk1.radioparadise.com/aac-320")));
    // } catch (e) {
    //   print("Error loading audio source: $e");
    // }
  }

  Future<void> setUrl( AudioPlayer _player,String url) async {
    await _player.setUrl(url);
  }

  Future<void> play( AudioPlayer _player,) async {
    if(_player.playing)
      {
        await _player.pause();
      }
    await _player.play();
  }

  Future<void> pause( AudioPlayer _player) async {
    await _player.pause();
  }
}