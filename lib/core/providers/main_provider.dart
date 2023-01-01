import 'package:auto_master_fiverr/core/models/services_model.dart';
import 'package:auto_master_fiverr/ui/widgets/add_services_dialogbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:uuid/uuid.dart';
import '../../ui/widgets/add_car_dialogbox.dart';
import '../../ui/widgets/custom_dialogbox.dart';
import '../blocs/bloc_export.dart';
import '../models/admin_model.dart';
import '../models/vehicle_model.dart';
import '../services/database_services.dart';

class MainProvider extends ChangeNotifier {
  MainProvider() {
    getVehicles();
    getAdmin();
  }

  final GlobalKey<ScaffoldState> homeScaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _adminUserNameController =
      TextEditingController();
  final TextEditingController _adminPasswordController =
      TextEditingController();

  TextEditingController get adminUserNameController => _adminUserNameController;

  TextEditingController get adminPasswordController => _adminPasswordController;

  /////Admin/////////////////////////////////


  final TextEditingController _adminUserNameChangeController =
  TextEditingController();
  final TextEditingController _adminPasswordChangeController =
  TextEditingController();
  final TextEditingController _adminOldPasswordChangeController =
  TextEditingController();
  final TextEditingController _adminPasswordChangeConfirmController =
  TextEditingController();

  TextEditingController get adminUserNameChangeController => _adminUserNameChangeController;

  TextEditingController get adminOldPasswordChangeController => _adminOldPasswordChangeController;
  TextEditingController get adminPasswordChangeController => _adminPasswordChangeController;
  TextEditingController get adminPasswordChangeConfirmController => _adminPasswordChangeConfirmController;
  login(BuildContext context) async {
    bool isAdmin = await _db.adminLogin(
        adminUserNameController.text, adminPasswordController.text);
    print(isAdmin);
    showDialog(
        context: context,
        builder: (context) {
          BlocProvider.of<SystemBloc>(context)
              .add( ChangeAdmin(admin: isAdmin));
          return CustomDialogBox(
            title: isAdmin?'Login Success':'Login Failed',
            message: isAdmin?'Admin Successfully Logged In':'Something went wrong',
            pressed: isAdmin?() {
              _adminUserNameController.clear();
              _adminPasswordController.clear();
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            }:() {
              Navigator.of(context).pop();
            },
          );
        });
  }
  changeAdmin(BuildContext context) async {
    if(_adminUserNameChangeController.text.isNotEmpty) {
      String name = _adminUserNameChangeController.text;
      if (_adminOldPasswordChangeController.text.isNotEmpty && _adminOldPasswordChangeController.text==_admin!.password) {
      if (_adminPasswordChangeController.text.isNotEmpty) {
        if (_adminPasswordChangeConfirmController.text.isNotEmpty) {
          if (_adminPasswordChangeController.text ==
              _adminPasswordChangeConfirmController.text) {
            String pass = _adminPasswordChangeController.text;
            EasyLoading.show();
            await _db.adminChanged(name, pass);
            EasyLoading.dismiss();
            _adminPasswordChangeController.clear();
            _adminOldPasswordChangeController.clear();
            _adminPasswordChangeConfirmController.clear();
            getAdmin();
            Navigator.of(context).pop();
          }
          else {
            showDialog(
                context: context,
                builder: (context) {
                  return CustomDialogBox(
                    title: 'Warning',
                    message: 'Please enter same password',
                    pressed: () {
                      Navigator.of(context).pop();
                    },
                  );
                });
          }
        }
        else {
          showDialog(
              context: context,
              builder: (context) {
                return CustomDialogBox(
                  title: 'Warning',
                  message: 'Confirm Password must not be Empty',
                  pressed: () {
                    Navigator.of(context).pop();
                  },
                );
              });
        }
      }
      else {
        showDialog(
            context: context,
            builder: (context) {
              return CustomDialogBox(

                title: 'Warning',
                message: 'Password must not be Empty',
                pressed: () {
                  Navigator.of(context).pop();
                },
              );
            });
      }
    }else{
        showDialog(
            context: context,
            builder: (context) {

              return CustomDialogBox(

                title: 'Warning',
                message: 'Old password is invalid',
                pressed: () {
                  Navigator.of(context).pop();
                },
              );
            });
      }
    }
    else{
      showDialog(
          context: context,
          builder: (context) {

            return CustomDialogBox(

              title: 'Warning',
              message: 'Username must not be Empty',
              pressed: () {
                Navigator.of(context).pop();
              },
            );
          });
    }



  }

