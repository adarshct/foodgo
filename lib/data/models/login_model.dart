class LoginModel {
  String? access;
  String? refresh;
  String? email;

  LoginModel({this.access, this.refresh, this.email});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      access: json['access'],
      refresh: json['refresh'],
      email: json['email'],
    );
  }
}
