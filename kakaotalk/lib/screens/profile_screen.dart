import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kakaotalk/components/bottom_icon_button.dart';
import 'package:kakaotalk/models/user.dart';

class ProfileScreen extends StatelessWidget {
  final User user;

  const ProfileScreen({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            user.backgroundImage,
          ),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
        body: Column(
          children: [
            const Spacer(),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(user.profileImage),
                  fit: BoxFit.cover,
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 5.0,
                    spreadRadius: 0.0,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              user.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              user.info,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              color: Colors.white,
            ),
            bottomIconButtons(user.name),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomIconButtons(String name) {
    String firstButtonText;
    String secondButtonText;
    IconData secondButtonIcon;

    if (name == me.name) {
      firstButtonText = "나와의 채팅";
      secondButtonText = "프로필 편집";
      secondButtonIcon = FontAwesomeIcons.pen;
    } else {
      firstButtonText = "1:1 채팅";
      secondButtonText = "통화하기";
      secondButtonIcon = FontAwesomeIcons.phone;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BottomIconButton(
            icon: FontAwesomeIcons.comment,
            text: firstButtonText,
          ),
          const SizedBox(
            width: 50,
          ),
          BottomIconButton(
            icon: secondButtonIcon,
            text: secondButtonText,
          ),
        ],
      ),
    );
  }
}
