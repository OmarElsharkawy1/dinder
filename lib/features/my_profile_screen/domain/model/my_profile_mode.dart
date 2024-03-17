import 'package:pile_up/features/matching_screen/domain/model/dog_model.dart';

class MyProfile {
  int id;
  int age;
  String name;
  String gender;
  String description;
  List<DogModel> myDogs;
  String image;

  MyProfile({
    required this.id,
    required this.age,
    required this.gender,
    required this.name,
    required this.description,
    required this.myDogs,
    required this.image,
  });

  factory MyProfile.fromJson(Map<String, dynamic> json) => MyProfile(
        id: json["id"],
        age: json["age"],
        gender: json["gender"],
        name: json["name"],
        description: json["description"],
        myDogs: json['myDogs'],
        image: json['image'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "age": age,
        "gender": gender,
        "name": name,
        "description": description,
        'myDogs': myDogs,
        'image': image,
      };
}
