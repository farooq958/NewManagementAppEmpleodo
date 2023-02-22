class Repository{

 static var  selectedRadio =0;
static int onWillCheck=0;

 static Future<int> onWillPopCheck(int toReturn) async {
  onWillCheck = toReturn;
  //print("${onWillCheck}check");
  Future.delayed(const Duration(seconds: 4),(){
   onWillCheck=0;
  // print(onWillCheck);
   return onWillCheck;
  });


  return onWillCheck;


 }

}