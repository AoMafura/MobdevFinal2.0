import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo[600],
      child: Center(
        child: SpinKitCircle(
          color: Colors.amber[600],
          size: 70.0,
        ),
      ),
    );
  }
}
