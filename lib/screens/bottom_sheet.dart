import 'package:flutter/material.dart';

class BottomSheetDemo extends StatefulWidget {
  const BottomSheetDemo({super.key});

  @override
  State<BottomSheetDemo> createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () {
            showModalBottomSheet(
              showDragHandle: true,
              context: context,
              builder: (BuildContext context) {
                return Column(
                  children: [
                    Text(
                      'How many seats?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 50),
                    Image.asset(
                      'assets/images/scooter.png',
                      height: 100,
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 20, left: 20, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '1',
                          ),
                          Text(
                            '2',
                          ),
                          Text(
                            '3',
                          ),
                          Text(
                            '4',
                          ),
                          Text(
                            '5',
                          ),
                          Text(
                            '6',
                          ),
                          Text(
                            '7',
                          ),
                          Text(
                            '8',
                          ),
                          Text(
                            '9',
                          ),
                          Text(
                            '10',
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            );
          },
          child: Text('Book Tickets')),
    ));
  }
}
