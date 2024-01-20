import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/use_case.dart';
import '../../../../domain/entities/unique_id.dart';
import '../../../../domain/use cases/load_todo_entry_ids_for_collection.dart';

part 'to_do_detail_state.dart';

class ToDoDetailCubit extends Cubit<ToDoDetailCubitState> {
  ToDoDetailCubit({
    required this.collectionId,
    required this.loadToDoEntryIdsForCollection,
  }) : super(ToDoDetailCubitLoadingState());

  final CollectionId collectionId;
  final LoadToDoEntryIdsForCollection loadToDoEntryIdsForCollection;

  Future<void> fetch() async {
    emit(ToDoDetailCubitLoadingState());
    try {
      final entryIds = await loadToDoEntryIdsForCollection.call(
        CollectionIdParam(collectionId: collectionId),
      );

      if (entryIds.isLeft) {
        emit(ToDoDetailCubitErrorState());
      } else {
        emit(ToDoDetailCubitLoadedState(entryIds: entryIds.right));
      }
    } on Exception {
      emit(ToDoDetailCubitErrorState());
    }
  }
}
