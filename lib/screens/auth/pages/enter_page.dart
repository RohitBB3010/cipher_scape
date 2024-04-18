import 'package:cipher_affair/components/common_text_field.dart';
import 'package:cipher_affair/components/custom_button.dart';
import 'package:cipher_affair/components/login_component.dart';
import 'package:cipher_affair/consts/colors.dart';
import 'package:cipher_affair/consts/spacing_consts.dart';
import 'package:cipher_affair/screens/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnterPage extends StatelessWidget {
  EnterPage({super.key});

  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary_3,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginComponent().basicComp(0.6, 0.2, 50, context),
              SpacingConsts().mediumHeightBetweenFields(context),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: CustomTextField(
                  controller: phoneController,
                  hintText: 'Enter phone number',
                  prefixIcon: Icons.phone,
                ),
              ),
              SpacingConsts().mediumHeightBetweenFields(context),
              CustomButton(
                buttonText: 'Send OTP',
                buttonHeight: 0.08,
                buttonWidth: 0.7,
                onPressed: () {
                  String phoneNumber = '+91${phoneController.text}';

                  context.read<AuthCubit>().getOtp(phoneNumber);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
