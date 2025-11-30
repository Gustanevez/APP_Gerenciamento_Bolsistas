import 'package:flutter/material.dart';
import 'package:gerenciamento_bolsistas/Style/colors.dart';
import 'package:gerenciamento_bolsistas/Widgets/button.dart';
class Homepagebolsista extends StatelessWidget{
  const Homepagebolsista({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
      backgroundColor: cor2,
    ),
    appBar: AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("Olá,Bolsista",style: TextStyle(fontFamily: 'ABeeZee',fontSize: 16 ),),
        ],
      ),
    ),
    body:Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child:Column(
       children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
         children: [
          Button(text: 'Notificações',onPressed: () {
          },size: const Size(335,46),color:cor1,icon: Icons.notifications,)
        ]
       ),
       SizedBox(height: 40,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Container(
            height: 140,
            width:337 ,
            color: cor1,
           child: Align(alignment: Alignment.topLeft,
           child:Text('Metas do projeto') ,),
           )
          ],
        )
      ],
      
    
    ) ,
    ),
      ),
    );
    
    

    
  }

}
