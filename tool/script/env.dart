import 'dart:convert';
import 'dart:io';

Future<void> main() async {
  final Map<String, dynamic> config = {
    'baseUrl': '',
    'app': {
      'bundleIdentifier': '',
      'bundleName': '',
      'companyName': 'Lafayete',
      'usernamePrefix': ''
    },
    'socketBaseUrl': '',
    'stage': '',
    'certificates': '',
  };

  final filename = 'lib/config/config.dart';
  File(filename).writeAsString('final environment = ${json.encode(config)};');
}