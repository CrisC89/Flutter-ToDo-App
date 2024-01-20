import 'package:either_dart/src/either.dart';
import 'package:to_do_app/domain/entities/to_do_collection.dart';
import 'package:to_do_app/domain/entities/to_do_entry.dart';
import 'package:to_do_app/domain/failures/failure.dart';
import 'package:to_do_app/domain/repositories/to_do_repository.dart';

import '../../domain/entities/to_do_color.dart';
import '../../domain/entities/unique_id.dart';

class ToDoRepositoryMock implements ToDoRepository{
  final List<ToDoEntry> toDoEntries = List.generate(
    100,
        (index) => ToDoEntry(
      id: EntryId.fromUniqueString(index.toString()),
      description: 'description $index',
      isDone: false,
    ),
  );

  final toDoCollections = List<ToDoCollection>.generate(
    10,
        (index) => ToDoCollection(
      id: CollectionId.fromUniqueString(index.toString()),
      title: 'title $index',
      color: ToDoColor(
        colorIndex: index % ToDoColor.predefinedColors.length,
      ),
    ),
  );

  @override
  Future<Either<Failure, List<ToDoCollection>>> readToDoCollections() {
    try {
      return Future.delayed(
        const Duration(milliseconds: 200),
            () => Right(toDoCollections),
      );
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }

  @override
  Future<Either<Failure, ToDoEntry>> readToDoEntry(CollectionId collectionId, EntryId entryId) {
    try {
      final selectedEntryItem = toDoEntries.firstWhere(
            (element) => element.id == entryId,
      );

      return Future.delayed(
        const Duration(milliseconds: 200),
            () => Right(selectedEntryItem),
      );
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }

  @override
  Future<Either<Failure, List<EntryId>>> readToDoEntryIds(CollectionId collectionId) {
    try {
      final startIndex = int.parse(collectionId.value) * 10;
      final endIndex = startIndex + 10;
      final entryIds = toDoEntries.sublist(startIndex, endIndex).map((entry) => entry.id).toList();

      return Future.delayed(
        const Duration(milliseconds: 300),
            () => Right(entryIds),
      );
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }

  @override
  Future<Either<Failure, ToDoEntry>> updateToDoEntry({required CollectionId collectionId, required EntryId entryId}) {
    final index = toDoEntries.indexWhere((element) => element.id == entryId);
    final entryToUpdate = toDoEntries[index];
    final updatedEntry = toDoEntries[index].copyWith(isDone: !entryToUpdate.isDone);
    toDoEntries[index] = updatedEntry;

    return Future.delayed(const Duration(milliseconds: 100), () => Right(updatedEntry));
  }
}
