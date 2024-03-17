import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/matching_screen/domain/model/dog_model.dart';

abstract class BaseRepositoryDogs {
  Future<Either<List<DogModel>, Failure>> getDogs();
}
