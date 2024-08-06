class User {
  final String? firstname;
  final String? lastname;
  final String? username;
  final String? email;
  final String? phone;
  final String? password;
  final String? referredby;
  final String? devicetype;
  final String? registervia;

  User({
    this.firstname,
    this.lastname,
    this.username,
    this.email,
    this.phone,
    this.password,
    this.referredby,
    this.devicetype,
    this.registervia,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstname: json['firstname'],
      lastname: json['lastname'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      password: json['password'],
      referredby: json['referredby'],
      devicetype: json['devicetype'],
      registervia: json['registervia'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstname': firstname,
      'lastname': lastname,
      'username': username,
      'email': email,
      'phone': phone,
      'password': password,
      'referredby': referredby,
      'devicetype': devicetype,
      'registervia': registervia,
    };
  }
}
