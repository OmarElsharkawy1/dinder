import 'package:dartz/dartz.dart';
import 'package:pile_up/core/base_use_case/base_use_case.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/auth/domain/model/authModelResponse.dart';
import 'package:pile_up/features/auth/domain/repo/base_repo.dart';

class LoginWithEmailAndPasswordUseCase
    extends BaseUseCase<AuthModelResponse, AuthModel> {
  BaseRepository baseRepository;

  LoginWithEmailAndPasswordUseCase({required this.baseRepository});

  @override
  Future<Either<AuthModelResponse, Failure>> call(AuthModel parameter) async {
    final result = await baseRepository.loginWithEmailAndPassword(parameter);

    return result;
  }
}

class AuthModel {
  final String email;
  final String password;

  AuthModel({required this.email, required this.password});
}
