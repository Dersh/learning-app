import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoadError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/images/wifi.svg",
            width: 59.51,
            height: 52.29,
            color: Color(0xFFB2BBC6),
          ),
          Padding(
            padding: EdgeInsets.only(top: 21.71),
            child: Text(
              "There was an error\nplease try again",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  height: 1.29,
                  letterSpacing: -0.41,
                  color: Color(0xFF919BA8)),
            ),
          )
        ],
      ),
    );
  }
}
