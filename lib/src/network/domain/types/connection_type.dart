abstract class ConnectionType {
  const ConnectionType();
  factory ConnectionType.wifi() = ConnectionTypeWifi;
  factory ConnectionType.mobile() = ConnectionTypeMobile;
  factory ConnectionType.none() = ConnectionTypeNone;

  void when({
    required void Function(ConnectionTypeWifi) wifi,
    required void Function(ConnectionTypeMobile) mobile,
    required void Function(ConnectionTypeNone) none,
  }) {
    if (this is ConnectionTypeWifi) {
      wifi.call(this as ConnectionTypeWifi);
    }

    if (this is ConnectionTypeMobile) {
      mobile.call(this as ConnectionTypeMobile);
    }

    if (this is ConnectionTypeNone) {
      none.call(this as ConnectionTypeNone);
    }

    wifi.call(this as ConnectionTypeWifi);
  }

  R map<R>({
    required R Function(ConnectionTypeWifi) wifi,
    required R Function(ConnectionTypeMobile) mobile,
    required R Function(ConnectionTypeNone) none,
  }) {
    if (this is ConnectionTypeWifi) {
      return wifi.call(this as ConnectionTypeWifi);
    }

    if (this is ConnectionTypeMobile) {
      return mobile.call(this as ConnectionTypeMobile);
    }

    if (this is ConnectionTypeNone) {
      return none.call(this as ConnectionTypeNone);
    }

    return wifi.call(this as ConnectionTypeWifi);
  }

  void maybeWhen({
    void Function(ConnectionTypeWifi)? wifi,
    void Function(ConnectionTypeMobile)? mobile,
    void Function(ConnectionTypeNone)? none,
    required void Function() orElse,
  }) {
    if (this is ConnectionTypeWifi && wifi != null) {
      wifi.call(this as ConnectionTypeWifi);
    }

    if (this is ConnectionTypeMobile && mobile != null) {
      mobile.call(this as ConnectionTypeMobile);
    }

    if (this is ConnectionTypeNone && none != null) {
      none.call(this as ConnectionTypeNone);
    }

    orElse.call();
  }

  R maybeMap<R>({
    R Function(ConnectionTypeWifi)? wifi,
    R Function(ConnectionTypeMobile)? mobile,
    R Function(ConnectionTypeNone)? none,
    required R Function() orElse,
  }) {
    if (this is ConnectionTypeWifi && wifi != null) {
      return wifi.call(this as ConnectionTypeWifi);
    }

    if (this is ConnectionTypeMobile && mobile != null) {
      return mobile.call(this as ConnectionTypeMobile);
    }

    if (this is ConnectionTypeNone && none != null) {
      return none.call(this as ConnectionTypeNone);
    }

    return orElse.call();
  }

  factory ConnectionType.fromString(String value) {
    if (value == 'wifi') {
      return ConnectionType.wifi();
    }

    if (value == 'mobile') {
      return ConnectionType.mobile();
    }

    if (value == 'none') {
      return ConnectionType.none();
    }

    return ConnectionType.wifi();
  }

  @override
  String toString() {
    if (this is ConnectionTypeWifi) {
      return 'wifi';
    }

    if (this is ConnectionTypeMobile) {
      return 'mobile';
    }

    if (this is ConnectionTypeNone) {
      return 'none';
    }

    return 'wifi';
  }
}

class ConnectionTypeWifi extends ConnectionType {}

class ConnectionTypeMobile extends ConnectionType {}

class ConnectionTypeNone extends ConnectionType {}
