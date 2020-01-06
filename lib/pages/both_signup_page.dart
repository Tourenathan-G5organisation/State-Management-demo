import 'package:demo/bloc/user_bloc.dart';
import 'package:demo/bloc/user_event.dart';
import 'package:demo/bloc/user_state.dart';
import 'package:demo/data/app_repo.dart';
import 'package:demo/data/model/user.dart';
import 'package:demo/pages/both_detail_page.dart';
import 'package:demo/state/user_signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class BothSignUp extends StatefulWidget {
  //Color color1 = Color(0xff2B2B28);
  //Color color2 = Color(0xffE3BD06);
  @override
  BothSignUpState createState() => BothSignUpState();
}

class BothSignUpState extends State<BothSignUp> {
  final _formKey = GlobalKey<FormState>();
  User _user = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: color1,
        appBar: AppBar(
          //backgroundColor: color1,
          title: Text('Sign Up'),
        ),
        body: BlocProvider(
          create: (BuildContext context) => UserBloc(Repository()),
          child: SafeArea(
              child: Container(
            //color: color1,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                child: BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    if (state is UserInitial) {
                      return buildForm(context);
                    } else if (state is SignupLoading) {
                      return buildLoading(context);
                    } else if (state is UserSignupComplete) {
                      return buildWelCome(context, state.user);
                    }
                  },
                ), //buildForm(context),
              ),
            ),
          )),
        ));
  }

  Widget buildLoading(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }

  Widget buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            'Please fill in the information below',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            validator: _validateField,
            keyboardType: TextInputType.text,
            style: TextStyle(fontSize: 18.0),
            decoration: InputDecoration(
              hintText: 'Full Name',
              prefixIcon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
            ),
            onSaved: (value) => this._user.userName = value,
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(fontSize: 18.0),
            decoration: InputDecoration(
              hintText: 'Email',
              prefixIcon: Icon(
                Icons.email,
                color: Colors.black,
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
            ),
            validator: _validateField,
            onSaved: (value) => this._user.email = value,
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            keyboardType: TextInputType.phone,
            style: TextStyle(fontSize: 18.0),
            decoration: InputDecoration(
              hintText: 'Phone Number',
              prefixIcon: Icon(
                Icons.phone,
                color: Colors.black,
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
            ),
            validator: _validateField,
            onSaved: (value) => this._user.phoneNumber = value,
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            style: TextStyle(fontSize: 18.0),
            decoration: InputDecoration(
              hintText: 'Password',
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.black,
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
            ),
            validator: _validateField,
            onSaved: (value) => this._user.password = value,
          ),
          SizedBox(
            height: 20.0,
          ),
          SizedBox(
              width: double.infinity,
              height: 50,
              child: RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      submitUserDetails(context, this._user);
                    }
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  color: Theme.of(context).accentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  ))),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Already have account? ',
                  style: TextStyle(
                    fontSize: 16.0,
                  )),
              Text(
                'Login',
                style: TextStyle(
                    fontSize: 16.0, color: Theme.of(context).accentColor),
              ),
            ],
          ) //Name
        ],
      ),
    );
  }

  Widget buildWelCome(BuildContext context, final User user) {
    return //Container(
        //child:
        Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome: ',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              '${user.userName}',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        RaisedButton(
            onPressed: () {
              //repo.user = user;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) =>
                          /*BlocProvider.value(
                              value: BlocProvider.of<UserBloc>(context),
                              child: DetailPage(),)*/
                          ChangeNotifierProvider(
                            create: (_) => UserSignUp(user),
                            child: DetailPage(),
                          )));
            },
            child: Text(
              'View Details ',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            color: Theme.of(context).accentColor,
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(20.0),
            )),
        SizedBox(height: 60.0),
        RaisedButton(
          onPressed: () {
            backToForm(context);
          },
          child: Text(
            'Back to form',
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          color: Theme.of(context).accentColor,
        )
      ],
      //)
    );
  }

  String _validateField(String text) {
    text = text.trim();
    if (text.isEmpty) {
      return 'value required';
    }
    return null;
  }

  void submitUserDetails(BuildContext context, User newUser) {
    final weatherBloc = BlocProvider.of<UserBloc>(context);
    weatherBloc.add(NewUser(newUser));
  }

  void backToForm(BuildContext context) {
    final weatherBloc = BlocProvider.of<UserBloc>(context);
    weatherBloc.add(showForm());
  }
}
