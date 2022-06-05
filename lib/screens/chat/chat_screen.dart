import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_folder/configs/constants.dart';

import '../login/login_screen.dart';
import '../splash_screen.dart';
import 'components/messages.dart';
import 'components/new_message.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return FutureBuilder(
        // Initialize FlutterFire:
        future: _initialization,
        builder: (context, appSnapshot) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text('Messenger'),
              backgroundColor: kPrimaryColor,
            ),
            body: StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (ctx, userSnapshot) {
                  if (userSnapshot.connectionState == ConnectionState.waiting) {
                    return SplashScreen();
                  }
                  if (userSnapshot.hasData) {
                    return Column(
                      children: <Widget>[
                        Expanded(
                          child: Messages(),
                        ),
                        NewMessage(),
                      ],
                    );
                  }
                  return const LoginScreen();
                }),
          );
        });
  }
}
