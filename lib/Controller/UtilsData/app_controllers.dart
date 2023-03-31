import 'package:flutter/cupertino.dart';

class AppControllers{
static GlobalKey scaffoldKey=GlobalKey();
  static final  TextEditingController loginEmpleadoEmailNumberController=  TextEditingController();
  static final  TextEditingController loginPinCodeController=  TextEditingController();
static final PageController performanceController= PageController(initialPage: 0);
 static final TextEditingController dropDownController=TextEditingController();
 static final TextEditingController addGoalsDescriptionController=TextEditingController();
  static final TextEditingController addGoalsGoalsTitleController=TextEditingController();
  static final TextEditingController addGoalsDropDownReviewCycleController=TextEditingController();
  static final TextEditingController feedBackDescriptionController=TextEditingController();
  static final TextEditingController feedBackDropDownReviewCycleController=TextEditingController();
static final TextEditingController timeAdjustmentInTimeController =TextEditingController();
  static final TextEditingController timeAdjustmentOutTimeController =TextEditingController();
  static final TextEditingController timeAdjustmentDateTimeController =TextEditingController();
  static final TextEditingController timeAdjustmentDescriptionController=TextEditingController();
static final TextEditingController leaveSubjectController= TextEditingController();
  static final TextEditingController leaveBodyController= TextEditingController();
  static final TextEditingController leaveFromController= TextEditingController();
  static final TextEditingController leaveUpToController= TextEditingController();
  static final TextEditingController chatMessageController= TextEditingController();
  static final ScrollController chatScrollController= ScrollController();
static final PageController inboxLeavePageViewController = PageController(initialPage: 0);

}