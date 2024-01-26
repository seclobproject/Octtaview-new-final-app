
import '../networking/constant.dart';
import '../support/dio_helper.dart';

class MemberService {


  static Future Getmemberdata() async {
    try {
      var dio = await DioHelper.getInstance();
      var response = await dio.get('$baseURL/api/user/view-childs');
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  static Future memberslistinginner(id) async {
    var dio = await DioHelper.getInstance();
    var response = await dio.get('$baseURL/api/user/view-childs?id=$id');
    return response;
  }


  static Future addmember(data) async {
    try {
      var dio = await DioHelper.getInstance();
      var response = await dio.post('$baseURL/api/user/add-user',data: data);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }


}
