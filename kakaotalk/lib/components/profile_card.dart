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
