import 'package:flutter/material.dart';
import 'package:rsp_game/game/game_body.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      colorScheme: const ColorScheme.light(
        primary: Colors.white,
        secondary: Colors.black,
      ),
      useMaterial3: true,
    ),
    home: Scaffold(
      appBar: AppBar(
        title: const Text(
          "가위 바위 보 !",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: const GameBody(),
    ),
  ));
}
