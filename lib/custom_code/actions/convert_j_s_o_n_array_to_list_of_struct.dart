// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<UserStruct>> convertJSONArrayToListOfStruct(
    List<dynamic> jsonArray) async {
  // convert json array into list of objects

  List<UserStruct> listOfStruct = [];
  for (var item in jsonArray) {
    listOfStruct.add(UserStruct.fromMap(item));
  }
  return listOfStruct;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
