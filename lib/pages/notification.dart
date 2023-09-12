import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class Notifcation extends StatelessWidget {
  const Notifcation({super.key});

  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
      ),
      body: Center(
        child: Text(message.notification!.body!),
      ),
    );
  }
}
