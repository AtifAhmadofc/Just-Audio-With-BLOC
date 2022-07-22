part of 'radio_bloc.dart';

@immutable

class RadioState {
  RadioState({
    this.isPlaying=false,
    this.isLoading=false,
    this.error=false
  });
  final bool? isPlaying;
  final bool? isLoading;
  final bool? error;

  RadioState copyWith({
    bool? isLoading,
    bool? isPlaying,
    bool? error,
  }) {
    return RadioState(
      isLoading: isLoading ?? this.isLoading,
      isPlaying: isPlaying ?? this.isPlaying,
      error: error ?? this.error,
    );
  }

}
