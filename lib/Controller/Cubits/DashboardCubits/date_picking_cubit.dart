import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


class DatePickingCubit extends Cubit<DateTime> {
  DatePickingCubit() : super(DateTime.now());

  adjustDate(DateTime dt )
  {
    emit(dt);

  }
}
