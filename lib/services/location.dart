import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location
{
  double latitude;
  double longitude;

  Future<void> GetCurrentLocation() async
  {
    try
    {
      Position position = await
      Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      latitude = position.latitude;
      longitude = position.longitude;

      print(latitude);
      print(longitude);
    }
    catch (e)
    {
      print(e);
    }
  }
}