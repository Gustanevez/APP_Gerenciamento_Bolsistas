import 'package:flutter/material.dart';
import 'package:gerenciamento_bolsistas/Style/colors.dart';


class Button extends StatelessWidget{
  final String _text;
  final VoidCallback?  callback;
  final Size? size;
  final Color? color;
  final IconData? icon;

  const Button({Key? key,required String text, VoidCallback? onPressed,this.size,this.color,this.icon})
      : _text = text,
       callback = onPressed,
       super(key: key);

  @override
  Widget build(BuildContext context) {
   return ElevatedButton(key: Key(_text),onPressed: callback, 
   style: ButtonStyle(
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25))),
        backgroundColor: WidgetStateProperty.all<Color>(
          color ?? cor1,
        ),
        fixedSize: WidgetStateProperty.all<Size>(
          size ?? const Size(23, 26),
        )
   ),
   child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      if (icon != null) Icon(icon,color: corLetra1,),             
      if (icon != null) const SizedBox(width: 8),
      Text(_text,style: TextStyle(fontFamily: 'ABeeZee',color: corLetra1,),)
    ],
   ),
   );
  }

}
