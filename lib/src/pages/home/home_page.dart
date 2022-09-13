// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get_moments/models/profissionais_models.dart';
import 'package:get_moments/repository/profissionais_repo.dart';
import 'package:get_moments/src/components/loading_get_moments.dart';
import 'package:get_moments/src/components/menu_get_moments.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart' as colors;

class HomePage extends StatefulWidget {
  final String login;
  const HomePage({
    Key? key,
    required this.login,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProfissionaisModels> profissionaisList = <ProfissionaisModels>[];

  Future<void> loadingProfissionais() async {
    profissionaisList = await getProfissionais();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        profissionaisList;
      });
    });
  }

  @override
  initState() {
    super.initState();
    loadingProfissionais();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getProfissionais(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return pageview(context);
          } else {
            return const LoadingGetMoments();
          }
        });
  }

  Widget pageview(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 28),
        child: Column(
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
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MenuGetMoments(
                                              email: widget.login),
                                        ),
                                      );
                                    },
                                    child: const CircleAvatar(
                                      radius: 40,
                                      backgroundImage: NetworkImage(
                                        'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50?s=202',
                                      ),
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
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.5,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView.builder(
                  itemCount: profissionaisList.length,
                  itemBuilder: ((context, index) {
                    final ProfissionaisModels profissionais =
                        profissionaisList[index];
                    final idAvatar = profissionais.id;
                    return SizedBox(
                      height: 120,
                      child: Card(
                        color: Colors.blue,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                  'https://get-moments.herokuapp.com/assets/professionals/$idAvatar.jpeg',
                                ),
                              ),
                              const SizedBox(width: 5),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      profissionais.name,
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
                                        const SizedBox(width: 5),
                                        Column(
                                          children: List.generate(
                                              profissionais.serviceDays!.length,
                                              (index) {
                                            final listDays = profissionais
                                                .serviceDays![index];
                                            return Column(
                                              children: [
                                                Text(
                                                  listDays,
                                                  style: GoogleFonts.roboto(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: colors.customWhite,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 4,
                                                ),
                                              ],
                                            );
                                          }),
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
                                        const SizedBox(width: 5),
                                        Text(
                                          profissionais.serviceHours,
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
                )),
          ],
        ),
      ),
    );
  }
}
