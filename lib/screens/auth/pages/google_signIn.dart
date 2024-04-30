import 'package:auto_size_text/auto_size_text.dart';
import 'package:cipher_affair/components/login_component.dart';
import 'package:cipher_affair/consts/colors.dart';
import 'package:cipher_affair/consts/spacing_consts.dart';
import 'package:cipher_affair/screens/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in_button/sign_in_button.dart';

class GoogleSignIn extends StatelessWidget {
  const GoogleSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    //   return SafeArea(
    //     child: Scaffold(
    //       backgroundColor: primary_3,
    //       body: Column(
    //         children: [
    //           LoginComponent().basicComp(0.8, 0.4, 50, context),
    //           SpacingConsts().mediumHeightBetweenFields(context),
    //           SignInButton(Buttons.googleDark, onPressed: () {
    //             context.read<AuthCubit>().googleSignIn();
    //           })
    //         ],
    //       ),
    //     ),
    //   );
    // }

    return SafeArea(
      child: Scaffold(
        backgroundColor: primary_3,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)),
                    image: DecorationImage(
                        image: AssetImage('assets/login_page.jpeg'),
                        opacity: 0.4,
                        fit: BoxFit.cover)),
                child: Column(
                  children: [
                    SpacingConsts().customHeightBetweenFields(context, 0.15),
                    const AutoSizeText(
                      'Cipher Scape',
                      style: TextStyle(
                          color: Colors.amber,
                          fontFamily: 'Legio',
                          fontSize: 55.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SpacingConsts().mediumHeightBetweenFields(context),
                    SignInButton(Buttons.googleDark, onPressed: () {
                      context.read<AuthCubit>().googleSignIn();
                    })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
