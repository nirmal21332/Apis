import 'dart:convert';

import 'package:api_practicing/PostApi.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<PostApi>postModel=[];
  Future<List<PostApi>> getPostApi()async{
    final response=await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if(response.statusCode==200){
      var data=jsonDecode(response.body.toString());
      for(Map i in data){
        postModel.add(PostApi.fromJson(i));
      }
      return postModel;
    }else{
      return postModel;
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          FutureBuilder(future:getPostApi(), builder: builder)
        ],
      ),
    );
  }
}
