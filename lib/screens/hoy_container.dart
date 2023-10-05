import 'package:flutter/material.dart';

class Hoycontainer extends StatefulWidget {
  const Hoycontainer({super.key});

  @override
  State<Hoycontainer> createState() => _HoycontainerState();
}

class _HoycontainerState extends State<Hoycontainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 125,
            width: double.infinity,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 196, 223, 245),
                borderRadius: BorderRadius.circular(10)),
            child: Stack(alignment: Alignment.center, children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.info),
                  SizedBox(width: 15),
                  Flexible(
                    child: Text(
                        'A professional is a member of a profession or any person who works in a specified professional activity. The term also describes the standards of education and training that prepare members of the profession.'),
                  )
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
