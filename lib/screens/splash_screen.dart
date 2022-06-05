// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: const Center(
        child: Text('Loading...'),
      ),
    );
  }
}
