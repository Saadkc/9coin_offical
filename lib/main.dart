import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:ninecoin/apptheme/apptheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ninecoin/features/home/ui/home_page.dart';

import 'features/auth/ui/login_page.dart';
import 'firebase_options.dart';

Future<void> backgroundHandler(RemoteMessage message ) async{
  
  print(message.data.toString());
  print(message.notification!.title);

}


void main() async {
   WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    name: "ninecoin",
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  await messaging.requestPermission(
  alert: true,
  announcement: false,
  badge: true,
  carPlay: false,
  criticalAlert: false,
  provisional: false,
  sound: true,
);



FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  print('Got a message whilst in the foreground!');
  print('Message data: ${message.data}');

  if (message.notification != null) {
    print('Message also contained a notification: ${message.notification}');
  }
});
  runApp(const App(page: 0,));
}

class App extends StatelessWidget {
  final int? page;
  const App({Key? key, this.page}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.standard,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      home: const LoginPage()
      
    );
  }
}
