import 'package:either_dart/either.dart';
import 'package:to_do_app/domain/repositories/to_do_repository.dart';

import '../../core/use_case.dart';
import '../entities/unique_id.dart';
import '../failures/failure.dart';

class LoadToDoEntryIdsForCollection implements UseCase<List<EntryId>, CollectionIdParam> {
  const LoadToDoEntryIdsForCollection({required this.toDoRepository});

  final ToDoRepository toDoRepository;

  @override
  Future<Either<Failure, List<EntryId>>> call(CollectionIdParam params) async {
    try {
      final loadedIds = toDoRepository.readToDoEntryIds(
        params.collectionId,
      );

      return loadedIds.fold(
            (left) => Left(left),
            (right) => Right(right),
      );
    } on Exception catch (e) {
      return Left(ServerFailure(stackTrace: e.toString()));
    }
  }
}
