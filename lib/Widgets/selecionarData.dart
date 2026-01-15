import 'package:flutter/material.dart';

class SeletorDataCampo extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final DateTime? dataInicialLimite; 
  final DateTime? dataFinalLimite;   
  final Function(DateTime) onDataSelecionada;
  final IconData? icone;

  const SeletorDataCampo({
    super.key,
    required this.label,
    required this.controller,
    required this.onDataSelecionada,
    this.dataInicialLimite,
    this.dataFinalLimite,
    this.icone = Icons.calendar_today,
  });

  Future<void> _abrirCalendario(BuildContext context) async {
    final DateTime agora = DateTime.now();
    final DateTime initialDate = (dataInicialLimite != null && dataInicialLimite!.isAfter(agora)) 
        ? dataInicialLimite! 
        : agora;

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      
      firstDate: dataInicialLimite ?? DateTime(2020),
      lastDate: dataFinalLimite ?? DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.green, 
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      String dataFormatada = "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}";
      controller.text = dataFormatada;
      onDataSelecionada(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _abrirCalendario(context),
      child: IgnorePointer( 
        child: TextFormField(
          controller: controller,
          style: const TextStyle(fontFamily: 'ABeeZee', fontSize: 14),
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(color: Colors.black54),
            prefixIcon: Icon(icone, color: Colors.green),
            filled: true,
            fillColor: Colors.grey[50],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.black12),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.black12),
            ),
          ),
          
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Por favor, selecione uma data";
            }
            return null;
          },
        ),
      ),
    );
  }
}