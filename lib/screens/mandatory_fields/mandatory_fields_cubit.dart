import 'package:cipher_affair/consts/fb_player.dart';
import 'package:cipher_affair/screens/auth/auth_cubit.dart';
import 'package:cipher_affair/screens/mandatory_fields/mandatory_field_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MandatoryFieldsCubit extends Cubit<MandatoryFields> {
  MandatoryFieldsCubit() : super(MandatoryFieldsLoadingState());

  Future<void> checkUserData() async {
    debugPrint('Function called');

    var doc = await FirebaseFirestore.instance
        .collection(FirebasePlayer.fieldPlayers)
        .where(FirebasePlayer.id, isEqualTo: AuthCubit().uid)
        .limit(1)
        .get();

    if (doc.docs.isEmpty) {
      emit(MandatoryFieldsNotFilledState());
    }
    if (doc.docs.isNotEmpty) {
      emit(MandatoryFieldsPresentState());
    }
  }
}
