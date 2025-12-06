
import 'package:flutter/material.dart';
import 'package:gerenciamento_bolsistas/Screens/homePageBolsista.dart';
import 'package:gerenciamento_bolsistas/Screens/loginSelect.dart';


class Menu2 extends StatelessWidget {
  const Menu2({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 260,
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFA6F4A2), // Sua cor verde clara
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          children: [
            // --- Cabeçalho do Menu (Ícone de Fechar) ---
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 10.0,
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  // Ícone para fechar o Drawer
                  icon: const Icon(Icons.menu, size: 28, color: Colors.black),
                  onPressed: () {
                    // Fecha o Drawer ao ser clicado
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),

            const SizedBox(height: 5),

            // --- Item de Exemplo: Dashboard (Home) ---
            _menuItem(
              // Caminho da sua imagem home.png
              iconPath: "assets/Image/home.png",
              text: "Dashboard",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Homepagebolsista(),
                  ),
                ); // Coloque aqui a lógica de navegação para a tela principal/home
              },
            ),

            
            
            _menuItem(
              iconPath:
                  "assets/Image/data-limite.png", // Reutilizando para Agenda de Prazos
              text: "Agenda de Prazos",
              onTap: () {},
            ),
            _menuItem(
              iconPath: "assets/Image/notificacao.png",
              text: "Notificações",
              onTap: () {},
            ),
            _menuItem(
              iconPath:
                  "assets/Image/configuracoes.png", // Imagem encontrada na sua lista
              text: "Configurações",
              onTap: () {},
            ),
            _menuItem(
              iconPath:
                  "assets/Image/ajuda.png", // Imagem encontrada na sua lista
              text: "Ajuda",
              onTap: () {},
            ),

            // --- SEPARADOR (DIVIDER) ---
            const Divider(
              color: Colors.black45,
              height: 40,
              indent: 15,
              endIndent: 15,
            ),

            // --- ITEM SAIR ---
            _menuItem(
              iconPath:
                  "assets/Image/sair.png", // Imagem encontrada na sua lista
              text: "Sair",
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                  (rout) => false,
                );
                // Lógica de logout
              },
            ), // Você pode adicionar mais itens aqui, se precisar te // ...
          ],
        ),
      ),
    );
  }

  Widget _menuItem({
    required String iconPath,
    required String text,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(iconPath, width: 24, height: 24),

            const SizedBox(width: 10), // mínimo viável

            Text(
              text,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
