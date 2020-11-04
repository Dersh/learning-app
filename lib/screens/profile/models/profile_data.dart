import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class ProfileData extends Equatable {
  final String name;
  final String surname;
  final int followers;
  final int following;
  final String address;
  final String link;
  final String bio;
  final String profileImageLink;
  final List<String> photos;
  final List<String> likedPhotos;
  final List<String> bookmarkPhotos;
  ProfileData(
      {this.name,
      this.surname,
      this.followers,
      this.likedPhotos,
      this.profileImageLink,
      this.address,
      this.link,
      this.bio,
      this.bookmarkPhotos,
      this.following,
      this.photos});
  @override
  List<Object> get props => [
        name,
        surname,
        followers,
        likedPhotos,
        address,
        link,
        bio,
        bookmarkPhotos,
        profileImageLink,
        following,
        photos
      ];
}
