
import '../networking/constant.dart';
import '../support/dio_helper.dart';

class ReportService {


  static Future reportDetails(status) async {
    var queryParameters = {
      'reportName': status
    };
    var dio = await DioHelper.getInstance();
    var response = await dio.post('$baseURL/api/user/view-all-transactions',queryParameters:queryParameters);
    return response.data;
  }


}
