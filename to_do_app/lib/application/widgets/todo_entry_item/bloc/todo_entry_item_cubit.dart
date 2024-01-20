import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/use_case.dart';
import '../../../../domain/entities/to_do_entry.dart';
import '../../../../domain/entities/unique_id.dart';
import '../../../../domain/use cases/load_todo_entry.dart';
import '../../../../domain/use cases/update_todo_entry.dart';



part 'todo_entry_item_state.dart';

class ToDoEntryItemCubit extends Cubit<ToDoEntryItemState> {
  ToDoEntryItemCubit({
    required this.loadToDoEntry,
    required this.entryId,
    required this.collectionId,
    required this.uploadToDoEntry,
  }) : super(ToDoEntryItemLoadingState());

  final EntryId entryId;
  final CollectionId collectionId;
  final LoadToDoEntry loadToDoEntry;
  final UpdateToDoEntry uploadToDoEntry;

  Future<void> fetch() async {
    try {
      final entry = await loadToDoEntry.call(
        ToDoEntryIdsParam(
          collectionId: collectionId,
          entryId: entryId,
        ),
      );

      return entry.fold(
            (left) => emit(ToDoEntryItemErrorState()),
            (right) => emit(ToDoEntryItemLoadedState(toDoEntry: right)),
      );
    } on Exception {
      emit(ToDoEntryItemErrorState());
    }
  }

  Future<void> update() async {
    try {
      final updatedEntry = await uploadToDoEntry.call(ToDoEntryIdsParam(
        collectionId: collectionId,
        entryId: entryId,
      ));

      return updatedEntry.fold(
            (left) => emit(ToDoEntryItemErrorState()),
            (right) => emit(
          ToDoEntryItemLoadedState(toDoEntry: right),
        ),
      );
    } on Exception {
      emit(ToDoEntryItemErrorState());
    }
  }
}
