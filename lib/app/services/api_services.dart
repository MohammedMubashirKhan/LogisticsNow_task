import 'package:http/http.dart' as http;

class ApiServices {
  ApiServices();

  Future<String?> getApi(String searchTerm) async {
    String? data;
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://lorriservice.azurefd.net//api/autocomplete?suggest=$searchTerm&limit=20&searchFields=new_locations'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      data = await response.stream.bytesToString();
      print(data);
    } else {
      print(response.reasonPhrase);
    }
    return data;
  }
}
