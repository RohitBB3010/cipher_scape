// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Player _$PlayerFromJson(Map<String, dynamic> json) => Player(
      id: json['id'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
      levels:
          (json['levels'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PlayerToJson(Player instance) => <String, dynamic>{
      'id': instance.id,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'levels': instance.levels,
    };
