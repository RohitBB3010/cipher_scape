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
    return SafeArea(
      child: Scaffold(
        backgroundColor: primary_3,
        body: Column(
          children: [
            LoginComponent().basicComp(0.6, 0.2, 50, context),
            SpacingConsts().mediumHeightBetweenFields(context),
            SignInButton(Buttons.googleDark, onPressed: () {
              context.read<AuthCubit>().googleSignIn();
            })
          ],
        ),
      ),
    );
  }
}
