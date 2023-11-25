import 'package:flutter/material.dart';

class SimInitialBody extends StatelessWidget {
  const SimInitialBody({super.key, required this.onStartTap});
  final VoidCallback onStartTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: GestureDetector(
            onTap: onStartTap,
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.5,
              height: 50,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Start',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
