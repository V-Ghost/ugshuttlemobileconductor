import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shuttleuserapp/models/users.dart';
import 'package:shuttleuserapp/pages/innerPages/ScanPage.dart';
import 'package:shuttleuserapp/widgets/busLayout.dart';
import 'package:shuttleuserapp/widgets/raisedGradientButton.dart';

class BusPage extends StatefulWidget {
  BusPage({Key key}) : super(key: key);

  @override
  _BusPageState createState() => _BusPageState();
}

class _BusPageState extends State<BusPage> {
  Users u;

  @override
  void initState() {
    // DatabaseService().signOut();
    u = Provider.of<Users>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.qr_code),
        backgroundColor: Colors.purple,
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => ScanPage()),
          );
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 10),
              child: Row(children: [
                Container(
                  child: Row(children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back_sharp,
                        color: Colors.grey,
                        size: 30,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.location_on,
                      color: Colors.grey,
                      size: 30,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Ticket",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ]),
                ),
                Expanded(
                  child: Container(),
                ),
              ]),
            ),
            SizedBox(
              height: 15,
            ),
            BusLayout(),
            // RaisedGradientButton(
            //     width: 200,
            //     child: Text(
            //       'Confirm Order',
            //       style: TextStyle(color: Colors.white),
            //     ),
            //     gradient: LinearGradient(
            //       colors: <Color>[Colors.purple[800], Colors.purple],
            //     ),
            //     onPressed: () async {}),
          ]),
        ),
      ),
    );
  }
}
