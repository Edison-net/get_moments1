import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart' as colors;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                child: Column(
                  children: [
                    Container(
                      height: 120,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      color: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 30,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Seja bem-vindo\n'
                                  'Nome usuário',
                                  style: GoogleFonts.roboto(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: colors.customWhite,
                                  ),
                                ),
                                const SizedBox(width: 40),
                                GestureDetector(
                                  onTap: () {},
                                  child: const CircleAvatar(
                                    radius: 40,
                                    backgroundImage: NetworkImage(
                                        'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50?s=200'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: 42,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 4,
              itemBuilder: ((context, index) {
                return Card(
                  elevation: 0,
                  color: colors.customBlack,
                  child: SizedBox(
                    width: 130,
                    height: 36,
                    child: InkWell(
                      child: Center(
                        child: Text(
                          'Ortopedista',
                          style: GoogleFonts.roboto(
                            fontSize: 12,
                            color: colors.customWhite,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.5,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ListView.builder(
                  itemBuilder: ((context, index) {
                    return SizedBox(
                      height: 120,
                      child: Card(
                        color: Colors.blue,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                    'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50?s=200'),
                              ),
                              const SizedBox(width: 20),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Dr. Usuario $index',
                                      style: GoogleFonts.roboto(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        color: colors.customWhite,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.calendar_month_outlined,
                                          color: colors.customWhite,
                                          size: 20,
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          'Quinta-feira',
                                          style: GoogleFonts.roboto(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: colors.customWhite,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.watch_later,
                                          color: colors.customWhite,
                                          size: 20,
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          '10:00 - 12:00',
                                          style: GoogleFonts.roboto(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: colors.customWhite,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                  itemCount: 10)),
        ],
      ),
    );
  }
}
