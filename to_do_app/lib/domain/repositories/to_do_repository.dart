import 'package:either_dart/either.dart';
import 'package:to_do_app/domain/entities/to_do_collection.dart';

import '../failures/failure.dart';

abstract class ToDoRepository {
  Future<Either<Failure, List<ToDoCollection>>> readToDoCollections();
}
