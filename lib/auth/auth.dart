import 'package:flutter_dotenv/flutter_dotenv.dart';

final String myApiKey = dotenv.env['API_KEY'] ?? "";
final String myRAT = dotenv.env['RAT'] ?? "";
final String baseURL = dotenv.env['BASIC_URL'] ?? "";
final String baseImageURL = dotenv.env['BASIC_IMAGE_URL'] ?? "";
final String baseVideoURL = dotenv.env['YT_VDO_URL'] ?? "";
