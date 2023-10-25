import 'package:flutter/material.dart';

class BottomSheetDemo extends StatefulWidget {
  const BottomSheetDemo({super.key});

  @override
  State<BottomSheetDemo> createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () {
            showModalBottomSheet(
              showDragHandle: true,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              context: context,
              builder: (BuildContext context) {
                return Column(
                  children: [
                    const Text(
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
                          StatefulBuilder(
                            builder: (BuildContext context, Function setState) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    isSelected = true;
                                    print('ISSELECTED ? $isSelected');
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: isSelected
                                          ? Colors.red
                                          : Colors.transparent),
                                  child: Center(
                                      child: Text('1',
                                          style: isSelected
                                              ? TextStyle(color: Colors.white)
                                              : TextStyle(
                                                  color: Colors.black))),
                                ),
                              );
                            },
                          ),
                          StatefulBuilder(
                            builder: (BuildContext context, Function setState) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    isSelected = true;
                                    print('ISSELECTED ? $isSelected');
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: isSelected
                                          ? Colors.red
                                          : Colors.transparent),
                                  child: Center(
                                      child: Text('2',
                                          style: isSelected
                                              ? TextStyle(color: Colors.white)
                                              : TextStyle(
                                                  color: Colors.black))),
                                ),
                              );
                            },
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
                    ),
                  ],
                );
              },
            );
          },
          child: Text('Book Tickets')),
    ));
  }
}

Widget roundShape() {
  return Container(
    height: 50,
    width: 25,
    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
  );
}
