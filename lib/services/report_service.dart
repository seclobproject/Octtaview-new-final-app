
import '../networking/constant.dart';
import '../support/dio_helper.dart';

class ReportService {


  static Future reportDetails() async {
    var dio = await DioHelper.getInstance();
    var response = await dio.get('$baseURL/api/user/view-direct-referal-history');
    return response.data;
  }


}