  ModelAdmin? _admin;

  ModelAdmin? get admin => _admin;

  getAdmin() async {
     _admin = (await _db.getAdmin());
     _adminUserNameChangeController.text=_admin!.username;
    notifyListeners();
  }

  /////Admin/////////////////////////////////

  bool _isScan = false;

  bool get isScan => _isScan;

  setScan(bool val) {
    _isScan = val;

    notifyListeners();
  }

  final DatabaseService _db = DatabaseService();

  ///////////// Add Car ///////////////////////////
  final addCarFormKey = GlobalKey<FormState>();

  final _makerController = TextEditingController();
  final _vehicleNumberController = TextEditingController();
  final _manufactureYearController = TextEditingController();
  final _modelController = TextEditingController();
  final _engineController = TextEditingController();
  final _vinValueController = TextEditingController();

  TextEditingController get makerController => _makerController;

  TextEditingController get vehicleNumberController => _vehicleNumberController;

  TextEditingController get manufactureYearController =>
      _manufactureYearController;

  TextEditingController get modelController => _modelController;

  TextEditingController get engineController => _engineController;

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
    print('validateAddCar');
    _vehicleNumberController.text.isEmpty
        ? _vehicleNumberValidate = true
        : false;
    _makerController.text.isEmpty ? _makerValidate = true : false;
    _manufactureYearController.text.isEmpty
        ? _manufactureYearValidate = true
        : false;
    _modelController.text.isEmpty ? _modelValidate = true : false;
    _engineController.text.isEmpty ? _engineNumberValidate = true : false;
    _vinValueController.text.isEmpty ? _vinValidate = true : false;

    print('validateAddCar before if');
    print(_vehicleNumberController.text.isNotEmpty);
    print(_makerController.text.isNotEmpty);
    print(_manufactureYearController.text.isNotEmpty);
    print(_engineController.text.isNotEmpty);
    print(_modelController.text.isNotEmpty);
    print(_vinValueController.text.isNotEmpty);

    if (_vehicleNumberController.text.isNotEmpty &&
        _makerController.text.isNotEmpty &&
        _manufactureYearController.text.isNotEmpty &&
        _engineController.text.isNotEmpty &&
        _modelController.text.isNotEmpty &&
        _vinValueController.text.isNotEmpty) {
      print('validateAddCar after if');
      showDialog(
          context: context,
          builder: (context) {
            var uid = const Uuid().v4();

            ModelVehicle mdl = ModelVehicle(
                id: uid,
                vehicleNumber: _vehicleNumberController.text,
                maker: _makerController.text,
                manufactureYear: _manufactureYearController.text,
                model: _modelController.text,
                engineNumber: _engineController.text,
                vin: _vinValueController.text);
            return AddCarDialogBox(
              mdl: mdl,
            );
          });
    }
    notifyListeners();
  }

  addVehicle(ModelVehicle mdl) {
    _db.registerVehicle(mdl);
    _vehicleNumberController.clear();
    _makerController.clear();
    _manufactureYearController.clear();
    _modelController.clear();
    _engineController.clear();
    _vinValueController.clear();
    getVehicles();
    notifyListeners();
  }

