part of 'network_cubit.dart';

class NetworkState {
  final ConnectionType connectionType;
  NetworkState({
    required this.connectionType,
  });

  factory NetworkState.initial() => NetworkState(
        connectionType: ConnectionType.none(),
      );

  NetworkState copyWith({
    ConnectionType? connectionType,
  }) {
    return NetworkState(
      connectionType: connectionType ?? this.connectionType,
    );
  }

  @override
  String toString() => 'NetworkState(connectionType: $connectionType )';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NetworkState && other.connectionType == connectionType;
  }

  @override
  int get hashCode => runtimeType.hashCode ^ connectionType.hashCode;
}
