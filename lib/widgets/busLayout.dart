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
                  Seats(id: "CL1"),
                  Seats(id: "CL3"),
                  Seats(id: "CL5"),
                  Seats(id: "CL7"),
                  Seats(id: "CL9"),
                  SizedBox(
                    height: 60,
                  ),
                  Seats(id: "BL1"),
                  Seats(id: "BL3"),
                  Seats(id: "BL5"),
                  SizedBox(
                    height: 155,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child:
                        RotatedBox(quarterTurns: -1, child: Seats(id: "AL1")),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child:
                        RotatedBox(quarterTurns: -1, child: Seats(id: "AL2")),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child:
                        RotatedBox(quarterTurns: -1, child: Seats(id: "AL3")),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child:
                        RotatedBox(quarterTurns: -1, child: Seats(id: "AL4")),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Seats(id: "CL2"),
                Seats(id: "CL4"),
                Seats(id: "CL6"),
                Seats(id: "CL8"),
                Seats(id: "CL10"),
                SizedBox(
                  height: 60,
                ),
                Seats(id: "BL2"),
                Seats(id: "BL4"),
                Seats(id: "BL6"),
              ],
            ),
            Column(
              children: [
                Seats(
                  id: "CM",
                ),
              ],
            ),
            Column(
              children: [
                Seats(id: "CR2"),
                Seats(id: "CR4"),
                Seats(id: "CR6"),
                Seats(id: "CR8"),
                Seats(id: "CR10"),
                SizedBox(
                  height: 60,
                ),
                Seats(id: "BR2"),
                Seats(id: "BR4"),
                Seats(id: "BR6"),
                Seats(id: "BR8"),
                Seats(id: "BR10"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40.0),
              child: Column(
                children: [
                  Seats(id: "CR1"),
                  Seats(id: "CR3"),
                  Seats(id: "CR5"),
                  Seats(id: "CR7"),
                  Seats(id: "CR9"),
                  SizedBox(
                    height: 60,
                  ),
                  Seats(id: "BR1"),
                  Seats(id: "BR3"),
                  Seats(id: "BR5"),
                  Seats(id: "BR7"),
                  Seats(id: "BR9"),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: RotatedBox(quarterTurns: 1, child: Seats(id: "AR1")),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: RotatedBox(quarterTurns: 1, child: Seats(id: "AR2")),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: RotatedBox(quarterTurns: 1, child: Seats(id: "AR3")),
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
