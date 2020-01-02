import 'package:demo/bloc/user_bloc.dart';
import 'package:demo/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Details'),
        ),
        body: SafeArea(child: Container(
          margin: EdgeInsets.symmetric(vertical: 30.0),
          child: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
            if (state is UserSignupComplete) {
              return SingleChildScrollView(
                child: Column(

                  children: <Widget>[
                    Text(
                      'User details',
                      style: TextStyle(fontSize: 24.0),
                    ),
                    SizedBox(height: 60.0),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text('Name: ', style: TextStyle(fontSize: 18.0,)),
                      Text('${state.user.userName}', style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.w600),),
                    ]),
                    SizedBox(height: 30.0),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text('Email: ', style: TextStyle(fontSize: 18.0,)),
                      Text('${state.user.email}', style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.w600),),
                    ]),
                    SizedBox(height: 30.0),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text('Phone: ', style: TextStyle(fontSize: 18.0,)),
                      Text('${state.user.phoneNumber}', style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.w600),),
                    ]),

                  ],
                ),
              );
            }
          }),
        ),)
    );
  }
}
