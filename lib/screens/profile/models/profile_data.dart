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
      {@required this.name,
      @required this.surname,
      @required this.followers,
      @required this.likedPhotos,
      @required this.profileImageLink,
      @required this.address,
      @required this.link,
      @required this.bio,
      @required this.bookmarkPhotos,
      @required this.following,
      @required this.photos});
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
