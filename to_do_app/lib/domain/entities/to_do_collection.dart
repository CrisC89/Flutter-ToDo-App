import 'package:to_do_app/domain/entities/to_do_color.dart';
import 'package:to_do_app/domain/entities/unique_id.dart';

class ToDoCollection {
  final CollectionId id;
  final String title;
  final ToDoColor color;

  ToDoCollection({required this.id, required this.title, required this.color});

  factory ToDoCollection.empty(){
    return ToDoCollection(
      id: CollectionId(),
      title:'',
      color: ToDoColor(colorIndex: 0)
    );
  }
}
