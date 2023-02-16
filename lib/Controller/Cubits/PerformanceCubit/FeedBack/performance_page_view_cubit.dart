import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class FeedBackButtonsCubit extends Cubit<int> {
  FeedBackButtonsCubit() : super(0);

  setIndexButtonPage(int index)
  {

    emit(index);
  }
}
