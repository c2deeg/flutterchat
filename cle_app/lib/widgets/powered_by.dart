import 'package:cle_app/util/config/config.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PoweredByUs extends StatelessWidget {
  final Color color;
  const PoweredByUs({Key? key, this.color = Palette.red}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.padding,
      child: GestureDetector(
          onLongPress: () async {
            final url = Uri.parse('https://tainosystems.com/');
            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            }
          },
          child: Text(
            "POWERED BY TAINO SYSTEMS INC.",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color,
              letterSpacing: 1,
            ),
          )),
    );
  }
}
