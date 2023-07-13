import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:polygontrade/feature/polygon/data/remote_source/remote_source.dart';

import '../../../../common/constant/constant.dart';
import '../../../../common/error/exception.dart';
import '../../../../common/error/failures.dart';
import '../../../../injection.dart';
import '../models/grouped_daily_models.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio dio = sl.get<Dio>();

  @override
  Future<GroupedDailyModels> getAllGroupedDaily(String time) async {
    try {
      final response = await dio.get(
        '$mainUrl$getAllGroupedDailyUrl' +
            '$time' +
            '?&apiKey=rkWzalJg2cpTlqD1lEdOFoa_tccPlzsp',
      );

      if (response.statusCode == 200) {
        final groupedDailyModels = GroupedDailyModels.fromJson(response.data);
        return groupedDailyModels;
      } else {
        print(response.statusCode);
        throw ServerFailure(statusCode: response.statusCode);
      }
    } on DioError catch (exception) {
      print(exception.error);
      throw ServerException(response: exception.response!);
    } catch (_) {
      print(_);
      throw NetworkException();
    }
  }
}
