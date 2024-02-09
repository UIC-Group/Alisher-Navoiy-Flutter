part of 'audio_bloc.dart';

abstract class AudioEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ToggleRepeat extends AudioEvent {}

class ToggleAudioBookMark extends AudioEvent {}

class GoToPreviousTrack extends AudioEvent {}

class GoToNextTrack extends AudioEvent {}

class TogglePlayPause extends AudioEvent {}
