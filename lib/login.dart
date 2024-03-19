import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'package:registration/img.dart';
import 'package:registration/person.dart';
import 'package:registration/reg.dart';
import 'package:http/http.dart' as http;
import 'package:registration/scan.dart';

import 'package:registration/person.dart';
import 'package:registration/reg.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _rollno=TextEditingController();
  final _password=TextEditingController();


  Future<void> login() async{
    print(_rollno.text);
    print(_password.text);
    Uri uri = Uri.parse('https://scnner-web.onrender.com/api/login');


    var response = await http.post(uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'rollno':_rollno.text,'password': _password.text}));



    print(response.statusCode);
    print(response.body);
    var data=jsonDecode(response.body);

    print(data["message"]);
    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Scanner()),
      );
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:data["message"]));
    }}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Center(
            child: Text('Login',style: TextStyle(
                fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),
            ),
          ),
        ),
        backgroundColor: Colors.teal,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child:Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'enter your roll no'
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'enter your password'
                  ),),
                SizedBox(height: 30),
                ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.teal,fixedSize: Size(100,50)),





                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Reg()),
                    );
                  },



                  child:  Text('login',style: TextStyle(fontSize: 20,color: Colors.white),),
                ),
                SizedBox(height: 30),
               TextButton(onPressed: (){Navigator.push(context,
               MaterialPageRoute(builder: (context) => const Reg()));},
                   child: Text('Dont have an account?Register now')),

              ]
          ),
        ),
    );

  }
}



