
import '../networking/constant.dart';
import '../support/dio_helper.dart';

class CapitalService {


  static Future Capitaldata() async {
    try {
      var dio = await DioHelper.getInstance();
      var response = await dio.get('$baseURL/api/user/capital-Withdraw-Report');
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  static Future capitalamountsend(data) async {
    try {
      var dio = await DioHelper.getInstance();
      var response = await dio.post('$baseURL/api/user/add-package-by-user',data: data);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }



}
