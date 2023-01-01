import 'dart:convert';

import 'package:auto_master_fiverr/core/models/admin_model.dart';
import 'package:auto_master_fiverr/core/models/services_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../models/vehicle_model.dart';

class DatabaseService {
  final _db = FirebaseFirestore.instance;
  static final DatabaseService _singleton = DatabaseService._internal();

  factory DatabaseService() {
    return _singleton;
  }

  DatabaseService._internal();

  Future<bool> adminLogin(String username, String userpass) async {
    bool isAdmin=false;
    try {
      final snapshot = await _db
          .collection('admin')
          .where('username', isEqualTo: username)
          .where('password', isEqualTo: userpass).get();
      if(snapshot.size>0){
        isAdmin=true;
      }


    } catch (e, s) {
      print('Exception @DatabaseService/getUser $e');
    }
    return isAdmin;
  }

  Future<void> adminChanged(String username, String userpass) async {
    try {
      await _db
          .collection('admin').doc('6XY4UhOHuxD0xuEUixid').set({
        'username':username,
        'password':userpass

      });

    } catch (e, s) {
      print('Exception @DatabaseService/getUser $e');
    }
  }

  Future<ModelAdmin?> getAdmin() async {
    try {
      final snapshot = await _db.collection('admin').doc('6XY4UhOHuxD0xuEUixid').get();

      ModelAdmin mdl = ModelAdmin.fromMap(snapshot.data()!);

      return mdl;
      //return ModelVehicle.fromMap(snapshot.data()!, snapshot.id);
    } catch (e, s) {
      print('Exception @DatabaseService/getUser $e');
    }
    return null;
  }
  registerVehicle(ModelVehicle car) async {
    print("${car.id}  ID is-------");
    try {
      await _db.collection('vehicles').doc(car.id).set({
        "id": car.id,
        "vehicleNumber": car.vehicleNumber,
        "maker": car.maker,
        "manufactureYear": car.manufactureYear,
        "model": car.model,
        "engineNumber": car.engineNumber,
        "vin": car.vin,
      });
    } catch (e, s) {
      print('Exception @DatabaseService/registerPatient $e');
//      print(s);
    }
  }

  Future<List<ModelVehicle>> getVehicle() async {
    List<ModelVehicle> lst = [];
    try {
      final snapshot = await _db.collection('vehicles').get();

      List<DocumentSnapshot> docs = await snapshot.docs;
      if (docs.isNotEmpty && docs.length > 0) {
        final data = docs.map((e) => jsonEncode(e.data())).toList();
        debugPrint("Get all community posts => ${data}");

        lst = vehicleModelFromJson(data.toString());
      }
      //return ModelVehicle.fromMap(snapshot.data()!, snapshot.id);
    } catch (e, s) {
      print('Exception @DatabaseService/getUser $e');
    }
    return lst;
  }

  Future<ModelVehicle?> getSingleVehicle(String id) async {
    try {
      final snapshot = await _db.collection('vehicles').doc(id).get();

      ModelVehicle mdl = ModelVehicle.fromMap(snapshot.data()!);

      return mdl;
      //return ModelVehicle.fromMap(snapshot.data()!, snapshot.id);
    } catch (e, s) {
      print('Exception @DatabaseService/getUser $e');
    }
    return null;
  }

  ///////?/////////////////////////////////////

  saveService(ModelService service, String id) async {
    print("${service.id}  ID is-------");
    try {
      await _db
          .collection('vehicles')
          .doc(id)
          .collection('services')
          .doc(service.id)
          .set({
        "id": service.id,
        "dateVisit": service.dateVisit,
        "mileage": service.mileage,
        "workDescription": service.workDescription,
        "observations": service.observations,
      });
    } catch (e, s) {
      print('Exception @DatabaseService/registerPatient $e');
//      print(s);
    }
  }

  Future<List<ModelService>> getServices(String id) async {
    List<ModelService> lst = [];
    try {
      final snapshot =
          await _db.collection('vehicles').doc(id).collection('services').get();

      List<DocumentSnapshot> docs = await snapshot.docs;
      if (docs.isNotEmpty && docs.length > 0) {
        final data = docs.map((e) => jsonEncode(e.data())).toList();
        debugPrint("Get all community posts => ${data}");

        lst = serviceModelFromJson(data.toString());
      }
      //return ModelVehicle.fromMap(snapshot.data()!, snapshot.id);
    } catch (e, s) {
      print('Exception @DatabaseService/getUser $e');
    }
    return lst;
  }
///////?/////////////////////////////////////
//
//   subscribeUser(SubsUser user) async {
//     String id = FirebaseAuth.instance.currentUser!.uid.toString();
//     print(id + "ID is-------");
//     try {
//       await _db.collection('subs_users').doc(id).set(user.toJson());
//     } catch (e, s) {
//       print('Exception @DatabaseService/registerPatient $e');
// //      print(s);
//     }
//   }
//
//   ///
//   /// Get User
//   ///
//   Future<AppUser?> getUser(id) async {
//     print('@getUser: id: $id');
//     try {
//       final snapshot = await _db.collection('reg_users').doc(id).get();
//       print('User Data: ${snapshot.data()}');
//       return AppUser.fromJson(snapshot.data()!, snapshot.id);
//     } catch (e, s) {
//       print('Exception @DatabaseService/getUser $e');
//       return null;
//     }
//   }
//
//   ///
//   /// Get User for forget password
//   ///
//   Future<AppUser?> getUserbyEmail(email) async {
//     print('@getUser: email: $email');
//     try {
//       print('@getUser: email in try: $email');
//       final snapshot = await _db
//           .collection('reg_users')
//           .where('email', isEqualTo: email)
//           .where('auth_type', isEqualTo: 'email_pass').snapshots().first;
//       print('User Data: ${snapshot.docs.first.id}');
//       print('User Data: ${snapshot.docs.first.data()}');
//       AppUser usr=AppUser.fromJson(snapshot.docs.first.data(), snapshot.docs.first.id);
//
//       print('AppUser Data: ${usr.id}');
//       print('AppUser Data: ${usr.email}');
//       return usr;
//     } catch (e, s) {
//       print('Exception @DatabaseService/getUser $e');
//       return null;
//     }
//   }
}
