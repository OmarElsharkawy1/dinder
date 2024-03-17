import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/matching_screen/domain/model/dog_model.dart';
import 'package:pile_up/features/matching_screen/domain/repo/dogs_base_repo.dart';

class GetDogsUseCase {
  final BaseRepositoryDogs baseRepositoryDogs;

  GetDogsUseCase({required this.baseRepositoryDogs});

  Future<Either<List<DogModel>, Failure>> getDogs() async {
    final result = await baseRepositoryDogs.getDogs();

    return result;
  }
}
