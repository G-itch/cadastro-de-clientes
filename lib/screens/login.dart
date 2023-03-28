import 'package:cadastro/models/user.dart';
import 'package:cadastro/models/user_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../helpers/validators.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color.fromARGB(255, 16, 16, 16),
      body: Container(
          child: Align(
        alignment: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
            ? Alignment.center
            : Alignment(.6, 0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 300),
            child: Container(
              child: Column(
                mainAxisAlignment:
                    // ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                    // ?
                    MainAxisAlignment.center,
                // : MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Entrar",
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
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Container(
                  //       height: 53,
                  //       width: 90,
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(12),
                  //           border: Border.all(
                  //             width: 2,
                  //             color: Color.fromARGB(255, 39, 39, 39),
                  //           ),
                  //           color: Color.fromARGB(255, 23, 23, 23)),
                  //     ),
                  //     SizedBox(
                  //       width: 30,
                  //     ),
                  //     Container(
                  //       height: 53,
                  //       width: 90,
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(12),
                  //           border: Border.all(
                  //             width: 2,
                  //             color: Color.fromARGB(255, 39, 39, 39),
                  //           ),
                  //           color: Color.fromARGB(255, 23, 23, 23)),
                  //     )
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 35,
                  // ),
                  Form(
                    key: formKey,
                    child: Consumer<UserManager>(builder: (_, userManager, __) {
                      return Column(
                        children: [
                          TextFormField(
                            controller: emailController,
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
                              hintText: 'Email',
                              enabledBorder: bordertext,
                              disabledBorder: bordertext,
                              border: bordertext,
                              focusedBorder: bordertext,
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 113, 113, 113)),
                            ),
                            autocorrect: false,
                            keyboardType: TextInputType.emailAddress,
                            validator: (email) {
                              if (email != null && !emailValid(email)) {
                                return 'Email inválido';
                              }
                              return null;
                            },
                          ).animate().fadeIn(
                              duration: const Duration(seconds: 2),
                              delay: const Duration(
                                  seconds: 1, milliseconds: 400)),
                          SizedBox(height: 45),
                          TextFormField(
                            controller: passController,
                            enabled: !userManager.loading,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                            cursorHeight: 20,
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              isDense: true,
                              filled: true,
                              fillColor: Color.fromARGB(255, 23, 23, 23),
                              hintText: 'Senha',
                              border: bordertext,
                              disabledBorder: bordertext,
                              enabledBorder: bordertext,
                              focusedBorder: bordertext,
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 113, 113, 113)),
                            ),
                            enableSuggestions: true,
                            autocorrect: false,
                            obscureText: true,
                            validator: (pass) {
                              if (pass!.isEmpty || pass.length < 6) {
                                return 'Senha inválida';
                              }
                              return null;
                            },
                          ).animate().fadeIn(
                              duration: const Duration(seconds: 2),
                              delay: const Duration(
                                  seconds: 1, milliseconds: 800)),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Não possui uma conta?",
                                style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 113, 113, 113)),
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
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushReplacementNamed("/signup");
                                  },
                                  child: Text("Cadastre-se",
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
                                      print(emailController.text);
                                      print(passController.text);
                                      userManager.signIn(
                                          user: Usuario(
                                              email: emailController.text,
                                              password: passController.text),
                                          onFail: (e) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
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
                                                content:
                                                    Text('Falha ao entrar: $e'),
                                                backgroundColor: Colors.red,
                                              ),
                                            );
                                          },
                                          onSucess: () {
                                            Navigator.of(context).pop();
                                            print('sucesso');
                                          });
                                    }
                                  },
                            style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all<Size>(
                                    Size(250, 40)),
                                mouseCursor: MaterialStateMouseCursor.clickable,
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
                                    'Entrar',
                                    style: GoogleFonts.poppins(
                                        color: Color.fromARGB(255, 16, 16, 16),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                          ).animate().fadeIn(
                              duration: const Duration(seconds: 2),
                              delay: const Duration(
                                  seconds: 2, milliseconds: 200)),
                        ],
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}

OutlineInputBorder bordertext = OutlineInputBorder(
    borderSide: BorderSide(width: 2, color: Color.fromARGB(255, 39, 39, 39)),
    borderRadius: BorderRadius.circular(12));
