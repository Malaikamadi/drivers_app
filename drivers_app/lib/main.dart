import 'package:drivers_app/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'authentication/login_screen.dart';


Future<void> main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCLwMGGIvK31DOBjT1O02Ix5EjI5qoahkY",
      authDomain: "indriver-console.firebaseapp.com",
      databaseURL: "https://indriver-console-default-rtdb.firebaseio.com",
      projectId: "indriver-console",
      storageBucket: "indriver-console.appspot.com",
      messagingSenderId: "183568777633",
      appId: "1:183568777633:web:bc9ffb605bfcf8dab54be0",
      measurementId: "G-49NHY0SFWV"
    )
  );

  await Permission.locationWhenInUse.isDenied.then((valueOfPermission)
  {
    if(valueOfPermission)
    {
      Permission.locationWhenInUse.request();
    }
  });

  await Permission.notification.isDenied.isDenied.then((valueOfPermission)
  {
    if(valueOfPermission)
    {
      Permission.locationWhenInUse.request();
    }
  });

  runApp(const MyApp());
}

extension on Future<bool> {
  get isDenied => null;
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: "Drivers App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: FirebaseAuth.instance.currentUser ==null ? LoginScreen() : HomePage(),
    );
  }
}
