import 'package:flutter/material.dart';

class BottomSheetDemo extends StatefulWidget {
  const BottomSheetDemo({super.key});

  @override
  State<BottomSheetDemo> createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  bool isSelected = false;
  int selectedIndex = 0;
  List<int> tickets = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
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
                    SizedBox(height: 10),
                    Expanded(
                      child: StatefulBuilder(
                        builder: (BuildContext context,
                            void Function(void Function()) setState) {
                          return ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: tickets.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 5),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = index;
                                      });
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: selectedIndex == index
                                              ? Colors.red
                                              : Colors.transparent),
                                      child: Center(
                                          child: Text('${tickets[index]}',
                                              style: isSelected
                                                  ? TextStyle(
                                                      color: Colors.white)
                                                  : TextStyle(
                                                      color: Colors.black))),
                                    ),
                                  ),
                                );
                              });
                        },
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
