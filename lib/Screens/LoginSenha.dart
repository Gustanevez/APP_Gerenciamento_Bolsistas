import 'package:flutter/material.dart';
import 'package:gerenciamento_bolsistas/Screens/cadastrar_usuario.dart';
import 'package:gerenciamento_bolsistas/Screens/homePageBolsista.dart';
import 'package:gerenciamento_bolsistas/Screens/home_page_coordenador.dart';
import 'package:gerenciamento_bolsistas/Services/auth.dart';
import 'package:gerenciamento_bolsistas/Widgets/Coodernador/widget_cadastrar_projeto.dart';
import 'package:gerenciamento_bolsistas/Widgets/buttonActions.dart';
import 'package:gerenciamento_bolsistas/Widgets/widget_tela_login.dart';

class LoginSenha extends StatefulWidget {
  final String tipoUsuario;

  const LoginSenha({super.key, required this.tipoUsuario});

  @override
  State<LoginSenha> createState() => _LoginSenhaState();
}

class _LoginSenhaState extends State<LoginSenha> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  bool _estaCarregando = false;
  Autenticacao servico_auten = Autenticacao();

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  'assets/Image/topo.png',
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),

                const SizedBox(height: 0),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
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
                      CampoProjeto(
                        label: "Email",
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Digite seu email';
                          }
                          if (!value.endsWith('@acad.ifma.edu.br')) {
                            return 'o email não é válido, precisa ser o email institucional';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 18),

                      CampoProjeto(
                        label: "Senha",
                        controller: _senhaController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Crie sua senha";
                          }
                          if (value.length < 8) {
                            return 'A senha precisa ter no minimo 8 caracters';
                          }
                          return null;
                        },
                      ),
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

                      const SizedBox(height: 20),
                      _estaCarregando
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Color(0xFF4CAF50),
                              ),
                            )
                          : ButtonEntrar(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    _estaCarregando = true;
                                  });

                                  Map<String, dynamic>? result =
                                      await servico_auten.LogarUsuario(
                                        email: _emailController.text,
                                        senha: _senhaController.text,
                                      );

                                  setState(() {
                                    _estaCarregando = false;
                                  });

                                  if (result != null &&
                                      !result.containsKey('error')) {
                                    String? tipoUsuarioLogado =
                                        result['tipoUsuario'];
                                    print(
                                      "Tipo no Banco: '$tipoUsuarioLogado'",
                                    );
                                    print(
                                      "Tipo Selecionado na Tela: '${widget.tipoUsuario}'",
                                    );
                                    if (tipoUsuarioLogado ==
                                        widget.tipoUsuario) {
                                      if (tipoUsuarioLogado == 'coordenador') {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const Homepagecoordenador(),
                                          ),
                                        );
                                      } else if (tipoUsuarioLogado ==
                                          'bolsista') {
                                        Navigator.pushReplacement(
                                          context,  
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                 Homepagebolsista(),
                                          ),
                                        );
                                      }
                                    }
                                  }
                                }
                              },
                            ),

                      const Center(child: Text("Ou continue com")),
                      const SizedBox(height: 15),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SocialButton(imagePath: "assets/Image/google.png"),
                          SocialButton(imagePath: 'assets/Image/suap.png'),
                        ],
                      ),

                      const SizedBox(height: 25),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Não possui conta? ",
                            style: TextStyle(fontSize: 14),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Buttonactions(
                              text: 'criar agora',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CadastrarUsuario(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
