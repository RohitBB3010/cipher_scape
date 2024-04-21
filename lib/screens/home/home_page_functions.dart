import 'package:cipher_affair/consts/fb_player.dart';
import 'package:cipher_affair/screens/auth/auth_cubit.dart';
import 'package:cipher_affair/screens/mandatory_fields/models/player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePageFunction {
  Future<Player> returnPlayer() async {
    var doc = await FirebaseFirestore.instance
        .collection(FirebasePlayer.fieldPlayers)
        .doc('ETXOFNj7LbciV4LGnE3g')
        .get();

    Player currentPlayer = Player.fromJson(doc.data()!);

    return currentPlayer;
  }
}
