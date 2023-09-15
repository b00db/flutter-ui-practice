# 카카오톡 UI 구현해보기

## 과정 엿보기 👀

### 1. 홈 화면

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

### 3. 프로필 화면

핵심 개념 
- InkWell
- Navigator

<br/>

<p align="left">
    <img src="./assets/kakaotalk3.png" width="25%" />
    <img src="./assets/kakaotalk4.png" width="25%" />
<p>

<br/>

<details>
<summary>핵심 코드</summary>
<div markdown="1">

```dart

import 'package:flutter/material.dart';
import 'package:kakaotalk/models/user.dart';
import 'package:kakaotalk/screens/profile_screen.dart';

class ProfileCard extends StatelessWidget {
  final User user;

  const ProfileCard({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileScreen(user: user),
          ),
        );
      },
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(user.profileImage),
        ),
        title: Text(user.name),
        subtitle: Text(user.info),
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

appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(
              FontAwesomeIcons.x,
              size: 20,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),

```

</div>
</details>

<br/>

### 4. 채팅 리스트

핵심 개념
- ListView
- ListTile

<br/>

<img src="./assets/kakaotalk5.png" width="25%" />

<br/>

<details>
<summary>핵심 코드</summary>
<div markdown="1">

```dart

import 'package:flutter/material.dart';
import 'package:kakaotalk/components/chat_card.dart';
import 'package:kakaotalk/models/chat.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("채팅"),
      ),
      body: ListView(
        children: List.generate(
          chats.length,
          (index) => ChatCard(chat: chats[index]),
        ),
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
import 'package:kakaotalk/models/chat.dart';

class ChatCard extends StatelessWidget {
  final Chat chat;

  const ChatCard({
    super.key,
    required this.chat,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(chat.image),
                ),
                title: Text(chat.title),
                subtitle: Text(chat.content),
                contentPadding: const EdgeInsets.all(0),
              ),
            ),
            Column(
              children: [
                Text(
                  chat.date,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                if (chat.count != "0")
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red,
                    ),
                    child: Text(
                      chat.count,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
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