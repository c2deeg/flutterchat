import 'package:cle_app/data/api/api.dart';
import 'package:cle_app/data/database/models/joined/shipment_with_loads.dart';
import 'package:cle_app/data/settings/local_data.dart';
import 'package:cle_app/services/services.dart';
import 'package:cle_app/widgets/widgets.dart';

class ShipmentService {
  Future<List<ShipmentWithLoads>> getAllShipment() async {
    if (await NetworkService().isConnected()) {
      try {
        final token = await AuthenticationService().getToken();

        final shipmentListData = await ApiClient.create()
            .getShipmentsByUser(LocalData().user.id, token);

        List<ShipmentWithLoads> shipmentList = ApiUtil.interceptResponce(
            shipmentListData,
            responceType: ResponceType.shipmentList);

        return shipmentList;
      } catch (e) {
        errorToast();
        return [];
      }
    } else {
      noInternetToast();
    }
    errorToast();
    return [];
  }

  Future<bool> acceptJob(int shipmentId) async {
    if (await NetworkService().isConnected()) {
      try {
        final token = await AuthenticationService().getToken();

        final shipmentResult =
            await ApiClient.create().acceptShipmentJob(shipmentId, token);

        if (shipmentResult.isSuccessful) {
          return true;
        }
        return false;
      } catch (e) {
        errorToast();
        return false;
      }
    } else {
      noInternetToast();
      return false;
    }
  }

  void pickedUpLoad() {}
  void pickedUpShipment() {}
  void enRouteToPickup() {}
  void atPickup() {}
  void delivered() {}
  void getShipmentDetails(int id) {}
  void getCurrentShipment() {}
  void getPreviousShipments() {}
}
