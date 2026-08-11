import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final serviceList = [
  {"id": 1, "title": "Android App Development", "shortDescription": "Native Android apps using Java, Kotlin and Jetpack Compose.", "icon": "fa-brands fa-android"},
  {"id": 2, "title": "iOS App Development", "shortDescription": "High-quality iOS apps built with Swift and Objective-C.", "icon": "fa-brands fa-apple"},
  {"id": 3, "title": "Cross-Platform Development", "shortDescription": "Build apps for iOS and Android using Flutter or React Native.", "icon": "fa-solid fa-mobile-screen-button"},
  {"id": 4, "title": "UI/UX Design", "shortDescription": "Intuitive and engaging app interfaces and user experiences.", "icon": "fa-solid fa-pen-ruler"},
  {"id": 5, "title": "DevOps & Automation", "shortDescription": "CI/CD pipelines and automated deployment for apps.", "icon": "fa-solid fa-gears"}
];

final Map<String, FaIconData> faIconMap = {
  'fa-brands fa-android': FontAwesomeIcons.android,
  'fa-brands fa-apple': FontAwesomeIcons.apple,
  'fa-solid fa-mobile-screen-button': FontAwesomeIcons.mobileScreenButton,
  'fa-solid fa-globe': FontAwesomeIcons.globe,
  'fa-solid fa-pen-ruler': FontAwesomeIcons.penRuler,
  'fa-solid fa-gears': FontAwesomeIcons.gears
};
