import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shuttleuserapp/models/users.dart';

class DatabaseService {
  final String shuttleuid;
  DatabaseService({this.shuttleuid});
  final CollectionReference shuttleCollection =
      FirebaseFirestore.instance.collection('shuttles');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  getShuttleId() async {
    try {
      await FirebaseFirestore.instance
          .collection('shuttles')
          .doc(shuttleuid)
          .get();
      return true;
    } catch (error) {
      print(error.toString());
      return error.toString();
    }
  }

  toggleSeatState() {}

  Future<dynamic> updatelocation(Position position) async {
    try {
      await FirebaseFirestore.instance
          .collection('shuttles')
          .doc(shuttleuid)
          .update({
        'latitude': position.latitude,
        'longitude': position.longitude,
      });
      return true;
    } catch (error) {
      print(error.toString());
      return error.toString();
    }
  }

  Future<dynamic> updateSpeed(double speed) async {
    try {
      await shuttleCollection.doc(shuttleuid).update({
        'speed': speed,
      });
      return true;
    } catch (error) {
      print(error.toString());
      return error.toString();
    }
  }

  Future loginIn(Users u) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: u.userName, password: u.password);

      var result = await FirebaseFirestore.instance
          .collection('shuttles')
          .doc(u.regNo)
          .get();
      if (result.exists) {
        await FirebaseFirestore.instance
            .collection('employees')
            .doc(userCredential.user.uid)
            .update({"shuttle": u.regNo});
      } else {
        await _auth.signOut();
        throw Exception("Shuttle does not exist in database");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
      return e.message;
    } catch (e) {
      return e.message;
    }
  }

  Future<void> signOut() async {
    try {
      //  await FirebaseDatabase.instance
      //     .reference()
      //     .child("userInfo")
      //     .child("userStatus").child(uid).remove();
      await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
