import "dart:async";

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class ProfileDataProvider {
  final http.Client httpClient;

  ProfileDataProvider({@required this.httpClient}) : assert(httpClient != null);
  final String username = "keyvan_mansouri";
  final String authToken = "iCtDAVKK124Nat_FBIY-eUeV98-XMHnjOkqF2Ll-qGQ";
  Future<String> downloadProfileData() async {
    var response = await http.get(
        'https://api.unsplash.com//users/$username',
        headers: {'Authorization': 'Bearer $authToken'});

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response.body;
    } else {
      throw Exception('Error: ${response.reasonPhrase}');
    }
  }

  Future<String> downloadLikedPhotos() async {
    var response = await http.get(
        'https://api.unsplash.com//users/$username/likes',
        headers: {'Authorization': 'Bearer $authToken'});

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response.body;
    } else {
      throw Exception('Error: ${response.reasonPhrase}');
    }
  }

  Future<String> downloadPhotos() async {
    var response = await http.get(
        'https://api.unsplash.com//users/$username/photos',
        headers: {'Authorization': 'Bearer $authToken'});

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response.body;
    } else {
      throw Exception('Error: ${response.reasonPhrase}');
    }
  }
}
