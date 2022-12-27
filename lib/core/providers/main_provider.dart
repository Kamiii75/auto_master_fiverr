import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../../ui/widgets/add_car_dialogbox.dart';
import '../models/vehicle_model.dart';
import '../services/database_services.dart';
class MainProvider extends ChangeNotifier{

  final GlobalKey<ScaffoldState> homeScaffoldKey = GlobalKey<ScaffoldState>();
final TextEditingController _adminUserNameController=TextEditingController();
final TextEditingController _adminPasswordController=TextEditingController();
 TextEditingController get adminUserNameController=>_adminUserNameController;
  TextEditingController get adminPasswordController=>_adminPasswordController;


  bool _isScan=false;
  bool get isScan=>_isScan;
  setScan(bool val){
    _isScan=val;

    notifyListeners();
  }




  ///////////// Add Car ///////////////////////////
  final addCarFormKey = GlobalKey<FormState>();

  final _MakerController = TextEditingController();
  final _VehicleNumberController = TextEditingController();
  final _ManufactureYearController = TextEditingController();
  final _modelController = TextEditingController();
  final _EngineController = TextEditingController();
  final _vinValueController = TextEditingController();

  TextEditingController get makerController => _MakerController;

  TextEditingController get vehicleNumberController => _VehicleNumberController;

  TextEditingController get manufactureYearController =>
      _ManufactureYearController;

  TextEditingController get modelController => _modelController;

  TextEditingController get engineController => _EngineController;

  TextEditingController get vinValueController => _vinValueController;

  var Imagetext = "";

  bool _vehicleNumberValidate = false;
  bool _makerValidate = false;
  bool _manufactureYearValidate = false;
  bool _modelValidate = false;
  bool _engineNumberValidate = false;
  bool _vinValidate = false;

  bool get vehicleNumberValidate => _vehicleNumberValidate;

  bool get makerValidate => _makerValidate;

  bool get manufactureYearValidate => _manufactureYearValidate;

  bool get modelValidate => _modelValidate;

  bool get engineNumberValidate => _engineNumberValidate;

  bool get vinValidate => _vinValidate;

  void setVehicleNumberValidate(bool val) {
    _vehicleNumberValidate = val;
    notifyListeners();
  }

  void setMakerValidate(bool val) {
    _makerValidate = val;
    notifyListeners();
  }

  void setManufactureYearValidate(bool val) {
    _manufactureYearValidate = val;
    notifyListeners();
  }

  void setmodelValidate(bool val) {
    _modelValidate = val;
    notifyListeners();
  }

  void setEngineNumberValidate(bool val) {
    _engineNumberValidate = val;
    notifyListeners();
  }

  void setvinValidate(bool val) {
    _vinValidate = val;
    notifyListeners();
  }

  void validateAddCar(BuildContext context) {
    _VehicleNumberController.text.isEmpty
        ? _vehicleNumberValidate = true
        : false;
    _MakerController.text.isEmpty ? _makerValidate = true : false;
    _ManufactureYearController.text.isEmpty
        ? _manufactureYearValidate = true
        : false;
    _modelController.text.isEmpty ? _modelValidate = true : false;
    _EngineController.text.isEmpty ? _engineNumberValidate = true : false;
    _vinValueController.text.isEmpty ? _vinValidate = true : false;

    if (_VehicleNumberController.text.isNotEmpty &&
        _MakerController.text.isNotEmpty &&
        _ManufactureYearController.text.isNotEmpty &&
        _EngineController.text.isNotEmpty &&
        _vinValueController.text.isNotEmpty) {
      showDialog(
          context: context,
          builder: (context) {
            var uid = const Uuid().v4();

            ModelVehicle mdl = ModelVehicle(
                id: uid,
                vehicleNumber: _VehicleNumberController.text,
                maker: _MakerController.text,
                manufactureYear: _ManufactureYearController.text,
                model: _modelController.text,
                engineNumber: _EngineController.text,
                vinValue: _vinValueController.text);
            return AddCarDialogBox(
              mdl: mdl,
            );
          });
    }
    notifyListeners();
  }

  addVehicle(ModelVehicle mdl) {
    DatabaseService _db=DatabaseService();
    _db.registerVehicle(mdl);
  }
///////////// Add Car ///////////////////////////

}