import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  //Color color1 = Color(0xff2B2B28);
  //Color color2 = Color(0xffE3BD06);
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
      body: Container(
        //color: color1,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: buildForm(context),
          ),
        ),
      ),
    );
  }

  Widget buildLoading(BuildContext context) {
    return CircularProgressIndicator(
        backgroundColor: Theme.of(context).accentColor);
  }

  Widget buildForm(BuildContext context){
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
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0)),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(fontSize: 18.0),
            decoration: InputDecoration(
              labelText: 'hhhhh',
              hintText: 'Email',
              prefixIcon: Icon(
                Icons.email,
                color: Colors.black,
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0)),
            ),
            validator: _validateField,
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
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0)),
            ),
            validator: _validateField,
            onSaved: (value){},
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
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0)),
            ),
            validator: _validateField,
          ),
          SizedBox(
            height: 20.0,
          ),
          SizedBox(
              width: double.infinity,
              height: 50,
              child: RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {}
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
                    fontSize: 16.0,
                    color: Theme.of(context).accentColor),
              ),
            ],
          ) //Name
        ],
      ),
    );
  }

  Widget buildWelCome(BuildContext context) {
    return Container(
        child: Column(
          children: <Widget>[
            Text(
              'Welcome Nathan',
              style: TextStyle(fontSize: 24.0),
            ),
            RaisedButton(
                onPressed: () {},
                child: Text(
                  'View Details',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                color: Theme.of(context).accentColor,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0),
                ))
          ],
        ));
  }

  String _validateField(String text){
    text = text.trim();
      if (text.isEmpty) {
        return 'value required';
      }
      return null;

  }

  void submitUserDetails() {}
}
