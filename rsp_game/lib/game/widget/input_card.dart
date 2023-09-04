import 'package:flutter/material.dart';

class InputCard extends StatelessWidget {
  final VoidCallback? callback;
  final Widget child;

  const InputCard({
    required this.callback,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => callback?.call(),
        child: InputContents(child: child),
      ),
    );
  }
}

class InputContents extends StatelessWidget {
  const InputContents({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 4,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: child,
    );
  }
}
