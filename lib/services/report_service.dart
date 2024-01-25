
import '../networking/constant.dart';
import '../support/dio_helper.dart';

class ReportService {


  static Future ReportData(data) async {
    try {
      var dio = await DioHelper.getInstance();
      var response = await dio.post('$baseURL/api/user/view-all-transactions',data: data);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }


}
