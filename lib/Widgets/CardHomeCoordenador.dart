import 'package:flutter/material.dart';
import 'package:gerenciamento_bolsistas/Models/Project.dart';
import 'package:gerenciamento_bolsistas/Style/colors.dart';


class card_home_coordenador extends StatelessWidget {
  const card_home_coordenador({
    super.key,
    required this.projetos,
  });

  final List<Project> projetos;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          
          InkWell(
            onTap: () {
              
            },
            child: Container(
              
              width: MediaQuery.of(context).size.width * 0.35,
              height:
                  double.infinity, 
              margin: const EdgeInsets.only(right: 15),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: cor1,
                borderRadius: BorderRadius.circular(
                  20,
                ), 
              ),
    
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Image.asset(
                    'assets/Image/pessoas.png',
                    width: 40,
                    height: 40,
                    color: Colors.black, 
                  ),
    
                  
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Bolsistas Ativos', 
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
    
                      Text(
                       
                        (projetos.length +0 ).toString(),
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
    
                 
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(
                      Icons.add_circle_outline,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
    
          
          InkWell(
            onTap: () {
              
            },
            child: Container(
             
              width: MediaQuery.of(context).size.width * 0.35,
              height:
                  double.infinity,
              margin: const EdgeInsets.only(right: 15),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: cor1,
                borderRadius: BorderRadius.circular(
                  20,
                ), 
              ),
    
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                
                  Image.asset(
                    'assets/Image/e.png',
                    width: 40,
                    height: 40,
                    color: Colors.black,
                  ),
    
                  
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Projetos', 
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
    
                      Text(
                                                (projetos.length +0).toString(),
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
    
                 
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(
                      Icons.add_circle_outline,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
    
          
          InkWell(
            onTap: () {
             
            },
            child: Container(
         
              width: MediaQuery.of(context).size.width * 0.35,
              height:
                  double.infinity, 
              margin: const EdgeInsets.only(right: 15),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: cor1,
                borderRadius: BorderRadius.circular(
                  20,
                ), 
              ),
    
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Image.asset(
                    'assets/Image/relogio.png',
                    width: 40,
                    height: 40,
                    color: Colors.black, 
                  ),
    
                  
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Tempo de laboratório', 
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
    
                      Text(
                        
                        (projetos.length + 0).toString(),
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(
                      Icons.add_circle_outline,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}