import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());

  void safeEmit(HomeState state) {
    if (!isClosed) emit(state);
  }

  void selectCategory(int index) {
    safeEmit(state.copyWith(selectedCategoryIndex: index));
  }

  void selectNavigationBar(int index) {
    safeEmit(state.copyWith(navigationIndex: index));
  }
}
