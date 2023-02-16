import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class PerformancePageViewCubit extends Cubit<int> {
  PerformancePageViewCubit() : super(0);

  setIndexTopPage(int index)
  {

    emit(index);
  }
}
