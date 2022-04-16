abstract class GameCategoryType {
  const GameCategoryType();
  factory GameCategoryType.mainGame() = GameCategoryTypeMainGame;
  factory GameCategoryType.dlcAddon() = GameCategoryTypeDlcAddon;
  factory GameCategoryType.expansion() = GameCategoryTypeExpansion;
  factory GameCategoryType.bundle() = GameCategoryTypeBundle;
  factory GameCategoryType.standaloneExpansion() =
      GameCategoryTypeStandaloneExpansion;
  factory GameCategoryType.mod() = GameCategoryTypeMod;
  factory GameCategoryType.episode() = GameCategoryTypeEpisode;
  factory GameCategoryType.season() = GameCategoryTypeSeason;
  factory GameCategoryType.remake() = GameCategoryTypeRemake;
  factory GameCategoryType.remaster() = GameCategoryTypeRemaster;
  factory GameCategoryType.expandedGame() = GameCategoryTypeExpandedGame;
  factory GameCategoryType.port() = GameCategoryTypePort;
  factory GameCategoryType.fork() = GameCategoryTypeFork;

  void when({
    required void Function(GameCategoryTypeMainGame) mainGame,
    required void Function(GameCategoryTypeDlcAddon) dlcAddon,
    required void Function(GameCategoryTypeExpansion) expansion,
    required void Function(GameCategoryTypeBundle) bundle,
    required void Function(GameCategoryTypeStandaloneExpansion)
        standaloneExpansion,
    required void Function(GameCategoryTypeMod) mod,
    required void Function(GameCategoryTypeEpisode) episode,
    required void Function(GameCategoryTypeSeason) season,
    required void Function(GameCategoryTypeRemake) remake,
    required void Function(GameCategoryTypeRemaster) remaster,
    required void Function(GameCategoryTypeExpandedGame) expandedGame,
    required void Function(GameCategoryTypePort) port,
    required void Function(GameCategoryTypeFork) fork,
  }) {
    if (this is GameCategoryTypeMainGame) {
      mainGame.call(this as GameCategoryTypeMainGame);
    }

    if (this is GameCategoryTypeDlcAddon) {
      dlcAddon.call(this as GameCategoryTypeDlcAddon);
    }

    if (this is GameCategoryTypeExpansion) {
      expansion.call(this as GameCategoryTypeExpansion);
    }

    if (this is GameCategoryTypeBundle) {
      bundle.call(this as GameCategoryTypeBundle);
    }

    if (this is GameCategoryTypeStandaloneExpansion) {
      standaloneExpansion.call(this as GameCategoryTypeStandaloneExpansion);
    }

    if (this is GameCategoryTypeMod) {
      mod.call(this as GameCategoryTypeMod);
    }

    if (this is GameCategoryTypeEpisode) {
      episode.call(this as GameCategoryTypeEpisode);
    }

    if (this is GameCategoryTypeSeason) {
      season.call(this as GameCategoryTypeSeason);
    }

    if (this is GameCategoryTypeRemake) {
      remake.call(this as GameCategoryTypeRemake);
    }

    if (this is GameCategoryTypeRemaster) {
      remaster.call(this as GameCategoryTypeRemaster);
    }

    if (this is GameCategoryTypeExpandedGame) {
      expandedGame.call(this as GameCategoryTypeExpandedGame);
    }

    if (this is GameCategoryTypePort) {
      port.call(this as GameCategoryTypePort);
    }

    if (this is GameCategoryTypeFork) {
      fork.call(this as GameCategoryTypeFork);
    }

    mainGame.call(this as GameCategoryTypeMainGame);
  }

  R map<R>({
    required R Function(GameCategoryTypeMainGame) mainGame,
    required R Function(GameCategoryTypeDlcAddon) dlcAddon,
    required R Function(GameCategoryTypeExpansion) expansion,
    required R Function(GameCategoryTypeBundle) bundle,
    required R Function(GameCategoryTypeStandaloneExpansion)
        standaloneExpansion,
    required R Function(GameCategoryTypeMod) mod,
    required R Function(GameCategoryTypeEpisode) episode,
    required R Function(GameCategoryTypeSeason) season,
    required R Function(GameCategoryTypeRemake) remake,
    required R Function(GameCategoryTypeRemaster) remaster,
    required R Function(GameCategoryTypeExpandedGame) expandedGame,
    required R Function(GameCategoryTypePort) port,
    required R Function(GameCategoryTypeFork) fork,
  }) {
    if (this is GameCategoryTypeMainGame) {
      return mainGame.call(this as GameCategoryTypeMainGame);
    }

    if (this is GameCategoryTypeDlcAddon) {
      return dlcAddon.call(this as GameCategoryTypeDlcAddon);
    }

    if (this is GameCategoryTypeExpansion) {
      return expansion.call(this as GameCategoryTypeExpansion);
    }

    if (this is GameCategoryTypeBundle) {
      return bundle.call(this as GameCategoryTypeBundle);
    }

    if (this is GameCategoryTypeStandaloneExpansion) {
      return standaloneExpansion
          .call(this as GameCategoryTypeStandaloneExpansion);
    }

    if (this is GameCategoryTypeMod) {
      return mod.call(this as GameCategoryTypeMod);
    }

    if (this is GameCategoryTypeEpisode) {
      return episode.call(this as GameCategoryTypeEpisode);
    }

    if (this is GameCategoryTypeSeason) {
      return season.call(this as GameCategoryTypeSeason);
    }

    if (this is GameCategoryTypeRemake) {
      return remake.call(this as GameCategoryTypeRemake);
    }

    if (this is GameCategoryTypeRemaster) {
      return remaster.call(this as GameCategoryTypeRemaster);
    }

    if (this is GameCategoryTypeExpandedGame) {
      return expandedGame.call(this as GameCategoryTypeExpandedGame);
    }

    if (this is GameCategoryTypePort) {
      return port.call(this as GameCategoryTypePort);
    }

    if (this is GameCategoryTypeFork) {
      return fork.call(this as GameCategoryTypeFork);
    }

    return mainGame.call(this as GameCategoryTypeMainGame);
  }

  void maybeWhen({
    void Function(GameCategoryTypeMainGame)? mainGame,
    void Function(GameCategoryTypeDlcAddon)? dlcAddon,
    void Function(GameCategoryTypeExpansion)? expansion,
    void Function(GameCategoryTypeBundle)? bundle,
    void Function(GameCategoryTypeStandaloneExpansion)? standaloneExpansion,
    void Function(GameCategoryTypeMod)? mod,
    void Function(GameCategoryTypeEpisode)? episode,
    void Function(GameCategoryTypeSeason)? season,
    void Function(GameCategoryTypeRemake)? remake,
    void Function(GameCategoryTypeRemaster)? remaster,
    void Function(GameCategoryTypeExpandedGame)? expandedGame,
    void Function(GameCategoryTypePort)? port,
    void Function(GameCategoryTypeFork)? fork,
    required void Function() orElse,
  }) {
    if (this is GameCategoryTypeMainGame && mainGame != null) {
      mainGame.call(this as GameCategoryTypeMainGame);
    }

    if (this is GameCategoryTypeDlcAddon && dlcAddon != null) {
      dlcAddon.call(this as GameCategoryTypeDlcAddon);
    }

    if (this is GameCategoryTypeExpansion && expansion != null) {
      expansion.call(this as GameCategoryTypeExpansion);
    }

    if (this is GameCategoryTypeBundle && bundle != null) {
      bundle.call(this as GameCategoryTypeBundle);
    }

    if (this is GameCategoryTypeStandaloneExpansion &&
        standaloneExpansion != null) {
      standaloneExpansion.call(this as GameCategoryTypeStandaloneExpansion);
    }

    if (this is GameCategoryTypeMod && mod != null) {
      mod.call(this as GameCategoryTypeMod);
    }

    if (this is GameCategoryTypeEpisode && episode != null) {
      episode.call(this as GameCategoryTypeEpisode);
    }

    if (this is GameCategoryTypeSeason && season != null) {
      season.call(this as GameCategoryTypeSeason);
    }

    if (this is GameCategoryTypeRemake && remake != null) {
      remake.call(this as GameCategoryTypeRemake);
    }

    if (this is GameCategoryTypeRemaster && remaster != null) {
      remaster.call(this as GameCategoryTypeRemaster);
    }

    if (this is GameCategoryTypeExpandedGame && expandedGame != null) {
      expandedGame.call(this as GameCategoryTypeExpandedGame);
    }

    if (this is GameCategoryTypePort && port != null) {
      port.call(this as GameCategoryTypePort);
    }

    if (this is GameCategoryTypeFork && fork != null) {
      fork.call(this as GameCategoryTypeFork);
    }

    orElse.call();
  }

  R maybeMap<R>({
    R Function(GameCategoryTypeMainGame)? mainGame,
    R Function(GameCategoryTypeDlcAddon)? dlcAddon,
    R Function(GameCategoryTypeExpansion)? expansion,
    R Function(GameCategoryTypeBundle)? bundle,
    R Function(GameCategoryTypeStandaloneExpansion)? standaloneExpansion,
    R Function(GameCategoryTypeMod)? mod,
    R Function(GameCategoryTypeEpisode)? episode,
    R Function(GameCategoryTypeSeason)? season,
    R Function(GameCategoryTypeRemake)? remake,
    R Function(GameCategoryTypeRemaster)? remaster,
    R Function(GameCategoryTypeExpandedGame)? expandedGame,
    R Function(GameCategoryTypePort)? port,
    R Function(GameCategoryTypeFork)? fork,
    required R Function() orElse,
  }) {
    if (this is GameCategoryTypeMainGame && mainGame != null) {
      return mainGame.call(this as GameCategoryTypeMainGame);
    }

    if (this is GameCategoryTypeDlcAddon && dlcAddon != null) {
      return dlcAddon.call(this as GameCategoryTypeDlcAddon);
    }

    if (this is GameCategoryTypeExpansion && expansion != null) {
      return expansion.call(this as GameCategoryTypeExpansion);
    }

    if (this is GameCategoryTypeBundle && bundle != null) {
      return bundle.call(this as GameCategoryTypeBundle);
    }

    if (this is GameCategoryTypeStandaloneExpansion &&
        standaloneExpansion != null) {
      return standaloneExpansion
          .call(this as GameCategoryTypeStandaloneExpansion);
    }

    if (this is GameCategoryTypeMod && mod != null) {
      return mod.call(this as GameCategoryTypeMod);
    }

    if (this is GameCategoryTypeEpisode && episode != null) {
      return episode.call(this as GameCategoryTypeEpisode);
    }

    if (this is GameCategoryTypeSeason && season != null) {
      return season.call(this as GameCategoryTypeSeason);
    }

    if (this is GameCategoryTypeRemake && remake != null) {
      return remake.call(this as GameCategoryTypeRemake);
    }

    if (this is GameCategoryTypeRemaster && remaster != null) {
      return remaster.call(this as GameCategoryTypeRemaster);
    }

    if (this is GameCategoryTypeExpandedGame && expandedGame != null) {
      return expandedGame.call(this as GameCategoryTypeExpandedGame);
    }

    if (this is GameCategoryTypePort && port != null) {
      return port.call(this as GameCategoryTypePort);
    }

    if (this is GameCategoryTypeFork && fork != null) {
      return fork.call(this as GameCategoryTypeFork);
    }

    return orElse.call();
  }

  factory GameCategoryType.fromString(String value) {
    if (value == 'main_ame') {
      return GameCategoryType.mainGame();
    }

    if (value == 'dlc_addon') {
      return GameCategoryType.dlcAddon();
    }

    if (value == 'expansion') {
      return GameCategoryType.expansion();
    }

    if (value == 'bundle') {
      return GameCategoryType.bundle();
    }

    if (value == 'standalone_expansion') {
      return GameCategoryType.standaloneExpansion();
    }

    if (value == 'mod') {
      return GameCategoryType.mod();
    }

    if (value == 'episode') {
      return GameCategoryType.episode();
    }

    if (value == 'season') {
      return GameCategoryType.season();
    }

    if (value == 'remake') {
      return GameCategoryType.remake();
    }

    if (value == 'remaster') {
      return GameCategoryType.remaster();
    }

    if (value == 'expanded_game') {
      return GameCategoryType.expandedGame();
    }

    if (value == 'port') {
      return GameCategoryType.port();
    }

    if (value == 'fork') {
      return GameCategoryType.fork();
    }

    return GameCategoryType.mainGame();
  }

  @override
  String toString() {
    if (this is GameCategoryTypeMainGame) {
      return 'main_game';
    }

    if (this is GameCategoryTypeDlcAddon) {
      return 'dlc_addon';
    }

    if (this is GameCategoryTypeExpansion) {
      return 'expansion';
    }

    if (this is GameCategoryTypeBundle) {
      return 'bundle';
    }

    if (this is GameCategoryTypeStandaloneExpansion) {
      return 'standalone_expansion';
    }

    if (this is GameCategoryTypeMod) {
      return 'mod';
    }

    if (this is GameCategoryTypeEpisode) {
      return 'episode';
    }

    if (this is GameCategoryTypeSeason) {
      return 'season';
    }

    if (this is GameCategoryTypeRemake) {
      return 'remake';
    }

    if (this is GameCategoryTypeRemaster) {
      return 'remaster';
    }

    if (this is GameCategoryTypeExpandedGame) {
      return 'expanded_game';
    }

    if (this is GameCategoryTypePort) {
      return 'port';
    }

    if (this is GameCategoryTypeFork) {
      return 'fork';
    }

    return 'mainGame';
  }
}

class GameCategoryTypeMainGame extends GameCategoryType {}

class GameCategoryTypeDlcAddon extends GameCategoryType {}

class GameCategoryTypeExpansion extends GameCategoryType {}

class GameCategoryTypeBundle extends GameCategoryType {}

class GameCategoryTypeStandaloneExpansion extends GameCategoryType {}

class GameCategoryTypeMod extends GameCategoryType {}

class GameCategoryTypeEpisode extends GameCategoryType {}

class GameCategoryTypeSeason extends GameCategoryType {}

class GameCategoryTypeRemake extends GameCategoryType {}

class GameCategoryTypeRemaster extends GameCategoryType {}

class GameCategoryTypeExpandedGame extends GameCategoryType {}

class GameCategoryTypePort extends GameCategoryType {}

class GameCategoryTypeFork extends GameCategoryType {}
