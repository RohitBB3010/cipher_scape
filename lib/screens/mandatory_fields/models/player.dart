import 'package:json_annotation/json_annotation.dart';

part 'player.g.dart';

@JsonSerializable()
class Player {
  String? id;
  String? phoneNumber;
  String? email;
  List<String>? levels = [];

  Player({this.id, this.phoneNumber, this.email, this.levels});
}
