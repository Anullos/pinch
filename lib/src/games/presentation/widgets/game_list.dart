import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../routes.dart';
import '../../../shared/presentation/l10n/generated/l10n.dart';
import '../../application/games_cubit.dart';
import 'item_game_list.dart';

class GameList extends StatelessWidget {
  const GameList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GamesCubit, GamesState>(listener: (_, state) {
      if (state.gamesFailureOrSuccess.isFailure) {
        state.gamesFailureOrSuccess.whenIsFailure(
          (failure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                failure.map(
                  serverError: (_) => S.of(context).serverError,
                ),
              ),
            ));
          },
        );
      }
    }, builder: (_, stateGames) {
      return stateGames.gamesList.isEmpty &&
              !stateGames.gamesFailureOrSuccess.isLoading
          ? Container(
              height: 300,
              alignment: Alignment.center,
              child: Text(
                S.of(context).thereNotGames,
                style: Theme.of(context).textTheme.headline6,
              ),
            )
          : ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: stateGames.gamesList.length,
              itemBuilder: (context, index) {
                final game = stateGames.gamesList[index];
                return ItemGameList(
                  index: index,
                  game: game,
                  onTap: () => Navigator.pushNamed(context, gameDetailsRoute,
                      arguments: game),
                );
              },
            );
    });
  }
}
