import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void login(String userName,password)async{
    try{
      Response response=await post(
        Uri.parse('https://restful-booker.herokuapp.com/auth'),
        body: {
          "username" : userName,
          "password" : password,
        }
      );

      if(response.statusCode==200){
        var data=jsonDecode(response.body.toString());
        print(data);
        print('Login Successful');
      }else{
        print('Try Again');
      }

    }catch(e){
      print(e.toString());
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post Api'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _userNameController,
              decoration: InputDecoration(
                hintText: 'Username',
                filled: true,
                fillColor: Colors.grey[300],
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
                filled: true,
                fillColor: Colors.grey[300],
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            SizedBox(height: 25),

            GestureDetector(
              onTap:(){

                login(_userNameController.text.toString(),_passwordController.text.toString());

              },
              child: Container(
                  height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Center(child: Text('Sign Up',style: TextStyle(fontWeight: FontWeight.bold),))
                ),
            ),

          ],
        ),
      ),
    );
  }
}
