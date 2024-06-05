import 'package:auto_size_text/auto_size_text.dart';
import 'package:cipher_affair/components/common_text_field.dart';
import 'package:cipher_affair/components/custom_button.dart';
import 'package:cipher_affair/components/loading_page.dart';
import 'package:cipher_affair/consts/colors.dart';
import 'package:cipher_affair/consts/spacing_consts.dart';
import 'package:cipher_affair/screens/auth/auth_cubit.dart';
import 'package:cipher_affair/screens/home/home_page.dart';
import 'package:cipher_affair/screens/mandatory_fields/mandatory_field_state.dart';
import 'package:cipher_affair/screens/mandatory_fields/mandatory_fields_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MandatoryFieldsPage extends StatelessWidget {
  const MandatoryFieldsPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();

    return BlocProvider(
      create: (context) => MandatoryFieldsCubit()..checkUserData(),
      child: BlocBuilder<MandatoryFieldsCubit, MandatoryFields>(
        builder: (context, state) {
          if (state is MandatoryFieldsLoadingState) {
            return const LoadingPage();
          }

          if (state is MandatoryFieldsNotFilledState) {
            return Scaffold(
              backgroundColor: primary_3,
              body: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SpacingConsts().largeHeightBetweenFields(context),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: Image.asset('assets/logo_new.jpeg')),
                        const AutoSizeText(
                          'Cipher Scape',
                          maxLines: 1,
                          style: TextStyle(
                              fontFamily: 'Legio',
                              fontSize: 50.0,
                              color: Colors.amber),
                        ),
                        SpacingConsts().mediumHeightBetweenFields(context),
                        const AutoSizeText(
                          'Join the ranks!! Identify yourself!',
                          style: TextStyle(
                              fontFamily: 'Kod',
                              fontSize: 20.0,
                              color: Colors.amber),
                        ),
                        SpacingConsts().mediumHeightBetweenFields(context),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: CustomTextField(
                            hintText: 'Enter name',
                            controller: nameController,
                            prefixIcon: Icons.person,
                          ),
                        ),
                        SpacingConsts().smallHeightBetweenFields(context),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: CustomTextField(
                            controller: emailController,
                            hintText: 'Enter email',
                            prefixIcon: Icons.person,
                          ),
                        ),
                        SpacingConsts().mediumHeightBetweenFields(context),
                        CustomButton(
                          buttonText: 'Submit',
                          buttonHeight: 0.06,
                          buttonWidth: 0.7,
                          color: Colors.amber,
                          onPressed: () {
                            if (nameController.text.isEmpty ||
                                emailController.text.isEmpty) {
                              SnackBar snackBar = SnackBar(
                                  elevation: 0.8,
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.amber,
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  content: const Center(
                                    child: AutoSizeText(
                                      'Please fill all fields',
                                      maxLines: 1,
                                      style: TextStyle(fontSize: 18.0),
                                    ),
                                  ));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              context
                                  .read<MandatoryFieldsCubit>()
                                  .setMandatoryFields(nameController.text,
                                      emailController.text);
                            }
                          },
                        ),
                        SpacingConsts().mediumHeightBetweenFields(context),
                        CustomButton(
                          buttonText: 'Exit',
                          buttonHeight: 0.06,
                          buttonWidth: 0.7,
                          color: Colors.amber,
                          onPressed: () {
                            context.read<AuthCubit>().signOut();
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }

          if (state is MandatoryFieldsSubmittedState) {
            return Center(
              child: AutoSizeText(state.toString()),
            );
          }

          if (state is MandatoryFieldsPresentState) {
            return HomePage();
          }

          return Container(
            child: AutoSizeText(state.toString()),
          );
        },
      ),
    );
  }
}
