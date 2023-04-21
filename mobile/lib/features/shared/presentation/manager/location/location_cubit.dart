import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:geolocator/geolocator.dart';
import 'package:mobile/core/di/injection.dart';
import 'package:mobile/core/utils/extensions.dart';
import 'package:mobile/features/shared/domain/repositories/local.storage.dart';
import 'package:mobile/generated/protos/shared.pb.dart';
import 'package:shared_utils/shared_utils.dart';

/// location services cubit
class LocationCubit extends Cubit<BlocState> {
  final BuildContext context;
  final _storage = getIt<BaseLocalStorageRepository>();

  LocationCubit(this.context) : super(BlocState.initialState());

  Future<void> getCurrentLocation() async {
    emit(BlocState.loadingState());
    // request location permission
    final permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      emit(BlocState<String>.errorState(
          failure: context.localizer.locationPermissionRequired));
      return;
    }
    var position = await Geolocator.getCurrentPosition();
    var location = AddressWithLatLngName(
        latitude: position.latitude, longitude: position.longitude);

    // get place name
    var locale = await _storage.defaultLocale;
    var placemarks = await geo.placemarkFromCoordinates(
        location.latitude, location.longitude,
        localeIdentifier: locale);
    if (placemarks.isNotEmpty) {
      var placemark = placemarks.first;
      var name = '${placemark.name}, ${placemark.locality}';
      location.name = name;
      location.address = placemark.locality ?? 'n/a';
      emit(BlocState<AddressWithLatLngName>.successState(data: location));
    } else {
      emit(BlocState<String>.errorState(failure: 'No location name found'));
    }
  }

  Future<void> getLocationStream() async {
    emit(BlocState.loadingState());
    var positionStream = Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.reduced,
      distanceFilter: 10,
      timeLimit: Duration(seconds: 5),
    ));
    emit(
      BlocState<Stream<AddressWithLatLngName>>.successState(
        data: positionStream.map((event) => AddressWithLatLngName(
            latitude: event.latitude, longitude: event.longitude)),
      ),
    );
  }

  Future<void> getDistanceBetween(
      AddressWithLatLngName origin, AddressWithLatLngName destination) async {
    emit(BlocState.loadingState());
    var distance = Geolocator.distanceBetween(origin.latitude, origin.longitude,
        destination.latitude, destination.longitude);
    emit(BlocState<double>.successState(data: distance));
  }

  Future<void> getLocationName(AddressWithLatLngName location) async {
    emit(BlocState.loadingState());
    var placemarks = await geo.placemarkFromCoordinates(
        location.latitude, location.longitude);
    if (placemarks.isNotEmpty) {
      var placemark = placemarks.first;
      var name = '${placemark.locality}, ${placemark.country}';
      location.name = name;
      location.address = placemark.locality ?? 'n/a';
      emit(BlocState<AddressWithLatLngName>.successState(data: location));
    } else {
      emit(BlocState<String>.errorState(failure: 'No location name found'));
    }
  }
}
