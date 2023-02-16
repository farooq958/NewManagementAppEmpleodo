import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


class DatePickingAddGoalsEndDateCubit extends Cubit<DateTime> {
  DatePickingAddGoalsEndDateCubit() : super(DateTime.now());

  adjustDate(DateTime dt )
  {
    emit(dt);

  }
}
