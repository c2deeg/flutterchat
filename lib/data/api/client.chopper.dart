// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$ApiClient extends ApiClient {
  _$ApiClient([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ApiClient;

  @override
  Future<Response<dynamic>> ping() {
    final $url = '/tnslogisticsapi/ping';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> login(Map<String, dynamic> loginInfo) {
    final $url = '/tnslogisticsapi/login';
    final $body = loginInfo;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> logout(String token) {
    final $url = '/tnslogisticsapi/logout/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> isTokenValid(String token) {
    final $url = '/tnslogisticsapi/iftokenvalid/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> changePassword(
      String token, Map<String, dynamic> newPassword) {
    final $url = '/tnslogisticsapi/changepassword/${token}';
    final $body = newPassword;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> createUser(
      String token, Map<String, dynamic> userData) {
    final $url = '/tnslogisticsapi/createuser/${token}';
    final $body = userData;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updateUser(
      String token, Map<String, dynamic> userData) {
    final $url = '/tnslogisticsapi/updateuser/${token}';
    final $body = userData;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> deleteUser(int userId, String token) {
    final $url = '/tnslogisticsapi/deleteuser/${userId}/${token}';
    final $request = Request('PUT', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> activateUser(int userId, String token) {
    final $url = '/tnslogisticsapi/activateuser/${userId}/${token}';
    final $request = Request('PUT', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> resetPassword(int userId, String token) {
    final $url = '/tnslogisticsapi/resetpassword/${userId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getUserById(int userId, String token) {
    final $url = '/tnslogisticsapi/getuserbyid/${userId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllUsers(String token) {
    final $url = '/tnslogisticsapi/getalluser/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getUsersByRole(int roleId, String token) {
    final $url = '/tnslogisticsapi/getuserbyrole/${roleId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> addNewTruck(
      String token, Map<String, dynamic> newTruckData) {
    final $url = '/tnslogisticsapi/addtruck/${token}';
    final $body = newTruckData;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> addNewTrailer(
      String token, Map<String, dynamic> newTrailerData) {
    final $url = '/tnslogisticsapi/addtrailer/${token}';
    final $body = newTrailerData;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getVehicle(int vehicleId, String token) {
    final $url = '/tnslogisticsapi/getvehicle/${vehicleId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllVehicles(String token) {
    final $url = '/tnslogisticsapi/getvehicles/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllTrucks(String token) {
    final $url = '/tnslogisticsapi/getalltrucks/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllTrailers(String token) {
    final $url = '/tnslogisticsapi/getalltrailers/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllAvailableTrucks(String token) {
    final $url = '/tnslogisticsapi/getallemptytrucks/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllOutOfServiceTrucks(String token) {
    final $url = '/tnslogisticsapi/getalloutofservicetrucks/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> assigneTruckToDriver(
      int vehicleId, int driverId, String token) {
    final $url =
        '/tnslogisticsapi/associatevehicletodriver/${vehicleId}/${driverId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> markVehicleOutOfService(
      int vehicleId, String token) {
    final $url =
        '/tnslogisticsapi/putvehicleoutofservice/${vehicleId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updateTruck(
      String token, Map<String, dynamic> truckData) {
    final $url = '/tnslogisticsapi/updatetruck/${token}';
    final $body = truckData;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updateTrailer(
      String token, Map<String, dynamic> trailerData) {
    final $url = '/tnslogisticsapi/updatetrailer/${token}';
    final $body = trailerData;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> pairTrailerToTruck(
      int trailerId, int truckId, String token) {
    final $url =
        '/tnslogisticsapi/associatetrailertotruck/${trailerId}/${truckId}/${token}';
    final $request = Request('PUT', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> unpairTrailerToTruck(
      int trailerId, int truckId, String token) {
    final $url =
        '/tnslogisticsapi/deassociatetrailertotruck/${trailerId}/${truckId}/${token}';
    final $request = Request('PUT', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> addNewLoad(
      String token, Map<String, dynamic> loadData) {
    final $url = '/tnslogisticsapi/addload/${token}';
    final $body = loadData;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> markLoadNotDelivered(
      String token, Map<String, dynamic> notDeliveredData) {
    final $url = '/tnslogisticsapi/loadnotdelivered/${token}';
    final $body = notDeliveredData;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updateLoad(
      String token, Map<String, dynamic> loadData) {
    final $url = '/tnslogisticsapi/updateload/${token}';
    final $body = loadData;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getLoadById(int loadId, String token) {
    final $url = '/tnslogisticsapi/getloadbyid/${loadId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllLoads(String token) {
    final $url = '/tnslogisticsapi/getallloads/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getLoadSummaryForDriver(
      int driverId, String token) {
    final $url = '/tnslogisticsapi/loadsummaryfordriver/${driverId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllPendingShipmentsByUser(
      int driverId, String token) {
    final $url =
        '/tnslogisticsapi/getallpendingshipmentsbyuser/${driverId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllPendingShipments(String token) {
    final $url = '/tnslogisticsapi/getallpendingshipmentsbyuser${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllNotDeliveredLoads(String token) {
    final $url = '/tnslogisticsapi/allnotdeliveredloads/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> dipatchPendingLoad(int loadId, String token) {
    final $url = '/tnslogisticsapi/dipatchpendingloads/${loadId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getNotDeliveredLoad(int loadId, String token) {
    final $url = '/tnslogisticsapi/viewnotdeliveredloads/${loadId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getNotDeliveredReason(int loadId, String token) {
    final $url = '/tnslogisticsapi/recorverloadissue/${loadId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getLoadsByStatus(String loadStatus, String token) {
    final $url = '/tnslogisticsapi/getloadsbystatus/${loadStatus}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllStatus(String token) {
    final $url = '/tnslogisticsapi/getallstatus/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllShipments(String token) {
    final $url = '/tnslogisticsapi/getallshipments/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getShipmentById(int shipmentId, String token) {
    final $url = '/tnslogisticsapi/getshipmentbyid/${shipmentId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getShipmentsByUser(int userId, String token) {
    final $url = '/tnslogisticsapi/getallshipmentsbyuser/${userId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getLastLocationOfVehicle(int userId, String token) {
    final $url = '/tnslogisticsapi/lastlocationofvehicle/${userId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> attachLoadstoJob(
      int loadId, int shipmentId, String token) {
    final $url =
        '/tnslogisticsapi/attachloadstojob/${loadId}/${shipmentId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> dispatch(
      String token, Map<String, dynamic> dispatchData) {
    final $url = '/tnslogisticsapi/dispatch/${token}';
    final $body = dispatchData;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updateShipment(
      String token, Map<String, dynamic> shipmentData) {
    final $url = '/tnslogisticsapi/updateshipment/${token}';
    final $body = shipmentData;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> acceptShipmentJob(
      String token, String shipmentId, Map<String, dynamic> shipmentData) {
    final $url = '/tnslogisticsapi/acceptthejob/${shipmentId}/${token}';
    final $body = shipmentData;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> pickupShipmentJob(
      String token, String shipmentId, Map<String, dynamic> shipmentData) {
    final $url = '/tnslogisticsapi/pickupthejob/${shipmentId}/${token}';
    final $body = shipmentData;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> dropoffShipmentJob(
      String token, String shipmentId, Map<String, dynamic> shipmentData) {
    final $url = '/tnslogisticsapi/dropoffthejob/${shipmentId}/${token}';
    final $body = shipmentData;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> enRoute(
      String token, String shipmentId, Map<String, dynamic> shipmentData) {
    final $url = '/tnslogisticsapi/onthewaytopickup/${shipmentId}/${token}';
    final $body = shipmentData;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> arrived(
      String token, String shipmentId, Map<String, dynamic> shipmentData) {
    final $url = '/tnslogisticsapi/arriveattheshipper/${shipmentId}/${token}';
    final $body = shipmentData;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> pickUpLoad(
      String token, String shipmentId, Map<String, dynamic> shipmentData) {
    final $url = '/tnslogisticsapi/loadandleave/${shipmentId}/${token}';
    final $body = shipmentData;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> reportIncident(
      String token, Map<String, dynamic> reportData) {
    final $url = '/tnslogisticsapi/reportincident/${token}';
    final $body = reportData;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getReportById(int reportId, String token) {
    final $url = '/tnslogisticsapi/getincidentbyid/${reportId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllRncidents(String token) {
    final $url = '/tnslogisticsapi/getallincidents/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> resolveReport(int reportId, String token) {
    final $url = '/tnslogisticsapi/resolveincident/${reportId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> createChatroom(
      String token, Map<String, dynamic> chatRoomData) {
    final $url = '/tnslogisticsapi/createchatroom/${token}';
    final $body = chatRoomData;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> addUsertoChatroom(
      String token, Map<String, dynamic> chatRoomData) {
    final $url = '/tnslogisticsapi/assignchatroomuser/${token}';
    final $body = chatRoomData;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> sendMessage(
      String token, Map<String, dynamic> messageData) {
    final $url = '/tnslogisticsapi/sendMessage/${token}';
    final $body = messageData;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> editMessage(
      String token, Map<String, dynamic> messageData) {
    final $url = '/tnslogisticsapi/editMessage/${token}';
    final $body = messageData;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllChatroomsByUser(String token) {
    final $url = '/tnslogisticsapi/getChatroomsbyuser/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getChatroomById(int chatRoomId, String token) {
    final $url = '/tnslogisticsapi/getchatroombyid/${chatRoomId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> deleteChatroom(int chatRoomId, String token) {
    final $url = '/tnslogisticsapi/deletechatroom/${chatRoomId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> generatePaystubs(
      String token, Map<String, dynamic> payPeriod) {
    final $url = '/tnslogisticsapi/generatepaystubs/${token}';
    final $body = payPeriod;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getPaystubById(int paystudId, String token) {
    final $url = '/tnslogisticsapi/getpaystubbyid/${paystudId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllPaystubsByUser(String token) {
    final $url = '/tnslogisticsapi/getallpaystubsbyuser/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> generatePaystubsByWeek(String token) {
    final $url = '/tnslogisticsapi/generatepaystubsbyweek/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getnotificationbyid(
      int notificationId, String token) {
    final $url =
        '/tnslogisticsapi/getnotificationbyid/${notificationId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getNotificationByUser(int userId, String token) {
    final $url = '/tnslogisticsapi/getnotificationbyuserid/${userId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> markNotificationIsRead(
      int notificationId, String token) {
    final $url =
        '/tnslogisticsapi/deletenotifafterview/${notificationId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
