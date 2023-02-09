import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:travel_app/main.dart';
import 'package:travel_app/services/Storage.dart';
import 'package:travel_app/widget/loading.dart';
import 'package:travel_app/services/auth.dart';
import 'package:travel_app/theme.dart';
import 'package:travel_app/widget/button.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String email = "";
  String password = "";
  String name = "";
  String phoneNumber = "";
  String Age = "";
  bool loading = false;
  String filerror = "";

  XFile? imageFile;

  get kBackgroundColor => null;

  Future<Position?> _getLocation() async {
    final location = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return location;
  }

  void _openGallery(BuildContext context) async {
    final picture = await ImagePicker().pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  void _openCamera(BuildContext context) async {
    var picture = await ImagePicker().pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  Future<void> _showSelectionDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("From where do you want to take the photo?"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: Text("Gallery"),
                      onTap: () {
                        _openGallery(context);
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: Text("Camera"),
                      onTap: () {
                        _openCamera(context);
                      },
                    )
                  ],
                ),
              ));
        });
  }

  Future _uploadFile() async {
    if (imageFile == null) return null;

    final filename = basename(imageFile!.path);
    final destination = 'users/$filename';

    var task = FireBaseApi.uploadFile(destination, File(imageFile!.path));
    if (task == null) return null;
    print(task);
    final snapshot = await task.whenComplete(() {});
    final url = await snapshot.ref.getDownloadURL();
    return url;
  }

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    final _formKey = GlobalKey<FormState>();

    Widget _setImageView() {
      if (imageFile != null) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 50),
          child: Image.file(File(imageFile!.path),
              width: 200, height: 200, fit: BoxFit.fill),
        );
      } else {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 50),
          child: Image.asset('assets/avatar.png',
              width: 200, height: 200, fit: BoxFit.fill),
        );
      }
    }

    Widget header() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/");
            },
            child: Image.asset(
              'assets/icon_back.png',
              width: 60,
              height: 60,
            ),
          ),
          Text(
            "signup",
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
          Image.asset(
            "assets/icon_three_dots.png",
            width: 60,
            height: 60,
          ),
        ],
      );
    }

    return SafeArea(
      child: loading
          ? Loading()
          : Scaffold(
              backgroundColor: kBackgroundColor,
              body: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(
                    left: 23,
                    right: 23,
                    top: 27,
                    bottom: 100,
                  ),
                  child: Column(
                    children: [
                      header(),
                      SizedBox(height: 75),
                      Text(
                        "Join,\n      the family!!",
                        style: blackTextStyle.copyWith(
                          fontSize: 40,
                          fontWeight: semiBold,
                        ),
                      ),
                      //SizedBox(height: 200),
                      Container(
                        padding: EdgeInsets.only(top: 75, right: 35, left: 35),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              _setImageView(),
                              SizedBox(height: 20),
                              InkWell(
                                onTap: () {
                                  _showSelectionDialog(context);
                                },
                                child: Container(
                                    width: 180,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: kOrangeColor,
                                      boxShadow: [
                                        BoxShadow(
                                          color: kOrangeColor.withOpacity(0.81),
                                          spreadRadius: 0,
                                          blurRadius: 24,
                                          offset: Offset(5,
                                              9), // changes position of shadow
                                        )
                                      ],
                                    ),
                                    child: Container(
                                      margin:
                                          EdgeInsets.fromLTRB(35, 15, 0, 15),
                                      child: Text(
                                        "Upload a image",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )),
                              ),
                              SizedBox(height: 5),
                              Text(filerror,
                                  style: TextStyle(color: Colors.red)),
                              SizedBox(height: 5),
                              TextFormField(
                                decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  hintText: 'Name',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                onChanged: (val) => name = val,
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                validator: (val) =>
                                    val!.isEmpty ? "Enter an Email" : null,
                                decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  hintText: 'E-mail',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                onChanged: (val) => email = val,
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  hintText: 'Age',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                onChanged: (val) => Age = val,
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  hintText: 'Phone number',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                onChanged: (val) => phoneNumber = val,
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                obscureText: true, //to give password effect
                                validator: (val) => (val!.length < 6)
                                    ? "Passwords length should be 6+"
                                    : null,
                                decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  hintText: 'Password',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                onChanged: (val) => password = val,
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                validator: (val) =>
                                    (val != password && val!.length < 6)
                                        ? "Enter the same password"
                                        : null,
                                obscureText: true, //to give password effect
                                decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  hintText: 'Confirm your Password',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Button(
                                width: 243,
                                height: 54,
                                fontSize: 22,
                                content: 'Sign up',
                                onClick: () async {

                                  if (imageFile == null) {
                                    setState(() {
                                      filerror = "Choose a file";
                                    });
                                  }

                                  //checking whether the form is valid or not
                                  else if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      loading = true;
                                    });

                                  //Taking user location
                                  Position? pos = await _getLocation();

                                    var file = await _uploadFile();
                                    if (file == null) {
                                      setState(() {
                                        filerror = "Choose a file";
                                        loading = false;
                                      });
                                    }

                                    dynamic user = await _auth
                                        .registerwithEmailandPassword(
                                            email,
                                            password,
                                            name,
                                            phoneNumber,
                                            Age,
                                            pos!.latitude,
                                            pos.longitude,
                                            file);

                                    if (user != null) {
                                      Home.user = user;
                                      Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        '/home',
                                        (route) => false,
                                      );
                                    } else {
                                      setState(() {
                                        loading = false;
                                      });
                                    }
                                  }
                                },
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              GestureDetector(
                                child: Text(
                                  "Login",
                                  style: blackTextStyle.copyWith(
                                    decoration: TextDecoration.underline,
                                    fontSize: 20,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, '/login', (route) => true);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
