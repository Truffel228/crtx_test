part of 'sim_bloc.dart';

@immutable
abstract class SimEvent {}

class SimStart extends SimEvent {}

class SimTick extends SimEvent {}
