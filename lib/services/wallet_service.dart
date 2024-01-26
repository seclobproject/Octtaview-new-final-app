
import '../networking/constant.dart';
import '../support/dio_helper.dart';

class WalletService {


  static Future WalletServiceData() async {
    try {
      var dio = await DioHelper.getInstance();
      var response = await dio.get('$baseURL/api/user/wallet-Withdraw-Report');
      return response.data;
    } catch (e) {
      rethrow;
    }
  }


}