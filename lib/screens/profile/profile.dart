import 'package:FlutterGalleryApp/screens/profile/images_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'models/profile_data.dart';

class Profile extends StatefulWidget {
  final ProfileData profileData;
  Profile(this.profileData);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
      length: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 41),
              child: Text(
                "${widget.profileData.name} ${widget.profileData.surname}",
                key: ValueKey("profile_name"),
                style: TextStyle(
                    letterSpacing: -0.41,
                    color: Colors.black,
                    fontSize: 17,
                    height: 1.29,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 31),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 18),
                    child: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: widget.profileData.profileImageLink,
                        width: 75,
                        height: 75,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                //TODO проверить паддинг
                                padding: const EdgeInsets.only(right: 40),
                                child: Column(
                                  children: [
                                    Text(
                                      "${widget.profileData.followers}",
                                      style: const TextStyle(
                                          color: Color(0xFF16B9FD),
                                          letterSpacing: -0.46,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          height: 1.27),
                                    ),
                                    Text(
                                      "followers",
                                      style: const TextStyle(
                                          fontSize: 13,
                                          height: 1.38,
                                          letterSpacing: -0.08,
                                          color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    "${widget.profileData.following}",
                                    style: const TextStyle(
                                        color: Color(0xFF16B9FD),
                                        letterSpacing: -0.46,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        height: 1.27),
                                  ),
                                  Text(
                                    "following",
                                    style: const TextStyle(
                                        fontSize: 13,
                                        height: 1.38,
                                        letterSpacing: -0.08,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                            ],
                          )),
                      Padding(
                        padding: EdgeInsets.only(top: 11),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 9.79),
                              child: SvgPicture.asset(
                                "assets/icons/location.svg",
                                height: 13,
                                width: 9.42,
                                color: Color(0xFF16B9FD),
                              ),
                            ),
                            Text(
                              "${widget.profileData.address ?? ""}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 13,
                                  height: 1.38,
                                  letterSpacing: -0.08,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 11),
                        child: Row(
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(right: 8.49),
                                child: SvgPicture.asset(
                                  "assets/icons/link.svg",
                                  height: 13.28,
                                  width: 12.42,
                                  color: Color(0xFF16B9FD),
                                )),
                            Text(
                              "${widget.profileData.link ?? ""}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 13,
                                  height: 1.38,
                                  letterSpacing: -0.08,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      )
                    ],
                  ))
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  "${widget.profileData.bio}",
                  style: const TextStyle(
                      fontSize: 12,
                      height: 1.66,
                      fontWeight: FontWeight.w300,
                      letterSpacing: -0.24,
                      color: Colors.black),
                  textAlign: TextAlign.justify,
                  //TODO проверить
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                )),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: Color(0xffE7E7E7)))),
              height: 42,
              margin: EdgeInsets.only(top: 25),
              child: TabBar(
                labelColor: Color(0xFF39CEFD),
                indicatorWeight: 3,
                indicatorColor: Color(0xFF39CEFD),
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(
                    icon: Icon(
                      FontAwesomeIcons.home,
                      size: 18,
                    ),
                    key: ValueKey("home_tab"),
                  ),
                  Tab(
                    icon: Icon(
                      FontAwesomeIcons.heart,
                      size: 20.99,
                    ),
                    key: ValueKey("favorite_tab"),
                  ),
                  Tab(
                    icon: Icon(
                      FontAwesomeIcons.bookmark,
                      size: 17,
                    ),
                    key: ValueKey("bookmark_tab"),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ImageGrid(imageLinks: widget.profileData.photos),
                  ImageGrid(imageLinks: widget.profileData.likedPhotos),
                  ImageGrid(imageLinks: widget.profileData.likedPhotos),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
