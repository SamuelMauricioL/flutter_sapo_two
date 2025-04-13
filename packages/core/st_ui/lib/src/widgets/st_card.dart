import 'package:flutter/material.dart';

class StCard extends StatelessWidget {
  const StCard({
    required this.child,
    super.key,
    this.margin,
    this.padding,
  });
  final Widget child;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin ?? const EdgeInsets.all(8),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(16),
        child: child,
      ),
    );
  }
}
