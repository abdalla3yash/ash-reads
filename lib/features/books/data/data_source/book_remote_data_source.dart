import 'package:bookapp/core/base/api_response.dart';
import 'package:bookapp/core/services/network/api_client.dart';
import 'package:bookapp/core/services/network/endpoints.dart';

abstract class BookRemoteDataSource {
  Future<ApiResponse> fetchBooks({int? page, String? search});
}

class BookRemoteDataSourceImpl implements BookRemoteDataSource {
  final ApiClient _apiClient;

  BookRemoteDataSourceImpl(this._apiClient);

  @override
  Future<ApiResponse> fetchBooks({int? page, String? search}) async {
    try {
      final queryParameters = {
        if (page != null) 'page': page.toString(),
        if (search != null) 'search': search,
      };

      final response = await _apiClient.get(url: EndPoints.booksApi, queryParameters: queryParameters);

      if (response.data != null && response.data.isNotEmpty) {
        return ApiResponse.withSuccess(response);
      } else {
        return ApiResponse.withError('No data available.');
      }
    } catch (e) {
      return ApiResponse.withError('Failed to fetch data. Please check your internet connection.');
    }
  }
}
