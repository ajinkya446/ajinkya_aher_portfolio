import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final serviceList = [
  {"id": 1, "title": "Android App Development", "shortDescription": "Native Android apps using Java and Kotlin.", "icon": "fa-brands fa-android"},
  {"id": 2, "title": "iOS App Development", "shortDescription": "High-quality iOS apps built with Swift and Objective-C.", "icon": "fa-brands fa-apple"},
  {"id": 3, "title": "Cross-Platform App Development", "shortDescription": "Build apps for iOS and Android using Flutter or React Native.", "icon": "fa-solid fa-mobile-screen-button"},
  {"id": 4, "title": "Flutter WebDevelopment", "shortDescription": "Responsive Flutter web apps and modern websites.", "icon": "fa-solid fa-globe"},
  {"id": 5, "title": "UI/UX Design", "shortDescription": "Intuitive and engaging app interfaces and user experiences.", "icon": "fa-solid fa-pencil-ruler"},
  {"id": 6, "title": "DevOps & Automation", "shortDescription": "CI/CD pipelines and automated deployment for apps.", "icon": "fa-solid fa-gears"}
];

final Map<String, IconData> faIconMap = {
  'fa-brands fa-android': FontAwesomeIcons.android,
  'fa-brands fa-apple': FontAwesomeIcons.apple,
  'fa-solid fa-mobile-screen-button': FontAwesomeIcons.mobileScreenButton,
  'fa-solid fa-globe': FontAwesomeIcons.globe,
  'fa-solid fa-pencil-ruler': FontAwesomeIcons.pencilRuler,
  'fa-solid fa-gears': FontAwesomeIcons.gears
};
