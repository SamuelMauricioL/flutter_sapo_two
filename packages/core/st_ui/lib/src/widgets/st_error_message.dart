import 'package:flutter/material.dart';

class StErrorMessage extends StatelessWidget {
  const StErrorMessage({required this.message, super.key});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: const TextStyle(color: Colors.red),
      ),
    );
  }
}
