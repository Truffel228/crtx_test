part of 'sim_bloc.dart';

@immutable
abstract class SimState extends Equatable {
  const SimState();
}

class SimInitial extends SimState {
  const SimInitial();
  @override
  List<Object?> get props => [];
}

class SimLoading extends SimState {
  const SimLoading();
  @override
  List<Object?> get props => [];
}

class SimFailure extends SimState {
  const SimFailure();
  @override
  List<Object?> get props => [];
}

class SimLoaded extends SimState {
  const SimLoaded(
    this.simStatus,
    this.updateTime,
  );
  
  final SimStatus simStatus;
  final DateTime updateTime;

  @override
  List<Object?> get props => [simStatus];
}

enum SimStatus {
  inserted,
  absent;

  static SimStatus fromBool(bool value) =>
      value ? SimStatus.inserted : SimStatus.absent;
}
