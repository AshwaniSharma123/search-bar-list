import 'package:flutter/material.dart';
import 'package:search_bar_list/search/searchlist.dart';

void main()=> runApp(Myapp());

class Myapp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'search',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey),
      home: searchlist(),
    );
  }
  
}
