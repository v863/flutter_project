import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'RegisterCustomerPage.dart';
import 'dart:async';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;

import 'Customer.dart';
import 'Farmer.dart';


void main()
{
   runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.lightGreenAccent,
      ),
     home: MyLoginPage(),
    );
  }
}

class MyLoginPage extends StatefulWidget{
   @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<MyLoginPage>{
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();

  static const items = <String>["farmer", "customer"];

  List<DropdownMenuItem<String>> _myitems = items
      .map((e) => DropdownMenuItem(
    value: e,
    child: Text(e),
  ))
      .toList();

  String valueItem = "farmer";

  Future<List> getapi() async{
    var url = "http://192.168.43.90:8081/grocery_app/Login.php";
    final response = await http.post(url, body: {
      "username": _username.text,
      "password": _password.text
    });

    final data =jsonDecode(response.body);

   if(data['level'] == "farmer")
     {
       Navigator.push(context,
         MaterialPageRoute(builder: (context)=> MyFarmerPage()),
       );
       Toast.show("Login Successfully", context,
              duration: Toast.LENGTH_LONG,
              gravity: Toast.BOTTOM,
          backgroundColor: Colors.yellow,
          textColor: Colors.white);
     }else if(data['level'] == "customer"){
     Navigator.push(context,
       MaterialPageRoute(builder: (context)=> MyCustomerPage()),
     );
     Toast.show("Login Successfully", context,
         duration: Toast.LENGTH_LONG,
         gravity: Toast.BOTTOM,
         backgroundColor: Colors.yellow,
         textColor: Colors.white);
   }else
       {
         Toast.show("Login Unsuccessfully", context,
              duration: Toast.LENGTH_LONG,
              gravity: Toast.BOTTOM,
              backgroundColor: Colors.blue,
              textColor: Colors.white);
       }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
       decoration: BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.topCenter,
          image: AssetImage("images/vegetables.jpg"),
        )
       ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 100.0,
              height: 175.0,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.lightGreenAccent[200],
                      Colors.lightGreenAccent[100],
                    ]
                  ),
                  borderRadius: BorderRadius.circular(45),
                  boxShadow: [
                   BoxShadow(
                     color: Colors.black12,
                     offset: Offset(0.0,15.0),
                     blurRadius: 15.0
                   ),
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0,15.0),
                        blurRadius: 15.0
                    ),

                  ]
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Login',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,fontFamily: 'Cursive'),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color:Colors.grey[200])),
                      ),
                      child: TextField(
                        controller: _username,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: "Username",
                          hintText: "Username or Phone number",
                          hintStyle: TextStyle(color: Colors.white),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color:  Colors.grey[200]))
                      ),
                      child: TextField(
                        controller: _password,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.white),
                          border: InputBorder.none,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10.0),
                        child: ListTile(
                            title: Text("Status / Level : "),
                            trailing: DropdownButton(
                              items: _myitems,
                              value: valueItem,
                              onChanged: (e) {
                                setState(() {
                                  valueItem = e;
                                });
                              },
                            ))),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Forgot Password?",style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    RaisedButton(
                      textColor: Colors.white,
                      padding: EdgeInsets.all(0.0),
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                      onPressed: (){
                        getapi();
                      },
                     child:Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(99.0)),
                        gradient: LinearGradient(
                          colors: [
                            Colors.blue[900],
                            Colors.blue[800],
                            Colors.blue[200],
                          ]
                        )
                      ),
                       padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
                        child: Text("Login",style: TextStyle(fontSize: 16),
                      ),
                    ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    RaisedButton(
                      textColor: Colors.white,
                      padding: EdgeInsets.all(0.0),
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                      onPressed: (){
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context)=> MyRegisterCustomerPage()),
                        );
                      },
                      child:Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(99.0)),
                            gradient: LinearGradient(
                                colors: [
                                  Colors.blue[900],
                                  Colors.blue[800],
                                  Colors.blue[200],
                                ]
                            )
                        ),
                        padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
                        child: Text("Register",style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
      ),

    );
  }
}