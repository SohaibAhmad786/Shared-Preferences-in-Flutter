import 'package:firstapp/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreenView extends StatefulWidget {
  const LoginScreenView({Key? key}) : super(key: key);

  @override
  State<LoginScreenView> createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView> {
  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login Screen",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 80,
              //color: Colors.amber,
              child: const Center(
                child: Text(
                  "Login Screen",
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                height: 80,
                //color: Colors.blueAccent,
                child: TextField(
                  controller: c1,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.blue),
                  decoration: const InputDecoration(
                      label: Text(
                        "Username",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.blue),
                      ),
                      prefixIcon: Icon(
                        Icons.person_rounded,
                        size: 40,
                        color: Colors.blue,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      )),
                ),
              ),
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                height: 80,
                //color: Colors.yellowAccent,
                child: TextField(
                  controller: c2,
                  obscureText: true,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.blue),
                  decoration: const InputDecoration(
                    label: Text("Password",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.blue)),
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      size: 40,
                      color: Colors.blue,
                    ),

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))
                        )
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 70,
              width: 160,
              decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: TextButton(
                  onPressed: () async {
                    print("getting data");
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setString("username", c1.text);
                    await prefs.setString("password", c2.text);
                    print("Got Data");
                    Get.to(() => const HomescreenDesign());
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
