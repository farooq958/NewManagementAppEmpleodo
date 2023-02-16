import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';



class AnimationScaleDartCubit extends Cubit<double> {
  AnimationScaleDartCubit() : super(1.0);

  transformWidget(double scaleFactor){

    emit(scaleFactor);
  }

}
