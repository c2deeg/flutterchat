import 'package:chopper/chopper.dart';
import 'package:cle_app/data/database/local_database/database.dart';
import 'package:cle_app/data/database/models/joined/shipment_with_loads.dart';
import 'package:cle_app/data/database/models/role.dart';

import '../../api/Model/getuserlistModel.dart';

class ApiUtil {
  ApiUtil._();

  static dynamic interceptResponce(Response response,
      {ResponceType responceType = ResponceType.none, int? shipmentId}) {
    if (response.isSuccessful) {
      final body = response.body;
      if (body.containsKey('error')) {
        if (body['error'] != '') return 'error: ${body['error']}';
      }
      if (body.containsKey('result')) {
        final data = body['result'];
        if (data == '') return;
        if (data == null) return;
        if (data is bool) return data;

        switch (responceType) {
          case ResponceType.none:
            return parseResult(data);
          case ResponceType.user:
            return parseUser(data);
          case ResponceType.token:
            return parseToken(data);
          case ResponceType.vehicle:
            return parseVehicle(data);
          case ResponceType.vehicleList:
            return parseVehicleList(data);
          case ResponceType.truckTrailerList:
            return parseTruckTrailerList(data);
          case ResponceType.shipment:
            return parseShipment(data);
          case ResponceType.shipmentList:
            return parseShipmentList(data);
          case ResponceType.shipmentWithDetails:
            return parseLoadedShipment(data);
          case ResponceType.load:
            return parseLoad(data, shipmentId!);
          case ResponceType.payroll:
            return parsePayroll(data);
          case ResponceType.result:
            return parseAllUser(data);
        }
      }
      return parseResult(body);
    }
    return '404 error';
  }

  static bool hasError(dynamic body) {
    if (body.toString().startsWith('error:')) return true;
    return false;
  }

  static User parseUser(Map<String, dynamic> body) {
    final userData = body['user'];
    final user = User(
        id: userData['id'] ?? 0,
        firstname: userData['prenom'] ?? '',
        lastname: userData['nom'] ?? '',
        email: userData['email'] ?? '',
        username: userData['username'] ?? '',
        password: userData['password'] ?? '',
        address: userData['adresse'],
        city: userData['ville'],
        country: userData['pays'],
        state: userData['etat'],
        telephoneOne: userData['tel1'],
        telephoneTwo: userData['tel2'],
        zipCode: userData['codepostal'],
        role: idToRole(userData['id'] ?? 4),
        isActive: userData['id'] == 1 ? true : false);
    return user;
  }

  static Vehicle parseVehicle(Map<String, dynamic> body) {
    final vehicleData = body;
    final vehicle = Vehicle(
      id: vehicleData['id'] ?? 0,
      vin: vehicleData['vin'] ?? '',
      number: vehicleData['number'] ?? 0,
      make: vehicleData['mark'] ?? '',
      model: vehicleData['model'] ?? '',
      maxTow: vehicleData['maxtow'] ?? 0,
      type: vehicleData['type'],
      isEmpty: vehicleData['isempty'],
    );
    return vehicle;
  }

  static GetUserData parseAllUser(Map<String, dynamic> body) {
    final allUserData = body;

    final allUser =GetUserData(
      result: allUserData['result'] ?? 0
    );
    return allUser;
  }

  static Payroll parsePayroll(Map<String, dynamic> body) {
    final vehicleData = body;
    final vehicle = Payroll(
      id: vehicleData['id'] ?? 0,
      tenantId: vehicleData['tenantid'] ?? 0,
      userId: vehicleData['userid'] ?? 0,
      netRevenue: ((vehicleData['revenuenet'] ?? 0) as int).toDouble(),
      grossIncome: ((vehicleData['revenuebrut'] ?? 0) as int).toDouble(),
      status: vehicleData['status'],
      notes: vehicleData['notes'],
      isdeleted: vehicleData['isdeleted'],
      periodStart: DateTime.parse(vehicleData['periodstart']),
      periodEnd: DateTime.parse(vehicleData['periodend']),
      percent: ((vehicleData['percent'] ?? 0) as int).toDouble(),
      revenueAfterPercent:
          ((vehicleData['revenueafterpercent'] ?? 0) as int).toDouble(),
      totalAdvance: ((vehicleData['totaladvance'] ?? 0) as int).toDouble(),
      credit: ((vehicleData['credit'] ?? 0) as int).toDouble(),
      currency: vehicleData['currency'],
    );
    return vehicle;
  }

  static List<Vehicle> parseVehicleList(List<dynamic> body) {
    final vehicleList = body
        .map((vehicleData) => Vehicle(
              id: vehicleData['id'] ?? 0,
              vin: vehicleData['vin'] ?? '',
              number: vehicleData['number'] ?? 0,
              make: vehicleData['mark'] ?? '',
              model: vehicleData['model'] ?? '',
              maxTow: vehicleData['maxtow'] ?? 0,
              curbWeight: vehicleData['cubweight'] ?? 0,
              type: vehicleData['type'],
              isEmpty: vehicleData['isempty'],
            ))
        .toList();

    return vehicleList;
  }

