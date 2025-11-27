import 'package:flutter/material.dart';

class MeuBotao extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;

  const MeuBotao({
    super.key,
    required this.texto,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      onPressed: onPressed,
      child: Text(texto),
    );
  }
}
