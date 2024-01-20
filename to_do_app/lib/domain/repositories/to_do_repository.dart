import 'package:either_dart/either.dart';
import 'package:to_do_app/domain/entities/to_do_collection.dart';

import '../entities/to_do_entry.dart';
import '../entities/unique_id.dart';
import '../failures/failure.dart';

abstract class ToDoRepository {
  Future<Either<Failure, List<ToDoCollection>>> readToDoCollections();
  Future<Either<Failure, ToDoEntry>> readToDoEntry(CollectionId collectionId, EntryId entryId);
  Future<Either<Failure, List<EntryId>>> readToDoEntryIds(CollectionId collectionId);
  Future<Either<Failure, ToDoEntry>> updateToDoEntry({
    required CollectionId collectionId,
    required EntryId entryId,
  });
}
