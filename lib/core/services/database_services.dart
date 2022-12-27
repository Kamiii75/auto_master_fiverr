import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/vehicle_model.dart';
class DatabaseService {
  final _db = FirebaseFirestore.instance;
  static final DatabaseService _singleton = DatabaseService._internal();


  factory DatabaseService() {
    return _singleton;
  }

  DatabaseService._internal();

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
        "vin": car.vinValue,
      });
    } catch (e, s) {
      print('Exception @DatabaseService/registerPatient $e');
//      print(s);
    }
  }
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