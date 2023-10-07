import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/pages/home_page.dart';
import 'package:travel_app/pages/login_page.dart';
import 'package:travel_app/pages/marketplace_page.dart';
import 'package:travel_app/pages/onboarding_page.dart';
import 'package:travel_app/pages/user_profile.dart';
import 'package:travel_app/services/auth.dart';
import 'package:travel_app/pages/bookmarks_page.dart';
import 'package:travel_app/pages/signup_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCyyOJJ8_A6djo7J09Mo6UQZv0741VOujU",
      projectId: "darshan-94f20",
      appId: "1:20336022135:android:acbf593c8c92e3ccb9ec72",
      messagingSenderId: "20336022135",
    ),
  );




  print('Firebase!');

  runApp(
    MultiProvider(
      providers: [
        Provider<AuthService>(create: (ctx) => AuthService()),
      ],
      child: const MyApp(),
    ),
  );
}

class Home extends StatelessWidget {
  Home({Key? key, user}) : super(key: key);
  static var user;

  getuser() {
    return user;
  }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<AuthUser?>(context);
    // print(user);
    if (user != null)
      return HomePage(
        user: user.uid,
      );
    else
      return OnBoardingPage();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<AuthUser?>.value(
      value: AuthService().onAuthChange,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
        routes: {
          '/boarding': (context) => OnBoardingPage(),
          '/home': (context) => HomePage(user: Home.user.uid),
          '/user': (context) => UserProfile(user: Home.user.uid),
          '/bookmarks': (context) => BookmarksPage(),
          '/login': (context) => LoginPage(),
          '/signup': (context) => SignupPage(),
          '/marketplace': (context) => MarketPage(),
        },
      ),
    );
  }
}

/*
login_page line 127 and here line 65 -> passing of user variable after login isn't being done properly
*/