import 'package:flutter/material.dart';
import 'package:kakaotalk/models/tab.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('더보기'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: GridView.count(
          crossAxisCount: 4,
          children: List.generate(
            tabs.length,
            (index) => Column(
              children: [
                Icon(tabs[index].icon),
                const SizedBox(height: 5),
                Text(tabs[index].text)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
