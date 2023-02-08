import 'package:flutter/material.dart';
import 'package:trashtag_city/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:trashtag_city/pages/sign_in.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trashtag City',

      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MainPageConnection(),
    );
  }
}

class MainPageConnection extends StatelessWidget {
  const MainPageConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else if(snapshot.hasData){
            return MyHomePage(title: "Trashtag City");
          }
          else{
            return SignInPage();
          }
        },
      ),
    );
  }
}