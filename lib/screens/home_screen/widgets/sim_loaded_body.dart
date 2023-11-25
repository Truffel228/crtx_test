import 'package:crtex_test/screens/home_screen/bloc/sim_bloc.dart';
import 'package:flutter/material.dart';

class SimLoadedBody extends StatelessWidget {
  const SimLoadedBody(
      {super.key, required this.simStatus, required this.updateTime});
  final SimStatus simStatus;
  final DateTime updateTime;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
 padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Changes detected',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      simStatus == SimStatus.inserted
                          ? 'SIM is inserted'
                          : 'SIM is absent',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      updateTime.millisecondsSinceEpoch.toString(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'Service started',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
