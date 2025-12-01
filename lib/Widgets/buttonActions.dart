import 'package:flutter/material.dart';
import 'package:gerenciamento_bolsistas/Style/colors.dart';

class Buttonactions extends StatelessWidget {
  final String _Text;
  final VoidCallback? callback;
  final Color? color;
  final Widget? icons;
  final Size? size;

  const Buttonactions({Key? key, required String text, 
  VoidCallback? onPressed, 
  this.color, this.icons, this.size})
  : _Text = text,
    callback = onPressed,
    super(key:key); 

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(key: Key(_Text),
     onPressed: callback,style: ButtonStyle(
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),      
        )
        ),
        backgroundColor: WidgetStateProperty.all<Color>(
          color ?? cor4,
        ),
        fixedSize: WidgetStateProperty.all<Size>(
          size ?? const Size(45, 20),
        ),
      
    ),child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        if (icons != null) icons!,            
        if (icons != null) const SizedBox(width: 8),
          Text(_Text,style: TextStyle(fontFamily: 'ABeeZee',color:corLetra2),),
        ],

    ), 
    );
  }
}