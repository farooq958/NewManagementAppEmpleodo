import 'package:flutter_bloc/flutter_bloc.dart';

class DatePickingPayrollCubit extends Cubit<DateTime> {
  DatePickingPayrollCubit() : super(DateTime.now());

  adjustDate(DateTime dt )
  {
    emit(dt);

  }
}