import 'package:either_dart/either.dart';
import 'package:either_dart/src/either.dart';
import 'package:to_do_app/domain/entities/to_do_collection.dart';

import 'package:to_do_app/domain/failures/failure.dart';

import '../../core/use_case.dart';
import '../repositories/to_do_repository.dart';

class LoadToDoCollections implements UseCase<List<ToDoCollection>, NoParams>{
  final ToDoRepository toDoRepository;

  const LoadToDoCollections({required this.toDoRepository});
  @override
  Future<Either<Failure, List<ToDoCollection>>> call(NoParams params) async {
    try {
      final loadedCollections = toDoRepository.readToDoCollections();

      return loadedCollections.fold(
            (left) => Left(left),
            (right) => Right(right),
      );
    } on Exception catch (e) {
      return Left(
        ServerFailure(stackTrace: e.toString()),
      );
    }
  }

}
