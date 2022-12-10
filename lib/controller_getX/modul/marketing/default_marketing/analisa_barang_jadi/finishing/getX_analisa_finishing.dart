import 'package:get/get.dart';
import 'package:mgp_mobile_app/controller_getX/modul/marketing/default_marketing/analisa_barang_jadi/finishing/mixin_analisa_finishing.dart';

class GetxAnalisaFinishing extends GetxController with FinishingDetail{
  late var listNamaFinishingBarangJadi = <String>[].obs;
  late var indexanalisaFinFnBp = <int>[].obs;
  late var subTotalFactorySupply = <double>[].obs;
  late var grandTotalFactorySupply = 0.0.obs;
  late var indexanalisaFinFnSc = <int>[].obs;
  late var subTotalLabourCost = <double>[].obs;
  late var grandTotalLabourCost = 0.0.obs;
  late var indexanalisaFinFnLc = <int>[].obs;
  late var subTotalMachineProcess = <double>[].obs;
  late var grandTotalMachineProcess = 0.0.obs;

  late var totalFinishing = 0.0.obs;

  finishing({required String idBarangJadi, String namaFinishing = "-"}) async{
    await fetchDataFinishingDetail(idBarangJadi: idBarangJadi);
    nameAnalisaFinishing();
    
    if(!namaFinishing.contains("-")){
      analisaFinFnBp(namaFinishing);
      analisaFinFnSc(namaFinishing);
      analisaFinFnLc(namaFinishing);
    }

    if(totalFinishing.value == 0.0 && listNamaFinishingBarangJadi.isNotEmpty){
      for(int j = 0 ; j < listNamaFinishingBarangJadi.length ; j++){
        analisaFinFnBp(listNamaFinishingBarangJadi[j].toString());
        analisaFinFnSc(listNamaFinishingBarangJadi[j].toString());
        analisaFinFnLc(listNamaFinishingBarangJadi[j].toString());
        totalFinishing.value = totalFinishing.value + grandTotalFactorySupply.value + grandTotalLabourCost.value + grandTotalMachineProcess.value;
      }
    }
  }
  
  nameAnalisaFinishing(){
    listNamaFinishingBarangJadi.clear;
    if (futureFinishing!.data!.analisaFinFnBp!.isNotEmpty) {//analisa_fin_fn_bp
      for (int i = 0; i < futureFinishing!.data!.analisaFinFnBp!.length; i++) {
        if(!listNamaFinishingBarangJadi.contains(futureFinishing!.data!.analisaFinFnBp![i].namaFinishingBarangJadi.toString()) && futureFinishing!.data!.analisaFinFnBp![i].namaFinishingBarangJadi.toString() != "-"){
          listNamaFinishingBarangJadi.add(futureFinishing!.data!.analisaFinFnBp![i].namaFinishingBarangJadi.toString());
        }
      }
    }
    if (futureFinishing!.data!.analisaFinFnSc!.isNotEmpty) {//analisa_fin_fn_sc
      for (int i = 0; i < futureFinishing!.data!.analisaFinFnSc!.length; i++) {
        if(!listNamaFinishingBarangJadi.contains(futureFinishing!.data!.analisaFinFnSc![i].namaFinishingBarangJadi.toString()) && futureFinishing!.data!.analisaFinFnSc![i].namaFinishingBarangJadi.toString() != "-"){
          listNamaFinishingBarangJadi.add(futureFinishing!.data!.analisaFinFnSc![i].namaFinishingBarangJadi.toString());
        }
      }
    }
    if (futureFinishing!.data!.analisaFinFnLc!.isNotEmpty) {//analisa_fin_fn_lc
      for (int i = 0; i < futureFinishing!.data!.analisaFinFnLc!.length; i++) {
        if(!listNamaFinishingBarangJadi.contains(futureFinishing!.data!.analisaFinFnLc![i].namaFinishingBarangJadi.toString()) && futureFinishing!.data!.analisaFinFnLc![i].namaFinishingBarangJadi.toString() != "-"){
          listNamaFinishingBarangJadi.add(futureFinishing!.data!.analisaFinFnLc![i].namaFinishingBarangJadi.toString());
        }
      }
    }
  }

  analisaFinFnBp(String namaFinishing){
    indexanalisaFinFnBp.clear();
    double totalFactorySupply = 0.0;
    if (futureFinishing!.data!.analisaFinFnBp!.isNotEmpty) {
      for (int i = 0; i < futureFinishing!.data!.analisaFinFnBp!.length; i++) {
        if(namaFinishing.toString().contains(futureFinishing!.data!.analisaFinFnBp![i].namaFinishingBarangJadi.toString())){
          indexanalisaFinFnBp.add(i);
          double subTotal = double.parse(futureFinishing!.data!.analisaFinFnBp![i].qty.toString()) * double.parse(futureFinishing!.data!.analisaFinFnBp![i].hargaSatuan.toString()) * double.parse(futureFinishing!.data!.analisaFinFnBp![i].koefisien.toString());
          subTotalFactorySupply.add(subTotal);
          totalFactorySupply = totalFactorySupply + subTotal.round();
        }
      }
      grandTotalFactorySupply.value = totalFactorySupply;
    }
  }

  analisaFinFnSc(String namaFinishing){
    indexanalisaFinFnSc.clear();
    double totalLabourCost = 0.0;
    if (futureFinishing!.data!.analisaFinFnSc!.isNotEmpty) {
      for (int i = 0; i < futureFinishing!.data!.analisaFinFnSc!.length; i++) {
        if(namaFinishing.toString().contains(futureFinishing!.data!.analisaFinFnSc![i].namaFinishingBarangJadi.toString())){
          indexanalisaFinFnSc.add(i);
          double subTotal = double.parse(futureFinishing!.data!.analisaFinFnSc![i].qty.toString()) * double.parse(futureFinishing!.data!.analisaFinFnSc![i].hargaSatuan.toString()) * double.parse(futureFinishing!.data!.analisaFinFnSc![i].koefisien.toString());
          subTotalLabourCost.add(subTotal);
          totalLabourCost = totalLabourCost + subTotal.round();
        }
      }
      grandTotalLabourCost.value = totalLabourCost;
    }
  }

  analisaFinFnLc(String namaFinishing){
    indexanalisaFinFnLc.clear();
    double totalMachineProcess = 0.0;
    if (futureFinishing!.data!.analisaFinFnLc!.isNotEmpty) {
      for (int i = 0; i < futureFinishing!.data!.analisaFinFnLc!.length; i++) {
        if(namaFinishing.toString().contains(futureFinishing!.data!.analisaFinFnLc![i].namaFinishingBarangJadi.toString())){
          indexanalisaFinFnLc.add(i);
          double subTotal = double.parse(futureFinishing!.data!.analisaFinFnLc![i].qty.toString()) * double.parse(futureFinishing!.data!.analisaFinFnLc![i].hargaSatuan.toString()) * double.parse(futureFinishing!.data!.analisaFinFnLc![i].koefisien.toString());
          subTotalMachineProcess.add(subTotal);
          totalMachineProcess = totalMachineProcess + subTotal.round();
        }
      }
      grandTotalMachineProcess.value = totalMachineProcess;
    }
  }
}
