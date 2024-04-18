import 'package:auto_size_text/auto_size_text.dart';
import 'package:cipher_affair/components/common_text_field.dart';
import 'package:cipher_affair/consts/colors.dart';
import 'package:cipher_affair/consts/spacing_consts.dart';
import 'package:cipher_affair/screens/mandatory_fields/mandatory_field_state.dart';
import 'package:cipher_affair/screens/mandatory_fields/mandatory_fields_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MandatoryFieldsPage extends StatelessWidget {
  const MandatoryFieldsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MandatoryFieldsCubit()..checkUserData(),
      child: BlocBuilder<MandatoryFieldsCubit, MandatoryFields>(
        builder: (context, state) {
          if (state is MandatoryFieldsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is MandatoryFieldsNotFilledState) {
            return Scaffold(
              backgroundColor: primary_3,
              body: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SpacingConsts().largeHeightBetweenFields(context),
                      const AutoSizeText(
                        'Cypher Affair',
                        style: TextStyle(
                            fontFamily: 'Legio',
                            fontSize: 40.0,
                            color: Colors.amber),
                      ),
                      SpacingConsts().mediumHeightBetweenFields(context),
                      const AutoSizeText(
                        'Let us get your name!!',
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
                          prefixIcon: Icons.person,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
          return Container(
            child: AutoSizeText(state.toString()),
          );
        },
      ),
    );
  }
}
