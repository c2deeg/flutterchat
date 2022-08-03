import 'package:cle_app/data/database/local_database/database.dart';
import 'package:cle_app/services/vehical_service.dart';
import 'package:flutter/cupertino.dart';

class TruckProvider extends ChangeNotifier {
  bool _isLoading = false;
  List<Vehicle> _trucks = [];
  List<Vehicle> _trailers = [];

  bool get isloading => _isLoading;
  List<Vehicle> get trucksList => _trucks;
  List<Vehicle> get trailersList => _trailers;

  TruckProvider() {
    getTrucksTrailers();
  }

  setLoading(bool loading) async {
    _isLoading = loading;
    notifyListeners();
  }

  setTruckList(List<Vehicle> trucksList) {
    _trucks = trucksList;
  }

  setTrailerList(List<Vehicle> trailerList) {
    _trailers = trailerList;
  }

  getTrucksTrailers() async {
    setLoading(true);
    final trucks = await VehicleService().getAllTrucks();
    final trailers = await VehicleService().getAllTrailers();
    setTruckList(trucks);
    setTrailerList(trailers);
    setLoading(false);
  }

  refreshTruckList() async {
    await Future.delayed(const Duration(milliseconds: 800));
    final trucks = await VehicleService().getAllTrucks();
    setTruckList(trucks);
  }

  refreshTrailersList() async {
    await Future.delayed(const Duration(milliseconds: 800));
    final trailers = await VehicleService().getAllTrailers();
    setTrailerList(trailers);
  }
}
