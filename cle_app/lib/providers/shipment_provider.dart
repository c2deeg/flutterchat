import 'package:cle_app/data/database/models/joined/shipment_with_loads.dart';
import 'package:cle_app/services/services.dart';
import 'package:flutter/cupertino.dart';

class ShipmentProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool _shipmentError = false;

  String _driverStatus = 'AVAILABLE';
  List<String> _statusOptions = [
    'AVAILABLE',
    'IN TRANSIT',
    'LOADING',
    'UNLOADING',
  ];

  List<ShipmentWithLoads> _currentShipments = [];
  List<ShipmentWithLoads> _availableShipments = [];
  List<ShipmentWithLoads> _pastShipments = [];
  late ShipmentWithLoads _detailsShipment;

  bool get isLoading => _isLoading;
  bool get shipmentError => _shipmentError;

  String get driverStatus => _driverStatus;
  List<String> get statusOptions => _statusOptions;

  ShipmentWithLoads get detailsShipment => _detailsShipment;
  List<ShipmentWithLoads> get currentShipments => _currentShipments;
  List<ShipmentWithLoads> get availableShipments => _availableShipments;
  List<ShipmentWithLoads> get pastShipments => _pastShipments;

  ShipmentProvider() {
    init();
  }

  setLoading(bool loading) async {
    _isLoading = loading;
    notifyListeners();
  }

  setErrorStatus(bool error) async {
    _shipmentError = error;
    notifyListeners();
  }

  setDriverStatus(String status) {
    _driverStatus = status;
    notifyListeners();
  }

  setStatusOptions(List<String> options) {
    _statusOptions = options;
    notifyListeners();
  }

  setCurrentShipments(List<ShipmentWithLoads> currentShipments) {
    _currentShipments = currentShipments;
  }

  setAvailableShipments(List<ShipmentWithLoads> availableShipments) {
    _availableShipments = availableShipments;
  }

  setPastShipments(List<ShipmentWithLoads> pastShipments) {
    _pastShipments = pastShipments;
  }

  setDetailsShipment(ShipmentWithLoads shipmentWithLoads) {
    setErrorStatus(false);
    _detailsShipment = shipmentWithLoads;
  }

  getShipments() async {
    final shipments = await ShipmentService().getAllShipment();
    final pastShipments = shipments.where((shipmentWloads) {
      return shipmentWloads.shipment.status == 'DE' ||
          shipmentWloads.shipment.status == 'AT';
    }).toList();
    final currentShipments = shipments.where((shipmentWloads) {
      return shipmentWloads.shipment.status == 'IT' ||
          shipmentWloads.shipment.status == 'WP' ||
          shipmentWloads.shipment.status == 'AS' ||
          shipmentWloads.shipment.status == 'LL' ||
          shipmentWloads.shipment.status == 'AC';
    }).toList();
    final availableShipments = shipments.where((shipmentWloads) {
      return shipmentWloads.shipment.status == 'PD';
    }).toList();
    setPastShipments(pastShipments);
    setAvailableShipments(availableShipments);
    setCurrentShipments(currentShipments);
  }

  acceptShipment(BuildContext context) async {
    setLoading(true);
    bool success =
        await ShipmentService().acceptJob(detailsShipment.shipment.id);
    if (success) {
      refreshShipments();
      Navigator.pop(context);
    } else {
      setErrorStatus(true);
    }
    setLoading(false);
  }

  refreshShipments() async {
    await getShipments();
    notifyListeners();
  }

  init() async {
    setLoading(true);
    await getShipments();
    setLoading(false);
  }
}
