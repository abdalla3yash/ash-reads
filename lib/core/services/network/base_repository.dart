import 'package:bookapp/core/utils/alerts.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../services/error/error_handler.dart';
import '../../services/error/failure.dart';
import '../../services/network/network_info.dart';

abstract class BaseRepository {
  final NetworkInfo networkInfo;

  BaseRepository(this.networkInfo);

  Future<Either<Failure, R>> call<R>({
    required Future<Response<dynamic>> Function() httpRequest,
    required R Function(dynamic data) successReturn,
  }) async {
    final bool hasConnection = await networkInfo.hasConnection;
    if (hasConnection) {
      try {
        final response = await httpRequest();
        final data = successReturn(response.data); 
        if(response.data["message"] != null && response.data["message"] != "" ) Alerts.showToast(response.data["message"].toString());
        return Right(data);
      } on Exception catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(ErrorType.noInternetConnection.getFailure());
    }
  }
}
