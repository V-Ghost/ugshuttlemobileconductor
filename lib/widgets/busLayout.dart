import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shuttleuserapp/models/users.dart';
import 'seats.dart';

class BusLayout extends StatefulWidget {
  const BusLayout({Key key}) : super(key: key);

  @override
  _BusLayoutState createState() => _BusLayoutState();
}

class _BusLayoutState extends State<BusLayout> {
  Users u;

  listenSeatStateChange() {
    // CollectionReference reference = FirebaseFirestore.instance
    //     .collection('shuttles')
    //     .doc(u.regNo)
    //     .collection("seats");
    // reference.snapshots().listen((querySnapshot) {
    //   querySnapshot.docChanges.forEach((change) {
    //     print("we dey");
    //     print(change.doc.data());
    //   });
    // });
  }

  @override
  void initState() {
    u = Provider.of<Users>(context, listen: false);

    listenSeatStateChange();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 40, bottom: 80),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Column(
                children: [
                  Seats(),
                  Seats(),
                  Seats(),
                  Seats(),
                  Seats(),
                  SizedBox(
                    height: 60,
                  ),
                  Seats(),
                  Seats(),
                  Seats(),
                  SizedBox(
                    height: 150,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: RotatedBox(quarterTurns: -1, child: Seats()),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: RotatedBox(quarterTurns: -1, child: Seats()),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: RotatedBox(quarterTurns: -1, child: Seats()),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: RotatedBox(quarterTurns: -1, child: Seats()),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Seats(),
                Seats(),
                Seats(),
                Seats(),
                Seats(),
                SizedBox(
                  height: 60,
                ),
                Seats(),
                Seats(),
                Seats(),
              ],
            ),
            Column(
              children: [
                Seats(),
              ],
            ),
            Column(
              children: [
                Seats(),
                Seats(),
                Seats(),
                Seats(),
                Seats(),
                SizedBox(
                  height: 60,
                ),
                Seats(),
                Seats(),
                Seats(),
                Seats(),
                Seats(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40.0),
              child: Column(
                children: [
                  Seats(),
                  Seats(),
                  Seats(),
                  Seats(),
                  Seats(),
                  SizedBox(
                    height: 60,
                  ),
                  Seats(),
                  Seats(),
                  Seats(),
                  Seats(
                    color: Colors.green,
                  ),
                  Seats(),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: RotatedBox(quarterTurns: 1, child: Seats()),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: RotatedBox(quarterTurns: 1, child: Seats()),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: RotatedBox(quarterTurns: 1, child: Seats()),
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
