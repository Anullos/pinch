import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/presentation/l10n/generated/l10n.dart';
import '../../application/games_cubit.dart';
import '../widgets/custom_header_delegate.dart';
import '../widgets/game_list.dart';

class GamesPage extends StatefulWidget {
  const GamesPage({Key? key}) : super(key: key);

  @override
  State<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  late ScrollController _controller;
  late GamesCubit _gamesCubit;

  @override
  void initState() {
    final _gamesCubit = context.read<GamesCubit>();
    _controller = ScrollController();
    super.initState();
    _gamesCubit.getGames();
    _controller.addListener(() async {
      await _gamesCubit.loadMore(_controller.position.extentAfter);
    });
  }

  @override
  void dispose() {
    _controller.removeListener(
        () => _gamesCubit.loadMore(_controller.position.extentAfter));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gamesCubit = context.read<GamesCubit>();
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverPersistentHeader(
                delegate: CustomHeaderDelegate(
                  height: kToolbarHeight + 60 + 70,
                  avatarSize: 60,
                  minAvatarSize: 30,
                  extraSpace: 70,
                ),
                pinned: true,
              ),
            ];
          },
          body: RefreshIndicator(
            onRefresh: () async {
              await gamesCubit.getGames();
            },
            child: SingleChildScrollView(
              controller: _controller,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const GameList(),
                  BlocBuilder<GamesCubit, GamesState>(
                    builder: (_, stateGames) {
                      return Column(
                        children: [
                          // when the _loadMore function is running
                          if (stateGames.isLoadMoreRunning)
                            const Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 40),
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          // When nothing else to load
                          if (!stateGames.hasNextPage)
                            Container(
                              padding:
                                  const EdgeInsets.only(top: 30, bottom: 30),
                              color: Colors.amber,
                              child: Center(
                                child: Text(
                                    S.of(context).youHaveFetchedAllContent),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
