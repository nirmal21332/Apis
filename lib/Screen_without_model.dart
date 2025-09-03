import 'package:api_practicing/api_services.dart';
import 'package:flutter/material.dart';

class ScreenWithoutModel extends StatefulWidget {
  const ScreenWithoutModel({super.key});

  @override
  State<ScreenWithoutModel> createState() => _ScreenWithoutModelState();
}

class _ScreenWithoutModelState extends State<ScreenWithoutModel> {

  bool isReady=false;
  dynamic singlePost;


  _getSingleNoModel(){
    isReady=true;
    ApiServices().getSingleNoModel().then((value){
      setState(() {
        singlePost=value!;
        isReady=false;
      });
    }).onError((error,stackTrace){
      print(error);
      isReady=false;
    });

  }

@override
  void initState() {
    super.initState();
    _getSingleNoModel();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Without Model'),
      ),
      body:isReady==true?Center(child: CircularProgressIndicator(),):Column(mainAxisAlignment: MainAxisAlignment.center,children: [
        Text(singlePost['title'].toString())
      ],),
    );
  }
}
