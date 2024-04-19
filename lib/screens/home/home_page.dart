import 'package:auto_size_text/auto_size_text.dart';
import 'package:cipher_affair/components/custom_button.dart';
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
                  SpacingConsts().largeHeightBetweenFields(context),
                  const AutoSizeText(
                    'CypherScape',
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 55.0,
                        fontFamily: 'Legio',
                        color: Colors.amber),
                  ),
                  SpacingConsts().mediumHeightBetweenFields(context),
                  // CustomButton(
                  //   buttonText: 'Level 1',
                  //   buttonHeight: 0.07,
                  //   buttonWidth: 0.7,
                  //   onPressed: () {
                  //     setState(() {
                  //       context.read<AuthCubit>().signOut();
                  //     });
                  //   },
                  // ),
                  // SpacingConsts().mediumHeightBetweenFields(context),
                  // CustomButton(
                  //   buttonText: 'Level 2',
                  //   buttonHeight: 0.07,
                  //   buttonWidth: 0.7,
                  //   onPressed: () {
                  //     setState(() {
                  //       context.read<AuthCubit>().signOut();
                  //     });
                  //   },
                  // ),
                  // SpacingConsts().mediumHeightBetweenFields(context),
                  // CustomButton(
                  //   buttonText: 'Level 3',
                  //   buttonHeight: 0.07,
                  //   buttonWidth: 0.7,
                  //   onPressed: () {
                  //     setState(() {
                  //       context.read<AuthCubit>().signOut();
                  //     });
                  //   },
                  // ),
                  Wrap(
                    runSpacing: MediaQuery.of(context).size.height * 0.03,
                    children: levels.take(2).map((level) {
                      return levelGrid(level, context);
                    }).toList(),
                  ),
                  SpacingConsts().mediumHeightBetweenFields(context),
                  CustomButton(
                    buttonText: 'Logout',
                    buttonHeight: 0.07,
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
      onHover: (_) {
        setState(() {});
      },
      child: Card(
        child: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(level.image!), fit: BoxFit.fill)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.02,
                      vertical: 0),
                  decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Center(
                    child: AutoSizeText(
                      'Level ${level.level} : ${level.title}',
                      maxLines: 1,
                      style: const TextStyle(
                          fontFamily: 'Kod',
                          color: Colors.white,
                          fontSize: 60,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
