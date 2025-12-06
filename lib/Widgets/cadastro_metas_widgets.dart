import 'package:flutter/material.dart';

class Campo extends StatelessWidget {
  final String label;
  final String hint;

  const Campo({
    super.key,
    required this.label,
    this.hint = "",

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
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}


class CampoComIcone extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;

  const CampoComIcone({
    super.key,
    required this.label,
    required this.icon,
    this.hint = "",
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

