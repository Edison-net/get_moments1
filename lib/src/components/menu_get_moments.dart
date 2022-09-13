// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get_moments/src/components/backgroudcolor.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pages/login/login_page.dart';

class MenuGetMoments extends StatelessWidget {
  final String email;
  const MenuGetMoments({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Backgroundcolor(
          child: Column(
            children: [
              const SizedBox(height: 15),
              Row(
                children: [
                  const SizedBox(width: 20),
                  GestureDetector(
                    child: const Icon(Icons.arrow_back_ios),
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // foto de perfil
              const SizedBox(
                width: 75,
                height: 75,
                child: CircleAvatar(
                  radius: 75,
                  backgroundImage: NetworkImage(
                    'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50?s=202',
                  ),
                ),
              ),
              const SizedBox(height: 14),
              // nome do usuario
              Text(
                email,
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListTile(
                  leading: const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blueAccent,
                    child: Icon(
                      Icons.logout,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  title: Text(
                    "Sair do App",
                    style: GoogleFonts.roboto(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => const LoginPage()),
                      (route) => false,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
