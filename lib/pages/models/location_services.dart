import 'package:geolocator/geolocator.dart';

import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationServices {
  Future<String> getCoordinate() async {
    //memilih gps yang akurat
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);

    //mencari koordinat
    final coordinates = new Coordinates(position.latitude, position.longitude);
    //mendapatkan alamt
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var alamat = addresses.first;

    return alamat.addressLine.toString();

    
  }
}