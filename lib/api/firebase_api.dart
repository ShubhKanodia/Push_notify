import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:push_notify/main.dart';

class FirebaseApi {
  //first create instance of firebase messaging
  final _firebaseMessaging = FirebaseMessaging.instance;

  //function to initialize notifications
  Future<void> initNotifications() async {
    //request user's permission
    await _firebaseMessaging.requestPermission();
    //get the token(firebase cloud messaging)
    final token = await _firebaseMessaging.getToken();

    //print to check
    print('Token: $token');

    initNotifications();
  }

  //function to handle notifications
  void handleMessage(RemoteMessage? message) {
    if (message == null) return;

    //navigate to new screen when notification is tapped
    navigatorKey.currentState!.pushNamed(
      '/notification',
      arguments: message,
    );
  }

  //function to handle foreground and background notifications
  Future initPushNotifications() async {
    //handle notifications is app was terminated and is now opened
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    //handle notifications if app is in background
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);

    //handle notifications if app is in foreground
    FirebaseMessaging.onMessage.listen(handleMessage);
  }
}
