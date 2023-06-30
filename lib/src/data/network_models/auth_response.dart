class AuthResponse {
  AuthResponse({
    this.token,
    this.firstName,
    this.lastName,
  });

  AuthResponse.fromJson(dynamic json) {
    token = json['token'];
    firstName = json['firstName'];
    lastName = json['lastName'];
  }

  String? token;
  String? firstName;
  String? lastName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    return map;
  }
}
