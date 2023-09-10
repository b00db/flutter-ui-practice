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
