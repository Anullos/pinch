import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'src/auth/application/auth_cubit.dart';
import 'src/auth/domain/auth_repository_interface.dart';
import 'src/auth/infrastructure/auth_repository_implements.dart';
import 'src/games/application/game_detail_cubit.dart';
import 'src/games/application/games_cubit.dart';
import 'src/games/domain/games_repository_interface.dart';
import 'src/games/infrastructure/local_games_repository_implements.dart';
import 'src/games/infrastructure/remote_games_repository_implements.dart';
import 'src/network/application/network_cubit.dart';
import 'src/network/domain/types/connection_type.dart';
import 'src/shared/config/cubits_logger.dart';
import 'src/shared/database/database.dart';
import 'src/shared/infrastructure/providers.dart';
import 'src/shared/presentation/l10n/generated/l10n.dart';
import 'routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final callback = Callback(
    onCreate: (database, version) {
      debugPrint('Database created');
    },
    onOpen: (database) {
      debugPrint('Database open');
    },
    onUpgrade: (database, startVersion, endVersion) {
      debugPrint('Database upgrade');
    },
  );
  final database = await $FloorAppDatabase
      .databaseBuilder(
        'pinch_database2.db',
      )
      .addCallback(callback)
      .build();
  BlocOverrides.runZoned(
    () {
      AuthCubit;
      NetworkCubit;
      GamesCubit;
      GameDetailCubit;
      runApp(MyApp(
        database: database,
      ));
    },
    blocObserver: CubitsLogger(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.database}) : super(key: key);
  final AppDatabase database;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepositoryInterface>(
          create: (_) => AuthRepositoryImplements(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthCubit>(
            create: (context) => AuthCubit(
              authRepository: context.read<AuthRepositoryInterface>(),
            )..isAuthenticated(),
          ),
          BlocProvider<NetworkCubit>(
            create: (context) => NetworkCubit(Connectivity())..initCubit(),
          ),
        ],
        child:
            BlocBuilder<NetworkCubit, NetworkState>(builder: (_, stateNetwork) {
          return RepositoryProvider<GamesRepositoryInterface>(
            create: (_) => (stateNetwork.connectionType is ConnectionTypeNone)
                ? LocalGamesRepositoryImplements(database)
                : RemoteGamesRepositoryImplements(dioInstanceClient, database),
            child: BlocProvider<GamesCubit>(
              create: (context) => GamesCubit(
                gamesRepository: context.read<GamesRepositoryInterface>(),
              ),
              child: MaterialApp(
                title: 'Pinch Assignment',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  S.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                onGenerateRoute: AppRouter.onGenerateRoute,
                initialRoute: splashRoute,
              ),
            ),
          );
        }),
      ),
    );
  }
}
