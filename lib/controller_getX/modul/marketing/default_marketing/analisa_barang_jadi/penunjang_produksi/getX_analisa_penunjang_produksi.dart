import 'package:get/get.dart';
import 'package:mgp_mobile_app/controller_getX/modul/marketing/default_marketing/analisa_barang_jadi/penunjang_produksi/mixin_analisa_bahan_baku.dart';

class GetxAnalisaPeluangPenunjang extends GetxController with PeluangPenunjangDetail{
  late var subTotalFactorySupply = <String>[].obs;
  late var subTotalLabourCost = <String>[].obs;
  late var subTotalMachineProcess = <String>[].obs;
  late var subTotalBiayaOverhead = <String>[].obs;
  late var grandTotalFactorySupply = "0.0".obs;
  late var grandTotalLabourCost = "0.0".obs;
  late var grandTotalMachineProcess = "0.0".obs;
  late var grandTotalBiayaOverhead = "0.0".obs;

  late var totalPenunjangProduksi = 0.0.obs;

  analisaPeluangPenunjang(String idBarangJadi) async{
    // totalSummaryBiaya.clear();
    await fetchDataPeluangPenunjangDetail(idBarangJadi: idBarangJadi);
    analisaFinTpFs();  
    analisaFinTpLc();
    analisaFinTpMp();   
    analisaFinTpBop();

    if(totalPenunjangProduksi.value == 0.0){
      totalPenunjangProduksi.value = double.parse(grandTotalFactorySupply.value.toString()) + double.parse(grandTotalLabourCost.value.toString()) + double.parse(grandTotalMachineProcess.value.toString()) + double.parse(grandTotalBiayaOverhead.value.toString());
    }
  }

  analisaFinTpFs(){
    double totalFactorySupply = 0.0;
    if (futureDetailPenunjang!.data!.analisaFinTpFs!.isNotEmpty) {
      for (var i = 0; i < futureDetailPenunjang!.data!.analisaFinTpFs!.length; i++) {
        double subTotal = double.parse(futureDetailPenunjang!.data!.analisaFinTpFs![i].qty.toString()) * double.parse(futureDetailPenunjang!.data!.analisaFinTpFs![i].hargaSatuan.toString()) * double.parse(futureDetailPenunjang!.data!.analisaFinTpFs![i].koefisien.toString());
        subTotalFactorySupply.add(subTotal.toString());
        totalFactorySupply = totalFactorySupply + subTotal.round();
      }
    }
    grandTotalFactorySupply.value = totalFactorySupply.toString();    
  }

  analisaFinTpLc(){
    double totalLabourCost = 0.0;
    if (futureDetailPenunjang!.data!.analisaFinTpLc!.isNotEmpty) {
      for (var i = 0; i < futureDetailPenunjang!.data!.analisaFinTpLc!.length; i++) {
        double subTotal = double.parse(futureDetailPenunjang!.data!.analisaFinTpLc![i].qty.toString()) * double.parse(futureDetailPenunjang!.data!.analisaFinTpLc![i].hargaSatuan.toString()) * double.parse(futureDetailPenunjang!.data!.analisaFinTpLc![i].koefisien.toString());
        subTotalLabourCost.add(subTotal.toString());
        totalLabourCost = totalLabourCost + subTotal.round();
      }
    }
    grandTotalLabourCost.value = totalLabourCost.toString();
  }
  
  analisaFinTpMp(){
    double totalMachineProcess = 0.0;
    if (futureDetailPenunjang!.data!.analisaFinTpMp!.isNotEmpty) {
      for (var i = 0; i < futureDetailPenunjang!.data!.analisaFinTpMp!.length; i++) {
        double subTotal = double.parse(futureDetailPenunjang!.data!.analisaFinTpMp![i].qty.toString()) * double.parse(futureDetailPenunjang!.data!.analisaFinTpMp![i].hargaSatuan.toString()) * double.parse(futureDetailPenunjang!.data!.analisaFinTpMp![i].koefisien.toString());
        subTotalMachineProcess.add(subTotal.toString());
        totalMachineProcess = totalMachineProcess + subTotal.round();
      }
    }
    grandTotalMachineProcess.value = totalMachineProcess.toString();
  }

  analisaFinTpBop(){
    double totalBiayaOverhead = 0.0;
    if (futureDetailPenunjang!.data!.analisaFinTpBop!.isNotEmpty) {
      for (var i = 0; i < futureDetailPenunjang!.data!.analisaFinTpBop!.length; i++) {
        double subTotal = double.parse(futureDetailPenunjang!.data!.analisaFinTpBop![i].qty.toString()) * double.parse(futureDetailPenunjang!.data!.analisaFinTpBop![i].hargaSatuan.toString()) * double.parse(futureDetailPenunjang!.data!.analisaFinTpBop![i].koefisien.toString());
        subTotalBiayaOverhead.add(subTotal.toString());
        totalBiayaOverhead = totalBiayaOverhead + subTotal.round();
      }
    }
    grandTotalBiayaOverhead.value = totalBiayaOverhead.toString();
  }
}