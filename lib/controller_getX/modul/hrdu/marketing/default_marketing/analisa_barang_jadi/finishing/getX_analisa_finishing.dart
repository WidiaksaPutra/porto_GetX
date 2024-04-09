import 'package:get/get.dart';

class GetxAnalisaFinishing extends GetxController{
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

  finishingDetail(var detailBahanBaku, String namaFinishing){
    nameAnalisaFinishing(detailBahanBaku);
    analisaFinishing(namaFinishing, detailBahanBaku);
    finishingTotal(detailBahanBaku);
  }
  
  nameAnalisaFinishing(var detailBahanBaku){
    listNamaFinishingBarangJadi.clear;
    if (detailBahanBaku.analisaFinFnBp!.isNotEmpty) {//analisa_fin_fn_bp
      for (int i = 0; i < detailBahanBaku.analisaFinFnBp!.length; i++) {
        if(!listNamaFinishingBarangJadi.contains(detailBahanBaku.analisaFinFnBp![i].namaFinishingBarangJadi.toString()) && detailBahanBaku.analisaFinFnBp![i].namaFinishingBarangJadi.toString() != "-"){
          listNamaFinishingBarangJadi.add(detailBahanBaku.analisaFinFnBp![i].namaFinishingBarangJadi.toString());
        }
      }
    }
    if (detailBahanBaku.analisaFinFnSc!.isNotEmpty) {//analisa_fin_fn_sc
      for (int i = 0; i < detailBahanBaku.analisaFinFnSc!.length; i++) {
        if(!listNamaFinishingBarangJadi.contains(detailBahanBaku.analisaFinFnSc![i].namaFinishingBarangJadi.toString()) && detailBahanBaku.analisaFinFnSc![i].namaFinishingBarangJadi.toString() != "-"){
          listNamaFinishingBarangJadi.add(detailBahanBaku.analisaFinFnSc![i].namaFinishingBarangJadi.toString());
        }
      }
    }
    if (detailBahanBaku.analisaFinFnLc!.isNotEmpty) {//analisa_fin_fn_lc
      for (int i = 0; i < detailBahanBaku.analisaFinFnLc!.length; i++) {
        if(!listNamaFinishingBarangJadi.contains(detailBahanBaku.analisaFinFnLc![i].namaFinishingBarangJadi.toString()) && detailBahanBaku.analisaFinFnLc![i].namaFinishingBarangJadi.toString() != "-"){
          listNamaFinishingBarangJadi.add(detailBahanBaku.analisaFinFnLc![i].namaFinishingBarangJadi.toString());
        }
      }
    }
  }

  analisaFinishing(String namaFinishing, var detailBahanBaku){
    if(!namaFinishing.contains("-")){
      analisaFinFnBp(namaFinishing, detailBahanBaku);
      analisaFinFnSc(namaFinishing, detailBahanBaku);
      analisaFinFnLc(namaFinishing, detailBahanBaku);
    }
  }

  finishingTotal(var detailBahanBaku){
    if(totalFinishing.value == 0.0 && listNamaFinishingBarangJadi.isNotEmpty){
      for(int j = 0 ; j < listNamaFinishingBarangJadi.length ; j++){
        analisaFinFnBp(listNamaFinishingBarangJadi[j].toString(), detailBahanBaku);
        analisaFinFnSc(listNamaFinishingBarangJadi[j].toString(), detailBahanBaku);
        analisaFinFnLc(listNamaFinishingBarangJadi[j].toString(), detailBahanBaku);
        totalFinishing.value = totalFinishing.value + grandTotalFactorySupply.value + grandTotalLabourCost.value + grandTotalMachineProcess.value;
      }
    }
  }

  analisaFinFnBp(String namaFinishing, var detailBahanBaku){
    indexanalisaFinFnBp.clear();
    double totalFactorySupply = 0.0;
    if (detailBahanBaku.analisaFinFnBp!.isNotEmpty) {
      for (int i = 0; i < detailBahanBaku.analisaFinFnBp!.length; i++) {
        if(namaFinishing.toString().contains(detailBahanBaku.analisaFinFnBp![i].namaFinishingBarangJadi.toString())){
          indexanalisaFinFnBp.add(i);
          double subTotal = double.parse(detailBahanBaku.analisaFinFnBp![i].qty.toString()) * double.parse(detailBahanBaku.analisaFinFnBp![i].hargaSatuan.toString()) * double.parse(detailBahanBaku.analisaFinFnBp![i].koefisien.toString());
          subTotalFactorySupply.add(subTotal);
          totalFactorySupply = totalFactorySupply + subTotal.round();
        }
      }
      grandTotalFactorySupply.value = totalFactorySupply;
    }
  }

  analisaFinFnSc(String namaFinishing, var detailBahanBaku){
    indexanalisaFinFnSc.clear();
    double totalLabourCost = 0.0;
    if (detailBahanBaku.analisaFinFnSc!.isNotEmpty) {
      for (int i = 0; i < detailBahanBaku.analisaFinFnSc!.length; i++) {
        if(namaFinishing.toString().contains(detailBahanBaku.analisaFinFnSc![i].namaFinishingBarangJadi.toString())){
          indexanalisaFinFnSc.add(i);
          double subTotal = double.parse(detailBahanBaku.analisaFinFnSc![i].qty.toString()) * double.parse(detailBahanBaku.analisaFinFnSc![i].hargaSatuan.toString()) * double.parse(detailBahanBaku.analisaFinFnSc![i].koefisien.toString());
          subTotalLabourCost.add(subTotal);
          totalLabourCost = totalLabourCost + subTotal.round();
        }
      }
      grandTotalLabourCost.value = totalLabourCost;
    }
  }

  analisaFinFnLc(String namaFinishing, var detailBahanBaku){
    indexanalisaFinFnLc.clear();
    double totalMachineProcess = 0.0;
    if (detailBahanBaku.analisaFinFnLc!.isNotEmpty) {
      for (int i = 0; i < detailBahanBaku.analisaFinFnLc!.length; i++) {
        if(namaFinishing.toString().contains(detailBahanBaku.analisaFinFnLc![i].namaFinishingBarangJadi.toString())){
          indexanalisaFinFnLc.add(i);
          double subTotal = double.parse(detailBahanBaku.analisaFinFnLc![i].qty.toString()) * double.parse(detailBahanBaku.analisaFinFnLc![i].hargaSatuan.toString()) * double.parse(detailBahanBaku.analisaFinFnLc![i].koefisien.toString());
          subTotalMachineProcess.add(subTotal);
          totalMachineProcess = totalMachineProcess + subTotal.round();
        }
      }
      grandTotalMachineProcess.value = totalMachineProcess;
    }
  }
}
