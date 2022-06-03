import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import '../login/login_screen.dart';
import '../splash_screen.dart';
import 'components/messages.dart';
import 'components/new_message.dart';

class ChatScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return FutureBuilder(
        // Initialize FlutterFire:
        future: _initialization,
        builder: (context, appSnapshot) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text('FlutterChat'),
            ),
            body: StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (ctx, userSnapshot) {
                  if (userSnapshot.connectionState == ConnectionState.waiting) {
                    return SplashScreen();
                  }
                  if (userSnapshot.hasData) {
                    return Container(
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Messages(),
                          ),
                          NewMessage(),
                        ],
                      ),
                    );
                  }
                  return LoginScreen();
                }),
          );
        });
  }
}
