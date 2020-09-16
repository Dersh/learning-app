part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoadSuccess extends ProfileState {
  final ProfileData profileData;
  ProfileLoadSuccess(this.profileData);
  @override
  List<Object> get props => [profileData];
}

class ProfileLoadFailure extends ProfileState {}
