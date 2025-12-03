import 'package:flutter/material.dart';
import 'package:gerenciamento_bolsistas/Screens/HomePageBolsista.dart';
import 'package:gerenciamento_bolsistas/Screens/HomePageCoordenador.dart';

class LoginSenha extends StatefulWidget {
  final String tipoUsuario; // "coordenador" ou "bolsista"

  const LoginSenha({super.key, required this.tipoUsuario});

  @override
  State<LoginSenha> createState() => _LoginSenhaState();
}

class _LoginSenhaState extends State<LoginSenha> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ---- IMAGEM DO TOPO ----
              Image.asset(
                'assets/Image/topo.png',
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),

              const SizedBox(height: 0),

              // ---- FORMULÁRIO ----
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        widget.tipoUsuario == "coordenador"
                            ? "Login Coordenador"
                            : "Login Bolsista",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),

                      const SizedBox(height: 25),

                      _buildEmailField(),
                      const SizedBox(height: 18),

                      _buildPasswordField(),
                      const SizedBox(height: 10),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Esqueceu a senha?",
                            style: TextStyle(
                              color: Color(0xFF4CAF50),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      // ---- BOTÃO ENTRAR ----
                      ElevatedButton(
                        onPressed: _entrar,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4CAF50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: const Text(
                          "Entrar",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Center(child: Text("Ou continue com")),
                      const SizedBox(height: 15),

                      // ---- BOTÕES SOCIAIS ----
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _socialButton("assets/Image/google.png"),
                          _socialButton("assets/Image/suap.png"),
                        ],
                      ),

                      const SizedBox(height: 25),

                      // ---- CRIAR CONTA ----
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Não possui conta? ",
                            style: TextStyle(fontSize: 14),
                          ),
                          GestureDetector(
                            onTap: () {
                              // 👉 aqui você coloca a navegação para criar conta
                            },
                            child: const Text(
                              "Crie agora",
                              style: TextStyle(
                                color: Color(0xFF4CAF50),
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ------------------------
  // FUNÇÃO DO BOTÃO ENTRAR
  // ------------------------
  void _entrar() {
    if (widget.tipoUsuario == "coordenador") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Homepagecoordenador()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Homepagebolsista()),
      );
    }
  }

  // ------------------------
  // COMPONENTES DO LAYOUT
  // ------------------------

  /// Botão social com ícone
  Widget _socialButton(String imagePath) {
    return Container(
      width: 100,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      padding: const EdgeInsets.all(10),
      child: Image.asset(imagePath, width: 55, height: 55),
    );
  }

  /// Campo Email
  Widget _buildEmailField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Email institucional",
        filled: true,
        fillColor: const Color(0xFFF7F7F7),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 15,
        ),
        prefixIcon: const Icon(Icons.email_outlined),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  /// Campo Senha
  Widget _buildPasswordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Senha",
        filled: true,
        fillColor: const Color(0xFFF7F7F7),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 15,
        ),
        prefixIcon: const Icon(Icons.lock_outline),
        suffixIcon: const Icon(Icons.visibility_off_outlined),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
