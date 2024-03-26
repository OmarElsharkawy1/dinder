import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/auth/data/auth_remote_data_source.dart';
import 'package:pile_up/features/auth/domain/model/authModelResponse.dart';
import 'package:pile_up/features/auth/domain/use_case/login_with_email_and_password_use_case.dart';
import 'package:pile_up/features/auth/domain/use_case/sign_up_use_case.dart';

abstract class BaseRepository {
  Future<Either<AuthModelResponse, Failure>> loginWithEmailAndPassword(
      AuthModel authModel);
  Future<Either<Map<String, dynamic>, Failure>> signUpWithEmailAndPassword(
      SignUpModel signUpModel);
  Future<Either<AuthWithGoogleModel, Failure>> signWithGoogle();
}
