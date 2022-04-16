import 'package:flutter/cupertino.dart';

import '../../../shared/presentation/l10n/generated/l10n.dart';
import '../../domain/types/game_category_type.dart';

extension GameCategoryTypeExtension on GameCategoryType {
  String toTranslation(BuildContext context) {
    if (this is GameCategoryTypeMainGame) {
      return S.of(context).mainGame;
    }

    if (this is GameCategoryTypeDlcAddon) {
      return S.of(context).dlcAddon;
    }

    if (this is GameCategoryTypeExpansion) {
      return S.of(context).expansion;
    }

    if (this is GameCategoryTypeBundle) {
      return S.of(context).bundle;
    }

    if (this is GameCategoryTypeStandaloneExpansion) {
      return S.of(context).standaloneExpansion;
    }

    if (this is GameCategoryTypeMod) {
      return S.of(context).mod;
    }

    if (this is GameCategoryTypeEpisode) {
      return S.of(context).episode;
    }

    if (this is GameCategoryTypeSeason) {
      return S.of(context).season;
    }

    if (this is GameCategoryTypeRemake) {
      return S.of(context).remake;
    }

    if (this is GameCategoryTypeRemaster) {
      return S.of(context).remaster;
    }

    if (this is GameCategoryTypeExpandedGame) {
      return S.of(context).expandedGame;
    }

    if (this is GameCategoryTypePort) {
      return S.of(context).port;
    }

    if (this is GameCategoryTypeFork) {
      return S.of(context).fork;
    }

    return S.of(context).mainGame;
  }

  int toValue() {
    if (this is GameCategoryTypeMainGame) {
      return 0;
    }

    if (this is GameCategoryTypeDlcAddon) {
      return 1;
    }

    if (this is GameCategoryTypeExpansion) {
      return 2;
    }

    if (this is GameCategoryTypeBundle) {
      return 3;
    }

    if (this is GameCategoryTypeStandaloneExpansion) {
      return 4;
    }

    if (this is GameCategoryTypeMod) {
      return 5;
    }

    if (this is GameCategoryTypeEpisode) {
      return 6;
    }

    if (this is GameCategoryTypeSeason) {
      return 7;
    }

    if (this is GameCategoryTypeRemake) {
      return 8;
    }

    if (this is GameCategoryTypeRemaster) {
      return 9;
    }

    if (this is GameCategoryTypeExpandedGame) {
      return 10;
    }

    if (this is GameCategoryTypePort) {
      return 11;
    }

    if (this is GameCategoryTypeFork) {
      return 12;
    }

    return 0;
  }

  static GameCategoryType fromValue(int value) {
    switch (value) {
      case 0:
        return GameCategoryType.mainGame();
      case 1:
        return GameCategoryType.dlcAddon();
      case 2:
        return GameCategoryType.expansion();
      case 3:
        return GameCategoryType.bundle();
      case 4:
        return GameCategoryType.standaloneExpansion();
      case 5:
        return GameCategoryType.mod();
      case 6:
        return GameCategoryType.episode();
      case 7:
        return GameCategoryType.season();
      case 8:
        return GameCategoryType.remake();
      case 9:
        return GameCategoryType.remaster();
      case 10:
        return GameCategoryType.expandedGame();
      case 11:
        return GameCategoryType.port();
      case 12:
        return GameCategoryType.fork();
      default:
        return GameCategoryType.mainGame();
    }
  }
}
