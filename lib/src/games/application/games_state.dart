part of 'games_cubit.dart';

class GamesState {
  final int page;
  final int limit;
  final List<GameLiteModel> gamesList;
  final bool isFirstLoadRunning;
  final bool isLoadMoreRunning;
  final bool hasNextPage;
  final Resource<PinchFailure, List<GameLiteModel>> gamesFailureOrSuccess;
  GamesState({
    required this.page,
    required this.limit,
    required this.gamesList,
    required this.isFirstLoadRunning,
    required this.isLoadMoreRunning,
    required this.hasNextPage,
    required this.gamesFailureOrSuccess,
  });

  factory GamesState.initial() => GamesState(
        page: 1,
        limit: 10,
        gamesList: [],
        isFirstLoadRunning: true,
        isLoadMoreRunning: false,
        hasNextPage: true,
        gamesFailureOrSuccess: Resource.none(),
      );

  GamesState copyWith({
    int? page,
    int? limit,
    List<GameLiteModel>? gamesList,
    bool? isFirstLoadRunning,
    bool? isLoadMoreRunning,
    bool? hasNextPage,
    Resource<PinchFailure, List<GameLiteModel>>? gamesFailureOrSuccess,
  }) {
    return GamesState(
      page: page ?? this.page,
      limit: limit ?? this.limit,
      gamesList: gamesList ?? this.gamesList,
      isFirstLoadRunning: isFirstLoadRunning ?? this.isFirstLoadRunning,
      isLoadMoreRunning: isLoadMoreRunning ?? this.isLoadMoreRunning,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      gamesFailureOrSuccess:
          gamesFailureOrSuccess ?? this.gamesFailureOrSuccess,
    );
  }

  @override
  String toString() =>
      'GamesState(page: $page, limit: $limit, gamesList: $gamesList, isFirstLoadRunning: $isFirstLoadRunning, isLoadMoreRunning: $isLoadMoreRunning, hasNextPage: $hasNextPage, gamesFailureOrSuccess: $gamesFailureOrSuccess)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GamesState &&
        page == other.page &&
        limit == other.limit &&
        listEquals(gamesList, other.gamesList) &&
        isFirstLoadRunning == other.isFirstLoadRunning &&
        isLoadMoreRunning == other.isLoadMoreRunning &&
        hasNextPage == other.hasNextPage &&
        gamesFailureOrSuccess == other.gamesFailureOrSuccess;
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      page.hashCode ^
      limit.hashCode ^
      gamesList.hashCode ^
      isFirstLoadRunning.hashCode ^
      isLoadMoreRunning.hashCode ^
      hasNextPage.hashCode ^
      gamesFailureOrSuccess.hashCode;
}
