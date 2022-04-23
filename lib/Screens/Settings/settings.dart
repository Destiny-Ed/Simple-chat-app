import 'package:badges/badges.dart';
import 'package:cryto/Model/chat_model.dart';
import 'package:cryto/Model/stories_model.dart';
import 'package:cryto/Screens/Chat/chat_details.dart';
import 'package:cryto/Styles/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: const Center(
          child: Text('Profile Paqge'),
        ));
  }
}
