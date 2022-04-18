import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/presentation/l10n/generated/l10n.dart';
import '../../../shared/presentation/utils/pinch_colors.dart';
import '../../application/game_detail_cubit.dart';
import '../../domain/games_repository_interface.dart';
import '../../domain/models/game_lite_model.dart';
import '../widgets/custom_button_widget.dart';
import '../widgets/game_details_extrainfo.dart';
import '../widgets/game_details_header.dart';

class GameDetailsPage extends StatelessWidget {
  const GameDetailsPage({Key? key, required this.gameLite}) : super(key: key);
  final GameLiteModel gameLite;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GameDetailCubit>(
      create: (context) => GameDetailCubit(
        gamesRepository: context.read<GamesRepositoryInterface>(),
      )..getGameDetail(gameLite.id),
      child: Scaffold(
        backgroundColor: PinchColors.background,
        appBar: AppBar(
          title: Text(S.of(context).detailsGame),
          backgroundColor: PinchColors.background,
        ),
        body: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Full screen
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    // Header
                    GameDetailsHeader(gameLite: gameLite),
                    // Body extra info
                    const GameDetailsExtraInfo(),
                  ],
                ),
              ),
              // Button to go to page game
              Positioned(
                left: 0,
                right: 0,
                bottom: 20,
                child: Center(
                  child: SizedBox(
                    width: 200,
                    child: Builder(builder: (context) {
                      return BlocListener<GameDetailCubit, GameDetailState>(
                        listener: (context, state) {
                          if (state.launchUrlError) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                S.of(context).cantToLauncher,
                              ),
                            ));
                          }
                        },
                        child: CustomButtonWidget(
                          isLoading: false,
                          text: S.of(context).goToPage,
                          onTap: context.read<GameDetailCubit>().goToPage,
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
