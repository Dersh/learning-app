import 'package:http/http.dart' as http;
import 'package:FlutterGalleryApp/screens/profile/data_provider/profile_data_provider.dart';
import 'package:FlutterGalleryApp/screens/profile/load_error.dart';
import 'package:FlutterGalleryApp/screens/profile/loading.dart';
import 'package:FlutterGalleryApp/screens/profile/profile.dart';
import 'package:FlutterGalleryApp/screens/profile/repository/profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_bloc/profile_bloc.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileBloc profileBloc;
  @override
  void initState() {
    profileBloc = ProfileBloc(
        profileRepository: ProfileRepository(
            profileDataProvider:
                ProfileDataProvider(httpClient: http.Client())))
      ..add(ProfileLoaded());
    super.initState();
  }

  @override
  void dispose() {
    profileBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      cubit: profileBloc,
      builder: (context, state) {
        if (state is ProfileInitial)
          return Loading();
        else if (state is ProfileLoadSuccess)
          return Profile(state.profileData);
        else
          return LoadError();
      },
    );
  }
}
