import 'dart:io';
import 'package:http/io_client.dart';

import 'package:chopper/chopper.dart';
part 'client.chopper.dart';

@ChopperApi(baseUrl: '/tnslogisticsapi')
abstract class ApiClient extends ChopperService {
  //Ping------------------------------------------------------------------------------------------------
  @Get(path: "/ping")
  Future<Response> ping();

  //Authentication------------------------------------------------------------------------------------------------
  @Post(path: "/login")
  Future<Response> login(@Body() Map<String, dynamic> loginInfo);

  @Get(path: "/logout/{token}")
  Future<Response> logout(@Path('token') String token);

  @Get(path: "/iftokenvalid/{token}")
  Future<Response> isTokenValid(@Path('token') String token);

  //Users------------------------------------------------------------------------------------------------
  @Post(path: "/changepassword/{token}")
  Future<Response> changePassword(
      @Path('token') String token, @Body() Map<String, dynamic> newPassword);

  @Post(path: "/createuser/{token}")
  Future<Response> createUser(
      @Path('token') String token, @Body() Map<String, dynamic> userData);

  @Put(path: "/updateuser/{token}")
  Future<Response> updateUser(
      @Path('token') String token, @Body() Map<String, dynamic> userData);

  @Put(path: "/deleteuser/{id}/{token}", optionalBody: true)
  Future<Response> deleteUser(
      @Path(
    'id',
  )
          int userId,
      @Path(
    'token',
  )
          String token);

  @Put(path: "/activateuser/{id}/{token}", optionalBody: true)
  Future<Response> activateUser(
      @Path(
    'id',
  )
          int userId,
      @Path(
    'token',
  )
          String token);

  @Get(path: "/resetpassword/{id}/{token}")
  Future<Response> resetPassword(
      @Path(
    'id',
  )
          int userId,
      @Path(
    'token',
  )
          String token);

  @Get(path: "/getuserbyid/{id}/{token}")
  Future<Response> getUserById(
      @Path(
    'id',
  )
          int userId,
      @Path(
    'token',
  )
          String token);

  @Get(path: "/getalluser/{token}")
  Future<Response> getAllUsers(@Path('token') String token);

  @Get(path: "/getuserbyrole/{id}/{token}")
  Future<Response> getUsersByRole(
      @Path(
    'id',
  )
          int roleId,
      @Path(
    'token',
  )
          String token);

  //Vehicles------------------------------------------------------------------------------------------------
  @Post(path: "/addtruck/{token}")
  Future<Response> addNewTruck(
      @Path('token') String token, @Body() Map<String, dynamic> newTruckData);

  @Post(path: "/addtrailer/{token}")
  Future<Response> addNewTrailer(
      @Path('token') String token, @Body() Map<String, dynamic> newTrailerData);

  @Get(path: "/getvehicle/{id}/{token}")
  Future<Response> getVehicle(
      @Path('id') int vehicleId, @Path('token') String token);

  @Get(path: "/getvehicles/{token}")
  Future<Response> getAllVehicles(@Path('token') String token);

  @Get(path: "/getalltrucks/{token}")
  Future<Response> getAllTrucks(@Path('token') String token);

  @Get(path: "/getalltrailers/{token}")
  Future<Response> getAllTrailers(@Path('token') String token);

  @Get(path: "/getallemptytrucks/{token}")
  Future<Response> getAllAvailableTrucks(@Path('token') String token);

  @Get(path: "/getalloutofservicetrucks/{token}")
  Future<Response> getAllOutOfServiceTrucks(@Path('token') String token);

  @Get(path: "/associatevehicletodriver/{vehicleId}/{driverId}/{token}")
  Future<Response> assigneTruckToDriver(@Path('vehicleId') int vehicleId,
      @Path('driverId') int driverId, @Path('token') String token);

  @Get(path: "/putvehicleoutofservice/{vehicleId}/{token}")
  Future<Response> markVehicleOutOfService(
      @Path('vehicleId') int vehicleId, @Path('token') String token);

  @Put(path: "/updatetruck/{token}")
  Future<Response> updateTruck(
      @Path('token') String token, @Body() Map<String, dynamic> truckData);

  @Put(path: "/updatetrailer/{token}")
  Future<Response> updateTrailer(
      @Path('token') String token, @Body() Map<String, dynamic> trailerData);

  @Put(
      path: "/associatetrailertotruck/{idtrailer}/{idtruck}/{token}",
      optionalBody: true)
  Future<Response> pairTrailerToTruck(@Path('idtrailer') int trailerId,
      @Path('idtruck') int truckId, @Path('token') String token);

