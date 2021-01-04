import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:toast/toast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Set<Marker> _markers = <Marker>{};

  final CameraPosition _basePosition = CameraPosition(
    target: LatLng(37, -122),
    zoom: 14.4746,
  );

  void _showToast() {
    Toast.show("OnTap test", context, backgroundColor: Colors.red);
  }

  void _addMarkers() {
    _markers = <Marker>{
      Marker(
        markerId: MarkerId('1'),
        position: LatLng(37, -122),
        onTap: () => _showToast(),
      ),
      Marker(
        markerId: MarkerId('2'),
        position: LatLng(37.001, -122.001),
        onTap: () => _showToast(),
      ),
      Marker(
        markerId: MarkerId('3'),
        position: LatLng(36.99, -121.99),
        onTap: () => _showToast(),
      ),
      Marker(
        markerId: MarkerId('4'),
        position: LatLng(37.01, -122.01),
        onTap: () => _showToast(),
      ),
      Marker(
        markerId: MarkerId('5'),
        position: LatLng(37.004, -122.0056),
        onTap: () => _showToast(),
      ),
    };
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        markers: _markers,
        mapType: MapType.normal,
        initialCameraPosition: _basePosition,
        onMapCreated: (GoogleMapController controller) {
          _addMarkers();
        },
      ),
    );
  }
}
