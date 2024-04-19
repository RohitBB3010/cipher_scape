import 'package:cipher_affair/components/custom_button.dart';
import 'package:cipher_affair/consts/colors.dart';
import 'package:cipher_affair/screens/auth/auth_cubit.dart';
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                CustomButton(
                  buttonText: 'Logout',
                  buttonHeight: 0.07,
                  buttonWidth: 0.1,
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
    );
  }
}
