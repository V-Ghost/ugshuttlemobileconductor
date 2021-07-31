import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shuttleuserapp/models/users.dart';
import 'package:shuttleuserapp/pages/innerPages/busPage.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with WidgetsBindingObserver {
  final Geolocator geolocator = Geolocator();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Position _currentPosition;
  StreamSubscription positionStream;
  Users u;
  User user;
  int _selectedIndex = 0;
  //static List<Widget> _widgetOptions = <Widget>[MapPage(), Pay(), History()];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isLocationServiceEnabled;
  LocationPermission permission;
  double height;
  Future _dialog;
  SharedPreferences myPrefs;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  StreamSubscription iosSubscription;
  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser;

    WidgetsBinding.instance.addObserver(this);

    u = Provider.of<Users>(context, listen: false);

    const oneSec = const Duration(seconds: 40);
    // new Timer.periodic(oneSec, (Timer t) =>  DatabaseService(uid : user.uid).onlineUpdate());
    print('first');
    // final databaseReference = FirebaseDatabase.instance
    //     .reference()
    //     .child("userInfo")
    //     .child("userStatus")
    //     .child(user.uid);

    // databaseReference.onDisconnect().update({
    //   'status': 'offline',
    //   'lastChanged': DateTime.now().toUtc().toString()
    // }).then((_) async {});

    super.initState();
  }

  @override
  void dispose() {
    positionStream?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      print("object");
      _listenForLocation(context);
    }
  }

  _listenForLocation(BuildContext context) async {
    isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (isLocationServiceEnabled) {
      // setState(() {

      // });
      if (_dialog != null) {
        Navigator.of(context).pop();
        _dialog = null;
      }

      var geolocator = Geolocator();
// var options = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);

      Geolocator.getPositionStream(
              desiredAccuracy: LocationAccuracy.best, distanceFilter: 1)
          .listen((position) {
        var speedInMps = position.speed;

        print(speedInMps);
        // DatabaseService(uid: user.uid).updateSpeed(speedInMps);
      });

      // permission = await Geolocator.requestPermission();
      positionStream = Geolocator.getPositionStream(
              desiredAccuracy: LocationAccuracy.best, distanceFilter: 1)
          .listen((Position position) {
        print(position.latitude);
        //DatabaseService(uid: user.uid).updatelocation(position);
      });
    } else {
      if (_dialog == null) {
        _dialog = showMyDialog(context);
        await _dialog;
        print('found');
      } else {
        //do nothing
        print('not found');
      }
      print("falsee");
    }
  }

  checkPermissionsAndLocation() async {
    isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    permission = await Geolocator.requestPermission();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    _listenForLocation(context);
    //  print(firstRun.firstRun);
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          await SystemNavigator.pop();
        },
        child: Scaffold(
          key: _scaffoldKey,

          // drawer: Drawer(
          //   child: ListView(
          //     padding: EdgeInsets.zero,
          //     children: <Widget>[
          //       DrawerHeader(
          //         padding: const EdgeInsets.only(
          //             top: 30, bottom: 30, left: 90, right: 90),
          //         child: CircleAvatar(
          //           radius: 2,
          //           backgroundImage: NetworkImage("${u.picture}"),
          //           backgroundColor: Colors.purple,
          //         ),
          //         decoration: BoxDecoration(
          //             // color: Colors.white,
          //             ),
          //       ),
          //       ListTile(
          //         title: Text('Log Out'),
          //         leading: Icon(
          //           CupertinoIcons.fullscreen_exit,
          //           color: Colors.grey,
          //           semanticLabel: 'Text to announce in accessibility modes',
          //         ),
          //         onTap: () async {

          //           await  _auth.signOut();

          //             Navigator.push(
          //                     context,
          //                     CupertinoPageRoute(
          //                         settings: RouteSettings(name: "Foo"),
          //                         builder: (context) => LoginUI()),
          //                   );

          //         },
          //       ),

          //     ],
          //   ),
          // ),
          // floatingActionButton: FloatingActionButton(
          //   child: Text("LOGOUT !!!"),
          //   onPressed: () {
          //     final FirebaseAuth _auth = FirebaseAuth.instance;

          //     _auth.signOut();
          //     runApp(MyApp());
          //     // Navigator.popUntil(context, ModalRoute.withName('/gettingStarted'));
          //   },
          // ),
          body: BusPage(),

          // Center(
          //   child: _widgetOptions.elementAt(_selectedIndex),
          // ),
          // bottomNavigationBar: BottomNavigationBar(
          //   items: const <BottomNavigationBarItem>[
          //     BottomNavigationBarItem(
          //       icon: Icon(
          //         CupertinoIcons.location_solid,
          //         size: 30,
          //       ),
          //       title: Text('Brim'),
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(
          //         Icons.payment,
          //         size: 30,
          //       ),
          //       title: Text('Pay'),
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(
          //        Icons.history,
          //         size: 30,
          //       ),
          //       title: Text('History'),
          //     ),
          //   ],
          //   currentIndex: _selectedIndex,
          //   selectedItemColor: Colors.purple,
          //   unselectedItemColor: Colors.black,
          //   type: BottomNavigationBarType.fixed,
          //   showSelectedLabels: false,
          //   showUnselectedLabels: false,
          //   backgroundColor: Colors.white,
          //   elevation: 0,
          //   onTap: _onItemTapped,
          // ),
        ),
      ),
    );
  }

  Future showMyDialog(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Location Error'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("please turn on location setting"),
              ],
            ),
          ),
          actions: <Widget>[
            // GestureDetector(
            //   child: Text('Close'),
            //   onTap: () {
            //     Navigator.of(context).pop();
            //   },
            // ),

            GestureDetector(
              child: Text('go to setting'),
              onTap: () async {
                await Geolocator.openLocationSettings();
              },
            ),
          ],
        );
      },
    );
  }
}
