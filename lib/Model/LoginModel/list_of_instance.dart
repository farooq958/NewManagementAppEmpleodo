
late List<dynamic> listOfInstances;
 List<String> getListOfOragnization(){
  List<String> listOfInstanceString=["Choose Organization Instance"];
 // List<Map<String,String>> listOfData=[{}];
  print("from here");
  for(int i=0;i<listOfInstances.length;i++)
  {

   if(listOfInstances[i]["role"]!="Admin") {
     listOfInstanceString.add("${listOfInstances[i]["org_name"]}-${listOfInstances[i]["role"]}-${listOfInstances[i]["id"]}");
  //listOfData.add({listOfInstances[i]["org_name"]:""});

   }
   print("${listOfInstances[i]}\n");
  }
  return listOfInstanceString;

}
getInstanceThroughName(String instanceName){
  //var filteredString;
  if(instanceName!="Choose Organization Instance") {
     //filteredString = instanceName.split("-");
    print("after this");
print(listOfInstances);
//print(filteredString[0]);
  var dataOfInstance={};
 for(int i=0;i<listOfInstances.length;i++) {
   var checkString="${listOfInstances[i]["org_name"]}-${listOfInstances[i]["role"]}-${listOfInstances[i]["id"]}";
   print(checkString);
   print(instanceName);
 //print( listOfInstances[i]["org_name"] == filteredString[0]);
  if (
      checkString == instanceName) {
    print("here");
   dataOfInstance = listOfInstances[i];
   // listOfInstanceString.add("${listOfInstances[i]["org_name"]}-${listOfInstances[i]["role"]}");
   //listOfData.add({listOfInstances[i]["org_name"]:""});

  }

 }
    return dataOfInstance;
 }
  else{
   return "Choose Organization Instance";
  }
}
// class InstanceOrganization {
//   InstanceOrganization({
//     required this.id,
//     required this.oneid,
//     required this.token,
//     required this.accessType,
//     required this.coverOneid,
//     required this.coverOrgoneid,
//     required this.accessCredentials,
//     required this.appId,
//     required this.oneOrgId,
//     required this.status,
//     required this.accessExpiry,
//     required this.entryTime,
//     required this.orgName,
//     required this.roleId,
//     required this.role,
//     required this.roleDesc,
//     required this.parentAppToken,
//   });
//
//   final String id;
//   final String oneid;
//   final String token;
//   final String accessType;
//   final String coverOneid;
//   final String coverOrgoneid;
//   final String accessCredentials;
//   final String appId;
//   final String oneOrgId;
//   final String status;
//   final String accessExpiry;
//   final String entryTime;
//   final String orgName;
//   final int roleId;
//   final String role;
//   final String roleDesc;
//   final String parentAppToken;
// }