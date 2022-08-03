import 'package:chopper/chopper.dart';
import 'package:cle_app/data/database/local_database/database.dart';
import 'package:cle_app/data/database/models/joined/payroll_with_item.dart';
import 'package:cle_app/data/database/models/joined/shipment_with_loads.dart';
import 'package:cle_app/data/database/models/role.dart';

import '../../api/Model/get_userlist_model.dart';

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
          case ResponceType.payroll:
            return parsePayroll(data);
          case ResponceType.payrollList:
            return parsePayrollList(data);
          case ResponceType.expenceList:
            return parseExpenceList(data);
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
        address: userData['adresse'] ?? '',
        city: userData['ville'] ?? '',
        country: userData['pays'] ?? '',
        state: userData['etat'] ?? '',
        telephoneOne: userData['tel1'] ?? '',
        telephoneTwo: userData['tel2'] ?? '',
        zipCode: userData['codepostal'] ?? '',
        profilePicture: userData['profilepicture'] ?? '',
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

    final allUser = GetUserData(result: allUserData['result'] ?? 0);
    return allUser;
  }

  static Payroll parsePayroll(Map<String, dynamic> body) {
    final payroll = body;
    final paystub = Payroll(
      id: payroll['id'] ?? 0,
      tenantId: payroll['tenantid'] ?? 0,
      userId: payroll['userid'] ?? 0,
      netRevenue: ((payroll['revenuenet'] ?? 0) as int).toDouble(),
      grossIncome: ((payroll['revenuebrut'] ?? 0) as int).toDouble(),
      status: payroll['status'],
      notes: payroll['notes'],
      isdeleted: payroll['isdeleted'],
      periodStart: DateTime.parse(payroll['periodstart']),
      periodEnd: DateTime.parse(payroll['periodend']),
      percent: ((payroll['percent'] ?? 0) as int).toDouble(),
      revenueAfterPercent:
          ((payroll['revenueafterpercent'] ?? 0) as int).toDouble(),
      totalAdvance: ((payroll['totaladvance'] ?? 0) as int).toDouble(),
      credit: ((payroll['credit'] ?? 0) as int).toDouble(),
      currency: payroll['currency'],
      reimbursment: payroll['reimbursment'],
      subtotal: payroll['subtotal'],
      totalDeductionAdvance: payroll['deductionadvance'],
      totalLoads: payroll['TotalDeliberyLoadsPrice'],
      totalLoadsAfterPercent: payroll['TotalLoadsPriceAfterPercent'],
    );
    return paystub;
  }

  static List<PayrollWithItems> parsePayrollList(List<dynamic> body) {
    final paystubs = body
        .map((payroll) => PayrollWithItems(
              payroll: Payroll(
                id: payroll['id'] ?? 0,
                tenantId: payroll['tenantid'] ?? 0,
                userId: payroll['userid'] ?? 0,
                netRevenue: ((payroll['revenuenet'] ?? 0) as int).toDouble(),
                grossIncome: ((payroll['revenuebrut'] ?? 0) as int).toDouble(),
                status: payroll['status'],
                notes: payroll['notes'],
                isdeleted: payroll['isdeleted'],
                periodStart: DateTime.parse(payroll['periodstart']),
                periodEnd: DateTime.parse(payroll['periodend']),
                percent: ((payroll['percent'] ?? 0) as int).toDouble(),
                revenueAfterPercent:
                    ((payroll['revenueafterpercent'] ?? 0) as int).toDouble(),
                totalAdvance:
                    ((payroll['totaladvance'] ?? 0) as int).toDouble(),
                credit: ((payroll['credit'] ?? 0) as int).toDouble(),
                currency: payroll['currency'] ?? 0,
                reimbursment: payroll['reimbursment'] == null
                    ? 0.0
                    : (payroll['reimbursment'] as int).toDouble(),
                subtotal: ((payroll['subtotal'] ?? 0) as int).toDouble(),
                totalDeductionAdvance:
                    ((payroll['deductionadvance'] ?? 0) as int).toDouble(),
                totalLoads: ((payroll['TotalDeliberyLoadsPrice'] ?? 0) as int)
                    .toDouble(),
                totalLoadsAfterPercent:
                    ((payroll['TotalLoadsPriceAfterPercent'] ?? 0) as int)
                        .toDouble(),
              ),
              loads: payroll['listDeliberyLoads'] == null
                  ? []
                  : (payroll['listDeliberyLoads'] as List<dynamic>)
                      .map((item) => PayrollLoad(
                            payrollId: item['id'] ?? 0,
                            type: 'LOADS',
                            dispatch: item['dispatch'] ?? '',
                            consigneeAddress: item['consigne_address'] ?? 0,
                            consignee: item['consignee'] ?? 0,
                            dropoffTime: item['deliverydate'] == null
                                ? DateTime.now()
                                : DateTime.parse(item['deliverydate']),
                            pickupTime: item['pickupptime'] == null
                                ? DateTime.now()
                                : DateTime.parse(item['pickupptime']),
                            expeditor: item['expeditor'] ?? '',
                            expeditorAddress: item['exp_address'] ?? '',
                            loadprice: item['loadprice'] ?? 0,
                            loadpriceAfterPercent:
                                item['revenuafterpercent'] ?? 0,
                            percent: item['percentt'] ?? 0,
                            currency: item['currency'] ?? 'USD',
                          ))
                      .toList(),
              advances: payroll['listadvance'] == null
                  ? []
                  : (payroll['listadvance'] as List<dynamic>)
                      .map((item) => PayrollItem(
                            payrollId: item['id'] ?? 0,
                            type: 'ADVANCES',
                            note: item['note'] ?? '',
                            amount: item['amount'] ?? 0,
                            currency: item['currency'] ?? 'USD',
                            createdAt: DateTime.parse(
                                item['createdAt'] ?? DateTime.now()),
                          ))
                      .toList(),
              credits: payroll['listcredit'] == null
                  ? []
                  : (payroll['listcredit'] as List<dynamic>)
                      .map((item) => PayrollItem(
                            payrollId: item['id'] ?? 0,
                            type: 'CREDITS',
                            note: item['note'] ?? '',
                            amount: item['amount'] ?? 0,
                            currency: item['currency'] ?? 'USD',
                            createdAt: DateTime.parse(
                                item['createdAt'] ?? DateTime.now()),
                          ))
                      .toList(),
              deductions: payroll['listdeduction'] == null
                  ? []
                  : (payroll['listdeduction'] as List<dynamic>)
                      .map((item) => PayrollItem(
                            payrollId: item['id'] ?? 0,
                            type: 'DEDUCTIONS',
                            note: item['note'] ?? '',
                            amount: item['amount'] ?? 0,
                            currency: item['currency'] ?? 'USD',
                            createdAt: DateTime.parse(
                                item['createdAt'] ?? DateTime.now()),
                          ))
                      .toList(),
              reimbursments: payroll['listreimbursment'] == null
                  ? []
                  : (payroll['listreimbursment'] as List<dynamic>)
                      .map((item) => PayrollItem(
                            payrollId: item['id'] ?? 0,
                            type: 'REIMBURSMENTS',
                            note: item['note'] ?? '',
                            amount: item['amount'] ?? 0,
                            currency: item['currency'] ?? 'USD',
                            createdAt: DateTime.parse(
                                item['createdAt'] ?? DateTime.now()),
                          ))
                      .toList(),
            ))
        .toList();
    return paystubs;
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

  static List<Expence> parseExpenceList(List<dynamic> body) {
    final expenceList = body
        .map((data) => Expence(
              id: data['id'] ?? 0,
              amount: (data['amount'] ?? 0),
              transaction: 'Expence driver',
              createdAt: DateTime.parse(
                  data['createdAt'] ?? DateTime.now().toIso8601String()),
              paymentType: 'from Payroll',
              amountGive: (data['amountGive'] ?? 0),
              change: (data['change'] ?? 0),
              currency: data['currency'] ?? '',
              note: data['note'] ?? '',
              banque: data['banque'] ?? '',
              checkNumber: data['numCheque'] ?? '',
              cardNumber: data['numCarte'] ?? '',
              bankCardNumber: (data['numFicheBanque'] ?? ''),
            ))
        .toList();

    return expenceList;
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
            profilePicture: userData['profilepicture'] ?? '',
            role: idToRole(userData['id'] ?? 4),
            isActive: userData['id'] == 1 ? true : false))
        .toList();

    return userList;
  }

  static List<ShipmentWithLoads> parseShipmentList(List<dynamic> body) {
    final shipments = body
        .map((shipment) => ShipmentWithLoads(
              shipment: Shipment(
                  id: shipment['id'] ?? 0,
                  pickUpTime: DateTime.parse(shipment['pickuptime'] ??
                      DateTime.now().toIso8601String()),
                  dropOffTime: DateTime.parse(shipment['dropofftime'] ??
                      DateTime.now().toIso8601String()),
                  pickuplocation: shipment['pickuplocation'] ?? '',
                  dispatcher: shipment['dispatcher'] ?? '',
                  broker: shipment['broker'] ?? '',
                  status: shipment['status'] ?? '',
                  expeditor: shipment['expeditor']),
              loads: shipment['loads'] != null
                  ? (shipment['loads'] as List<dynamic>)
                      .map((load) => Load(
                          id: load['id'] ?? 0,
                          name: load['name'] ?? '',
                          weight: load['weight'] ?? 0,
                          unitWeight: load['unitweight'] ?? '',
                          temperature: load['temperature'] ?? 0,
                          unitTemperature: load['unittemperature'] ?? '',
                          loadPrice: load['loadprice'] ?? 0,
                          totalMileage: load['totalmileage'] ?? 0,
                          consignee: load['consignee'] ?? '',
                          notes: load['notes'] ?? '',
                          pickUpTime: DateTime.parse(
                              load['pickup'] != null && load['pickup'] != ''
                                  ? load['pickup']
                                  : DateTime.now().toIso8601String()),
                          dropOffTime: DateTime.parse(
                              load['dropoff'] != null && load['dropoff'] != ''
                                  ? load['dropoff']
                                  : DateTime.now().toIso8601String()),
                          dropoffLocation: load["dropofflocation"] ?? '',
                          isempty: load['isempty'] ?? false,
                          currency: load['currency'] ?? '',
                          status: load['status'] ?? '',
                          shipmentId: shipment['id'] ?? 0))
                      .toList()
                  : [],
            ))
        .toList();

    return shipments;
  }

  // static Load parseLoad(Map<String, dynamic> body, int shipmentId) {
  //   final loadData = body;
  //   final load = Load(
  //     id: loadData['id'] ?? 0,
  //     currency: loadData['currency'] ?? '',
  //     isempty: loadData['isempty'] ?? false,
  //     loadPrice: loadData['loadprice'] ?? 0,
  //     name: loadData['name'] ?? '',
  //     shipmentId: shipmentId,
  //     temperature: loadData['temperature'] ?? 0,
  //     totalMileage: loadData['totalmileage'] ?? 0,
  //     weight: loadData['weight'] ?? 0,
  //     consignee: loadData['consignee'] ?? '',
  //     pickUp: ,
  //     notes: loadData['notes'] ?? '',
  //     unitTemperature: loadData['unittemperature'] ?? '',
  //     unitWeight: loadData['unitweight'] ?? '',
  //     status: loadData['status'] ?? '',
  //   );

  //   return load;
  // }

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
        pickUpTime: DateTime.parse(
            shipmentData['pickuptime'] ?? DateTime.now().toIso8601String()),
        pickuplocation: shipmentData['pickuplocation'] ?? '',

        dropOffTime: DateTime.parse(
            shipmentData['dropofftime'] ?? DateTime.now().toIso8601String()),
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
      pickuplocation: shipmentData['pickuplocation'] ?? '',
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
  payroll,
  payrollList,
  result,
  expenceList
  // broker,
  // expence,
  // report,
  // notification,
  // chatMessage,
  // chatRoom,
}
