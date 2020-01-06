import 'package:demo/pages/bloc_signup_page.dart';
import 'package:demo/pages/both_signup_page.dart';
import 'package:demo/pages/provider_signup_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //primarySwatch: Colors.blue,
        primaryColor: Color(0xff2B2B28),
        accentColor: Color(0xffE3BD06),
      ),
      home: MyHomePage(title: 'State Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Choose State management pattern',
                  style: TextStyle(fontSize: 22.0),
                ),
                SizedBox(height: 20.0),
                SizedBox(width: 200, height: 40,
                  child:  RaisedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Text(
                        'Provider',
                        style: TextStyle(fontSize: 18.0, ),
                      ),
                      color: Theme.of(context).accentColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      )),),

                SizedBox(height: 20.0),
                SizedBox(width: 200, height: 40,
                child:  RaisedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => BlocSignUp()));
                    },
                    child: Text(
                      'BLoC Pattern',
                      style: TextStyle(fontSize: 18.0, ),
                    ),
                    color: Theme.of(context).accentColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                    )),),

                SizedBox(height: 20.0),
                SizedBox(width: 200, height: 40,
                  child: RaisedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => BothSignUp()));
                      },
                      child: Text(
                        'Both Pattern',
                        style: TextStyle(fontSize: 18.0,),
                      ),
                      color: Theme
                          .of(context)
                          .accentColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      )),)

              ],
            ),
          )),
    );
  }
}
