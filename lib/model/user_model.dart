class User {
  int? userId;
  String? name;
  String? email;
  String? token;
  String? renewalToken;

  User({this.userId, this.name, this.email, this.token, this.renewalToken});

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
        userId: responseData['id'],
        name: responseData['name'],
        email: responseData['email'],
        token: responseData['access_token'],
        renewalToken: responseData['renewal_token']
    );
  }
}