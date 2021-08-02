class Seats {
  String avaliable;
  String id;
  Seats();
  Seats.fromMap(Map<String, dynamic> data) {
    avaliable = data["avaliable"];
    id = data["id"];
  }
}
