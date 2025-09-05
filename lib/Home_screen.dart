import 'dart:convert';

import 'package:api_practicing/ApiModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

Future<ApiModel> getProductsAPi() async {
  final response = await http.get(
    Uri.parse('https://webhook.site/08c44fae-4eff-4d3e-bc19-ac2ea7a4e32b'),
  );
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    return ApiModel.fromJson(data);
  } else {
    return ApiModel.fromJson(data);
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products Api')),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<ApiModel>(
              future: getProductsAPi(),
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.data!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height:MediaQuery.of(context).size.height*0.3,
                        width:MediaQuery.of(context).size.width*0.3,
                        child: ListView.builder(
                            itemCount: snapshot.data!.data![index].images!.length,
                            itemBuilder:(context,value){
                          return Container(
                            height:MediaQuery.of(context).size.height*0.25,
                            width:MediaQuery.of(context).size.width*0.25,
                            decoration: BoxDecoration(
                              image:DecorationImage(
                                  image:NetworkImage(snapshot.data!.data![index].images![value].url.toString())
                              )
                            ),
                          );
                        }),
                      );
                    },
                  );
                }else{
                 return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
