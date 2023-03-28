import 'package:cadastro/helpers/validators.dart';
import 'package:cadastro/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/user_manager.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final Usuario user = Usuario();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color.fromARGB(255, 16, 16, 16),
      body: Container(
          child: Align(
        alignment: Alignment(-.6, 0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 300),
              child: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Cadastro",
                                textAlign: TextAlign.start,
                                style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40))
                            .animate()
                            .fadeIn(
                                duration: const Duration(seconds: 2),
                                delay: const Duration(seconds: 1))
                            .slideY(
                                begin: 0.5,
                                duration: const Duration(milliseconds: 500)),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Form(
                        key: formKey,
                        child: Consumer<UserManager>(
                            builder: (_, userManager, __) {
                          return Column(children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: TextFormField(
                                enabled: !userManager.loading,
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                                cursorHeight: 20,
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                  isDense: true,
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 23, 23, 23),
                                  hintText: 'Usuário',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  disabledBorder: bordertext,
                                  enabledBorder: bordertext,
                                  focusedBorder: bordertext,
                                  hintStyle: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                                validator: (name) {
                                  if (name!.isEmpty) {
                                    return 'Campo Obrigatório';
                                  }
                                  return null;
                                },
                                onSaved: (name) => user.name = name!,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: TextFormField(
                                enabled: !userManager.loading,
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                                keyboardType: TextInputType.emailAddress,
                                cursorHeight: 20,
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                  isDense: true,
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 23, 23, 23),
                                  hintText: 'Email',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  disabledBorder: bordertext,
                                  enabledBorder: bordertext,
                                  focusedBorder: bordertext,
                                  hintStyle: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                                validator: (email) {
                                  if (email!.isEmpty) {
                                    return 'Campo obrigatório';
                                  } else if (!emailValid(email)) {
                                    return 'Email inválido';
                                  }
                                  return null;
                                },
                                onSaved: (email) => user.email = email!,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: TextFormField(
                                enabled: !userManager.loading,
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                                cursorHeight: 20,
                                cursorColor: Colors.white,
                                autocorrect: false,
                                obscureText: true,
                                decoration: InputDecoration(
                                  isDense: true,
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 23, 23, 23),
                                  hintText: 'Senha',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  disabledBorder: bordertext,
                                  enabledBorder: bordertext,
                                  focusedBorder: bordertext,
                                  hintStyle: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                                validator: (pass) {
                                  if (pass!.isEmpty) {
                                    return 'Campo obrigatório';
                                  } else if (pass.length < 6) {
                                    return 'Senha muito curta';
                                  }
                                  return null;
                                },
                                onSaved: (password) =>
                                    user.password = password!,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: TextFormField(
                                enabled: !userManager.loading,
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                                cursorHeight: 20,
                                cursorColor: Colors.white,
                                autocorrect: false,
                                obscureText: true,
                                decoration: InputDecoration(
                                  isDense: true,
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 23, 23, 23),
                                  hintText: 'Repita a senha',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  disabledBorder: bordertext,
                                  enabledBorder: bordertext,
                                  focusedBorder: bordertext,
                                  hintStyle: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                                validator: (pass) {
                                  if (pass!.isEmpty) {
                                    return 'Campo obrigatório';
                                  } else if (pass.length < 6) {
                                    return 'Senha muito curta';
                                  }
                                  return null;
                                },
                                onSaved: (password) =>
                                    user.confirmPassword = password = password!,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Já possui uma conta?",
                                  style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          Color.fromARGB(255, 113, 113, 113)),
                                ),
                                TextButton(
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(24),
                                          ),
                                        ),
                                        mouseCursor:
                                            MaterialStateMouseCursor.clickable,
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                                Colors.transparent),
                                        overlayColor: MaterialStateProperty.all(
                                            Color.fromARGB(43, 255, 255, 255))),
                                    onPressed: () {},
                                    child: Text("Entre",
                                        style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white)))
                              ],
                            ).animate().fadeIn(
                                duration: const Duration(seconds: 2),
                                delay: const Duration(
                                    seconds: 2, milliseconds: 200)),
                            ElevatedButton(
                              onPressed: userManager.loading
                                  ? null
                                  : () {
                                      if (formKey.currentState!.validate()) {
                                        formKey.currentState!.save();
                                        if (user.password !=
                                            user.confirmPassword) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15))),
                                            content:
                                                Text('Senhas não coincidem'),
                                            backgroundColor: Colors.red,
                                          ));
                                          return;
                                        }
                                        userManager.signUp(
                                            user: user,
                                            onFail: (e) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                shape:
                                                    const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        15),
                                                                topRight: Radius
                                                                    .circular(
                                                                        15))),
                                                content: Text(
                                                    'Falha ao cadastrar: $e'),
                                                backgroundColor: Colors.red,
                                              ));
                                            },
                                            onSucess: () {
                                              Navigator.of(context).pop();
                                            });
                                      }
                                    },
                              style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all<Size>(
                                      Size(250, 40)),
                                  mouseCursor:
                                      MaterialStateMouseCursor.clickable,
                                  overlayColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                  )),
                              child: userManager.loading
                                  ? const CircularProgressIndicator(
                                      color: Color.fromARGB(255, 16, 16, 16),
                                      strokeWidth: 1,
                                    )
                                  : Text(
                                      'Cadastrar-se',
                                      style: GoogleFonts.poppins(
                                          color:
                                              Color.fromARGB(255, 16, 16, 16),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                            )
                          ]);
                        }),
                      ),
                    ]),
              )),
        ),
      )),
    );
  }
}

OutlineInputBorder bordertext = OutlineInputBorder(
    borderSide: BorderSide(width: 2, color: Color.fromARGB(255, 39, 39, 39)),
    borderRadius: BorderRadius.circular(12));
