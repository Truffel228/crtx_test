import 'package:crtex_test/screens/home_screen/bloc/sim_bloc.dart';
import 'package:crtex_test/screens/home_screen/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final SimBloc _simBloc;

  @override
  void initState() {
    super.initState();
    _simBloc = context.read<SimBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SimBloc, SimState>(
        builder: (context, state) {
          if (state is SimInitial) {
            return SimInitialBody(
              onStartTap: _onStartTap,
            );
          }

          if (state is SimLoaded) {
            return SimLoadedBody(
              simStatus: state.simStatus,
              updateTime: state.updateTime,
            );
          }

          if (state is SimLoading) {
            return const SimLoadingBody();
          }

          return const Center(
            child: Text('Failure'),
          );
        },
      ),
    );
  }

  void _onStartTap() => _simBloc.add(SimStart());
}
