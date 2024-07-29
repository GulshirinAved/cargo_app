import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:kargo_app/src/bottom_nav/bottom_nav_screen.dart';
import 'package:kargo_app/src/core/send_token.dart';
import 'package:kargo_app/src/screens/clientHome/clientHome_screen.dart';

import '../../core/firebase_setup.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({Key? key}) : super(key: key);

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    FirebaseSetup();

    Future.delayed(const Duration(seconds: 3), () {
      ////!!!!!!!!!Suny men calyshdym for testing client ui
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => const BottomNavScreen(),
      ));
      // Navigator.of(context).pushReplacement(MaterialPageRoute(
      //   builder: (_) => const ClientHomeScreen(),
      // ));
    });
    sendToken();
  }

  sendToken() async {
    final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    String? token = await firebaseMessaging.getToken();
    print(token);
    print('ebofboqufboqfboqbfqofbu');

    SendFcmTokenRepository().sendToken(token!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            )),
        child: Padding(
          padding: const EdgeInsets.all(100.0),
          child: Center(
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
      ),
    );
  }
}
