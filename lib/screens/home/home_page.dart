import 'package:auto_size_text/auto_size_text.dart';
import 'package:cipher_affair/components/custom_button.dart';
import 'package:cipher_affair/components/loading_page.dart';
import 'package:cipher_affair/consts/colors.dart';
import 'package:cipher_affair/consts/list_levels.dart';
import 'package:cipher_affair/consts/spacing_consts.dart';
import 'package:cipher_affair/screens/auth/auth_cubit.dart';
import 'package:cipher_affair/screens/home/level.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: primary_3,
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.02,
              vertical: MediaQuery.of(context).size.height * 0.02,
            ),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/home_page_1.jpeg'),
                    fit: BoxFit.cover,
                    opacity: 0.2)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SpacingConsts().mediumHeightBetweenFields(context),
                  const AutoSizeText(
                    'CypherScape',
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 55.0,
                        fontFamily: 'Legio',
                        color: Colors.amber),
                  ),
                  SpacingConsts().mediumHeightBetweenFields(context),
                  Wrap(
                    runSpacing: MediaQuery.of(context).size.height * 0.03,
                    children: levels.take(2).map((level) {
                      return levelGrid(level, context);
                    }).toList(),
                  ),
                  SpacingConsts().mediumHeightBetweenFields(context),
                  CustomButton(
                    buttonText: 'Logout',
                    buttonHeight: 0.05,
                    buttonWidth: 0.7,
                    onPressed: () {
                      setState(() {
                        context.read<AuthCubit>().signOut();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget levelGrid(
    Level level,
    BuildContext context,
  ) {
    return InkWell(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width * 0.6,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.white, width: 2),
            image: DecorationImage(
                image: AssetImage(level.image!), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.6,
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.02,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                color: Colors.amber,
              ),
              child: Center(
                  child: AutoSizeText(
                'Level ${level.level} : ${level.title}',
                style: const TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                    fontFamily: 'Kod',
                    fontWeight: FontWeight.bold),
              )),
            )
          ],
        ),
      ),
    );
  }
}
