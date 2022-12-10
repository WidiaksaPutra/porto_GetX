import 'package:flutter_test/flutter_test.dart';
import 'package:mgp_mobile_app/controller_getX/login/getX_validasi_form.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/approval/getX_approval.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../default_test/dummy_data_variabel_test.dart';

void main(){
  group("Unit Test Approval", (){
    ApprovalHrdu appHrd;
    appHrd = ApprovalHrdu();

    ValidasiForm v;
    v = ValidasiForm();

    late String tokenUser;
    late SharedPreferences loginData;

    test("Test Hasil Isi Approval Logika", () async{
      await v.postLogin(usernameVariabelTrue, passwordVariabelTrue);
      loginData = await SharedPreferences.getInstance();
      await Future.delayed(const Duration(milliseconds: 1000), () {
        tokenUser = loginData.getString("token").toString();
        appHrd.approvalHrdu(tokenUser);
        List isiAppHrd = appHrd.hakAksesMenu;
        expect(v.loginP.value.toString(), equals("berhasil"));
        expect(isiAppHrd, equals(hakAksesHRDUKotaArta));
      });
    });
  });
}