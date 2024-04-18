import 'package:json_annotation/json_annotation.dart';

part 'player.g.dart';

@JsonSerializable()
class Player {
  String? id;
  String? name;
  String? phoneNumber;
  String? email;
  List<String>? levels = [];

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerToJson(this);

  Player({this.id, this.phoneNumber, this.email, this.levels, this.name});
}
