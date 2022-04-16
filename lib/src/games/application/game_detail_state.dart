part of 'game_detail_cubit.dart';

class GameDetailState {
  final Resource<PinchFailure, GameModel> gamesFailureOrSuccess;
  final bool launchUrlError;
  GameDetailState({
    required this.gamesFailureOrSuccess,
    required this.launchUrlError,
  });

  factory GameDetailState.initial() => GameDetailState(
        gamesFailureOrSuccess: Resource.none(),
        launchUrlError: false,
      );

  GameDetailState copyWith({
    Resource<PinchFailure, GameModel>? gamesFailureOrSuccess,
    bool? launchUrlError,
  }) {
    return GameDetailState(
      gamesFailureOrSuccess:
          gamesFailureOrSuccess ?? this.gamesFailureOrSuccess,
      launchUrlError: launchUrlError ?? this.launchUrlError,
    );
  }

  @override
  String toString() =>
      'GameDetailState(gamesFailureOrSuccess: $gamesFailureOrSuccess, launchUrlError: $launchUrlError)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GameDetailState &&
        gamesFailureOrSuccess == other.gamesFailureOrSuccess &&
        launchUrlError == other.launchUrlError;
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      gamesFailureOrSuccess.hashCode ^
      launchUrlError.hashCode;
}
