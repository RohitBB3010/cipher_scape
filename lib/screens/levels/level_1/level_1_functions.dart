import 'package:cipher_affair/consts/fb_player.dart';
import 'package:cipher_affair/screens/auth/auth_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Level1Functions {
  Future<void> updateLevelsFirebase() async {
    var doc = await FirebaseFirestore.instance
        .collection(FirebasePlayer.fieldPlayers)
        .doc(AuthCubit().uid)
        .update({
      FirebasePlayer.fieldLevels: FieldValue.arrayUnion(['1'])
    });
  }
}