///////////// Add Car ///////////////////////////
  ///////////// Add Services ///////////////////////////
  final addCarServivesFormKey = GlobalKey<FormState>();

  final _dateVisitController = TextEditingController();
  final _mileageController = TextEditingController();
  final _workDescriptionController = TextEditingController();
  final _observationsController = TextEditingController();

  TextEditingController get dateVisitController => _dateVisitController;

  TextEditingController get mileageController => _mileageController;

  TextEditingController get workDescriptionController =>
      _workDescriptionController;

  TextEditingController get observationsController => _observationsController;

  bool _mileageValidate = false;
  bool _dateVisitValidate = false;
  bool _workDescriptionValidate = false;
  bool _observationsValidate = false;

  bool get mileageValidate => _mileageValidate;

  bool get dateVisitValidate => _dateVisitValidate;

  bool get workDescriptionValidate => _workDescriptionValidate;

  bool get observationsValidate => _observationsValidate;

  void setMileageValidate(bool val) {
    _mileageValidate = val;
    notifyListeners();
  }

  void setDateVisitValidate(bool val) {
    _dateVisitValidate = val;
    notifyListeners();
  }

  void setWorkDescriptionValidate(bool val) {
    _workDescriptionValidate = val;
    notifyListeners();
  }

  void setObservationsValidate(bool val) {
    _observationsValidate = val;
    notifyListeners();
  }

  void validateCarServices(BuildContext context) {
    print('validateAddCar');
    _mileageController.text.isEmpty ? _mileageValidate = true : false;
    _dateVisitController.text.isEmpty ? _dateVisitValidate = true : false;
    _workDescriptionController.text.isEmpty
        ? _workDescriptionValidate = true
        : false;
    _observationsController.text.isEmpty ? _observationsValidate = true : false;

    print('validateAddCar before if');
    print(_mileageController.text.isNotEmpty);
    print(_dateVisitController.text.isNotEmpty);
    print(_workDescriptionController.text.isNotEmpty);
    print(_observationsController.text.isNotEmpty);

    if (_mileageController.text.isNotEmpty &&
        _dateVisitController.text.isNotEmpty &&
        _workDescriptionController.text.isNotEmpty &&
        _observationsController.text.isNotEmpty) {
      print('validateAddCar after if');
      showDialog(
          context: context,
          builder: (context) {
            var uid = const Uuid().v4();

            ModelService mdl = ModelService(
              id: uid,
              mileage: _mileageController.text,
              dateVisit: _dateVisitController.text,
              workDescription: _workDescriptionController.text,
              observations: _observationsController.text,
            );
            return AddServiceDialogBox(
              mdl: mdl,
            );
          });
    }
    notifyListeners();
  }

  addVehicleService(BuildContext context, ModelService mdl) async {
    String id = BlocProvider.of<SystemBloc>(context).state.docId;
    await _db.saveService(mdl, id);
    _dateVisitController.clear();
    _mileageController.clear();
    _workDescriptionController.clear();
    _observationsController.clear();

    getServices(context, id);
  }

///////////// Add Car ///////////////////////////
///////////// List Cars ///////////////////////////
  List<ModelVehicle> _listVehicles = [];

  List<ModelVehicle> get listVehicles => _listVehicles;

  getVehicles() async {
    _listVehicles = await _db.getVehicle();
    notifyListeners();
  }

///////////// List Cars ///////////////////////////
  late ModelVehicle _singleVehicle;

  ModelVehicle get singleVehicle => _singleVehicle;

  Future<bool> getSingleVehicle(BuildContext context, String id) async {
    //  String id=BlocProvider.of<SystemBloc>(context).state.docId;

    bool res=false;
   try{
     ModelVehicle? mdl = await _db.getSingleVehicle(id);
     print(mdl!.id);
     if (mdl.id != null) {
       _singleVehicle = mdl;
     }
     getServices(context, id);
     res=true;

   }catch(e){

   }
    notifyListeners();
   return res;
  }

///////////// List Services ///////////////////////////
  List<ModelService> _listService = [];

  List<ModelService> get listService => _listService;

  getServices(BuildContext context, String id) async {
    _listService = await _db.getServices(id);

    notifyListeners();
  }
///////////// List Services ///////////////////////////
}
