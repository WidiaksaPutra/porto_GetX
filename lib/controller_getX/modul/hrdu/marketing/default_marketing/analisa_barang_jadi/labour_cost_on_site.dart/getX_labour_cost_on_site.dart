import 'package:get/get.dart';

class GetxLabourCostOnSite extends GetxController{
  late var totalLabourCostOnSite = 0.0.obs;
  late var subTotalLabourCostOnSite = <String>[].obs;

  labourCostOnSite(var detailLabourCostOnSite){
    totalLabourCostOnSite.value = 0.0;
    subTotalLabourCostOnSite.clear();
    if (detailLabourCostOnSite.analisaLabourCostOnsite!.isNotEmpty) {
      for (int i = 0; i < detailLabourCostOnSite.analisaLabourCostOnsite!.length; i++) {
        double subTotal = double.parse(detailLabourCostOnSite.analisaLabourCostOnsite![i].qty.toString()) * double.parse(detailLabourCostOnSite.analisaLabourCostOnsite![i].unitPrice.toString()) * double.parse(detailLabourCostOnSite.analisaLabourCostOnsite![i].konstanta.toString());
        subTotalLabourCostOnSite.add(subTotal.toString());
        totalLabourCostOnSite.value = totalLabourCostOnSite.value + subTotal.round();
      }
    }
  }
}