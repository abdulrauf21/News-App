// ignore: file_names

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
class ApiService {
  Future get(String url) async{
    final apiUrl = Uri.parse(url);
    
    return await http.get(apiUrl, headers: {
      "Authorization": dotenv.env['apiKey']!
    });
  }
}