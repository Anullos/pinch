import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../domain/types/connection_type.dart';

part 'network_state.dart';

class NetworkCubit extends Cubit<NetworkState> {
  final Connectivity _connectivity;
  NetworkCubit(this._connectivity) : super(NetworkState.initial());

  StreamSubscription? _connectionSubscription;

  void initCubit() {
    _connectionSubscription =
        _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.wifi) {
        emit(state.copyWith(connectionType: ConnectionType.wifi()));
      } else if (event == ConnectivityResult.mobile) {
        emit(state.copyWith(connectionType: ConnectionType.mobile()));
      } else {
        emit(state.copyWith(connectionType: ConnectionType.none()));
      }
    });
  }

  @override
  Future<void> close() {
    _connectionSubscription?.cancel();
    return super.close();
  }
}
