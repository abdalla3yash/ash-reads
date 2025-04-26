import 'package:bookapp/core/base/api_response.dart';
import 'package:bookapp/core/services/network/api_client.dart';
import 'package:bookapp/core/services/network/endpoints.dart';

abstract class BookRemoteDataSource {
  Future<ApiResponse> fetchBooks({int? page,String? search});
}

class BookRemoteDataSourceImpl implements BookRemoteDataSource {
  final ApiClient _apiClient;

  BookRemoteDataSourceImpl(this._apiClient);

  @override
  Future<ApiResponse> fetchBooks({int? page,String? search}) async {
    final response = await _apiClient.get(url: EndPoints.booksApi,queryParameters: {'page':page,'search':search});    
    if (response.data!= null) {
      return ApiResponse.withSuccess(response);
    } else {
      return ApiResponse.withError(response.statusMessage);
    }
  }
}
