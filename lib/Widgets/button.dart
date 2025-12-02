import 'package:flutter/material.dart';
import 'package:gerenciamento_bolsistas/Style/colors.dart';


class Button extends StatelessWidget{
  final String _text;
  final VoidCallback?  callback;
  final Size? size;
  final Color? color;
  final Widget? icon;

  const Button({Key? key,required String text, VoidCallback? onPressed,this.size,this.color,this.icon})
      : _text = text,
       callback = onPressed,
       super(key: key);

  @override
  Widget build(BuildContext context) {
   return OutlinedButton(key: Key(_text),onPressed: callback, 
   style: ButtonStyle(
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14))),
        backgroundColor: WidgetStateProperty.all<Color>(
          color ?? cor1,
        ),
        fixedSize: size != null? WidgetStateProperty.all<Size>(size!)
        :null,
   ),
   child: Row(
    mainAxisAlignment: MainAxisAlignment.start ,
    children: [
      if (icon != null) icon!,            
      if (icon != null) const SizedBox(width: 8),
        Text(_text,style: TextStyle(fontFamily: 'ABeeZee',color: corLetra1,),)
    ],
   ),
   );
  }

}
