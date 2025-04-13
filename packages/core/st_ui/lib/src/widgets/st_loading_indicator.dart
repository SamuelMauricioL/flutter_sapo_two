import 'package:flutter/material.dart';

class StLoadingIndicator extends StatelessWidget {
  const StLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
