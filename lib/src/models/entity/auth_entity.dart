class AuthEntity {
  String? firstname;
  String? lastname;
  String? phone;
  String? password;

  AuthEntity({this.firstname, this.lastname, this.phone, this.password});

  Map<String, dynamic> toJson() => {
    "firstname": firstname,
    "lastname": lastname,
    "phone": phone,
    "password": password,
  };
}
