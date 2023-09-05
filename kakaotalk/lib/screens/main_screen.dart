import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kakaotalk/screens/chat_screen.dart';
import 'package:kakaotalk/screens/friend_screen.dart';
import 'package:kakaotalk/screens/more_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int selectedIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: const [
          FriendScreen(),
          ChatScreen(),
          MoreScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: selectedIndex,
        backgroundColor: Colors.grey.shade100,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black45,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.user),
            label: "Friend",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.comment),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.ellipsis),
            label: "More",
          ),
        ],
      ),
    );
  }
}
