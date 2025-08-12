import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SelectedCategoryCubit extends Cubit<int> {
  SelectedCategoryCubit() : super(0);

  void onCategoryClicked(int newIndex) {
    emit(newIndex);
  }
}
