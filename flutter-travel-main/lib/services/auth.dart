import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel_app/services/database.dart';

class AuthUser {
  final String uid;
  AuthUser({required this.uid});
}

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //A function which return AuthUser from firebase User
  AuthUser? _userfromFireBaseUser(User user) {
    // ignore: unnecessary_null_comparison
    return (user == null) ? AuthUser(uid: "123r"): AuthUser(uid: user.uid);
  }

  //Funcrion to implement Register with email and password
  Future<AuthUser?> registerwithEmailandPassword(String email, String password,
      String name, String phoneNumber, String Age,double lat,double long,String image) async {
    final userCredentail = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await DatabaseManager()
        .CreateUser(_userfromFireBaseUser(userCredentail.user!)!.uid, name, phoneNumber, email, Age,lat,long,image);
    return _userfromFireBaseUser(userCredentail.user!);
  }

  //function for sign in
  Future<AuthUser?> signinwithEmailandpassword(
      String email, String password) async {
    final userCredentail = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return _userfromFireBaseUser(userCredentail.user!);
  }

  //A stream to check whether the user is Authenticated or not
  Stream<AuthUser?> get onAuthChange {
    return _auth
        .authStateChanges()
        .map((User? user) => (user == null) ? null : AuthUser(uid: user.uid));
  }

  //function to implement Sign out
  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {}
  }
}