  static List<Vehicle> parseTruckTrailerList(List<dynamic> body) {
    final vehicleList = body
        .map((vehicleData) => Vehicle(
              id: vehicleData['id'] ?? 0,
              vin: vehicleData['vin'] ?? '',
              number: vehicleData['number'] ?? 0,
              make: vehicleData['mark'] ?? '',
              model: vehicleData['model'] ?? '',
              curbWeight: vehicleData['cubweight'] ?? 0,
              maxTow: vehicleData['maxtow'] ?? 0,
              type: vehicleData['type'],
              isEmpty: vehicleData['isempty'],
            ))
        .toList();

    return vehicleList;
  }

  static List<User> parseUserList(List<dynamic> body) {
    final userList = body
        .map((userData) => User(
            id: userData['id'] ?? 0,
            firstname: userData['prenom'] ?? '',
            lastname: userData['nom'] ?? '',
            email: userData['email'] ?? '',
            username: userData['username'] ?? '',
            password: userData['password'] ?? '',
            address: userData['adresse'],
            city: userData['ville'],
            country: userData['pays'],
            state: userData['etat'],
            telephoneOne: userData['tel1'],
            telephoneTwo: userData['tel2'],
            zipCode: userData['codepostal'],
            role: idToRole(userData['id'] ?? 4),
            isActive: userData['id'] == 1 ? true : false))
        .toList();

    return userList;
  }

  static List<Shipment> parseShipmentList(List<dynamic> body) {
    final shipmentList = body
        .map((shipmentData) => Shipment(
              id: shipmentData['id'] ?? 0,
              pickUpTime: DateTime.parse(shipmentData['pickuptime']),
              dropOffTime: DateTime.parse(shipmentData['dropofftime']),
              createdAt: DateTime.parse(shipmentData['createdat']),
              dispatcher: shipmentData['dispatcher'] ?? '',
              broker: shipmentData['broker'] ?? '',
              status: shipmentData['status'] ?? '',
              expeditor: shipmentData['expeditor'] ?? '',
            ))
        .toList();

    return shipmentList;
  }

  static Load parseLoad(Map<String, dynamic> body, int shipmentId) {
    final loadData = body;
    final load = Load(
      id: loadData['id'] ?? 0,
      currency: loadData['currency'] ?? '',
      isempty: loadData['isempty'] ?? false,
      loadPrice: loadData['loadprice'] ?? 0,
      name: loadData['name'] ?? '',
      shipmentId: shipmentId,
      temperature: loadData['temperature'] ?? 0,
      totalMileage: loadData['totalmileage'] ?? 0,
      weight: loadData['weight'] ?? 0,
      consignee: loadData['consignee'] ?? '',
      notes: loadData['notes'] ?? '',
      unitTemperature: loadData['unittemperature'] ?? '',
      unitWeight: loadData['unitweight'] ?? '',
      status: loadData['status'] ?? '',
    );

    return load;
  }

  static ShipmentWithLoads parseLoadedShipment(Map<String, dynamic> body) {
    final shipmentData = body;
    final loadsdata = shipmentData['loads'];
    final List loads;
    if (loadsdata != null) {
      loads =
          (loadsdata as List<dynamic>).map((e) => e['idload'] as int).toList();
    } else {
      loads = <int>[];
    }

    final shipWithDetails = ShipmentWithLoads(
      shipment: Shipment(
        id: shipmentData['id'] ?? 0,
        pickUpTime: DateTime.parse(shipmentData['pickuptime']),
        dropOffTime: DateTime.parse(shipmentData['dropofftime']),
        createdAt: DateTime.parse(shipmentData['createdat']),
        dispatcher: shipmentData['dispatcher'] ?? '',
        broker: shipmentData['broker'] ?? '',
        status: shipmentData['status'] ?? '',
        expeditor: shipmentData['expeditor'] ?? '',
        // docs: shipmentData['docs'] ?? '',
      ),
      loadIds: loads as List<int>,
      loads: const [],
    );

    return shipWithDetails;
  }

  static Shipment parseShipment(Map<String, dynamic> body) {
    final shipmentData = body;
    final shipment = Shipment(
      id: shipmentData['id'] ?? 0,
      pickUpTime: DateTime.parse(shipmentData['pickuptime']),
      dropOffTime: DateTime.parse(shipmentData['dropofftime']),
      createdAt: DateTime.parse(shipmentData['createdat']),
      dispatcher: shipmentData['dispatcher'] ?? '',
      broker: shipmentData['broker'] ?? '',
      status: shipmentData['status'] ?? '',
      expeditor: shipmentData['expeditor'] ?? '',
    );

    return shipment;
  }

  static String parseToken(Map<String, dynamic> body) {
    return body['token'];
  }

  static dynamic parseResult(Map<String, dynamic> body) {
    return body;
  }
}

enum ResponceType {
  none,
  user,
  token,
  vehicle,
  vehicleList,
  truckTrailerList,
  shipment,
  shipmentList,
  shipmentWithDetails,
  load,
  payroll,
  result
  // broker,
  // expence,
  // report,
  // notification,
  // chatMessage,
  // chatRoom,
}
