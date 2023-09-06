# 카카오톡 UI 구현해보기

## 과정 엿보기 👀

### 1. 홈화면

핵심 개념 
- IndexedStack 
- BottomNavigationBar

<br/>

<img src="./assets/kakaotalk1.gif" width="25%" />

<br/>

<details>
<summary>핵심 코드</summary>
<div markdown="1">

```dart
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

```

</div>
</details>

<br/>

### 2. 친구 리스트

핵심 개념
- ListView
- ListTile

<br/>

<img src="./assets/kakaotalk2.gif" width="25%" />

<br/>

<details>
<summary>핵심 코드</summary>
<div markdown="1">

```dart

import 'package:flutter/material.dart';
import 'package:kakaotalk/components/profile_card.dart';
import 'package:kakaotalk/models/user.dart';

class FriendScreen extends StatelessWidget {
  const FriendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("친구"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          ProfileCard(user: me),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                const Text("친구"),
                const SizedBox(width: 6),
                Text("${friends.length}"),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: List.generate(
                friends.length,
                (index) => ProfileCard(user: friends[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

```

</div>
</details>

<details>
<summary>핵심 코드</summary>
<div markdown="1">

```dart

import 'package:flutter/material.dart';
import 'package:kakaotalk/models/user.dart';

class ProfileCard extends StatelessWidget {
  final User user;

  const ProfileCard({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(user.backgroundImage),
      ),
      title: Text(user.name),
      subtitle: Text(user.info),
    );
  }
}

```

</div>
</details>

<br/>

<br/>
<br/>

## 결과 엿보기 👀