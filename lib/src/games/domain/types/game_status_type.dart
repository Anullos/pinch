abstract class GameStatusType {
  const GameStatusType();
  factory GameStatusType.released() = GameStatusTypeReleased;
  factory GameStatusType.alpha() = GameStatusTypeAlpha;
  factory GameStatusType.beta() = GameStatusTypeBeta;
  factory GameStatusType.earlyAccess() = GameStatusTypeEarlyAccess;
  factory GameStatusType.offline() = GameStatusTypeOffline;
  factory GameStatusType.cancelled() = GameStatusTypeCancelled;
  factory GameStatusType.rumored() = GameStatusTypeRumored;
  factory GameStatusType.delisted() = GameStatusTypeDelisted;

  void when({
    required void Function(GameStatusTypeReleased) released,
    required void Function(GameStatusTypeAlpha) alpha,
    required void Function(GameStatusTypeBeta) beta,
    required void Function(GameStatusTypeEarlyAccess) earlyAccess,
    required void Function(GameStatusTypeOffline) offline,
    required void Function(GameStatusTypeCancelled) cancelled,
    required void Function(GameStatusTypeRumored) rumored,
    required void Function(GameStatusTypeDelisted) delisted,
  }) {
    if (this is GameStatusTypeReleased) {
      released.call(this as GameStatusTypeReleased);
    }

    if (this is GameStatusTypeAlpha) {
      alpha.call(this as GameStatusTypeAlpha);
    }

    if (this is GameStatusTypeBeta) {
      beta.call(this as GameStatusTypeBeta);
    }

    if (this is GameStatusTypeEarlyAccess) {
      earlyAccess.call(this as GameStatusTypeEarlyAccess);
    }

    if (this is GameStatusTypeOffline) {
      offline.call(this as GameStatusTypeOffline);
    }

    if (this is GameStatusTypeCancelled) {
      cancelled.call(this as GameStatusTypeCancelled);
    }

    if (this is GameStatusTypeRumored) {
      rumored.call(this as GameStatusTypeRumored);
    }

    if (this is GameStatusTypeDelisted) {
      delisted.call(this as GameStatusTypeDelisted);
    }

    released.call(this as GameStatusTypeReleased);
  }

  R map<R>({
    required R Function(GameStatusTypeReleased) released,
    required R Function(GameStatusTypeAlpha) alpha,
    required R Function(GameStatusTypeBeta) beta,
    required R Function(GameStatusTypeEarlyAccess) earlyAccess,
    required R Function(GameStatusTypeOffline) offline,
    required R Function(GameStatusTypeCancelled) cancelled,
    required R Function(GameStatusTypeRumored) rumored,
    required R Function(GameStatusTypeDelisted) delisted,
  }) {
    if (this is GameStatusTypeReleased) {
      return released.call(this as GameStatusTypeReleased);
    }

    if (this is GameStatusTypeAlpha) {
      return alpha.call(this as GameStatusTypeAlpha);
    }

    if (this is GameStatusTypeBeta) {
      return beta.call(this as GameStatusTypeBeta);
    }

    if (this is GameStatusTypeEarlyAccess) {
      return earlyAccess.call(this as GameStatusTypeEarlyAccess);
    }

    if (this is GameStatusTypeOffline) {
      return offline.call(this as GameStatusTypeOffline);
    }

    if (this is GameStatusTypeCancelled) {
      return cancelled.call(this as GameStatusTypeCancelled);
    }

    if (this is GameStatusTypeRumored) {
      return rumored.call(this as GameStatusTypeRumored);
    }

    if (this is GameStatusTypeDelisted) {
      return delisted.call(this as GameStatusTypeDelisted);
    }

    return released.call(this as GameStatusTypeReleased);
  }

  void maybeWhen({
    void Function(GameStatusTypeReleased)? released,
    void Function(GameStatusTypeAlpha)? alpha,
    void Function(GameStatusTypeBeta)? beta,
    void Function(GameStatusTypeEarlyAccess)? earlyAccess,
    void Function(GameStatusTypeOffline)? offline,
    void Function(GameStatusTypeCancelled)? cancelled,
    void Function(GameStatusTypeRumored)? rumored,
    void Function(GameStatusTypeDelisted)? delisted,
    required void Function() orElse,
  }) {
    if (this is GameStatusTypeReleased && released != null) {
      released.call(this as GameStatusTypeReleased);
    }

    if (this is GameStatusTypeAlpha && alpha != null) {
      alpha.call(this as GameStatusTypeAlpha);
    }

    if (this is GameStatusTypeBeta && beta != null) {
      beta.call(this as GameStatusTypeBeta);
    }

    if (this is GameStatusTypeEarlyAccess && earlyAccess != null) {
      earlyAccess.call(this as GameStatusTypeEarlyAccess);
    }

    if (this is GameStatusTypeOffline && offline != null) {
      offline.call(this as GameStatusTypeOffline);
    }

    if (this is GameStatusTypeCancelled && cancelled != null) {
      cancelled.call(this as GameStatusTypeCancelled);
    }

    if (this is GameStatusTypeRumored && rumored != null) {
      rumored.call(this as GameStatusTypeRumored);
    }

    if (this is GameStatusTypeDelisted && delisted != null) {
      delisted.call(this as GameStatusTypeDelisted);
    }

    orElse.call();
  }

  R maybeMap<R>({
    R Function(GameStatusTypeReleased)? released,
    R Function(GameStatusTypeAlpha)? alpha,
    R Function(GameStatusTypeBeta)? beta,
    R Function(GameStatusTypeEarlyAccess)? earlyAccess,
    R Function(GameStatusTypeOffline)? offline,
    R Function(GameStatusTypeCancelled)? cancelled,
    R Function(GameStatusTypeRumored)? rumored,
    R Function(GameStatusTypeDelisted)? delisted,
    required R Function() orElse,
  }) {
    if (this is GameStatusTypeReleased && released != null) {
      return released.call(this as GameStatusTypeReleased);
    }

    if (this is GameStatusTypeAlpha && alpha != null) {
      return alpha.call(this as GameStatusTypeAlpha);
    }

    if (this is GameStatusTypeBeta && beta != null) {
      return beta.call(this as GameStatusTypeBeta);
    }

    if (this is GameStatusTypeEarlyAccess && earlyAccess != null) {
      return earlyAccess.call(this as GameStatusTypeEarlyAccess);
    }

    if (this is GameStatusTypeOffline && offline != null) {
      return offline.call(this as GameStatusTypeOffline);
    }

    if (this is GameStatusTypeCancelled && cancelled != null) {
      return cancelled.call(this as GameStatusTypeCancelled);
    }

    if (this is GameStatusTypeRumored && rumored != null) {
      return rumored.call(this as GameStatusTypeRumored);
    }

    if (this is GameStatusTypeDelisted && delisted != null) {
      return delisted.call(this as GameStatusTypeDelisted);
    }

    return orElse.call();
  }

  factory GameStatusType.fromString(String value) {
    if (value == 'released') {
      return GameStatusType.released();
    }

    if (value == 'alpha') {
      return GameStatusType.alpha();
    }

    if (value == 'beta') {
      return GameStatusType.beta();
    }

    if (value == 'early_access') {
      return GameStatusType.earlyAccess();
    }

    if (value == 'offline') {
      return GameStatusType.offline();
    }

    if (value == 'cancelled') {
      return GameStatusType.cancelled();
    }

    if (value == 'rumored') {
      return GameStatusType.rumored();
    }

    if (value == 'delisted') {
      return GameStatusType.delisted();
    }

    return GameStatusType.released();
  }

  @override
  String toString() {
    if (this is GameStatusTypeReleased) {
      return 'released';
    }

    if (this is GameStatusTypeAlpha) {
      return 'alpha';
    }

    if (this is GameStatusTypeBeta) {
      return 'beta';
    }

    if (this is GameStatusTypeEarlyAccess) {
      return 'early_access';
    }

    if (this is GameStatusTypeOffline) {
      return 'offline';
    }

    if (this is GameStatusTypeCancelled) {
      return 'cancelled';
    }

    if (this is GameStatusTypeRumored) {
      return 'rumored';
    }

    if (this is GameStatusTypeDelisted) {
      return 'delisted';
    }

    return 'released';
  }
}

class GameStatusTypeReleased extends GameStatusType {}

class GameStatusTypeAlpha extends GameStatusType {}

class GameStatusTypeBeta extends GameStatusType {}

class GameStatusTypeEarlyAccess extends GameStatusType {}

class GameStatusTypeOffline extends GameStatusType {}

class GameStatusTypeCancelled extends GameStatusType {}

class GameStatusTypeRumored extends GameStatusType {}

class GameStatusTypeDelisted extends GameStatusType {}
