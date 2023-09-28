import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:kakaotalk/components/chat_icon_button.dart';
import 'package:kakaotalk/components/my_chat.dart';
import 'package:kakaotalk/components/other_chat.dart';
import 'package:kakaotalk/components/time_line.dart';
import 'package:kakaotalk/models/chat.dart';

class ChatRoomScreen extends StatefulWidget {
  final Chat chat;

  const ChatRoomScreen(this.chat, {super.key});

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  final List<MyChat> chats = [];
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void handleSubmitted(text) {
      _textController.clear();

      setState(() {
        chats.add(
          MyChat(
            text: text,
            time: DateFormat("a H:mm")
                .format(DateTime.now())
                .replaceAll("AM", "오전")
                .replaceAll("PM", "오후"),
          ),
        );
      });
    }

    return Container(
      color: const Color(0xFFb2c7da),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            widget.chat.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          actions: const [
            Icon(FontAwesomeIcons.magnifyingGlass, size: 20),
            SizedBox(width: 25),
            Icon(FontAwesomeIcons.bars, size: 20),
            SizedBox(width: 25),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TimeLine(time: widget.chat.timeline),
                    OtherChat(
                      image: widget.chat.image,
                      name: widget.chat.title,
                      text: widget.chat.content,
                      time: widget.chat.time,
                    ),
                    ...List.generate(chats.length, (index) => chats[index]),
                  ],
                ),
              ),
            ),
            Container(
              height: 60,
              color: Colors.white,
              child: Row(
                children: [
                  const ChatIconButton(icon: Icon(FontAwesomeIcons.squarePlus)),
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      maxLines: 1,
                      style: const TextStyle(fontSize: 20),
                      decoration: const InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                      cursorColor: Colors.black,
                      onSubmitted: handleSubmitted,
                    ),
                  ),
                  const ChatIconButton(icon: Icon(FontAwesomeIcons.faceSmile)),
                  const ChatIconButton(icon: Icon(FontAwesomeIcons.cog)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
