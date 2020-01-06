import 'package:demo/state/user_signup_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Details'),
        ),
        body: SafeArea(
            child: Container(
          margin: EdgeInsets.symmetric(vertical: 30.0),
          child: Consumer<UserSignUp>(builder: (context, userSignUp, _) {
            if (!userSignUp.isLoading() && userSignUp.isDataLoaded()) {
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Text(
                      'User details',
                      style: TextStyle(fontSize: 24.0),
                    ),
                    SizedBox(height: 60.0),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text('Name: ',
                          style: TextStyle(
                            fontSize: 18.0,
                          )),
                      Text(
                        '${userSignUp.user.userName}',
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.w600),
                      ),
                    ]),
                    SizedBox(height: 30.0),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text('Email: ',
                          style: TextStyle(
                            fontSize: 18.0,
                          )),
                      Text(
                        '${userSignUp.user.email}',
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.w600),
                      ),
                    ]),
                    SizedBox(height: 30.0),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text('Phone: ',
                          style: TextStyle(
                            fontSize: 18.0,
                          )),
                      Text(
                        '${userSignUp.user.phoneNumber}',
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.w600),
                      ),
                    ]),
                  ],
                ),
              );
            }
            return Container();
          }),
        )));
  }
}
