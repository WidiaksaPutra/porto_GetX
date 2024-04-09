import 'package:flutter_test/flutter_test.dart';
import 'package:mgp_mobile_app/controller_getX/login/getX_validasi_form.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/approval/getX_approval.dart';

import '../../../default_test/dummy_data_variabel_test.dart';

void main(){
  group("Unit Test Approval", (){
    ApprovalHrdu appHrd;
    appHrd = ApprovalHrdu();

    ValidasiForm v;
    v = ValidasiForm();

    test("Test Hasil Isi Approval Logika", () async{ 
      await v.postLogin(usernameVariabelTrue, passwordVariabelTrue);
      await Future.delayed(const Duration(milliseconds: 1000), () => expect(v.loginP.value.toString(), equals("berhasil")));
      await appHrd.approvalHrdu();      
      List isiAppHrd = await appHrd.hakAksesMenu;
      await Future.delayed(const Duration(milliseconds: 1000), () => expect(isiAppHrd, equals(hakAksesHRDUKotaArta)));
    });
  });
}