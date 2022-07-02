import 'package:cle_app/util/config/config.dart';
import 'package:cle_app/widgets/cards/quick_info_tile.dart';
import 'package:flutter/material.dart';

class QuickInfoCard extends StatelessWidget {
  final String title;
  final String trailNum;
  final GlobalKey<QuickInfoTileState> tileKey;
  const QuickInfoCard({
    Key? key,
    required this.tileKey,
    required this.title,
    required this.trailNum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: QuickInfoTile(
          key: tileKey,
          title: Text(
            title,
            style: const TextStyle(fontSize: 24),
          ),
          trailing: Text(
            trailNum,
            style: const TextStyle(fontSize: 24),
          ),
          children: [
            ListTile(
              leading: const Icon(
                Icons.local_shipping_outlined,
              ),
              title: const Text(
                'Western Star 4700',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                '#22654',
                style: TextStyle(fontSize: 16),
              ),
              trailing: const Icon(
                Icons.check_circle_outlined,
                color: Colors.green,
              ),
              onTap: () {},
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(
                color: Palette.red,
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.local_shipping_outlined,
              ),
              title: const Text(
                'Mack Pinnacle',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                '#72454',
                style: TextStyle(fontSize: 16),
              ),
              trailing: const Icon(
                Icons.check_circle_outlined,
                color: Colors.green,
              ),
              onTap: () {},
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(
                color: Palette.red,
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.local_shipping_outlined,
              ),
              title: const Text(
                'Peterbilt Model 579',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                '#12384',
                style: TextStyle(fontSize: 16),
              ),
              trailing: const Icon(
                Icons.error_outline_outlined,
                color: Colors.red,
              ),
              onTap: () {},
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(
                color: Palette.red,
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.local_shipping_outlined,
              ),
              title: const Text(
                'Peterbilt Model 579',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                '#49223',
                style: TextStyle(fontSize: 16),
              ),
              trailing: const Icon(
                Icons.error_outline_outlined,
                color: Colors.red,
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
