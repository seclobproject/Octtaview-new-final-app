
import '../networking/constant.dart';
import '../support/dio_helper.dart';

class HomeService {


  static Future GetHomedata() async {
    try {
      var dio = await DioHelper.getInstance();
      var response = await dio.get('$baseURL/api/user/view-user-profile');
      return response.data;
    } catch (e) {
      rethrow;
    }
  }


  static Future Getpackage() async {
    try {
      var dio = await DioHelper.getInstance();
      var response = await dio.get('$baseURL/api/user/addfundHistory');
      return response.data;
    } catch (e) {
      rethrow;
    }
  }




}
