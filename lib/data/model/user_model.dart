class UserModel {
  String? name, email, id, phone;
  int avatarId;

  UserModel({
    this.email,
    this.id,
    this.name,
    this.avatarId = 1,
    this.phone,
  });

  factory UserModel.fromFirestore(Map<String,dynamic>? json){
    return UserModel(
      id: json?['id']??"",
      name: json?['name']??"",
      email: json?['email']??"",
      phone: json?['phone']??"",
      avatarId: json?['avatarId']
    );
  }

  Map<String, dynamic> toFirestore(){
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'avatarId': avatarId,
    };
  }
}
