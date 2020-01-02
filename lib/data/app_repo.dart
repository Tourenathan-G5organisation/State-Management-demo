import 'model/user.dart';

class Repository {

  Future<User> signUpUser(String userName, String email, String phone,
      String password) {
    return Future.delayed(Duration(seconds: 2),
            () {
          return User(userName: userName,
              email: email,
              phoneNumber: phone,
              password: password,
              createdAt: DateTime.now());
        });
  }

}