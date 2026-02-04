import '../models/bus_model.dart';
import '../sources/firebase_bus_source.dart';

class BusRepository {
  final FirebaseBusSource _source = FirebaseBusSource();

  Stream<BusModel> getBusStream(String busId) {
    return _source.watchBusLocation(busId).map((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>;
      return BusModel.fromMap(busId, data);
    });
  }
}
