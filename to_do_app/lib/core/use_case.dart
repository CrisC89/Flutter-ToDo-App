import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:to_do_app/domain/failures/failure.dart';

import '../domain/entities/unique_id.dart';

abstract class UseCase<Type, Params>{
  Future<Either<Failure, Type>> call(Params params);
}

abstract class Params extends Equatable {}

class NoParams extends Params {
  @override
  List<Object?> get props => [];
}

class ToDoEntryIdsParam extends Params {
  ToDoEntryIdsParam({
    required this.collectionId,
    required this.entryId,
  }) : super();

  final EntryId entryId;
  final CollectionId collectionId;

  @override
  List<Object> get props => [collectionId, entryId];
}

class CollectionIdParam extends Params {
  CollectionIdParam({
    required this.collectionId,
  }) : super();

  final CollectionId collectionId;

  @override
  List<Object> get props => [collectionId];
}
