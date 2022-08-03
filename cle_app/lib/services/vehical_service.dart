import 'package:cle_app/data/data.dart';
import 'package:cle_app/data/database/local_database/database.dart';
import 'package:cle_app/data/settings/local_data.dart';
import 'package:cle_app/services/services.dart';
import 'package:cle_app/widgets/errors.dart';

class VehicleService {
  Future<List<Vehicle>> getAllVehicles() async {
    if (await NetworkService().isConnected()) {
      try {
        final token = await AuthenticationService().getToken();
        final vehicalListData = await ApiClient.create().getAllVehicles(token);
        final vehicleList = ApiUtil.interceptResponce(vehicalListData,
            responceType: ResponceType.vehicleList);
        return vehicleList;
      } catch (e) {
        errorToast();
      }
    } else {
      return [];
    }
    errorToast();
    return [];
  }

  Future<List<Vehicle>> getAllTrucks() async {
    if (await NetworkService().isConnected()) {
      try {
        final token = await AuthenticationService().getToken();
        final userId = LocalData().user.id;
        final vehicalListData =
            await ApiClient.create().getVehiclebyUser(userId, token);
        List<Vehicle> vehicleList = ApiUtil.interceptResponce(vehicalListData,
            responceType: ResponceType.truckTrailerList);
        vehicleList.removeWhere((vehicle) => vehicle.type != 'Truck');
        return vehicleList;
      } catch (e) {
        errorToast();
      }
    } else {
      return [];
    }
    errorToast();
    return [];
  }

  Future<List<Vehicle>> getAllTrailers() async {
    if (await NetworkService().isConnected()) {
      try {
        final token = await AuthenticationService().getToken();
        final userId = LocalData().user.id;
        final vehicalListData =
            await ApiClient.create().getVehiclebyUser(userId, token);
        List<Vehicle> vehicleList = ApiUtil.interceptResponce(vehicalListData,
            responceType: ResponceType.truckTrailerList);
        vehicleList.removeWhere((vehicle) => vehicle.type != 'Trailer');
        return vehicleList;
      } catch (e) {
        errorToast();
      }
    } else {
      return [];
    }
    errorToast();
    return [];
  }

  Future<List<Vehicle>> getAlluser() async {
    if (await NetworkService().isConnected()) {
      try {
        final token = await AuthenticationService().getToken();
        final userslist = await ApiClient.create().getAllUsers(token);
        final userslists = ApiUtil.interceptResponce(userslist,
            responceType: ResponceType.truckTrailerList);
        return userslists;
      } catch (e) {
        errorToast();
      }
    } else {
      return [];
    }
    errorToast();
    return [];
  }
}
