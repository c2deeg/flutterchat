import 'package:cle_app/data/database/local_database/database.dart';
import 'package:cle_app/widgets/cards/expandable_card.dart';
import 'package:flutter/material.dart';

class VehicleList extends StatelessWidget {
  final List<Vehicle> vehicles;
  const VehicleList({Key? key, required this.vehicles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (vehicles.isEmpty) {
      return const Center(
        child: Text('No Vehicle Found'),
      );
    }
    return Expanded(
      child: ListView.builder(
          itemCount: vehicles.length,
          itemBuilder: (_, index) {
            final vehicle = vehicles[index];
            return ExpandableCard(
              childPadding: EdgeInsets.zero,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('#${vehicle.number}'),
                  Text(
                    '${vehicle.make} ${vehicle.model}',
                    style: const TextStyle(
                      fontSize: 17,
                      letterSpacing: .6,
                    ),
                  ),
                ],
              ),
              child: ListTile(
                title: Text('Type: ${vehicle.type}'),
                subtitle: Text.rich(
                  TextSpan(
                    text:
                        'Vin: ${vehicle.vin}\nMax Capacity: ${vehicle.maxTow} lbs\nCurb Weight: ${vehicle.curbWeight} lbs',
                  ),
                ),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(elevation: 0),
                  child: const Text('View Details'),
                  onPressed: () {},
                ),
              ),
            );
          }),
    );
  }
}
