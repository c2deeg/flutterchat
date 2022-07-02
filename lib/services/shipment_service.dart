import 'package:cle_app/data/api/api.dart';
import 'package:cle_app/data/database/local_database/database.dart';
import 'package:cle_app/data/database/models/joined/shipment_with_loads.dart';
import 'package:cle_app/services/services.dart';
import 'package:cle_app/widgets/widgets.dart';

class ShipmentService {
  Future<void> getAllShipment() async {
    if (await NetworkService().isConnected()) {
      try {
        List<ShipmentWithLoads> jobs = [];
        final token = await AuthenticationService().getToken();

        // final shipmentListData =
        //     await ApiClient.create().getShipmentsByUser(userId, token);

        final shipmentListData =
            await ApiClient.create().getAllShipments(token);

        List<Shipment> shipmentList = ApiUtil.interceptResponce(
            shipmentListData,
            responceType: ResponceType.shipmentList);

        for (var ship in shipmentList) {
          jobs.add(ApiUtil.interceptResponce(
              await ApiClient.create().getShipmentById(ship.id, token),
              responceType: ResponceType.shipmentWithDetails));
        }
        final List<ShipmentWithLoads> shipmentJobs = jobs.map((job) {
          // final loaddata = await ApiClient.create().getAllLoads( token);
          List<Load>? tempLoadList = [];
          tempLoadList = job.loadIds
              ?.map((id) async {
                final loaddata =
                    await ApiClient.create().getLoadById(id, token);
                final fullLoad = ApiUtil.interceptResponce(loaddata,
                    responceType: ResponceType.load,
                    shipmentId: job.shipment.id);
                if (!(fullLoad == 'error: Load does not exist.')) {
                  return fullLoad as Load;
                }
              })
              .cast<Load>()
              .toList();
          print(tempLoadList);
          // Future.wait(
          // job.loadIds?.forEach((id) async {
          //   final loaddata = await ApiClient.create().getLoadById(id, token);
          //   final fullLoad = ApiUtil.interceptResponce(loaddata,
          //       responceType: ResponceType.load, shipmentId: job.shipment.id);
          //   if (!(fullLoad == 'error: Load does not exist.')) {
          //     tempLoadList.add(fullLoad);
          //   }
          // }));
          return ShipmentWithLoads(shipment: job.shipment, loads: tempLoadList);
        }).toList();

        print(shipmentJobs);
      } catch (e) {
        errorToast();
      }
    } else {
      // return [];
    }
    errorToast();
    // return [];
  }

  void acceptJob() {}
  void pickedUpLoad() {}
  void pickedUpShipment() {}
  void enRouteToPickup() {}
  void atPickup() {}
  void delivered() {}
  void getShipmentDetails(int id) {}
  void getCurrentShipment() {}
  void getPreviousShipments() {}
}
