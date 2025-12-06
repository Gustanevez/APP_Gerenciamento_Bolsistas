import 'package:flutter/material.dart';

class Campo_projeto extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController? controller;

  const Campo_projeto({
    super.key,
    required this.label,
    this.hint = "",
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          labelStyle: const TextStyle(
            fontFamily: 'ABeeZee',
            fontSize: 12,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}


class CampoComIcone_projeto extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final TextEditingController? controller;

  const CampoComIcone_projeto({
    super.key,
    required this.label,
    required this.icon,
    this.hint = "",
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          labelStyle: const TextStyle(
            fontFamily: 'ABeeZee',
            fontSize: 12,
          ),
          suffixIcon: Icon(icon, color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

