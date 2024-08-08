import 'package:http/http.dart';

void printResponse(Response response) {
  print('👀response.request: ${response.request}');
  print('👀response.statusCode: ${response.statusCode}');
  print('👀response.reasonPhrase: ${response.reasonPhrase}');
  print('👀response.headers: ${response.headers}');
  print('👀response.body: ${response.body}');
}
