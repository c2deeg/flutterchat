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
  Future<Response<dynamic>> getpaymenttype(String token) {
    final $url = '/api/v1/getpaymenttype/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> gettransactions(String token) {
    final $url = '/api/v1/gettransactions/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> addexpensddriver(
      String token, Map<String, dynamic> data) {
    final $url = '/api/v1/addexpensddriver/${token}';
    final $body = data;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> deleteexpensebyid(String token, String id) {
    final $url = '/api/v1/deleteexpensebyid/${id}/${token}';
    final $request = Request('POST', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllExpences(String token, int userId) {
    final $url = '/api/v1/getallexpencesdriverbyuserid/${userId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updateexpense(String token) {
    final $url = '/api/v1/updateexpense/${token}';
    final $request = Request('POST', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> entity(String token) {
    final $url = '/api/v1/getentity/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> sendpdffile(
      Map<String, dynamic> data, String token, String entity) {
    final $url = '/api/v1/uploadfilesbase64/${entity}/{idelement}/${token}';
    final $body = data;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> ping() {
    final $url = '/api/v1/ping';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> login(Map<String, dynamic> loginInfo) {
    final $url = '/api/v1/login';
    final $body = loginInfo;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> logout(String token) {
    final $url = '/api/v1/logout/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> isTokenValid(String token) {
    final $url = '/api/v1/iftokenvalid/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> changePassword(
      String token, Map<String, dynamic> newPassword) {
    final $url = '/api/v1/changepassword/${token}';
    final $body = newPassword;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> createUser(
      String token, Map<String, dynamic> userData) {
    final $url = '/api/v1/createuser/${token}';
    final $body = userData;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updateUser(
      String token, Map<String, dynamic> userData) {
    final $url = '/api/v1/updateuser/${token}';
    final $body = userData;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> deleteUser(int userId, String token) {
    final $url = '/api/v1/deleteuser/${userId}/${token}';
    final $request = Request('PUT', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> activateUser(int userId, String token) {
    final $url = '/api/v1/activateuser/${userId}/${token}';
    final $request = Request('PUT', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> resetPassword(int userId, String token) {
    final $url = '/api/v1/resetpassword/${userId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getUserById(int userId, String token) {
    final $url = '/api/v1/getuserbyid/${userId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllUsers(String token) {
    final $url = '/api/v1/getalluser/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getUsersByRole(int roleId, String token) {
    final $url = '/api/v1/getuserbyrole/${roleId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> addNewTruck(
      String token, Map<String, dynamic> newTruckData) {
    final $url = '/api/v1/addtruck/${token}';
    final $body = newTruckData;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> addNewTrailer(
      String token, Map<String, dynamic> newTrailerData) {
    final $url = '/api/v1/addtrailer/${token}';
    final $body = newTrailerData;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getVehicle(int vehicleId, String token) {
    final $url = '/api/v1/getvehicle/${vehicleId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getVehiclebyUser(int userId, String token) {
    final $url = '/api/v1/getvehiclesbyuser/${userId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllVehicles(String token) {
    final $url = '/api/v1/getvehicles/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllTrucks(String token) {
    final $url = '/api/v1/getalltrucks/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllTrailers(String token) {
    final $url = '/api/v1/getalltrailers/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllAvailableTrucks(String token) {
    final $url = '/api/v1/getallemptytrucks/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllOutOfServiceTrucks(String token) {
    final $url = '/api/v1/getalloutofservicetrucks/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> assigneTruckToDriver(
      int vehicleId, int driverId, String token) {
    final $url =
        '/api/v1/associatevehicletodriver/${vehicleId}/${driverId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> markVehicleOutOfService(
      int vehicleId, String token) {
    final $url = '/api/v1/putvehicleoutofservice/${vehicleId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updateTruck(
      String token, Map<String, dynamic> truckData) {
    final $url = '/api/v1/updatetruck/${token}';
    final $body = truckData;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updateTrailer(
      String token, Map<String, dynamic> trailerData) {
    final $url = '/api/v1/updatetrailer/${token}';
    final $body = trailerData;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> pairTrailerToTruck(
      int trailerId, int truckId, String token) {
    final $url =
        '/api/v1/associatetrailertotruck/${trailerId}/${truckId}/${token}';
    final $request = Request('PUT', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> unpairTrailerToTruck(
      int trailerId, int truckId, String token) {
    final $url =
        '/api/v1/deassociatetrailertotruck/${trailerId}/${truckId}/${token}';
    final $request = Request('PUT', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> addNewLoad(
      String token, Map<String, dynamic> loadData) {
    final $url = '/api/v1/addload/${token}';
    final $body = loadData;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> markLoadNotDelivered(
      String token, Map<String, dynamic> notDeliveredData) {
    final $url = '/api/v1/loadnotdelivered/${token}';
    final $body = notDeliveredData;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updateLoad(
      String token, Map<String, dynamic> loadData) {
    final $url = '/api/v1/updateload/${token}';
    final $body = loadData;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getLoadById(int loadId, String token) {
    final $url = '/api/v1/getloadbyid/${loadId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllLoads(String token) {
    final $url = '/api/v1/getallloads/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getLoadSummaryForDriver(
      int driverId, String token) {
    final $url = '/api/v1/loadsummaryfordriver/${driverId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllPendingShipmentsByUser(
      int driverId, String token) {
    final $url = '/api/v1/getallpendingshipmentsbyuser/${driverId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllPendingShipments(String token) {
    final $url = '/api/v1/getallpendingshipmentsbyuser${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllNotDeliveredLoads(String token) {
    final $url = '/api/v1/allnotdeliveredloads/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> dipatchPendingLoad(int loadId, String token) {
    final $url = '/api/v1/dipatchpendingloads/${loadId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getNotDeliveredLoad(int loadId, String token) {
    final $url = '/api/v1/viewnotdeliveredloads/${loadId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getNotDeliveredReason(int loadId, String token) {
    final $url = '/api/v1/recorverloadissue/${loadId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getLoadsByStatus(String loadStatus, String token) {
    final $url = '/api/v1/getloadsbystatus/${loadStatus}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllStatus(String token) {
    final $url = '/api/v1/getallstatus/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllShipments(String token) {
    final $url = '/api/v1/getallshipments/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getShipmentById(int shipmentId, String token) {
    final $url = '/api/v1/getshipmentbyid/${shipmentId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getShipmentsByUser(int userId, String token) {
    final $url = '/api/v1/getallshipmentsbyuser/${userId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getLastLocationOfVehicle(int userId, String token) {
    final $url = '/api/v1/lastlocationofvehicle/${userId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> attachLoadstoJob(
      int loadId, int shipmentId, String token) {
    final $url = '/api/v1/attachloadstojob/${loadId}/${shipmentId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> dispatch(
      String token, Map<String, dynamic> dispatchData) {
    final $url = '/api/v1/dispatch/${token}';
    final $body = dispatchData;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updateShipment(
      String token, Map<String, dynamic> shipmentData) {
    final $url = '/api/v1/updateshipment/${token}';
    final $body = shipmentData;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> acceptShipmentJob(int shipmentId, String token) {
    final $url = '/api/v1/acceptthejob/${shipmentId}/${token}';
    final $request = Request('PUT', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> pickupShipmentJob(
      String token, int shipmentId, Map<String, dynamic> shipmentData) {
    final $url = '/api/v1/pickupthejob/${shipmentId}/${token}';
    final $body = shipmentData;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> dropoffShipmentJob(
      String token, int shipmentId, Map<String, dynamic> shipmentData) {
    final $url = '/api/v1/dropoffthejob/${shipmentId}/${token}';
    final $body = shipmentData;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> enRoute(
      String token, int shipmentId, Map<String, dynamic> shipmentData) {
    final $url = '/api/v1/onthewaytopickup/${shipmentId}/${token}';
    final $body = shipmentData;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> arrived(
      String token, int shipmentId, Map<String, dynamic> shipmentData) {
    final $url = '/api/v1/arriveattheshipper/${shipmentId}/${token}';
    final $body = shipmentData;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> pickUpLoad(
      String token, int shipmentId, Map<String, dynamic> shipmentData) {
    final $url = '/api/v1/loadandleave/${shipmentId}/${token}';
    final $body = shipmentData;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> reportIncident(
      String token, Map<String, dynamic> reportData) {
    final $url = '/api/v1/reportincident/${token}';
    final $body = reportData;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getReportById(int reportId, String token) {
    final $url = '/api/v1/getincidentbyid/${reportId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllRncidents(String token) {
    final $url = '/api/v1/getallincidents/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> resolveReport(int reportId, String token) {
    final $url = '/api/v1/resolveincident/${reportId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> createChatroom(
      String token, Map<String, dynamic> chatRoomData) {
    final $url = '/api/v1/createchatroom/${token}';
    final $body = chatRoomData;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> addUsertoChatroom(
      String token, Map<String, dynamic> chatRoomData) {
    final $url = '/api/v1/assignchatroomuser/${token}';
    final $body = chatRoomData;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> sendMessage(
      String token, Map<String, dynamic> messageData) {
    final $url = '/api/v1/sendMessage/${token}';
    final $body = messageData;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> editMessage(
      String token, Map<String, dynamic> messageData) {
    final $url = '/api/v1/editMessage/${token}';
    final $body = messageData;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllChatroomsByUser(String token) {
    final $url = '/api/v1/getChatroomsbyuser/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getChatroomById(int chatRoomId, String token) {
    final $url = '/api/v1/getchatroombyid/${chatRoomId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> deleteChatroom(int chatRoomId, String token) {
    final $url = '/api/v1/deletechatroom/${chatRoomId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> generatePaystubs(
      String token, Map<String, dynamic> payPeriod) {
    final $url = '/api/v1/generatepaystubs/${token}';
    final $body = payPeriod;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getPaystubById(int paystudId, String token) {
    final $url = '/api/v1/getpaystubbyid/${paystudId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllPaystubsByUser(String token) {
    final $url = '/api/v1/getallpaystubsbyuser/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> generatePaystubsByWeek(String token) {
    final $url = '/api/v1/generatepaystubsbyweek/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> fcmtoken(
      String token, Map<String, dynamic> fcmInfo) {
    final $url = '/api/v1/updateuserfcmtoken/${token}';
    final $body = fcmInfo;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getallnotication(String token) {
    final $url = '/api/v1/getallnotificationbyiduser/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> deleteNotification(String id, String token) {
    final $url = '/api/v1/deletenotif/${id}/${token}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getnotificationbyid(
      int notificationId, String token) {
    final $url = '/api/v1/getnotificationbyid/${notificationId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getNotificationByUser(int userId, String token) {
    final $url = '/api/v1/getnotificationbyuserid/${userId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> markNotificationIsRead(
      int notificationId, String token) {
    final $url = '/api/v1/deletenotifafterview/${notificationId}/${token}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
