import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager {
  final CollectionReference locationList =
      FirebaseFirestore.instance.collection('locations');

  Future getLocationsList() async {
    List itemsList = [];

    try {
      await locationList.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemsList.add(element.data());
        });
      });
      //print(itemsList);
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
}
