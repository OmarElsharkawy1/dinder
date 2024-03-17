import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/my_profile_screen/domain/model/my_profile_mode.dart';
import 'package:pile_up/features/my_profile_screen/domain/repo/my_profile_base_repo.dart';

class GetMyProfileUseCase {
  final BaseRepositoryMyProfile baseRepositoryMyProfile;

  GetMyProfileUseCase({required this.baseRepositoryMyProfile});

  Future<Either<MyProfile, Failure>> getMyProfile() async {
    final result = await baseRepositoryMyProfile.getMyProfile();

    return result;
  }
}
