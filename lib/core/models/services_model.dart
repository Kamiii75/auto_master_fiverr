import 'dart:convert';

import 'package:equatable/equatable.dart';

List<ModelService> serviceModelFromJson(String str) => List<ModelService>.from(json.decode(str).map((x) => ModelService.fromMap(x)));

class ModelService extends Equatable {
final String id;
final String dateVisit;
final String mileage;
final String workDescription;
final String observations;

const ModelService(
    {required this.id,
      required this.dateVisit,
      required this.mileage,
      required this.workDescription,
      required this.observations,
    });

ModelService copyWith(
    {String? id,
       String? dateVisit,
       String? mileage,
       String? workDescription,
       String? observations,

    }) {
  return ModelService(
      id: id ?? this.id,
    dateVisit: dateVisit ?? this.dateVisit,
      mileage: mileage ?? this.mileage,
      workDescription: workDescription ?? this.workDescription,
    observations: observations ?? this.observations,
  );
}

Map<String, dynamic> toMap() {
  return {
    "id": id,
    "dateVisit": dateVisit,
    "mileage": mileage,
    "workDescription": workDescription,
    "observations": observations,

  };
}

factory ModelService.fromMap(Map<String, dynamic> map) {
return ModelService(
id: map["id"] ?? '',
  dateVisit: map["dateVisit"] ?? '',
  mileage: map["mileage"] ?? '',
  workDescription: map["workDescription"] ?? '',
  observations: map["observations"] ?? '',

);
}

@override
// TODO: implement props
List<Object?> get props => [
  id,
  dateVisit,
  mileage,
  workDescription,
  observations


];
}