part of 'audio_bloc.dart';

class AudioState extends Equatable {
  final bool shouldRepeat;
  final bool isBookmarked;
  final bool isPlaying;
  final int currentTrack;

  AudioState({
    this.shouldRepeat = false,
    this.isBookmarked = false,
    this.isPlaying = true,
    this.currentTrack = 1,
  });
  @override
  List<Object> get props => [
        shouldRepeat,
        isBookmarked,
        isPlaying,
        currentTrack,
      ];

  AudioState copyWith({
    bool shouldRepeat,
    bool isBookmarked,
    bool isPlaying,
    int currentTrack,
  }) {
    return AudioState(
      shouldRepeat: shouldRepeat ?? this.shouldRepeat,
      isBookmarked: isBookmarked ?? this.isBookmarked,
      isPlaying: isPlaying ?? this.isPlaying,
      currentTrack: currentTrack ?? this.currentTrack,
    );
  }
}
