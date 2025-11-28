import 'package:flutter/material.dart';

class Homepagebolsista extends StatelessWidget{
  const Homepagebolsista({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text("Olá, coordenador"),
    ),
    body: Row(
      children: [Text('olá')],
    ),
    );
    

    
  }

}
