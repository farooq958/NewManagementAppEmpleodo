import 'package:bloc/bloc.dart';


class InboxApplicationDetailPageViewCubit extends Cubit<int> {
  InboxApplicationDetailPageViewCubit() : super(0);

setPageIndex(int pageNo)
{
  emit(pageNo);
}
}
