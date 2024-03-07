import 'dart:convert';
import 'package:nullplex_test/const/consts.dart';
import 'package:nullplex_test/requests/apis.dart';
import 'package:http/http.dart' as http;
import 'package:nullplex_test/views/widgets_common/snackbar.dart';

class AuthController extends ChangeNotifier {
  bool loading = false;

  set updateLoading(bool val) {
    loading = val;
    notifyListeners();
  }

  var userdata;

  // Future<String> getDeviceId() async => await FlutterUdid.udid;

  Future<bool> userSignIn(context, {phone, pass}) async {
    updateLoading = true;
    String device_id = "12345";

    http.Response? res = await Apis.signInApiRequest(
        phone: phone, password: pass, id: device_id);

    print(res);

    if (res != null) {
      if (res.statusCode == 200) {
        userdata = jsonDecode(res.body);
        updateLoading = false;
        return true;
      } else {
        userdata = jsonDecode(res.body);
        showSnackbar(context, userdata['message'] ?? "Some Thing went Wrong");
        updateLoading = false;
        return false;
      }
    }
    updateLoading = false;
    return false;
  }

  Future<bool> userSignUp(context, {name, phone, pass}) async {
    updateLoading = true;
    String deviceid = "113";
    http.Response? res = await Apis.signUpApiRequest(
        name: name, phoneNumber: phone, password: pass, id: deviceid);

    if (res != null) {
      print(res.body);
      if (res.statusCode == 200) {
        userdata = jsonDecode(res.body);
        updateLoading = false;
        return true;
      } else {
        userdata = jsonDecode(res.body);
        showSnackbar(context, userdata['message'] ?? "Some Thing went Wrong");
        updateLoading = false;
        return false;
      }
    }
    updateLoading = false;
    return false;
  }
}
