import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../domain/entities/unique_id.dart';

part 'navigation_todo_state.dart';

class NavigationToDoCubit extends Cubit<NavigationToDoState> {
  NavigationToDoCubit() : super(const NavigationToDoState());

  void selectedToDoCollectionChanged(CollectionId collectionId) {
    emit(NavigationToDoState(selectedCollectionId: collectionId));
  }

  void secondBodyHasChanged({required bool isSecondBodyDisplayed}) {
    if (state.isSecondBodyDisplayed != isSecondBodyDisplayed) {
      emit(NavigationToDoState(
        isSecondBodyDisplayed: isSecondBodyDisplayed,
        selectedCollectionId: state.selectedCollectionId,
      ));
    }
  }
}
