import 'package:api_practicing/View/world_states.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  String name;
  String image;
  int totalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      test;

  DetailScreen({
    super.key,
    required this.name,
    required this.todayRecovered,
    required this.critical,
    required this.active,
    required this.image,
    required this.test,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.name), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

Image.network(widget.image,height: 100,width: 100,),

          Stack(
            children: [
              Card(
                child:Column(
                  children: [
                    ReusableRow(value:widget.totalCases.toString(), title:'Cases'),
                    ReusableRow(value:widget.totalDeaths.toString(), title:'Deaths'),
                    ReusableRow(value:widget.totalRecovered.toString(), title:'Recovered'),
                    ReusableRow(value:widget.active.toString(), title:'Active'),
                    ReusableRow(value:widget.todayRecovered.toString(), title:'Today Recovered'),
                    ReusableRow(value:widget.critical.toString(), title:'Critical'),

                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
