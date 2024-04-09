import 'package:get/get.dart';

class GetxLabourCost extends GetxController{
  late var listSubTotalLabourCost = <String>[].obs;
  late var listKodeLabourCost = <String>[].obs;
  late var listQtyLabourCost = <String>[].obs;
  late var listKonstantaLabourCost = <String>[].obs;
  late var subTotal = 0.0.obs;
  late var totalLabourCost = 0.0.obs;
  late var hasilSubTotal = 0.0.obs;
  late var hasilQty = 0.0.obs;
  late var grandTotalLabourCost = "0.0".obs;
  late final listSubTotal;
  late final listKode;
  late final listQty;
  late final listKonstanta;

  labourCostDetail(var labourCost){            
    prosesLabourCost(labourCost);
    grandTotalLabourCost.value = totalLabourCost.value.toString();
  }

  prosesLabourCost(var labourCost){
    int lengRekapitulasi = labourCost!.data.length;

    listSubTotal = List.generate(lengRekapitulasi, (_) => []).obs;
    listKode = List.generate(lengRekapitulasi, (_) => []).obs;
    listQty = List.generate(lengRekapitulasi, (_) => []).obs;
    listKonstanta = List.generate(lengRekapitulasi, (_) => []).obs;

    late int hi, hj;
    late int lengAnalisaFinTpLc;
    late int lengAnalisaFinTpLc2;
    
    for(int loop = 0 ; loop < 2 ; loop++){
      for(int ki = 0 ; ki<lengRekapitulasi ; ki++){
        lengAnalisaFinTpLc = labourCost.data[ki].analisaFinTpLc!.length;
        if (labourCost.data[ki].analisaFinTpLc != []) {
          for (int kj = 0; kj < lengAnalisaFinTpLc; kj++) {
            if(loop == 0){
              hasilSubTotal.value = 0.0;
              hasilQty.value = 0.0;
              subTotal.value = double.parse(labourCost.data[ki].analisaFinTpLc![kj].qty.toString()) * double.parse(labourCost.data[ki].analisaFinTpLc![kj].unitPrice.toString()) * double.parse(labourCost.data[ki].analisaFinTpLc![kj].konstanta.toString());
              listSubTotalLabourCost.add(subTotal.value.toString());
              listKodeLabourCost.add(labourCost.data[ki].analisaFinTpLc![kj].kodeItem.toString());
              listQtyLabourCost.add(labourCost.data[ki].analisaFinTpLc![kj].qty.toString());
              listKonstantaLabourCost.add(labourCost.data[ki].analisaFinTpLc![kj].konstanta.toString());
              totalLabourCost.value = totalLabourCost.value + subTotal.value.round();
            }
            else{
              hasilSubTotal.value = 0.0;
              hasilQty.value = 0.0;
              for(int i = ki ; i<lengRekapitulasi ; i++){
                lengAnalisaFinTpLc2 = labourCost.data[i].analisaFinTpLc!.length;
                if (labourCost.data[i].analisaFinTpLc != []) {
                  for (int j = kj; j < lengAnalisaFinTpLc2; j++) {
                    if(listKode[i][j] == listKode[ki][kj] && listKonstanta[i][j] == listKonstanta[ki][kj]){
                      if(i == ki && j == kj){
                        hi = i;
                        hj = j;
                        hasilSubTotal.value = hasilSubTotal.value + double.parse(listSubTotal[i][j].toString());
                        hasilQty.value = hasilQty.value + double.parse(listQty[i][j].toString());
                      }
                      else{
                        hasilSubTotal.value = hasilSubTotal.value + double.parse(listSubTotal[i][j].toString());
                        hasilQty.value = hasilQty.value + double.parse(listQty[i][j].toString());
                        listQty[i][j] = 0.0;
                        listSubTotal[i][j] = 0.0;
                      }            
                    }
                  }
                }
                if(i == lengRekapitulasi-1){
                  listQty[hi][hj] = hasilQty.value;
                  listSubTotal[hi][hj] = hasilSubTotal.value.roundToDouble();
                }
              }
            }
          }
          if(loop == 0){
            listSubTotal[ki].addAll(listSubTotalLabourCost);
            listKode[ki].addAll(listKodeLabourCost);
            listQty[ki].addAll(listQtyLabourCost);
            listKonstanta[ki].addAll(listKonstantaLabourCost);

            listSubTotalLabourCost.clear();
            listKodeLabourCost.clear();
            listQtyLabourCost.clear();
            listKonstantaLabourCost.clear();
          }
        } 
      }
    }
  }
}