import 'package:flutter/material.dart';
import 'package:get_moments/src/components/backgroudcolor.dart';
import 'package:get_moments/src/components/logo_get_moments.dart';
import 'package:get_moments/src/components/text_field_get_moments.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart' as colors;
import '../../components/button_get_moments.dart';

class CadastrarPage extends StatefulWidget {
  const CadastrarPage({Key? key}) : super(key: key);

  @override
  State<CadastrarPage> createState() => _CadastrarPageState();
}

class _CadastrarPageState extends State<CadastrarPage> {
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
                    'Realize seu Cadastro',
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
                      hintText: 'Nome',
                      textInputAction: TextInputAction.next,
                      preffixIcon: const Icon(
                        Icons.person_outline,
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
                  const SizedBox(height: 20),
                  SizedBox(
                    child: Center(
                      child: ButtonGetMoments(
                        colorBackground: Colors.black54,
                        text: 'Cadastrar',
                        onPressed: () {},
                      ),
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
