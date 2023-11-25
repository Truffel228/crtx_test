import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

part 'sim_event.dart';
part 'sim_state.dart';

const Duration _tickInterval = Duration(seconds: 2);

const String _methodChannelName = 'crtex_test_method_channel';

const MethodChannel _methodChannel = MethodChannel(_methodChannelName);

class SimBloc extends Bloc<SimEvent, SimState> {
  SimBloc() : super(const SimInitial()) {
    on<SimStart>(_onSimStart);
    on<SimTick>(_onSimTick);
  }

  late final Timer _timer;

  Future<void> _onSimStart(
    SimStart event,
    Emitter<SimState> emit,
  ) async {
    emit(const SimLoading());

    add(SimTick());

    _timer = Timer.periodic(_tickInterval, (timer) {
      add(SimTick());
    });
  }

  Future<void> _onSimTick(SimTick event, Emitter<SimState> emit) async {
    try {
      final result = await _methodChannel.invokeMethod<bool?>('checkSimState');
      if (result == null) {
        emit(const SimLoading());
        return;
      }
      emit(
        SimLoaded(
          SimStatus.fromBool(result),
          DateTime.now(),
        ),
      );
    } catch (e) {
      log(e.toString());
      emit(const SimFailure());
    }
  }

  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }
}
