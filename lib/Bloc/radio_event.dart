
part of 'radio_bloc.dart';

@immutable
abstract class RadioEvent {}
class RadioInit extends RadioEvent {
  AudioPlayer player;
  RadioInit({required this.player});
}

class RadioSetUrlAndPlay extends RadioEvent {
  AudioPlayer player;
  String url;
  RadioSetUrlAndPlay({required this.player,required this.url});
}

class RadioPause extends RadioEvent {
  AudioPlayer player;
  RadioPause({required this.player});
}


class RadioResume extends RadioEvent {
  AudioPlayer player;
  RadioResume({required this.player});
}


class RadioPlay extends RadioEvent {
  AudioPlayer player;
  RadioPlay({required this.player});
}

