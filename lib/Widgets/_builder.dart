import 'package:flutter/material.dart';

class RegistrationCard extends StatelessWidget {
  final String title;

  const RegistrationCard({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 337,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color.fromARGB(255, 83, 83, 83),
          width: 1,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'ABeeZee',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 8),

          
          const Text(
            'Ex.: Data, local e outras observações de presença',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
              fontStyle: FontStyle.italic,
            ),
          ),

          const SizedBox(height: 12),

          
          TextFormField(
            maxLines: 4,
            decoration: InputDecoration(
              hintText: 'Digite aqui...',
              border: const OutlineInputBorder(),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 88, 88, 88),
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 82, 82, 82),
                  width: 1,
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.all(8.0),
            ),
            style: const TextStyle(color: Colors.black87),
          ),
        ],
      ),
    );
  }
}


 class DashboardCard extends StatelessWidget {
  final String title;
  final Widget content;
  final double topMargin;

  const DashboardCard({
    super.key,
    required this.title,
    required this.content,
    this.topMargin = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 337,
      margin: EdgeInsets.only(top: topMargin, bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black, width: 1),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'ABeeZee',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          content,
        ],
      ),
    );
  }
}
