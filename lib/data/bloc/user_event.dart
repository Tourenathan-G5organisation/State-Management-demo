import 'package:demo/data/model/user.dart';
import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class NewUser extends UserEvent {
  User user;
  NewUser(this.user);

  @override
  List<Object> get props {
    return [user];
  }
}