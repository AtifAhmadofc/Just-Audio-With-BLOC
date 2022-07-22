import 'dart:async';
import 'package:just_audio/just_audio.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Repo/radio_rapo.dart';

part 'radio_event.dart';
part 'radio_state.dart';

class RadioBloc extends Bloc<RadioEvent, RadioState> {
  RadioRepo radioRepo;
  RadioBloc({required this.radioRepo}) : super(RadioState()) {
    on<RadioInit>((event, emit) async {
      emit(RadioState(isLoading: true));
      await radioRepo.init(event.player);
      emit(RadioState(isLoading: false));

    });
    on<RadioSetUrlAndPlay>((event, emit) async {
      emit(RadioState(isLoading: true));
      await radioRepo.setUrl(event.player,event.url);
      await radioRepo.play(event.player,);
      emit(RadioState(isLoading: false,isPlaying: false));
    });

    on<RadioPause>((event, emit) async {
      emit(RadioState(isLoading: true));
      await radioRepo.pause(event.player);
      emit(RadioState(isLoading: false,isPlaying: false));

    });
    on<RadioPlay>((event, emit) async {
      emit(RadioState(isLoading: true));
      await radioRepo.play(event.player);
      emit(RadioState(isLoading: false,isPlaying: true));

    });
  }


}
