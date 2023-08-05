import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

///Determine the current position of the device.
///
///when the locatio servicees are not eneabled or permissions
///are denied the Future will return an error
///
Future<Position> determinePostion() async {
  bool serviceEnabled;
  LocationPermission permission;

  //Test if location services are enabled
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if(serviceEnabled){
    ///location sercices are not enabled don't continue accessing the position
    /// and request user of the app to enable location services
    return Future.error('Location Services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if(permission == LocationPermission.denied){
    permission = await Geolocator.requestPermission();
    if(permission == LocationPermission.denied){
      ///Permissions are denied, next time you could try requesting permissions again
      ///(this is also the point when androids will return true to having requested access to user location)
      return Future.error('Location permissions are denied');
    }
  }
  ///When we reach here, permissions are granted and we can continue accessing the position of the device
  return await Geolocator.getCurrentPosition();
}

///Getting the last know position 
Future<Position?> determineLastPostion() async {
  bool serviceEnabled;
  LocationPermission permission;

  //Test if location services are enabled
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if(serviceEnabled){
    ///location sercices are not enabled don't continue accessing the position
    /// and request user of the app to enable location services
    return Future.error('Location Services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if(permission == LocationPermission.denied){
    permission = await Geolocator.requestPermission();
    if(permission == LocationPermission.denied){
      ///Permissions are denied, next time you could try requesting permissions again
      ///(this is also the point when androids will return true to having requested access to user location)
      return Future.error('Location permissions are denied');
    }
  }
  ///When we reach here, permissions are granted and we can continue accessing the position of the device
  return await Geolocator.getLastKnownPosition();
}

///Next we need to convert the the latitude and longitude to words, this is called reverse geocoding
Future<String> myLocation(Position location) async {
  double latitude = location.latitude;
  double longitude = location.longitude;

  List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
  if(placemarks.isNotEmpty){
    Placemark placemark = placemarks[0];
    String address = placemark.name ?? '';//street
    String subCity = placemark.subLocality??'';
    String city = placemark.locality??'';
    return '$address, $subCity, $city';
  }
  return '';
}

