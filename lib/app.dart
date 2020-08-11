import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:connectivity/connectivity.dart';

import 'package:FlutterGalleryApp/res/res.dart';

import 'screens/404.dart';
import 'screens/home.dart';
import 'screens/photo_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(Connectivity().onConnectivityChanged),
      theme: ThemeData(
        textTheme: buildAppTextTheme(),
      ),
      onUnknownRoute: (RouteSettings settings) => _buildRoute(PageNotFound()),
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == '/fullScreenImage') {
          FullScreenImageArguments args = (settings.arguments as FullScreenImageArguments);
          final child = FullScreenImage(
            photo: args.photo,
            altDescription: args.altDescription,
            userName: args.userName,
            name: args.name,
            userPhoto: args.userPhoto,
            heroTag: args.heroTag,
          );

          return _buildRoute(child, arguments: args);
        }

        return null;
      },
      debugShowCheckedModeBanner: false,
    );
  }

  ModalRoute _buildRoute(child, {arguments}) {
    if (Platform.isAndroid) {
      return CupertinoPageRoute(builder: (context) => child, settings: arguments.settings);
    } else if (Platform.isIOS) {
      return MaterialPageRoute(builder: (context) => child, settings: arguments.settings);
    }

    return null;
  }
}
