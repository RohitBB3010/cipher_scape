import 'package:cipher_affair/consts/fb_player.dart';
import 'package:cipher_affair/screens/auth/auth_cubit.dart';
import 'package:cipher_affair/screens/mandatory_fields/mandatory_field_state.dart';
import 'package:cipher_affair/screens/mandatory_fields/models/player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MandatoryFieldsCubit extends Cubit<MandatoryFields> {
  MandatoryFieldsCubit() : super(MandatoryFieldsLoadingState());

  Future<void> checkUserData() async {
    debugPrint('Function called');

    String? phoneNumber = FirebaseAuth.instance.currentUser != null
        ? FirebaseAuth.instance.currentUser!.phoneNumber
        : '';

    var doc = await FirebaseFirestore.instance
        .collection(FirebasePlayer.fieldPlayers)
        .where(FirebasePlayer.fieldPhone, isEqualTo: phoneNumber)
        .limit(1)
        .get();

    if (doc.docs.isEmpty) {
      emit(MandatoryFieldsNotFilledState());
    }
    if (doc.docs.isNotEmpty) {
      emit(MandatoryFieldsPresentState());
    }
  }

  Future<void> setMandatoryFields(String name, String email) async {
    Player playerToAdd = Player(
        name: name,
        phoneNumber: FirebaseAuth.instance.currentUser!.phoneNumber,
        email: email,
        levels: []);

    var doc = await FirebaseFirestore.instance
        .collection(FirebasePlayer.fieldPlayers)
        .add(playerToAdd.toJson());

    FirebaseFirestore.instance
        .collection(FirebasePlayer.fieldPlayers)
        .doc(doc.id)
        .update({FirebasePlayer.id: doc.id});

    emit(MandatoryFieldsPresentState());
  }
}
