class RegisterRequest {
  RegisterRequest({
    this.firstName,
    this.lastName,
    this.username,
    this.password,
  });

  RegisterRequest.fromJson(dynamic json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    username = json['username'];
    password = json['password'];
  }

  String? firstName;
  String? lastName;
  String? username;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['username'] = username;
    map['password'] = password;
    return map;
  }
}
