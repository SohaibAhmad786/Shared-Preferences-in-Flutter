import 'package:firstapp/HomeScreen.dart';
import 'package:firstapp/Shared%20Prefernces/loginscreenview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesTopic extends StatefulWidget {
  const SharedPreferencesTopic({Key? key}) : super(key: key);

  @override
  State<SharedPreferencesTopic> createState() => _SharedPreferencesTopicState();
}

class _SharedPreferencesTopicState extends State<SharedPreferencesTopic> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    whereToMove();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.amber,
          color: Colors.greenAccent,
          strokeWidth: 5,
          semanticsLabel: "Abc",
          semanticsValue: "DEF",
        ),
      ),
    );
  }

  whereToMove() async {
    final prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString("username");
    String? password = prefs.getString("password");
    if (username == null && password == null) {
      Get.to(() => const LoginScreenView());
    } else {
      Get.to(() => const HomescreenDesign());
    }
  }
}
