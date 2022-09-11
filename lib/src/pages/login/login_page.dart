import 'package:flutter/material.dart';
import 'package:get_moments/src/components/backgroudcolor.dart';
import 'package:get_moments/src/components/logo_get_moments.dart';
import 'package:get_moments/src/components/text_field_get_moments.dart';
import 'package:get_moments/src/pages/cadastrar/cadastrar.page.dart';
import 'package:get_moments/src/pages/home/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart' as colors;
import '../../components/button_get_moments.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Backgroundcolor(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const LogoGetMoments(),
                  const SizedBox(height: 80),
                  Text(
                    'Realize seu login',
                    style: GoogleFonts.roboto(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      color: colors.customWhite,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: colors.customWhite,
                    ),
                    child: TextFieldGetMoments(
                      isError: isError,
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      preffixIcon: const Icon(
                        Icons.email_outlined,
                        color: colors.customBlack,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: colors.customWhite,
                    ),
                    child: TextFieldGetMoments(
                      isError: isError,
                      hintText: 'Senha',
                      obscureText: true,
                      preffixIcon: const Icon(
                        Icons.lock_outlined,
                        color: colors.customBlack,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 80,
                          width: 140,
                          child: Center(
                            child: ButtonGetMoments(
                              colorBackground: Colors.black54,
                              text: 'Cadastrar',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const CadastrarPage(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                          height: 80,
                          width: 140,
                          child: Center(
                            child: ButtonGetMoments(
                              colorBackground: Colors.black54,
                              text: 'Entrar',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomePage(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Esqueci minha senha',
                            style: GoogleFonts.roboto(
                              color: colors.customWhite,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
