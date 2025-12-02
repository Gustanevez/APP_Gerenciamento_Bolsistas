import 'package:flutter/material.dart';
import 'package:gerenciamento_bolsistas/Style/colors.dart';
import 'package:gerenciamento_bolsistas/Screens/RegisterProject.dart';


class Cardhomecoordenador extends StatefulWidget {
  final Widget? icon;
  final Size? size;
  final String _text;
  final VoidCallback? callback;

  const Cardhomecoordenador({Key? key,required String text,this.size,
  this.icon,
  VoidCallback? onPressed})
  :_text = text,
    callback = onPressed,
    super(key:key);

    
  @override
  State<Cardhomecoordenador> createState() => _CardhomecoordenadorState();
}

class _CardhomecoordenadorState extends State<Cardhomecoordenador> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}