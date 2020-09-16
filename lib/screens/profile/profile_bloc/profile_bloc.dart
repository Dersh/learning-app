import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import '../models/profile_data.dart';
import '../repository/profile_repository.dart';
part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;
  ProfileBloc({@required this.profileRepository})
      : assert(profileRepository != null),
        super(ProfileInitial());

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is ProfileLoaded) {
      try {
        ProfileData profileData = await  profileRepository.downloadProfileData();
        yield ProfileLoadSuccess(profileData);
      } catch (e){
        print(e);
        yield ProfileLoadFailure();
      }

    }
  }
}
