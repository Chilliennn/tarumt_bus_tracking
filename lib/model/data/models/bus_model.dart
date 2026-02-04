class BusModel {
  final String id;
  final double latitude;
  final double longitude;
  final String status;
  final int occupancy;

  BusModel({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.status,
    required this.occupancy,
  });

  factory BusModel.fromMap(String id, Map<dynamic, dynamic> map) {
    return BusModel(
      id: id,
      latitude: (map['latitude'] as num).toDouble(),
      longitude: (map['longitude'] as num).toDouble(),
      status: map['status'] ?? 'Unknown',
      occupancy: map['occupancy'] ?? 0,
    );
  }
}