  @Put(
      path: "/deassociatetrailertotruck/{idtrailer}/{idtruck}/{token}",
      optionalBody: true)
  Future<Response> unpairTrailerToTruck(@Path('idtrailer') int trailerId,
      @Path('idtruck') int truckId, @Path('token') String token);

  //Loads------------------------------------------------------------------------------------------------

  @Post(path: "/addload/{token}")
  Future<Response> addNewLoad(
      @Path('token') String token, @Body() Map<String, dynamic> loadData);

  @Post(path: "/loadnotdelivered/{token}")
  Future<Response> markLoadNotDelivered(@Path('token') String token,
      @Body() Map<String, dynamic> notDeliveredData);

  @Put(path: "/updateload/{token}")
  Future<Response> updateLoad(
      @Path('token') String token, @Body() Map<String, dynamic> loadData);

  @Get(path: "/getloadbyid/{id}/{token}")
  Future<Response> getLoadById(
      @Path('id') int loadId, @Path('token') String token);

  @Get(path: "/getallloads/{token}")
  Future<Response> getAllLoads(@Path('token') String token);

  @Get(path: "/loadsummaryfordriver/{id}/{token}")
  Future<Response> getLoadSummaryForDriver(
      @Path('id') int driverId, @Path('token') String token);

  @Get(path: "/getallpendingshipmentsbyuser/{id}/{token}")
  Future<Response> getAllPendingShipmentsByUser(
      @Path('id') int driverId, @Path('token') String token);

  @Get(path: "/getallpendingshipmentsbyuser{token}")
  Future<Response> getAllPendingShipments(@Path('token') String token);

  @Get(path: "/allnotdeliveredloads/{token}")
  Future<Response> getAllNotDeliveredLoads(@Path('token') String token);

  @Get(path: "/dipatchpendingloads/{id}/{token}")
  Future<Response> dipatchPendingLoad(
      @Path('id') int loadId, @Path('token') String token);

  @Get(path: "/viewnotdeliveredloads/{id}/{token}")
  Future<Response> getNotDeliveredLoad(
      @Path('id') int loadId, @Path('token') String token);

  @Get(path: "/recorverloadissue/{id}/{token}")
  Future<Response> getNotDeliveredReason(
      @Path('id') int loadId, @Path('token') String token);

  @Get(path: "/getloadsbystatus/{status}/{token}")
  Future<Response> getLoadsByStatus(
      @Path('status') String loadStatus, @Path('token') String token);

  @Get(path: "/getallstatus/{token}")
  Future<Response> getAllStatus(@Path('token') String token);

  //Shipments------------------------------------------------------------------------------------------------

  @Get(path: "/getallshipments/{token}")
  Future<Response> getAllShipments(@Path('token') String token);

  @Get(path: "/getshipmentbyid/{id}/{token}")
  Future<Response> getShipmentById(
      @Path('id') int shipmentId, @Path('token') String token);

  @Get(path: "/getallshipmentsbyuser/{id}/{token}")
  Future<Response> getShipmentsByUser(
      @Path('id') int userId, @Path('token') String token);

  @Get(path: "/lastlocationofvehicle/{id}/{token}")
  Future<Response> getLastLocationOfVehicle(
      @Path('id') int userId, @Path('token') String token);

  @Get(path: "/attachloadstojob/{idload}/{idjob}/{token}")
  Future<Response> attachLoadstoJob(@Path('idload') int loadId,
      @Path('idjob') int shipmentId, @Path('token') String token);

  @Post(path: "/dispatch/{token}")
  Future<Response> dispatch(
      @Path('token') String token, @Body() Map<String, dynamic> dispatchData);

  @Put(path: "/updateshipment/{token}")
  Future<Response> updateShipment(
      @Path('token') String token, @Body() Map<String, dynamic> shipmentData);

  @Put(path: "/acceptthejob/{id}/{token}")
  Future<Response> acceptShipmentJob(@Path('token') String token,
      @Path('id') String shipmentId, @Body() Map<String, dynamic> shipmentData);

  @Put(path: "/pickupthejob/{id}/{token}")
  Future<Response> pickupShipmentJob(@Path('token') String token,
      @Path('id') String shipmentId, @Body() Map<String, dynamic> shipmentData);

