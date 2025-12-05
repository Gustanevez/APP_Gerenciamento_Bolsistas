import 'package:flutter/material.dart';

class GeoMentePage extends StatelessWidget {
  const GeoMentePage({super.key});

  Widget _chipStatus(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Top bar
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Spacer(),
                  const Text(
                    "Olá, Coordenador!",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
                ],
              ),

              const SizedBox(height: 10),

              
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFEAFBEA),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 22,
                      backgroundImage: AssetImage("assets/user.png"),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bolsista: Helena Duarte",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Curso: Geografia",
                            style: TextStyle(fontSize: 11),
                          ),
                          Text(
                            "Matrícula: 18300 • Orientador: Dr. Ricardo",
                            style: TextStyle(fontSize: 11),
                          ),
                          Text(
                            "Período: 2025 a 2027",
                            style: TextStyle(fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFEAFBEA),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "GeoMente",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Sistema de mapeamento cognitivo para ambientes geográficos.",
                      style: TextStyle(fontSize: 13),
                    ),
                    const SizedBox(height: 20),

                    const Text(
                      "Área de Pesquisa",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Geografia e Geoprocessamento",
                      style: TextStyle(fontSize: 13),
                    ),
                    const SizedBox(height: 14),

                    const Text(
                      "Orientador(a)",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Dr. Ricardo A. Moura",
                      style: TextStyle(fontSize: 13),
                    ),
                    const SizedBox(height: 14),

                    const Text(
                      "Bolsistas",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 8),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Helena Duarte",
                          style: TextStyle(fontSize: 13),
                        ),
                        _chipStatus("Ativo", Colors.green),
                      ],
                    ),
                    const SizedBox(height: 6),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Caio Moreira",
                          style: TextStyle(fontSize: 13),
                        ),
                        _chipStatus("Ativo", Colors.green),
                      ],
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "Cronograma",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Pesquisa de Campo",
                          style: TextStyle(fontSize: 13),
                        ),
                        _chipStatus("Concluído", Colors.green),
                      ],
                    ),
                    const SizedBox(height: 6),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Modelagem dos Mapas",
                          style: TextStyle(fontSize: 13),
                        ),
                        _chipStatus("Ativo", Colors.green),
                      ],
                    ),
                    const SizedBox(height: 6),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Publicação de Artigo",
                          style: TextStyle(fontSize: 13),
                        ),
                        _chipStatus("Pendente", Colors.orange),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
