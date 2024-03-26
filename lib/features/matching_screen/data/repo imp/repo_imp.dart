import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/features/matching_screen/data/data%20source/get_dogs_remote_data_source.dart';
import 'package:pile_up/features/matching_screen/domain/model/dog_model.dart';
import 'package:pile_up/features/matching_screen/domain/repo/dogs_base_repo.dart';

class DogsRepositoryImp extends BaseRepositoryDogs {
  final BaseRemotelyDataSourceDogs baseRemotelyDataSourceDogs;

  DogsRepositoryImp({required this.baseRemotelyDataSourceDogs});

  @override
  Future<Either<List<DogModel>, Failure>> getDogs() async {
    try {
      final result = await baseRemotelyDataSourceDogs.getDogs();
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }
}
