import 'package:flutter/material.dart';
import 'seats.dart';

class BusLayout extends StatelessWidget {
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
                    height: 120,
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
