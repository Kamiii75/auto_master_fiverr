import 'dart:convert';

import 'package:equatable/equatable.dart';

List<ModelVehicle> vehicleModelFromJson(String str) => List<ModelVehicle>.from(json.decode(str).map((x) => ModelVehicle.fromMap(x)));

class ModelVehicle extends Equatable {
final String id;
final String vehicleNumber;
final String maker;
final String manufactureYear;
final String model;
final String engineNumber;
final String vin;

const ModelVehicle(
    {required this.id,
      required this.vehicleNumber,
      required this.maker,
      required this.manufactureYear,
      required this.model,
      required this.engineNumber,
      required this.vin,
    });

ModelVehicle copyWith(
    {String? id,
      String? vehicleNumber,
      String? maker,
      String? manufactureYear,
      String? model,
      String? engineNumber,
      String? vin,

    }) {
  return ModelVehicle(
      id: id ?? this.id,
      vehicleNumber: vehicleNumber ?? this.vehicleNumber,
      maker: maker ?? this.maker,
      manufactureYear: manufactureYear ?? this.manufactureYear,
    model: model ?? this.model,
    engineNumber: engineNumber ?? this.engineNumber,
    vin: vin ?? this.vin,

  );
}

Map<String, dynamic> toMap() {
  return {
    "id": id,
    "vehicleNumber": vehicleNumber,
    "maker": maker,
    "manufactureYear": manufactureYear,
    "model": model,
    "engineNumber": engineNumber,
    "vin": vin,

  };
}

factory ModelVehicle.fromMap(Map<String, dynamic> map) {
return ModelVehicle(
id: map["id"] ?? '',
  vehicleNumber: map["vehicleNumber"] ?? '',
  maker: map["maker"] ?? '',
  manufactureYear: map["manufactureYear"] ?? '',
  model: map["model"] ?? '',
  engineNumber: map["engineNumber"] ?? '',
  vin: map["vin"] ?? '',

);
}

@override
// TODO: implement props
List<Object?> get props => [
  id,
  vehicleNumber,
  maker,
  manufactureYear,
  model,
  engineNumber,
  vin,

];
}