part of 'home_cubit.dart';

final class HomeState {
  final int selectedCategoryIndex;
  final int navigationIndex;

  const HomeState({this.selectedCategoryIndex = 0, this.navigationIndex = 0});

  HomeState copyWith({int? selectedCategoryIndex, int? navigationIndex}) {
    return HomeState(
      selectedCategoryIndex:
          selectedCategoryIndex ?? this.selectedCategoryIndex,
      navigationIndex: navigationIndex ?? this.navigationIndex,
    );
  }
}
