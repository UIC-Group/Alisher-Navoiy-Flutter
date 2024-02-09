import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'audio_event.dart';
part 'audio_state.dart';

class AudioBloc extends Bloc<AudioEvent, AudioState> {
  AudioBloc() : super(AudioState());

  @override
  Stream<AudioState> mapEventToState(
    AudioEvent event,
  ) async* {
    if (event is ToggleRepeat) {
      yield state.copyWith(
        shouldRepeat: !state.shouldRepeat,
      );
    } else if (event is ToggleAudioBookMark) {
      yield state.copyWith(
        isBookmarked: !state.isBookmarked,
      );
    } else if (event is GoToPreviousTrack) {
      yield state.copyWith(currentTrack: state.currentTrack - 1);
    } else if (event is GoToNextTrack) {
      yield state.copyWith(currentTrack: state.currentTrack + 1);
    } else if (event is TogglePlayPause) {
      yield state.copyWith(isPlaying: !state.isPlaying);
    }
  }
}
