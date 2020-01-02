import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: SafeArea(child: Container(
        margin: EdgeInsets.symmetric(vertical: 30.0),
        child: SingleChildScrollView(
          child: Column(

            children: <Widget>[
              Text(
                'User details',
                style: TextStyle(fontSize: 24.0),
              ),
              SizedBox(height: 60.0),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('Name: ', style: TextStyle(fontSize: 18.0,)),
                Text('Nathan',style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),),
              ]),
              SizedBox(height: 30.0),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('Email: ', style: TextStyle(fontSize: 18.0,)),
                Text('teyou21@gmail.com', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),),
              ]),
              SizedBox(height: 30.0),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('Phone: ', style: TextStyle(fontSize: 18.0,)),
                Text('+79253777671', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),),
              ]),

            ],
          ),
        ),
      ),)
    );
  }
}
