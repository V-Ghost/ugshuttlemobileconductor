import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shuttleuserapp/models/users.dart';

class Seats extends StatefulWidget {
  final Color color;
  final String id;

  Seats({this.color, this.id});

  @override
  _SeatsState createState() => _SeatsState();
}

class _SeatsState extends State<Seats> {
  Users u;
  bool available;
  getSeatStateChange() async {
    var result = await FirebaseFirestore.instance
        .collection('shuttles')
        .doc(u.regNo)
        .collection("seats")
        .doc("AR3")
        .get();

    print(result.data()["available"]);
    if (result.data()["available"] == true) {
      available = true;
    } else {
      available = false;
    }
  }

  @override
  void initState() {
    u = Provider.of<Users>(context, listen: false);

    // listenSeatStateChange();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getSeatStateChange(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Column(
                  children: [
                    Icon(Icons.error),
                    Text(
                      snapshot.error.toString(),
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    )
                  ],
                ),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return InkWell(
              onTap: () {
                if (available) {
                } else {}
                setState(() {});
              },
              child: Padding(
                padding: EdgeInsets.only(right: 5),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      left: 10,
                    ),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: available ? Colors.green : Colors.grey,
                        // border: Border(bottom: BorderSide()),
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(100.0),
                          topRight: const Radius.circular(100.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
          return CircularProgressIndicator();
        });
  }
}
