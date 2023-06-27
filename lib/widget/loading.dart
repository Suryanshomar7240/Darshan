import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/theme.dart';

class Loading extends StatelessWidget {
  // const loading({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SpinKitSquareCircle(color: kOrangeColor, size: 50));
  }
}
