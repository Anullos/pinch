import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/presentation/l10n/generated/l10n.dart';
import '../../../shared/presentation/utils/text_styles.dart';
import '../../application/game_detail_cubit.dart';
import 'item_screentshot.dart';
import 'item_similar_game.dart';

class GameDetailsExtraInfo extends StatefulWidget {
  const GameDetailsExtraInfo({Key? key}) : super(key: key);

  @override
  State<GameDetailsExtraInfo> createState() => _GameDetailsExtraInfoState();
}

class _GameDetailsExtraInfoState extends State<GameDetailsExtraInfo> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameDetailCubit, GameDetailState>(
        builder: (context, state) {
      return state.gamesFailureOrSuccess.map(
        isNone: () => Container(),
        isLoading: () => const SizedBox(
          height: 200,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        isSuccess: (game) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (game.screenshots != null) ...[
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  S.of(context).screenshots,
                  style: sessionStyle(),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: game.screenshots!.length,
                  itemBuilder: (context, index) {
                    return ItemScreenshot(url: game.screenshots![index].url);
                  },
                ),
              ),
            ],
            if (game.similarGames != null) ...[
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  S.of(context).similarGames,
                  style: sessionStyle(),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  shrinkWrap: true,
                  itemCount: game.similarGames!.length,
                  itemBuilder: (context, index) {
                    final gameLite = game.similarGames![index];
                    return ItemSimilarGame(
                      gameLite: gameLite,
                    );
                  },
                ),
              ),
              const SizedBox(height: 100),
            ],
          ],
        ),
        isFailure: (failure) => Center(
          child: Text(
            failure.map(
              serverError: (_) => S.of(context).serverError,
            ),
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );
    });
  }
}
