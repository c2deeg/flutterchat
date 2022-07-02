import 'package:flutter/material.dart';

class DriverStatusMenuButton extends StatefulWidget {
  const DriverStatusMenuButton({
    Key? key,
  }) : super(key: key);

  @override
  State<DriverStatusMenuButton> createState() => _DriverStatusMenuButtonState();
}

class _DriverStatusMenuButtonState extends State<DriverStatusMenuButton> {
  List<String> statusOptions = [
    'OFFLINE',
    'AVALAIBLE',
    'IN TRANSIT',
    'LOADING',
    'UNLOADING',
  ];

  String selectedStatusOption = 'IN TRANSIT';

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 130),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            offset: Offset.zero,
            color: Colors.black.withOpacity(0.2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        child: DropdownButton<String>(
            underline: Container(),
            icon: const Icon(
              Icons.expand_more,
              // color: secondaryColor,
            ),
            value: selectedStatusOption,
            items: statusOptions
                .map((option) => DropdownMenuItem<String>(
                      value: option,
                      child: Text(
                        option,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          // color: secondaryColor,
                        ),
                      ),
                    ))
                .toList(),
            onChanged: (option) {
              setState(() {
                selectedStatusOption = option!;
              });
            }),
      ),
    );
  }
}
