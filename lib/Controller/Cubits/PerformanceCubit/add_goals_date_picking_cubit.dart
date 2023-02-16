import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


class DatePickingAddGoalsCubit extends Cubit<DateTime> {
  DatePickingAddGoalsCubit() : super(DateTime.now());

  adjustDate(DateTime dt )
  {
    emit(dt);

  }
}
