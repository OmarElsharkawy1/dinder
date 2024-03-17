class DogModel {
  int id;
  int age;
  String gender;
  int weight;
  String color;
  String temperament;
  String medicalHistory;
  String registrationNumber;
  String specialNeeds;
  String ownerId;
  dynamic owner;
  int dogTypeId;
  dynamic dogType;
  dynamic images;

  DogModel({
    required this.id,
    required this.age,
    required this.gender,
    required this.weight,
    required this.color,
    required this.temperament,
    required this.medicalHistory,
    required this.registrationNumber,
    required this.specialNeeds,
    required this.ownerId,
    required this.owner,
    required this.dogTypeId,
    required this.dogType,
    required this.images,
  });

  factory DogModel.fromJson(Map<String, dynamic> json) => DogModel(
        id: json["id"],
        age: json["age"],
        gender: json["gender"],
        weight: json["weight"],
        color: json["color"],
        temperament: json["temperament"],
        medicalHistory: json["medicalHistory"],
        registrationNumber: json["registrationNumber"],
        specialNeeds: json["specialNeeds"],
        ownerId: json["ownerId"],
        owner: json["owner"],
        dogTypeId: json["dogTypeId"],
        dogType: json["dogType"],
        images: json["images"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "age": age,
        "gender": gender,
        "weight": weight,
        "color": color,
        "temperament": temperament,
        "medicalHistory": medicalHistory,
        "registrationNumber": registrationNumber,
        "specialNeeds": specialNeeds,
        "ownerId": ownerId,
        "owner": owner,
        "dogTypeId": dogTypeId,
        "dogType": dogType,
        "images": images,
      };
}
