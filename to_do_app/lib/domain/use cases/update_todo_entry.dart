import 'package:either_dart/either.dart';

import '../../core/use_case.dart';
import '../entities/to_do_entry.dart';
import '../failures/failure.dart';
import '../repositories/to_do_repository.dart';

class UpdateToDoEntry implements UseCase<ToDoEntry, ToDoEntryIdsParam> {
  const UpdateToDoEntry({required this.toDoRepository});

  final ToDoRepository toDoRepository;

  @override
  Future<Either<Failure, ToDoEntry>> call(ToDoEntryIdsParam params) async {
    try {
      final loadedEntry = await toDoRepository.updateToDoEntry(
        collectionId: params.collectionId,
        entryId: params.entryId,
      );
      return loadedEntry.fold(
            (left) => Left(left),
            (right) => Right(right),
      );
    } on Exception catch (e) {
      return Left(ServerFailure(stackTrace: e.toString()));
    }
  }
}
