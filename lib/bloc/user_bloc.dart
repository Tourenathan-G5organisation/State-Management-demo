import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo/data/app_repo.dart';

import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final Repository _userRepo;

  UserBloc(this._userRepo);

  @override
  UserState get initialState => UserInitial();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {

    yield SignupLoading();

    if (event is NewUser) {
      final user = await _userRepo.signUpUser(event.user);
      yield UserSignupComplete(user);
    }
    else if(event is showForm) {
      yield UserInitial();
    }
  }
}