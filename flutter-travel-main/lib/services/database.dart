import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager {
  final CollectionReference locationList =
      FirebaseFirestore.instance.collection('locations');

  final CollectionReference UserModel =
      FirebaseFirestore.instance.collection('users');

  Future getLocationsList() async {
    List itemsList = [];

    try {
      await locationList.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemsList.add(element.data());
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> createUserData(
      String name, String gender, int score, String uid) async {
    return await locationList
        .doc(uid)
        .set({'name': name, 'gender': gender, 'score': score});
  }

  Future updateUserList(
      String name, String gender, int score, String uid) async {
    return await locationList
        .doc(uid)
        .update({'name': name, 'gender': gender, 'score': score});
  }

  Future CreateUser(String uid, String name, String phoneNumber, String Email,
      String Age,double lat,double long,String image) async {
    Map<String, double> location = {
      "latitude": lat,
      "longitude": long,
    };
    return await UserModel.doc(uid).collection("basicDetails").add({
      'name': name,
      'age': Age,
      'email': Email,
      'phone': phoneNumber,
      'location': location,
      'image':image,
    });
  }

  Future getUser(String uid) async {
    await UserModel.doc(uid).get().then((querySnapshot) {
      print(querySnapshot.data());
      return querySnapshot;
    });
  }
}
