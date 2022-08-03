import 'package:cle_app/data/database/local_database/database.dart';
import 'package:cle_app/widgets/cards/expandable_card.dart';
import 'package:flutter/material.dart';

class VehicleList extends StatelessWidget {
  final List<Vehicle> vehicles;
  final String type;
  const VehicleList({Key? key, required this.vehicles, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (vehicles.isEmpty) {
      return Expanded(
        child: ListView(
          children: [
            Center(
              child: Text(
                'No $type Found',
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      );
    }
    return Expanded(
      child: ListView.builder(
          itemCount: vehicles.length,
          itemBuilder: (_, index) {
            final vehicle = vehicles[index];
            return ExpandableCard(
              childPadding: EdgeInsets.zero,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('#${vehicle.number}'),
                  const SizedBox(
                    width: 8,
                  ),
                  Flexible(
                    child: Text(
                      '${vehicle.make} ${vehicle.model}',
                      style: const TextStyle(
                        fontSize: 17,
                        letterSpacing: .6,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              child: ListTile(
                title: Text('Vin: ${vehicle.vin}'),
                subtitle: Text.rich(
                  TextSpan(
                    text:
                        'Max Capacity: ${vehicle.maxTow} lbs\nCurb Weight: ${vehicle.curbWeight} lbs',
                  ),
                ),
              ),
            );
          }),
    );
  }
}
