import 'package:flutter/material.dart';
import 'package:gerenciamento_bolsistas/Style/colors.dart';
import 'package:gerenciamento_bolsistas/Widgets/buttonActions.dart';
import 'package:gerenciamento_bolsistas/Widgets/Coodernador/widget_cadastrar_projeto.dart';
import 'package:gerenciamento_bolsistas/Screens/LoginSelect.dart';
import 'package:gerenciamento_bolsistas/Services/auth.dart';

class CadastrarUsuario extends StatefulWidget {
  const CadastrarUsuario({super.key});

  @override
  State<CadastrarUsuario> createState() => _CriarLogin();
}

class _CriarLogin extends State<CadastrarUsuario> {
  Character? selected;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();
  Autenticacao _servicoAuten = Autenticacao();

  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    _nomeController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              'Olá, Coordenador!',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'BeeZee',
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 65),
                const Text(
                  "Cadastrar Usuario",
                  style: TextStyle(
                    fontFamily: 'ABeeZee',
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),

                const SizedBox(height: 45),

                CampoProjeto(
                  label: "Nome",
                  controller: _nomeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Digite seu nome';
                    }
                  },
                ),
                const SizedBox(height: 20),

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
                const SizedBox(height: 20),

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
                const SizedBox(height: 20),

                const Text(
                  'Selecione uma das opções abaixo: ',
                  style: TextStyle(fontFamily: 'ABeeZee', fontSize: 14),
                ),

                Column(
                  children: [
                    SelectLogin(
                      onChanged: (value) {
                        setState(() {
                          selected = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                Column(
                  children: [
                    Buttonactions(
                      text: 'Continuar',
                      onPressed: () {
                        String nome = _nomeController.text;
                        String email = _emailController.text;
                        String senha = _senhaController.text;

                        if (_formKey.currentState!.validate()) {
                          if (selected == Character.coordenador) {
                            if (selected == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Selecione um tipo de usuario',
                                    style: TextStyle(
                                      fontFamily: 'ABeeZee',
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              );  
                              return;
                            }
                            Navigator.pop(context);
                          }
                          _servicoAuten.cadastraraUsuario(
                            nome: nome,
                            email: email,
                            senha: senha,
                            tipoUsuario: selected == Character.coordenador
                                ? "coordenador"
                                : "bolsista",
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Login(),
                            ),
                          );
                        }
                      },
                      size: Size(MediaQuery.of(context).size.width * 0.9, 46),
                      color: cor4,
                    ),
                  ],
                ),

                SizedBox(height: 50),
                Column(children: [
              
              ],  
            ),
                const SizedBox(height: 10),

                Column(children: [
               
              ],
            ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
