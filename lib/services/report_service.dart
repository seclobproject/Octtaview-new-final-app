
import '../networking/constant.dart';
import '../support/dio_helper.dart';

class ReportService {


  static Future directIncome() async {
    var dio = await DioHelper.getInstance();
    var response = await dio.get('$baseURL/api/user/view-direct-referal-history');
    return response.data;
  }


  static Future roiDetails() async {
    var dio = await DioHelper.getInstance();
    var response = await dio.get('$baseURL/api/user/ROI-History');
    return response.data;
  }

  static Future levelDetails() async {
    var dio = await DioHelper.getInstance();
    var response = await dio.get('$baseURL/api/user/view-level1-Report');
    return response.data;
  }


  static Future levelone() async {
    var dio = await DioHelper.getInstance();
    var response = await dio.get('$baseURL/api/user/view-level1-Report');
    return response.data;
  }

  static Future levetwo() async {
    var dio = await DioHelper.getInstance();
    var response = await dio.get('$baseURL/api/user/view-level2-Report');
    return response.data;
  }

  static Future levelthree() async {
    var dio = await DioHelper.getInstance();
    var response = await dio.get('$baseURL/api/user/view-level3-Report');
    return response.data;
  }

}
