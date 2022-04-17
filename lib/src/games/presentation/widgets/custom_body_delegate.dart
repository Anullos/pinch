import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/presentation/l10n/generated/l10n.dart';
import '../../application/games_cubit.dart';
import 'game_list.dart';

class CustomBodyDelegate extends StatelessWidget {
  const CustomBodyDelegate({Key? key, required this.controller})
      : super(key: key);
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await context.read<GamesCubit>().getGames();
      },
      child: SingleChildScrollView(
        controller: controller,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const GameList(),
            BlocBuilder<GamesCubit, GamesState>(
              builder: (_, stateGames) {
                return Column(
                  children: [
                    // when the _loadMore function is running
                    if (stateGames.isLoadMoreRunning ||
                        stateGames.gamesFailureOrSuccess.isLoading)
                      const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 40),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    // When nothing else to load
                    if (!stateGames.hasNextPage)
                      Container(
                        padding: const EdgeInsets.only(top: 30, bottom: 30),
                        color: Colors.amber,
                        child: Center(
                          child: Text(S.of(context).youHaveFetchedAllContent),
                        ),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
