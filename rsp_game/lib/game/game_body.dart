import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rsp_game/game/enum.dart';
import 'package:rsp_game/game/widget/cpu_input.dart';
import 'package:rsp_game/game/widget/game_result.dart';
import 'package:rsp_game/game/widget/user_input.dart';

class GameBody extends StatefulWidget {
  const GameBody({super.key});

  @override
  State<GameBody> createState() => _GameBodyState();
}

class _GameBodyState extends State<GameBody> {
  late bool isDone;
  InputType? _userInput;
  late InputType _cpuInput;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isDone = false;
    setCpuInput();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: CpuInput(isDone: isDone, cpuInput: _cpuInput)),
        Expanded(
            child: GameResult(
          isDone: isDone,
          result: getResult(),
          callback: reset,
        )),
        Expanded(
          child: UserInput(
            isDone: isDone,
            userInput: _userInput,
            callback: setUserInput,
          ),
        ),
      ],
    );
  }

  void setUserInput(InputType userInput) {
    setState(() {
      isDone = true;
      _userInput = userInput;
    });
  }

  void setCpuInput() {
    final random = Random();
    _cpuInput = InputType.values[random.nextInt(3)];
  }

  void reset() {
    setState(() {
      isDone = false;
      setCpuInput();
    });
  }

  Result? getResult() {
    if (_userInput == null) return null;

    switch (_userInput!) {
      case InputType.rock:
        switch (_cpuInput) {
          case InputType.rock:
            return Result.draw;

          case InputType.scissors:
            return Result.win;

          case InputType.paper:
            return Result.lose;
        }

      case InputType.scissors:
        switch (_cpuInput) {
          case InputType.rock:
            return Result.lose;

          case InputType.scissors:
            return Result.draw;

          case InputType.paper:
            return Result.win;
        }

      case InputType.paper:
        switch (_cpuInput) {
          case InputType.rock:
            return Result.win;

          case InputType.scissors:
            return Result.lose;

          case InputType.paper:
            return Result.draw;
        }
    }
  }
}
