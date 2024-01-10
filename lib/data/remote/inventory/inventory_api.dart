 import 'package:custody_rx/app/common/logger.dart';
import 'package:custody_rx/base/base_network/api_end_points.dart';
import 'package:custody_rx/base/network/error_handler/error_handler.dart';
import 'package:custody_rx/base/network/exceptions.dart';
import 'package:custody_rx/base/network/remote_client/iApService.dart';
import 'package:custody_rx/data/remote/inventory/i_inventory_api.dart';
import 'package:custody_rx/models/inventory/inventory_model.dart';
import 'package:dio/dio.dart';

class InventoryApi implements IInventoryApi{

  InventoryApi(IApiService api) {
     api.setIsTokenRequired(true);
    _dio = api.get();
  }
  late Dio _dio;

  @override
  Future<InventoryModel> getInventory(Map<String, dynamic> map) async{
     try {
      final res = await _dio.get(ApiEndPoints.getInventory,
          queryParameters: map,
          options: Options(contentType: Headers.formUrlEncodedContentType));
      return InventoryModel.fromJson(res.data);

    } on DioException catch (e) {
      final exception = getException(e);
      throw exception;
    } catch (e) {
      d(e);
      throw ResponseException(msg: e.toString());
    }
  }

}