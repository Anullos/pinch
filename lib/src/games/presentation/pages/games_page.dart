import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/games_cubit.dart';
import '../widgets/custom_body_delegate.dart';
import '../widgets/custom_header_delegate.dart';

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
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          controller: _controller,
          slivers: [
            SliverPersistentHeader(
              delegate: CustomHeaderDelegate(
                height: kToolbarHeight + 60 + 70,
                avatarSize: 60,
                minAvatarSize: 30,
                extraSpace: 70,
              ),
              pinned: true,
            ),
            const SliverToBoxAdapter(child: CustomBodyDelegate()),
          ],
        ),
      ),
    );
  }
}
