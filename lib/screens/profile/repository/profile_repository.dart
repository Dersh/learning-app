import 'dart:convert';
import 'dart:async';

import 'package:FlutterGalleryApp/screens/profile/models/profile_data.dart';
import 'package:flutter/cupertino.dart';

import '../data_provider/profile_data_provider.dart';

class ProfileRepository {
  ProfileRepository({@required this.profileDataProvider});
  final ProfileDataProvider profileDataProvider;
  Future<ProfileData> downloadProfileData() async {
    final String profileData = await profileDataProvider.downloadProfileData();
    final Map<String, dynamic> profile = json.decode(profileData);
    final String likedPhotosData =
        await profileDataProvider.downloadLikedPhotos();
    List<String> likedPhotosLinks = (json.decode(likedPhotosData) as List)
        .map<String>((photo) => photo["urls"]["small"])
        .toList();
    final String photosData = await profileDataProvider.downloadPhotos();
    List<String> photosLinks = (json.decode(photosData) as List)
        .map<String>((photo) => photo["urls"]["small"])
        .toList();
    return ProfileData(
      profileImageLink: profile["profile_image"]["large"],
        name: profile["first_name"],
        surname: profile["last_name"],
        bio: profile["bio"],
        followers: profile["followers_count"],
        following: profile["following_count"],
        likedPhotos: likedPhotosLinks,
        photos: photosLinks,
        bookmarkPhotos: photosLinks,
        link: profile["email"],
        address: profile["location"]);
  }
}
