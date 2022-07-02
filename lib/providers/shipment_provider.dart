import 'package:cle_app/data/database/local_database/database.dart';
import 'package:cle_app/data/database/models/joined/shipment_with_loads.dart';
import 'package:cle_app/services/services.dart';
import 'package:cle_app/services/vehical_service.dart';
import 'package:flutter/cupertino.dart';

class ShipmentProvider extends ChangeNotifier {
  bool _isLoading = false;
  List<ShipmentWithLoads> _currentShipments = [];
  List<ShipmentWithLoads> _upcomingShipments = [];
  List<ShipmentWithLoads> _pastShipments = [];

  List<ShipmentWithLoads> get currentShipments => _currentShipments;
  List<ShipmentWithLoads> get upcomingShipments => _upcomingShipments;
  List<ShipmentWithLoads> get pastShipments => _pastShipments;

  ShipmentProvider() {
    getShipmentsAndLoads();
  }

  setLoading(bool loading) async {
    _isLoading = loading;
    notifyListeners();
  }

  setCurrentShipments(List<ShipmentWithLoads> currentShipments) {
    _currentShipments = currentShipments;
  }

  setUpcomingShipments(List<ShipmentWithLoads> upcomingShipments) {
    _upcomingShipments = upcomingShipments;
  }

  setPastShipments(List<ShipmentWithLoads> pastShipments) {
    _pastShipments = pastShipments;
  }

  getShipmentsAndLoads() async {
    setLoading(true);
    ShipmentService().getAllShipment();
    setLoading(false);
  }

  // Future<void> refreshTruckList() async {
  //   final trucks = await VehicleService().getAllTrucks();
  //   //TODO: Demo Only
  //   trucks.shuffle();
  //   setTruckList(trucks);
  //   setLoading(false);
  // }

  // refreshTrailersList() async {
  //   final trailers = await VehicleService().getAllTrailers();
  //   //TODO: Demo Only
  //   trailers.shuffle();
  //   setTrailerList(trailers);
  //   setLoading(false);
  // }
}
