import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:submission_project/data/models.dart';
import 'package:submission_project/data/repositories.dart';

part 'services.g.dart';

@RestApi(baseUrl: "https://restcountries.com/v3.1/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(Apis.endPoint)
  Future<List<Country>> getData();
}
