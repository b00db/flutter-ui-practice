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
  late InputType? _userInput;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isDone = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: CpuInput(isDone: isDone)),
        Expanded(child: GameResult(isDone: isDone)),
        Expanded(
            child: UserInput(
          isDone: isDone,
          callback: setUserInput,
        )),
      ],
    );
  }

  void setUserInput(InputType userInput) {
    setState(() {
      isDone = true;
      _userInput = userInput;
    });
  }
}
