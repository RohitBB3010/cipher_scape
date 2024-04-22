import 'package:cipher_affair/consts/fb_player.dart';
import 'package:cipher_affair/screens/auth/auth_cubit.dart';
import 'package:cipher_affair/screens/mandatory_fields/models/player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePageFunction {
  Future<Player> returnPlayer() async {
    var doc = await FirebaseFirestore.instance
        .collection(FirebasePlayer.fieldPlayers)
        .where(FirebasePlayer.id, isEqualTo: AuthCubit().uid)
        .limit(1)
        .get();

    Player currentPlayer = Player.fromJson(doc.docs.first.data());

    return currentPlayer;
  }
}
