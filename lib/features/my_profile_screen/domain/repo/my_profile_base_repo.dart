import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/my_profile_screen/domain/model/my_profile_mode.dart';

abstract class BaseRepositoryMyProfile {
  Future<Either<MyProfile, Failure>> getMyProfile();
}
