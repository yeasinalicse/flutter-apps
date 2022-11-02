import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:network_info_app/NetworkInfo.dart';

class MapPage extends StatefulWidget {

  final NetworkInfo? networkInfo;

  MapPage({Key? key, @required this.networkInfo}) : super(key: key);

  @override
  _Mapview createState() => _Mapview(networkInfo);
}
class _Mapview extends  State<MapPage> {
  NetworkInfo? networkInfo;
  _Mapview(this.networkInfo);
  static  LatLng _mapCenterPoint =
  LatLng(0, 0);
  double latitude=0;
  double longitude=0;

  static final CameraPosition _kInitialPosition =
  CameraPosition(target: _mapCenterPoint, zoom: 16.0, tilt: 0, bearing: 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      latitude =  double.parse('${networkInfo?.latitude}');
      longitude =  double.parse('${networkInfo?.longitude}');
      _mapCenterPoint =
          LatLng(latitude,longitude);
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('${networkInfo?.regionName}'),
      ),
      body: GoogleMap(
        initialCameraPosition: _kInitialPosition,
        markers: _createMarker(),
      ),
    );
  }

  Set<Marker> _createMarker() {
    return {
      Marker(
          markerId: MarkerId('${networkInfo?.regionName}'),
          position: _mapCenterPoint,
          infoWindow: InfoWindow(title: '${networkInfo?.regionName}')),
    };
  }
}