  @Put(path: "/dropoffthejob/{id}/{token}")
  Future<Response> dropoffShipmentJob(@Path('token') String token,
      @Path('id') String shipmentId, @Body() Map<String, dynamic> shipmentData);

  @Put(path: "/onthewaytopickup/{id}/{token}")
  Future<Response> enRoute(@Path('token') String token,
      @Path('id') String shipmentId, @Body() Map<String, dynamic> shipmentData);

  @Put(path: "/arriveattheshipper/{id}/{token}")
  Future<Response> arrived(@Path('token') String token,
      @Path('id') String shipmentId, @Body() Map<String, dynamic> shipmentData);

  @Put(path: "/loadandleave/{id}/{token}")
  Future<Response> pickUpLoad(@Path('token') String token,
      @Path('id') String shipmentId, @Body() Map<String, dynamic> shipmentData);

  //Reports------------------------------------------------------------------------------------------------

  @Post(path: "/reportincident/{token}")
  Future<Response> reportIncident(
      @Path('token') String token, @Body() Map<String, dynamic> reportData);

  @Get(path: "/getincidentbyid/{id}/{token}")
  Future<Response> getReportById(
      @Path('id') int reportId, @Path('token') String token);

  @Get(path: "/getallincidents/{token}")
  Future<Response> getAllRncidents(@Path('token') String token);

  @Get(path: "/resolveincident/{id}/{token}")
  Future<Response> resolveReport(
      @Path('id') int reportId, @Path('token') String token);

  //Chatrooms------------------------------------------------------------------------------------------------
  @Post(path: "/createchatroom/{token}")
  Future<Response> createChatroom(
      @Path('token') String token, @Body() Map<String, dynamic> chatRoomData);

  @Post(path: "/assignchatroomuser/{token}")
  Future<Response> addUsertoChatroom(
      @Path('token') String token, @Body() Map<String, dynamic> chatRoomData);

  @Post(path: "/sendMessage/{token}")
  Future<Response> sendMessage(
      @Path('token') String token, @Body() Map<String, dynamic> messageData);

  @Post(path: "/editMessage/{token}")
  Future<Response> editMessage(
      @Path('token') String token, @Body() Map<String, dynamic> messageData);

  @Get(path: "/getChatroomsbyuser/{token}")
  Future<Response> getAllChatroomsByUser(@Path('token') String token);

  @Get(path: "/getchatroombyid/{id}/{token}")
  Future<Response> getChatroomById(
      @Path('id') int chatRoomId, @Path('token') String token);

  @Get(path: "/deletechatroom/{id}/{token}")
  Future<Response> deleteChatroom(
      @Path('id') int chatRoomId, @Path('token') String token);

  //Payroll------------------------------------------------------------------------------------------------

  @Post(path: "/generatepaystubs/{token}")
  Future<Response> generatePaystubs(
      @Path('token') String token, @Body() Map<String, dynamic> payPeriod);

  @Get(path: "/getpaystubbyid/{id}/{token}")
  Future<Response> getPaystubById(
      @Path('id') int paystudId, @Path('token') String token);

  @Get(path: "/getallpaystubsbyuser/{token}")
  Future<Response> getAllPaystubsByUser(@Path('token') String token);

  @Get(path: "/generatepaystubsbyweek/{token}")
  Future<Response> generatePaystubsByWeek(@Path('token') String token);

  //Notification------------------------------------------------------------------------------------------------

  @Get(path: "/getnotificationbyid/{id}/{token}")
  Future<Response> getnotificationbyid(
      @Path('id') int notificationId, @Path('token') String token);

  @Get(path: "/getnotificationbyuserid/{id}/{token}")
  Future<Response> getNotificationByUser(
      @Path('id') int userId, @Path('token') String token);

  @Get(path: "/deletenotifafterview/{id}/{token}")
  Future<Response> markNotificationIsRead(
      @Path('id') int notificationId, @Path('token') String token);
  // ----------------------------------------------------------------------------------------------------------
  static ApiClient create() {
    HttpClient httpClient = HttpClient();
    httpClient.badCertificateCallback =
        ((X509Certificate cert, String host, int port) {
      final isValidHost = host == "app.sysgestock.com";
      return isValidHost;
      // return false;
    });
    final ioClient = IOClient(httpClient);
    final client = ChopperClient(
        client: ioClient,
        baseUrl: 'https://app.sysgestock.com',
        services: [_$ApiClient()],
        converter: const JsonConverter(),
        interceptors: [HttpLoggingInterceptor()]);

    return _$ApiClient(client);
  }
}
