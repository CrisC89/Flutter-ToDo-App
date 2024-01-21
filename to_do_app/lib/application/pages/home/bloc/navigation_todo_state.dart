part of 'navigation_todo_cubit.dart';

@immutable
class NavigationToDoState extends Equatable {
  final CollectionId? selectedCollectionId;
  final bool? isSecondBodyDisplayed;

  const NavigationToDoState({
    this.isSecondBodyDisplayed,
    this.selectedCollectionId,
  });

  @override
  List<Object?> get props => [isSecondBodyDisplayed, selectedCollectionId];
}
