import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';



class LeaveDetailCubit extends Cubit<int> {
  LeaveDetailCubit() : super(0);


setVisibiity(int vis)
{

  emit(vis);
}

}
