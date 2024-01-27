
import '../networking/constant.dart';
import '../support/dio_helper.dart';

class ProfileService {


  static Future ProfilePage() async {
    try {
      var dio = await DioHelper.getInstance();
      var response = await dio.get('$baseURL/api/user/view-user-profile');
      return response.data;
    } catch (e) {
      rethrow;
    }
  }


}
