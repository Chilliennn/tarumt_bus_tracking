import 'package:flutter/material.dart';
import 'package:tarumt_bus_tracking/model/data/models/bus_model.dart';
import 'package:tarumt_bus_tracking/model/data/repositories/bus_repository.dart';

/// Simple test page to verify Firebase stream connectivity for a bus.
class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MapView — Firebase Stream Test')),
      body: Center(
        child: StreamBuilder<BusModel>(
          stream: BusRepository().getBusStream('bus_01'),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Stream error: ${snapshot.error}');
            }
            if (snapshot.hasData) {
              return Text('Bus Latitude: ${snapshot.data!.latitude}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
