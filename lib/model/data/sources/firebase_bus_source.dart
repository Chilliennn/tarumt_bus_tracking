import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseBusSource {
  final FirebaseDatabase _db = FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL:
        'https://tarumt-bus-default-rtdb.asia-southeast1.firebasedatabase.app',
  );

  // Returns a stream of raw data from the 'active_buses' node
  Stream<DatabaseEvent> watchBusLocation(String busId) {
    return _db.ref('active_buses/$busId').onValue;
  }
}
