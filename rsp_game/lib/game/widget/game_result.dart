import 'package:flutter/material.dart';
import 'package:rsp_game/game/enum.dart';

class GameResult extends StatelessWidget {
  final bool isDone;
  final Result? result;
  final VoidCallback callback;

  const GameResult({
    required this.isDone,
    this.result,
    required this.callback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (isDone) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            result!.displayString,
            style: const TextStyle(
              fontSize: 34,
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () => callback.call(),
            icon: const Icon(
              Icons.refresh_rounded,
            ),
            iconSize: 34.0,
          )
        ],
      );
    }

    return const Center(
      child: Text(
        "가위, 바위, 보 !",
        style: TextStyle(
          fontSize: 34,
        ),
      ),
    );
  }
}
