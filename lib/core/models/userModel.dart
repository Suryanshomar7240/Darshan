class UserData {
  String? email;
  String? name;
  String? phoneNumber;
  String? age;
  UserLocation? location;
  String? image;
  String? uid;

  UserData(
      {required this.email,
      required this.name,
      required this.phoneNumber,
      required this.age,
      required this.location,
      required this.image,
      this.uid});

  UserData.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    age = json['age'];
    location = json['location'];
    image = json['image'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['name'] = name;
    data['phoneNumber'] = phoneNumber;
    data['age'] = age;
    data['location'] = location?.toJson();
    data['image'] = image;
    data['uid'] = uid;
    return data;
  }
}

class UserLocation {
  double? latitude;
  double? longitude;

  UserLocation({required this.latitude, required this.longitude});

  UserLocation.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}
