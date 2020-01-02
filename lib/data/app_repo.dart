import 'model/user.dart';

class Repository {
  Future<User> signUpUser(User user) {
    return Future.delayed(Duration(seconds: 2), () {
      return User(
          userName: user.userName,
          email: user.email,
          phoneNumber: user.phoneNumber,
          password: user.password,
          createdAt: DateTime.now());
    });
  }
}
