import 'package:equatable/equatable.dart';

class ModelVehicle extends Equatable {
final String id;
final String vehicleNumber;
final String maker;
final String manufactureYear;
final String model;
final String engineNumber;
final String vinValue;

const ModelVehicle(
    {required this.id,
      required this.vehicleNumber,
      required this.maker,
      required this.manufactureYear,
      required this.model,
      required this.engineNumber,
      required this.vinValue,
    });

ModelVehicle copyWith(
    {String? id,
      String? vehicleNumber,
      String? maker,
      String? manufactureYear,
      String? model,
      String? engineNumber,
      String? vinValue,

    }) {
  return ModelVehicle(
      id: id ?? this.id,
      vehicleNumber: vehicleNumber ?? this.vehicleNumber,
      maker: maker ?? this.maker,
      manufactureYear: manufactureYear ?? this.manufactureYear,
    model: model ?? this.model,
    engineNumber: engineNumber ?? this.engineNumber,
    vinValue: vinValue ?? this.vinValue,

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
    "vinValue": vinValue,

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
  vinValue: map["vinValue"] ?? '',

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
  vinValue,

];
}