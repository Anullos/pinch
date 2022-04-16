import 'package:flutter/material.dart';

import '../../../shared/presentation/l10n/generated/l10n.dart';
import '../../domain/types/game_status_type.dart';

extension GameStatusTypeExtension on GameStatusType {
  String toTranslation(BuildContext context) {
    if (this is GameStatusTypeReleased) {
      return S.of(context).released;
    }

    if (this is GameStatusTypeAlpha) {
      return S.of(context).alpha;
    }

    if (this is GameStatusTypeBeta) {
      return S.of(context).beta;
    }

    if (this is GameStatusTypeEarlyAccess) {
      return S.of(context).earlyAccess;
    }

    if (this is GameStatusTypeOffline) {
      return S.of(context).offline;
    }

    if (this is GameStatusTypeCancelled) {
      return S.of(context).cancelled;
    }

    if (this is GameStatusTypeRumored) {
      return S.of(context).rumored;
    }

    if (this is GameStatusTypeDelisted) {
      return S.of(context).delisted;
    }
    return S.of(context).released;
  }

  int toValue() {
    if (this is GameStatusTypeReleased) {
      return 0;
    }

    if (this is GameStatusTypeAlpha) {
      return 2;
    }

    if (this is GameStatusTypeBeta) {
      return 3;
    }

    if (this is GameStatusTypeEarlyAccess) {
      return 4;
    }

    if (this is GameStatusTypeOffline) {
      return 5;
    }

    if (this is GameStatusTypeCancelled) {
      return 6;
    }

    if (this is GameStatusTypeRumored) {
      return 7;
    }

    if (this is GameStatusTypeDelisted) {
      return 8;
    }
    return 0;
  }

  static GameStatusType fromValue(int value) {
    switch (value) {
      case 0:
        return GameStatusType.released();
      case 2:
        return GameStatusType.alpha();
      case 3:
        return GameStatusType.beta();
      case 4:
        return GameStatusType.earlyAccess();
      case 5:
        return GameStatusType.offline();
      case 6:
        return GameStatusType.cancelled();
      case 7:
        return GameStatusType.rumored();
      case 8:
        return GameStatusType.delisted();
      default:
        return GameStatusType.released();
    }
  }

  Color getColor() {
    if (this is GameStatusTypeReleased) {
      return Colors.green;
    }

    if (this is GameStatusTypeAlpha) {
      return Colors.blue;
    }

    if (this is GameStatusTypeBeta) {
      return Colors.orange;
    }

    if (this is GameStatusTypeEarlyAccess) {
      return Colors.purple;
    }

    if (this is GameStatusTypeOffline) {
      return Colors.grey;
    }

    if (this is GameStatusTypeCancelled) {
      return Colors.red;
    }

    if (this is GameStatusTypeRumored) {
      return Colors.yellow;
    }

    if (this is GameStatusTypeDelisted) {
      return Colors.red;
    }
    return Colors.green;
  }
}
