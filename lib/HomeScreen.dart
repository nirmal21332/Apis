import 'package:api_practicing/api_services.dart';
import 'package:api_practicing/single_post_model.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  bool isReady=false;

  SinlgeApiModel singleApiModel = SinlgeApiModel();

  _getSiglePost(){
    isReady=true;
    ApiServices().getSinglePost().then((value){
      setState(() {
        singleApiModel=value!;
        isReady=false;
      });
    }).onError((error,stackTrace){
      print(error);
      setState(() {
        isReady=false;
      });
    });
  }

  @override
  void initState() {
    _getSiglePost();
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.8,
        centerTitle: true,
        title: Text('Api Practice'),
      ),
      body: isReady==true?Center(
        child: CircularProgressIndicator(),
      ):Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(singleApiModel.title.toString())
        ],
      )
    );
  }
}
