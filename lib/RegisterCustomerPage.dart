import 'dart:convert';
import 'package:flutter/painting.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;

class MyRegisterCustomerPage extends StatefulWidget{
  _MyRegisterPageState createState() => _MyRegisterPageState();
}

class _MyRegisterPageState extends State<MyRegisterCustomerPage>
{
  TextEditingController _firstname = TextEditingController();
  TextEditingController _middlename = TextEditingController();
  TextEditingController _lastname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _contactno = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _city = TextEditingController();
  TextEditingController _village = TextEditingController();
  TextEditingController _pincode = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmpassword = TextEditingController();
  TextEditingController _level = TextEditingController();

  static const items = <String>["farmer", "customer"];

  List<DropdownMenuItem<String>> _myitems = items
      .map((e) => DropdownMenuItem(
    value: e,
    child: Text(e),
  ))
      .toList();

  String valueItem = "farmer";

  Future<List> insertapi() async {
    var url = "http://192.168.43.90:8081/grocery_app/register.php";
    final response = await http.post(url, body: {
      "firstname": _firstname.text,
      "middlename": _middlename.text,
      "lastname": _lastname.text,
      "email": _email.text,
      "contactno": _contactno.text,
      "address": _address.text,
      "city": _city.text,
      "village": _village.text,
      "pincode": _pincode.text,
      "password": _password.text,
      "confirmpassword": _confirmpassword.text,
      "level": _level.text
    });

    if(response.body == "Corrected")
      {
        Toast.show("Insert Successfully", context,
            duration: Toast.LENGTH_LONG,
            gravity: Toast.BOTTOM,
            backgroundColor: Colors.yellow,
            textColor: Colors.white);
      }else if(response.body == "Error")
        {
          Toast.show("Insert Unsuccessfully", context,
              duration: Toast.LENGTH_LONG,
              gravity: Toast.BOTTOM,
              backgroundColor: Colors.yellow,
              textColor: Colors.white);
        }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 10.0,
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
                child: ListView(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          'Register',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,fontFamily: 'Cursive'),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color:Colors.grey[200])),
                          ),
                          child: TextField(
                            obscureText: false,
                            controller: _firstname,
                            decoration: InputDecoration(
                              labelText: "First Name",
                              hintText: "First Name",
                              hintStyle: TextStyle(color: Colors.white),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color:Colors.grey[200])),
                          ),
                          child: TextField(
                            obscureText: false,
                            controller: _middlename,
                            decoration: InputDecoration(
                              labelText: "Middle Name",
                              hintText: "Middle Name",
                              hintStyle: TextStyle(color: Colors.white),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color:Colors.grey[200])),
                          ),
                          child: TextField(
                            obscureText: false,
                            controller: _lastname,
                            decoration: InputDecoration(
                              labelText: "Last Name",
                              hintText: "Last Name",
                              hintStyle: TextStyle(color: Colors.white),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color:Colors.grey[200])),
                          ),
                          child: TextField(
                            obscureText: false,
                            controller: _email,
                            decoration: InputDecoration(
                              labelText: "Email",
                              hintText: "Email",
                              hintStyle: TextStyle(color: Colors.white),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color:Colors.grey[200])),
                          ),
                          child: TextField(
                            obscureText: false,
                            controller: _contactno,
                            decoration: InputDecoration(
                              labelText: "Contact No",
                              hintText: "Contact No",
                              hintStyle: TextStyle(color: Colors.white),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color:Colors.grey[200])),
                          ),
                          child: TextField(
                            obscureText: false,
                            controller: _address,
                            decoration: InputDecoration(
                              labelText: "Address",
                              hintText: "Address",
                              hintStyle: TextStyle(color: Colors.white),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color:Colors.grey[200])),
                          ),
                          child: TextField(
                            obscureText: false,
                            controller: _city,
                            decoration: InputDecoration(
                              labelText: "City",
                              hintText: "City",
                              hintStyle: TextStyle(color: Colors.white),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color:Colors.grey[200])),
                          ),
                          child: TextField(
                            obscureText: false,
                            controller: _village,
                            decoration: InputDecoration(
                              labelText: "Village",
                              hintText: "Village",
                              hintStyle: TextStyle(color: Colors.white),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color:Colors.grey[200])),
                          ),
                          child: TextField(
                            obscureText: false,
                            controller: _pincode,
                            decoration: InputDecoration(
                              labelText: "Pincode",
                              hintText: "Pincode",
                              hintStyle: TextStyle(color: Colors.white),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color:  Colors.grey[200]))
                          ),
                          child: TextField(
                            obscureText: true,
                            controller: _password,
                            decoration: InputDecoration(
                              labelText: "Password",
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.white),
                              border: InputBorder.none,
                            ),
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color:Colors.grey[200])),
                          ),
                          child: TextField(
                            obscureText: true,
                            controller: _confirmpassword,
                            decoration: InputDecoration(
                              labelText: "Confirm Password",
                              hintText: "Confirm Password",
                              hintStyle: TextStyle(color: Colors.white),
                              border: InputBorder.none,
                            ),
                          ),
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
                        RaisedButton(
                          textColor: Colors.white,
                          padding: EdgeInsets.all(0.0),
                          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                          onPressed: (){
                            insertapi();
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
                            padding: EdgeInsets.fromLTRB(80, 10, 80, 10),
                            child: Text("Register",style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),

                      ],
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