import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile/core/utils/extensions.dart';
import 'package:mobile/core/utils/service.type.dart';
import 'package:mobile/generated/assets.dart';
import 'package:shared_utils/shared_utils.dart';

/// find a service based on [type]
class ServiceFinderPage extends StatefulWidget {
  final ProcheServiceType type;

  const ServiceFinderPage({Key? key, required this.type}) : super(key: key);

  @override
  State<ServiceFinderPage> createState() => _ServiceFinderPageState();
}

class _ServiceFinderPageState extends State<ServiceFinderPage> {
  final _mapController = Completer<GoogleMapController>();
  final _kGooglePlex = const CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962), zoom: 14.4746);
  var _loading = true;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    kUseDefaultOverlays(context, statusBarBrightness: context.theme.brightness);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: context.colorScheme.background.withOpacity(0)),
      body: LoadingIndicator(
        isLoading: _loading,
        lottieAnimResource: Assets.animLoading,
        loadingAnimIsAsset: true,
        message: context.localizer.findingLocation,
        child: Stack(
          children: [
            // add google map here
            Positioned.fill(
              child: GoogleMap(
                initialCameraPosition: _kGooglePlex,
                padding: const EdgeInsets.only(bottom: 16, left: 20),
                onMapCreated: (controller) {
                  if (_mapController.isCompleted) {
                    _mapController.complete(controller);
                  }
                },
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                mapToolbarEnabled: false,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _getCurrentLocation() async {
    try {
      logger.d('getting current location...');
      final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      final controller = await _mapController.future;
      controller.animateCamera(CameraUpdate.newLatLngZoom(
          LatLng(position.latitude, position.longitude), 14.4746));
      setState(() => _loading = false);
    } on PlatformException catch (e) {
      logger.e(e);
      setState(() => _loading = false);
    }
  }
}
