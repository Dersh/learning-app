import 'package:FlutterGalleryApp/screens/profile/repository/profile_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:FlutterGalleryApp/screens/profile/models/profile_data.dart';
import 'package:FlutterGalleryApp/screens/profile/profile_bloc/profile_bloc.dart';

ProfileData testProfile = ProfileData();

class MockProfileRepository extends Mock implements ProfileRepository {}

void main() {
  group('module 2', () {
    MockProfileRepository profileRepository;

    setUp(() {
      profileRepository = MockProfileRepository();
    });

    blocTest<ProfileBloc, ProfileState>(
      'should emit ProfileLoadFailure if repository throws',
      build: () {
        when(profileRepository.downloadProfileData())
            .thenThrow(Exception('oops'));
        return ProfileBloc(profileRepository: profileRepository);
      },
      act: (ProfileBloc bloc) async => bloc.add(ProfileLoaded()),
      seed: ProfileInitial(),
      expect: <ProfileState>[
        ProfileLoadFailure(),
      ],
    );

    blocTest<ProfileBloc, ProfileState>(
      'should emit ProfileLoadSuccess if download success',
      build: () {
        when(profileRepository.downloadProfileData())
            .thenAnswer((_) => Future.value(testProfile));
        return ProfileBloc(profileRepository: profileRepository);
      },
      act: (ProfileBloc bloc) async => bloc.add(ProfileLoaded()),
      seed: ProfileInitial(),
      expect: <ProfileState>[
        ProfileLoadSuccess(testProfile),
      ],
    );
  });
}
