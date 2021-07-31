import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shuttleuserapp/models/users.dart';

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
    // u = Provider.of<Users>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("hiiii"),
      ),
    );
  }
}
