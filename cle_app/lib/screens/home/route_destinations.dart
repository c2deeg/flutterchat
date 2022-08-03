import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final routeDestinations = [
  const AppDestination(
    icon: FontAwesomeIcons.mapLocationDot,
    title: "Map",
  ),
  const AppDestination(
    icon: FontAwesomeIcons.gaugeHigh,
    title: "Dashboard",
  ),
  const AppDestination(
    icon: FontAwesomeIcons.truckRampBox,
    title: "Shipments",
  ),
  const AppDestination(
    icon: FontAwesomeIcons.solidMessage,
    title: "Chat",
  ),
  const AppDestination(
    icon: FontAwesomeIcons.warehouse,
    title: "My Trucks",
  ),
  const AppDestination(
    icon: FontAwesomeIcons.solidUser,
    title: "Account",
  ),
  const AppDestination(
    icon: FontAwesomeIcons.solidBell,
    title: "Notifications",
  ),
  const AppDestination(
    icon: FontAwesomeIcons.triangleExclamation,
    title: "Report",
  ),
];

class AppDestination {
  final IconData icon;
  final String title;

  const AppDestination({required this.icon, required this.title});
}
