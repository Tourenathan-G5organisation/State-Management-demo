import 'package:demo/data/model/user.dart';
import 'package:demo/pages/provider_detail_page.dart';
import 'package:demo/state/user_signup_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: color1,
        appBar: AppBar(
          //backgroundColor: color1,
          title: Text('Sign Up'),
        ),
        body: ChangeNotifierProvider(
            create: (_) => UserSignUp(),
            child: SafeArea(
              child: Container(
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                    child:
                        Consumer<UserSignUp>(builder: (context, userSignUp, _) {
                      if (userSignUp.isLoading()) {
                        return buildLoading(context);
                      }
                      if (userSignUp.isDataLoaded()) {
                        return buildWelCome(context, userSignUp);
                      } else
                        return buildForm(context, userSignUp);
                    }), //buildForm(context),
                  ),
                ),
              ),
            )));
  }

  Widget buildLoading(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }

  Widget buildForm(BuildContext context, UserSignUp userSignUp) {
    User _user = User();
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
            onSaved: (value) => _user.userName = value,
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
            onSaved: (value) => _user.email = value,
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
            onSaved: (value) => _user.phoneNumber = value,
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
            onSaved: (value) => _user.password = value,
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
                      userSignUp.signupNewUser(_user);
                      /* Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPage()));*/
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

  Widget buildWelCome(BuildContext context, UserSignUp userSignUp) {
    return Container(
        child: Column(
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
              '${userSignUp.user.userName}',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        RaisedButton(
            onPressed: () {
              Navigator.push(context,
                      MaterialPageRoute(
                          builder: (_) =>
                              ChangeNotifierProvider.value(
                                value: Provider.of<UserSignUp>(context),
                                child: DetailPage(),)));
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
            userSignUp.resetData();
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
    ));
  }

  String _validateField(String text) {
    text = text.trim();
    if (text.isEmpty) {
      return 'value required';
    }
    return null;
  }

  void submitUserDetails() {}
}
