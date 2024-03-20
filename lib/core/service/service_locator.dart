import 'package:get_it/get_it.dart';
import 'package:pile_up/features/auth/data/auth_remote_data_source.dart';
import 'package:pile_up/features/auth/data/repo_imp.dart';
import 'package:pile_up/features/auth/domain/repo/base_repo.dart';
import 'package:pile_up/features/auth/domain/use_case/google_sign.dart';
import 'package:pile_up/features/auth/domain/use_case/login_with_email_and_password_use_case.dart';
import 'package:pile_up/features/auth/domain/use_case/sign_up_use_case.dart';
import 'package:pile_up/features/auth/presentation/controller/login_bloc/login_with_email_and_password_bloc.dart';
import 'package:pile_up/features/auth/presentation/controller/sign_in_with_platform_bloc/sign_in_with_platform_bloc.dart';
import 'package:pile_up/features/auth/presentation/controller/sign_up_bloc/sign_up_with_email_and_password_bloc.dart';
import 'package:pile_up/features/matching_screen/data/data%20source/jobs_remote_data_source.dart';
import 'package:pile_up/features/matching_screen/data/repo%20imp/repo_imp.dart';
import 'package:pile_up/features/matching_screen/domain/repo/dogs_base_repo.dart';
import 'package:pile_up/features/matching_screen/domain/use_case/get_dogs_use_case.dart';
import 'package:pile_up/features/matching_screen/presentation/controller/get_dogs_bloc.dart';
import 'package:pile_up/features/my_profile_screen/data/data%20source/my_profile_remote_data_source.dart';
import 'package:pile_up/features/my_profile_screen/data/repo%20imp/repo_imp.dart';
import 'package:pile_up/features/my_profile_screen/domain/repo/my_profile_base_repo.dart';
import 'package:pile_up/features/my_profile_screen/domain/use_case/get_my_profile_use_case.dart';
import 'package:pile_up/features/my_profile_screen/presentation/controller/get_my_profile_bloc.dart';

final getIt = GetIt.instance;

class ServerLocator {
  Future<void> init() async {
    //bloc

    // getIt.registerLazySingleton<BaseRepository>(
    //     () => RepositoryImp(baseRemotelyDataSource: getIt()));

    getIt.registerLazySingleton(() => LoginWithEmailAndPasswordBloc(
        loginWithEmailAndPasswordUseCase: getIt()));
    getIt.registerLazySingleton(
        () => SignInWithPlatformBloc(signInWithGoogleUC: getIt()));

    getIt.registerLazySingleton(() => SignUpWithEmailAndPasswordBloc(
          signUpWithEmailAndPasswordUseCase: getIt(),
        ));

    getIt.registerLazySingleton(() => GetDogsBloc(getDogsUseCase: getIt()));
    getIt.registerLazySingleton(
        () => GetMyProfileBloc(getMyProfileUseCase: getIt()));

//use_case
    getIt.registerFactory(
        () => LoginWithEmailAndPasswordUseCase(baseRepository: getIt()));
    getIt.registerFactory(() => SignInWithGoogleUC(baseRepository: getIt()));

    getIt.registerFactory(
        () => SignUpWithEmailAndPasswordUseCase(baseRepository: getIt()));

    getIt.registerFactory(() => GetDogsUseCase(baseRepositoryDogs: getIt()));
    getIt.registerFactory(
        () => GetMyProfileUseCase(baseRepositoryMyProfile: getIt()));

    //Remote Date
    getIt.registerLazySingleton<BaseRemotelyDataSource>(
        () => AuthRemotelyDateSource());

    getIt.registerLazySingleton<BaseRemotelyDataSourceDogs>(
        () => DogsRemotelyDateSource());

    getIt.registerLazySingleton<BaseRemotelyDataSourceMyProfile>(
        () => MyProfileRemotelyDateSource());

    //Repository Implementation
    getIt.registerLazySingleton<BaseRepository>(
        () => RepositoryImp(baseRemotelyDataSource: getIt()));
    getIt.registerLazySingleton<BaseRepositoryDogs>(
        () => DogsRepositoryImp(baseRemotelyDataSourceDogs: getIt()));
    getIt.registerLazySingleton<BaseRepositoryMyProfile>(
        () => MyProfileRepositoryImp(baseRemotelyDataSourceMyProfile: getIt()));
  }
}
