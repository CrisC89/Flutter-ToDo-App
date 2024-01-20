part of 'to_do_detail_cubit.dart';

@immutable
abstract class ToDoDetailCubitState extends Equatable {

  @override
  List<Object> get props => [];
}

class ToDoDetailCubitLoadingState extends ToDoDetailCubitState {}

class ToDoDetailCubitErrorState extends ToDoDetailCubitState {}

class ToDoDetailCubitLoadedState extends ToDoDetailCubitState {
  ToDoDetailCubitLoadedState({required this.entryIds});

  final List<EntryId> entryIds;

  @override
  List<Object> get props => [entryIds];
}
