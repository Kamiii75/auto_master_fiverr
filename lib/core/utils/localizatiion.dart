import 'package:get/get.dart';

class LocalizationClass extends Translations {
  @override
  Map<String, Map<String, String>> get keys {
    const Map<String, String> lang_en = {
      "appTitle": "Auto Master",
      "scanningFailed": "Scanning Failed",
      "scanningFailedTxt": "QrCode have error please scan valid QrCode",
      "admin": "Admin",
      "scan": "Scan",
      "userName": "User Name",
      "enterUserName": "Enter your Username",
      "userPass": "Password",
      "enterUserPass": "Enter your Password",
      "login": "Login",
      "loginSuccess": "Login Success",
      "loginSuccessTxt": "Admin Successfully Logged In",
      "loginFailed": "Login Failed",
      "loginFailedTxt": "Username or Password is Incorrect",
      "ok": "OK",
      "changePassword": "Change Password",
      "adminChangePassword": "Admin Change Password",
      "allVehicles": "All Vehicles",
      "logout": "Logout",


      "oldPassword": "Old Password",
      "newPassword": "New Password",
      "confirmPassword": "Confirm Password",
      "oldPasswordTxt": "Enter your Old Password",
      "newPasswordTxt": "Enter your New Password",
      "confirmPasswordTxt": "Confirm Your Password",
      "oldPasswordInvalidTxt": "Old Password is Invalid",
      "confirmPasswordInvalidTxt": "Please enter same password",

      "submit": "Submit",
      "warning": "Warning",

      "showAllVehicles":"Show All Vehicles",
      "addVehicle":"Add Vehicle",
      "vehicleServices":"Vehicle Services",
      "addService":"Add Service",
      "save":"Save",
      "cancel":"Cancel",

      "vehicleNumber":"Vehicle Number",
      "maker":"Maker",
      "manufactureYear":"Manufacture Year",
      "model":"Model",
      "engineNumber":"Engine Number",
      "vin":"VIN",

      "dateVisit":"Date Visit",
      "mileage":"Mileage",
      "workDescription":"Work Description",
      "observations":"Observations",

      "qrCode":"Qr Code",
      "share":"Share",

      "confirmNotEmpty":"Confirm Password must not be Empty",
      "passNotEmpty":"Password must not be Empty",
      "usernameNotEmpty":"Username must not be Empty",

    };

    const Map<String, String> lang_gr = {
      "appTitle": "Auto Master",
      "scanningFailed": "Η σάρωση απέτυχε",
      "scanningFailedTxt": "Το QrCode έχει σφάλμα, σαρώστε έγκυρο QrCode",
      "admin": "διαχειριστής",
      "scan": "σάρωση",
      // "scan": "Σάρωση",
      "userName": "oνομα χρήστη",
      "enterUserName": "Εισαγάγετε το όνομα χρήστη σας",
      "userPass": "Κωδικός πρόσβασης",
      "enterUserPass": "Εισάγετε τον κωδικό σας",
      "login": "σύνδεση",
      // "login": "Σύνδεση",
      "loginSuccess": "Επιτυχία σύνδεσης",
      "loginSuccessTxt": "Ο διαχειριστής συνδέθηκε με επιτυχία",
      "loginFailed": "Η σύνδεση απέτυχε",
      "loginFailedTxt": "Το όνομα χρήστη ή ο κωδικός πρόσβασης είναι εσφαλμένα",
      "ok": "Εντάξει",
      "changePassword": "Αλλαξε κωδικό",
      "adminChangePassword": "Αλλαγή κωδικού πρόσβασης διαχειριστή",
      "allVehicles": "Oλα τα Οχήματα",
      "logout": "Αποσύνδεση",


      "oldPassword": "ΠΑΛΙΟΣ ΚΩΔΙΚΟΣ",
      "newPassword": "νέος κωδικός πρόσβασης",
      "confirmPassword": "Επιβεβαίωση Κωδικού",
      "oldPasswordTxt": "Εισαγάγετε τον παλιό σας κωδικό πρόσβασης",
      "newPasswordTxt": "Εισαγάγετε τον νέο σας κωδικό πρόσβασης",
      "confirmPasswordTxt": "Επιβεβαιώστε τον κωδικό πρόσβασής σας",
      "oldPasswordInvalidTxt": "Ο παλιός κωδικός πρόσβασης δεν είναι έγκυρος",
      "confirmPasswordInvalidTxt": "Εισαγάγετε τον ίδιο κωδικό πρόσβασης",

      "submit": "υποβάλλουν",
      "warning": "Προειδοποίηση",

      "showAllVehicles":"Εμφάνιση όλων των οχημάτων",
      "addVehicle":"Προσθήκη οχήματος",
      "vehicleServices":"Υπηρεσίες οχημάτων",
      "addService":"Προσθήκη υπηρεσίας",
      "save":"σώσει",
      "cancel":"Aκυρο",
      // "save":"Σώσει",

      "vehicleNumber":"Αριθμός οχήματος",
      "maker":"Κατασκευαστής",
      "manufactureYear":"Eτος Κατασκευής",
      "model":"Μοντέλο",
      "engineNumber":"Αριθμός μηχανής",
      "vin":"VIN",

      "dateVisit":"Ημερομηνία Επίσκεψη",
      "mileage":"Απoσταση σε μίλια",
      "workDescription":"Περιγραφή Εργασίας",
      "observations":"Παρατηρήσεις",



      "qrCode":"Κωδικός Qr",
      "share":"Μετοχή",

      "confirmNotEmpty":"Η επιβεβαίωση κωδικού πρόσβασης δεν πρέπει να είναι κενή",
      "passNotEmpty":"Ο κωδικός πρόσβασης δεν πρέπει να είναι κενός",
      "usernameNotEmpty":"Το όνομα χρήστη δεν πρέπει να είναι κενό",


    };

    return {
      'en': lang_en,
      'gr': lang_gr,
    };
  }
}
