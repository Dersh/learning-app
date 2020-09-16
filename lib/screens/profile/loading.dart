import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Color(0xFF16B9FD)),
      ),
    );
  }
}
