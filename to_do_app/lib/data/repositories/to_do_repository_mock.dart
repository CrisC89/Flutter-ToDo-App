import 'package:either_dart/src/either.dart';
import 'package:to_do_app/domain/entities/to_do_collection.dart';
import 'package:to_do_app/domain/failures/failure.dart';
import 'package:to_do_app/domain/repositories/to_do_repository.dart';

import '../../domain/entities/to_do_color.dart';
import '../../domain/entities/unique_id.dart';

class ToDoRepositoryMock implements ToDoRepository{
  @override
  Future<Either<Failure, List<ToDoCollection>>> readToDoCollections() {
    final list = List<ToDoCollection>.generate(
      10,
          (index) => ToDoCollection(
        id: CollectionId.fromUniqueString(index.toString()),
        title: 'title $index',
        color: ToDoColor(
          colorIndex: index % ToDoColor.predefinedColors.length,
        ),
      ),
    );

    return Future.delayed(
      const Duration(milliseconds: 200),
          () => Right(list),
    );
  }

}
