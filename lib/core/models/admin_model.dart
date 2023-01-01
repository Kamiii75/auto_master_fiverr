import 'dart:convert';

import 'package:equatable/equatable.dart';

List<ModelAdmin> adminModelFromJson(String str) => List<ModelAdmin>.from(json.decode(str).map((x) => ModelAdmin.fromMap(x)));

class ModelAdmin extends Equatable {
final String id;
final String username;
final String password;

const ModelAdmin(
    {required this.id,
      required this.username,
      required this.password,
    });

ModelAdmin copyWith(
    {String? id,
       String? username,
       String? password,

    }) {
  return ModelAdmin(
      id: id ?? this.id,
    username: username ?? this.username,
      password: password ?? this.password,
  );
}

Map<String, dynamic> toMap() {
  return {
    "id": id,
    "username": username,
    "password": password,

  };
}

factory ModelAdmin.fromMap(Map<String, dynamic> map) {
return ModelAdmin(
id: map["id"] ?? '',
  username: map["username"] ?? '',
  password: map["password"] ?? '',

);
}

@override
// TODO: implement props
List<Object?> get props => [
  id,
  username,
  password,


];
}