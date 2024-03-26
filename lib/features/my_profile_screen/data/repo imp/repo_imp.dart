import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/features/matching_screen/data/data%20source/get_dogs_remote_data_source.dart';
import 'package:pile_up/features/matching_screen/domain/model/dog_model.dart';
import 'package:pile_up/features/matching_screen/domain/repo/dogs_base_repo.dart';
import 'package:pile_up/features/my_profile_screen/data/data%20source/my_profile_remote_data_source.dart';
import 'package:pile_up/features/my_profile_screen/domain/model/my_profile_mode.dart';
import 'package:pile_up/features/my_profile_screen/domain/repo/my_profile_base_repo.dart';

class MyProfileRepositoryImp extends BaseRepositoryMyProfile {
  final BaseRemotelyDataSourceMyProfile baseRemotelyDataSourceMyProfile;

  MyProfileRepositoryImp({required this.baseRemotelyDataSourceMyProfile});

  @override
  Future<Either<MyProfile, Failure>> getMyProfile() async {
    try {
      final result = await baseRemotelyDataSourceMyProfile.getMyProfile();
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }
}
