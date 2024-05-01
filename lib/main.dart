import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';

void forceHybridCompositionModeOnAndroid() {
  final GoogleMapsFlutterPlatform mapsImplementation =
      GoogleMapsFlutterPlatform.instance;
  if (mapsImplementation is GoogleMapsFlutterAndroid) {
    mapsImplementation.useAndroidViewSurface = true;
  }
}

void main() {
  //forceHybridCompositionModeOnAndroid();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Platform Views'),
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: size.width,
              height: size.height,
              child: const ColoredBox(color: Colors.green),
            ),
            SizedBox(
              width: size.width,
              height: size.height * 0.4,
              child: const GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(37.42796133580664, -122.085749655962),
                  zoom: 15,
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.2,
              height: size.height,
              child: const ColoredBox(color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
