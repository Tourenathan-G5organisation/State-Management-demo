import 'package:demo/data/model/user.dart';
import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  UserInitial();

  @override
  List<Object> get props {
    return [];
  }
}

class SignupLoading extends UserState {
  SignupLoading();

  @override
  List<Object> get props {
    return [];
  }
}

class UserSignupComplete extends UserState {
  final User user;

  UserSignupComplete(this.user);

  @override
  List<Object> get props {
    return [user];
  }
}
