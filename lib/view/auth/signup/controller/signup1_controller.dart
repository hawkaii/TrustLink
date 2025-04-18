import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../signup_2.dart';

class SignUp1Controller extends GetxController {
  // Observables for user input
  var name = ''.obs;
  var emailOrPhone = ''.obs;
  var password = ''.obs;
  var userName = ''.obs;
  var location = ''.obs;
  var interested = ''.obs;
  var selectedProfession = ''.obs;
  var professions = <String>[
    'Viewer',
    'Student',
    'Organisation',
    'Political Personality/Organization',
    'Musician',
    'Artist',
    'Drawing Artist',
    'Entrepreneur',
    'Sound Engineer',
    'Filmmaker',
    'Dancer',
    'Band',
    'Business',
    'Company',
    'Content Creator',
    'Fan Page',
    'Meme Page',
    'Athlete',
    'Gamer',
    'Esports Athlete',
    'Chess Athlete',
    'Teacher',
    'Software Engineer',
    'Marketing Professional',
    'Agency',
    'Committee/Club',
    'Graphic Designer',
    'Software Developer',
    'Teacher',
    'Government Body',
    'Video Editor',
    'Writer',
    'Job Profile',
    'Actor',
    'Doctor',
    'Other'
  ].obs;
  RxString selectedGender = ''.obs;
  RxString selectedInterested = ''.obs;
  RxString selectedDateOfBirth = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
  }


  // Update date of birth
  void updateDateOfBirth(String dob) {
    selectedDateOfBirth.value = dob;
  }

  // Update gender
  void updateGender(String gender) {
    selectedGender.value = gender;
  }

  // Method to update the selected profession
  void updateSelectedProfession(dynamic value) {
    selectedProfession.value = value;
  }

  void updateLocationField(String newLocation) {
    location.value = newLocation;
  }

  /// Get the Current location
  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar('Error', 'Location services are disabled.');
      return;
    }

    // Check for location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar('Error', 'Location permissions are denied.');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Get.snackbar(
        'Error',
        'Location permissions are permanently denied. We cannot access your location.',
      );
      return;
    }

    // Fetch the current position
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        print('Placemark Details: $place');

        String placeName = "${place.locality ?? place.subLocality}, "
            "${place.administrativeArea ?? place.country}, "
            "${place.postalCode}";

        location.value = placeName;
      } else {
        Get.snackbar('Error', 'Unable to fetch place name.');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch location: $e');
    }
  }
}
