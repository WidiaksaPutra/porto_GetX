// To parse this JSON data, do
//
//     final rekapitulasi = rekapitulasiFromJson(jsonString);

import 'dart:convert';

class Rekapitulasi {
    Rekapitulasi({
        this.status,
        this.message,
        required this.data,
    });

    final bool? status;
    final String? message;
    final List<Datum> data;

    factory Rekapitulasi.fromRawJson(String str) => Rekapitulasi.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Rekapitulasi.fromJson(Map<String, dynamic> json) => Rekapitulasi(
        status: json["status"],
        message: json["message"] == null ? "-" : json["message"].toString(),
        data: json["data"] == null ? [] :
              json["data"] == List.empty() ? [] : 
              List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message == null ? null : message!.toString,
        "data": data == null ? [] :
                data == List.empty() ? [] : 
                List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.idRaeDetail,
        this.idRae,
        this.idBarangJadi,
        this.qtyRae,
        this.hargaSatuanRae,
        this.refUid,
        this.kodeItem,
        this.namaItem,
        this.namaSatuan,
        this.idJenis,
        this.idSatuanJual,
        this.namaJenis,
        this.linkReferensi,
        this.uraian,
        this.namaKelompok,
        this.analisaHardwood,
        this.analisaPlywood,
        this.analisaFinTpFs,
        this.analisaFinTpLc,
        this.analisaFinTpMp,
        this.analisaFinTpBop,
        this.analisaFinFnBp,
        this.analisaFinFnSc,
        this.analisaFinFnLc,
        this.analisaLabourCostOnsite,
        this.analisaBiayaOverheadKantor,
        this.analisaAlatBantuOnsite,
    });

    final String? idRaeDetail;
    final String? idRae;
    final String? idBarangJadi;
    final String? qtyRae;
    final String? hargaSatuanRae;
    final String? refUid;
    final String? kodeItem;
    final String? namaItem;
    final String? namaSatuan;
    final String? idJenis;
    final String? idSatuanJual;
    final String? namaJenis;
    final String? linkReferensi;
    final String? uraian;
    final String? namaKelompok;
    final List<AnalisaHardwood>? analisaHardwood;
    final List<AnalisaPlywood>? analisaPlywood;
    final List<AnalisaFinTpF>? analisaFinTpFs;
    final List<AnalisaFinTpLc>? analisaFinTpLc;
    final List<AnalisaFinTpMp>? analisaFinTpMp;
    final List<AnalisaFinTpBop>? analisaFinTpBop;
    final List<AnalisaFinFnBp>? analisaFinFnBp;
    final List<AnalisaFinFnSc>? analisaFinFnSc;
    final List<AnalisaFinFnLc>? analisaFinFnLc;
    final List<AnalisaLabourCostOnsite>? analisaLabourCostOnsite;
    final List<AnalisaBiayaOverheadKantor>? analisaBiayaOverheadKantor;
    final List<AnalisaAlatBantuOnsite>? analisaAlatBantuOnsite;

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idRaeDetail: json["id_rae_detail"] == null ? "-" : json["id_rae_detail"].toString(),
        idRae: json["id_rae"] == null ? "-" : json["id_rae"].toString(),
        idBarangJadi: json["id_barang_jadi"] == null ? "-" : json["id_barang_jadi"].toString(),
        qtyRae: json["qty_rae"] == null ? "-" : json["qty_rae"].toString(),
        hargaSatuanRae: json["harga_satuan_rae"] == null ? "-" : json["harga_satuan_rae"].toString(),
        refUid: json["ref_uid"] == null ? "-" : json["ref_uid"].toString(),
        kodeItem: json["kode_item"] == null ? "-" : json["kode_item"].toString(),
        namaItem: json["nama_item"] == null ? "-" : json["nama_item"].toString(),
        namaSatuan: json["nama_satuan"] == null ? "-" : json["nama_satuan"].toString(),
        idJenis: json["id_jenis"] == null ? "-" : json["id_jenis"].toString(),
        idSatuanJual: json["id_satuan_jual"] == null ? "-" : json["id_satuan_jual"].toString(),
        namaJenis: json["nama_jenis"] == null ? "-" : json["nama_jenis"].toString(),
        linkReferensi: json["link_referensi"] == null ? "-" : json["link_referensi"].toString(),
        uraian: json["uraian"] == null ? "-" : json["uraian"].toString(),
        namaKelompok: json["nama_kelompok"] == null ? "-" : json["nama_kelompok"].toString(),
        analisaHardwood: json["analisa_hardwood"] == null ? [] : 
                          json["analisa_hardwood"] == List.empty() ? [] : 
                          List<AnalisaHardwood>.from(json["analisa_hardwood"].map((x) => AnalisaHardwood.fromJson(x))),
        analisaPlywood: json["analisa_plywood"] == null ? [] :
                        json["analisa_plywood"] == List.empty() ? [] : 
                        List<AnalisaPlywood>.from(json["analisa_plywood"].map((x) => AnalisaPlywood.fromJson(x))),
        analisaFinTpFs: json["analisa_fin_tp_fs"] == null ? [] :
                        json["analisa_fin_tp_fs"] == List.empty() ? [] :
                        List<AnalisaFinTpF>.from(json["analisa_fin_tp_fs"].map((x) => AnalisaFinTpF.fromJson(x))),
        analisaFinTpLc: json["analisa_fin_tp_lc"] == null ? [] :
                        json["analisa_fin_tp_lc"] == List.empty() ? [] : 
                        List<AnalisaFinTpLc>.from(json["analisa_fin_tp_lc"].map((x) => AnalisaFinTpLc.fromJson(x))),
        analisaFinTpMp: json["analisa_fin_tp_mp"] == null ? [] :
                        json["analisa_fin_tp_mp"] == List.empty() ? [] : 
                        List<AnalisaFinTpMp>.from(json["analisa_fin_tp_mp"].map((x) => AnalisaFinTpMp.fromJson(x))),
        analisaFinTpBop: json["analisa_fin_tp_bop"] == null ? [] :
                        json["analisa_fin_tp_bop"] == List.empty() ? [] : 
                        List<AnalisaFinTpBop>.from(json["analisa_fin_tp_bop"].map((x) => AnalisaFinTpBop.fromJson(x))),
        analisaFinFnBp: json["analisa_fin_fn_bp"] == null ? [] :
                        json["analisa_fin_fn_bp"] == List.empty() ? [] :
                        List<AnalisaFinFnBp>.from(json["analisa_fin_fn_bp"].map((x) => AnalisaFinFnBp.fromJson(x))),
        analisaFinFnSc: json["analisa_fin_fn_sc"] == null ? [] :
                        json["analisa_fin_fn_sc"] == List.empty() ? [] : 
                        List<AnalisaFinFnSc>.from(json["analisa_fin_fn_sc"].map((x) => AnalisaFinFnSc.fromJson(x))),
        analisaFinFnLc: json["analisa_fin_fn_lc"] == null ? [] :
                        json["analisa_fin_fn_lc"] == List.empty() ? [] :
                        List<AnalisaFinFnLc>.from(json["analisa_fin_fn_lc"].map((x) => AnalisaFinFnLc.fromJson(x))),
        analisaLabourCostOnsite: json["analisa_labour_cost_onsite"] == null ? [] :
                        json["analisa_labour_cost_onsite"] == List.empty() ? [] :
                        List<AnalisaLabourCostOnsite>.from(json["analisa_labour_cost_onsite"].map((x) => AnalisaLabourCostOnsite.fromJson(x))),
        analisaBiayaOverheadKantor: json["analisa_biaya_overhead_kantor"] == null ? [] :
                                    json["analisa_biaya_overhead_kantor"] == List.empty() ? [] :
                                    List<AnalisaBiayaOverheadKantor>.from(json["analisa_biaya_overhead_kantor"].map((x) => AnalisaBiayaOverheadKantor.fromJson(x))),
        analisaAlatBantuOnsite: json["analisa_alat_bantu_onsite"] == null ? [] :
                                json["analisa_alat_bantu_onsite"] == List.empty() ? [] :
                                List<AnalisaAlatBantuOnsite>.from(json["analisa_alat_bantu_onsite"].map((x) => AnalisaAlatBantuOnsite.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id_rae_detail": idRaeDetail == null ? "-" : idRaeDetail.toString(),
        "id_rae": idRae == null ? "-" : idRae.toString(),
        "id_barang_jadi": idBarangJadi == null ? "-" : idBarangJadi.toString(),
        "qty_rae": qtyRae == null ? "-" : qtyRae.toString(),
        "harga_satuan_rae": hargaSatuanRae == null ? "-" : hargaSatuanRae.toString(),
        "ref_uid": refUid == null ? "-" : refUid.toString(),
        "kode_item": kodeItem == null ? "-" : kodeItem.toString(),
        "nama_item": namaItem == null ? "-" : namaItem.toString(),
        "nama_satuan": namaSatuan == null ? "-" : namaSatuan.toString(),
        "id_jenis": idJenis == null ? "-" : idJenis.toString(),
        "id_satuan_jual": idSatuanJual == null ? "-" : idSatuanJual.toString(),
        "nama_jenis": namaJenis == null ? "-" : namaJenis.toString(),
        "link_referensi": linkReferensi == null ? "-" : linkReferensi.toString(),
        "uraian": uraian == null ? "-" : uraian.toString(),
        "nama_kelompok": namaKelompok == null ? "-" : namaKelompok.toString(),
        "analisa_hardwood": analisaHardwood == null ? [] : 
                            analisaHardwood == List.empty() ? [] :
                            List<dynamic>.from(analisaHardwood!.map((x) => x.toJson())),
        "analisa_plywood": analisaPlywood == null ? [] : 
                            analisaPlywood == List.empty() ? [] :
                            List<dynamic>.from(analisaPlywood!.map((x) => x.toJson())),
        "analisa_fin_tp_fs": analisaFinTpFs == null ? [] :
                              analisaFinTpFs == List.empty() ? [] :
                              List<dynamic>.from(analisaFinTpFs!.map((x) => x.toJson())),
        "analisa_fin_tp_lc": analisaFinTpLc == null ? [] :
                              analisaFinTpLc == List.empty() ? [] : 
                              List<dynamic>.from(analisaFinTpLc!.map((x) => x.toJson())),
        "analisa_fin_tp_mp": analisaFinTpMp == null ? [] :
                              analisaFinTpMp == List.empty() ? [] :
                              List<dynamic>.from(analisaFinTpMp!.map((x) => x.toJson())),
        "analisa_fin_tp_bop": analisaFinTpBop == null ? [] :
                              analisaFinTpBop == List.empty() ? [] : 
                              List<dynamic>.from(analisaFinTpBop!.map((x) => x.toJson())),
        "analisa_fin_fn_bp": analisaFinFnBp == null ? [] :
                              analisaFinFnBp == List.empty() ? [] :
                              List<dynamic>.from(analisaFinFnBp!.map((x) => x.toJson())),
        "analisa_fin_fn_sc": analisaFinFnSc == null ? [] :
                              analisaFinFnSc == List.empty() ? [] :
                              List<dynamic>.from(analisaFinFnSc!.map((x) => x.toJson())),
        "analisa_fin_fn_lc": analisaFinFnLc == null ? [] :
                              analisaFinFnLc == List.empty() ? [] : 
                              List<dynamic>.from(analisaFinFnLc!.map((x) => x.toJson())),
        "analisa_labour_cost_onsite": analisaLabourCostOnsite == null ? [] :
                                      analisaLabourCostOnsite == List.empty() ? [] : 
                                      List<dynamic>.from(analisaLabourCostOnsite!.map((x) => x.toJson())),
        "analisa_biaya_overhead_kantor": analisaBiayaOverheadKantor == null ? [] :
                                          analisaBiayaOverheadKantor == List.empty() ? [] :
                                          List<dynamic>.from(analisaBiayaOverheadKantor!.map((x) => x.toJson())),
        "analisa_alat_bantu_onsite": analisaAlatBantuOnsite == null ? [] :
                                      analisaAlatBantuOnsite == List.empty() ? [] :
                                      List<dynamic>.from(analisaAlatBantuOnsite!.map((x) => x.toJson())),
    };
}

class AnalisaHardwood {
    AnalisaHardwood({
        this.idRaeAnalisaBarangJadiHardwood,
        this.idRaeDetail,
        this.idJenisKayu,
        this.idFinishingBarangJadi,
        this.idTipeSisi,
        this.idPartKayu,
        this.idDeskripsi,
        this.deskripsi,
        this.qtyRaw,
        this.tRaw,
        this.wRaw,
        this.lRaw,
        this.qtyFinal,
        this.tFinal,
        this.wFinal,
        this.lFinal,
        this.unitPrice,
        this.konstanta,
        this.kodeItem,
        this.namaItem,
        this.kodeSatuan,
        this.namaSatuan,
        this.namaJenisKayu,
        this.namaFinishingBarangJadi,
        this.namaTipeSisi,
        this.namaPartKayu,
        this.hargaSatuan,
        this.koefisien,
        this.kodeItemBahan,
    });

    final String? idRaeAnalisaBarangJadiHardwood;
    final String? idRaeDetail;
    final String? idJenisKayu;
    final String? idFinishingBarangJadi;
    final String? idTipeSisi;
    final String? idPartKayu;
    final String? idDeskripsi;
    final String? deskripsi;
    final String? qtyRaw;
    final String? tRaw;
    final String? wRaw;
    final String? lRaw;
    final String? qtyFinal;
    final String? tFinal;
    final String? wFinal;
    final String? lFinal;
    final String? unitPrice;
    final String? konstanta;
    final String? kodeItem;
    final String? namaItem;
    final String? kodeSatuan;
    final String? namaSatuan;
    final String? namaJenisKayu;
    final String? namaFinishingBarangJadi;
    final String? namaTipeSisi;
    final String? namaPartKayu;
    final String? hargaSatuan;
    final String? koefisien;
    final String? kodeItemBahan;

    factory AnalisaHardwood.fromRawJson(String str) => AnalisaHardwood.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AnalisaHardwood.fromJson(Map<String, dynamic> json) => AnalisaHardwood(
        idRaeAnalisaBarangJadiHardwood: json["id_rae_analisa_barang_jadi_hardwood"] == null ? "-" : json["id_rae_analisa_barang_jadi_hardwood"].toString(),
        idRaeDetail: json["id_rae_detail"] == null ? "-" : json["id_rae_detail"].toString(),
        idJenisKayu: json["id_jenis_kayu"] == null ? "-" : json["id_jenis_kayu"].toString(),
        idFinishingBarangJadi: json["id_finishing_barang_jadi"] == null ? "-" : json["id_finishing_barang_jadi"].toString(),
        idTipeSisi: json["id_tipe_sisi"] == null ? "-" : json["id_tipe_sisi"].toString(),
        idPartKayu: json["id_part_kayu"] == null ? "-" : json["id_part_kayu"].toString(),
        idDeskripsi: json["id_deskripsi"] == null ? "-" : json["id_deskripsi"].toString(),
        deskripsi: json["deskripsi"] == null ? "-" : json["deskripsi"].toString(),
        qtyRaw: json["qty_raw"] == null ? "-" : json["qty_raw"].toString(),
        tRaw: json["t_raw"] == null ? "-" : json["t_raw"].toString(),
        wRaw: json["w_raw"] == null ? "-" : json["w_raw"].toString(),
        lRaw: json["l_raw"] == null ? "-" : json["l_raw"].toString(),
        qtyFinal: json["qty_final"] == null ? "-" : json["qty_final"].toString(),
        tFinal: json["t_final"] == null ? "-" : json["t_final"].toString(),
        wFinal: json["w_final"] == null ? "-" : json["w_final"].toString(),
        lFinal: json["l_final"] == null ? "-" : json["l_final"].toString(),
        unitPrice: json["unit_price"] == null ? "-" : json["unit_price"].toString(),
        konstanta: json["konstanta"] == null ? "-" : json["konstanta"].toString(),
        kodeItem: json["kode_item"] == null ? "-" : json["kode_item"].toString(),
        namaItem: json["nama_item"] == null ? "-" : json["nama_item"].toString(),
        kodeSatuan: json["kode_satuan"] == null ? "-" : json["kode_satuan"].toString(),
        namaSatuan: json["nama_satuan"] == null ? "-" : json["nama_satuan"].toString(),
        namaJenisKayu: json["nama_jenis_kayu"] == null ? "-" : json["nama_jenis_kayu"].toString(),
        namaFinishingBarangJadi: json["nama_finishing_barang_jadi"] == null ? "-" : json["nama_finishing_barang_jadi"].toString(),
        namaTipeSisi: json["nama_tipe_sisi"] == null ? "-" : json["nama_tipe_sisi"].toString(),
        namaPartKayu: json["nama_part_kayu"] == null ? "-" : json["nama_part_kayu"].toString(),
        hargaSatuan: json["harga_satuan"] == null ? "-" : json["harga_satuan"].toString(),
        koefisien: json["koefisien"] == null ? "-" : json["koefisien"].toString(),
        kodeItemBahan: json["kode_item_bahan"] == null ? "-" : json["kode_item_bahan"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id_rae_analisa_barang_jadi_hardwood": idRaeAnalisaBarangJadiHardwood == null ? "-" : idRaeAnalisaBarangJadiHardwood.toString(),
        "id_rae_detail": idRaeDetail == null ? "-" : idRaeDetail.toString(),
        "id_jenis_kayu": idJenisKayu == null ? "-" : idJenisKayu.toString(),
        "id_finishing_barang_jadi": idFinishingBarangJadi == null ? "-" : idFinishingBarangJadi.toString(),
        "id_tipe_sisi": idTipeSisi == null ? "-" : idTipeSisi.toString(),
        "id_part_kayu": idPartKayu == null ? "-" : idPartKayu.toString(),
        "id_deskripsi": idDeskripsi == null ? "-" : idDeskripsi.toString(),
        "deskripsi": deskripsi == null ? "-" : deskripsi.toString(),
        "qty_raw": qtyRaw == null ? "-" : qtyRaw.toString(),
        "t_raw": tRaw == null ? "-" : tRaw.toString(),
        "w_raw": wRaw == null ? "-" : wRaw.toString(),
        "l_raw": lRaw == null ? "-" : lRaw.toString(),
        "qty_final": qtyFinal == null ? "-" : qtyFinal.toString(),
        "t_final": tFinal == null ? "-" : tFinal.toString(),
        "w_final": wFinal == null ? "-" : wFinal.toString(),
        "l_final": lFinal == null ? "-" : lFinal.toString(),
        "unit_price": unitPrice == null ? "-" : unitPrice.toString(),
        "konstanta": konstanta == null ? "-" : konstanta.toString(),
        "kode_item": kodeItem == null ? "-" : kodeItem.toString(),
        "nama_item": namaItem == null ? "-" : namaItem.toString(),
        "kode_satuan": kodeSatuan == null ? "-" : kodeSatuan.toString(),
        "nama_satuan": namaSatuan == null ? "-" : namaSatuan.toString(),
        "nama_jenis_kayu": namaJenisKayu == null ? "-" : namaJenisKayu.toString(),
        "nama_finishing_barang_jadi": namaFinishingBarangJadi == null ? "-" : namaFinishingBarangJadi.toString(),
        "nama_tipe_sisi": namaTipeSisi == null ? "-" : namaTipeSisi.toString(),
        "nama_part_kayu": namaPartKayu == null ? "-" : namaPartKayu.toString(),
        "harga_satuan": hargaSatuan == null ? "-" : hargaSatuan.toString(),
        "koefisien": koefisien == null ? "-" : koefisien.toString(),
        "kode_item_bahan": kodeItemBahan == null ? "-" : kodeItemBahan.toString(),
    };
}

class AnalisaPlywood {
    AnalisaPlywood({
        this.idRaeAnalisaBarangJadiPlywood,
        this.idRaeDetail,
        this.idItemBuaso,
        this.idFinishingBarangJadi,
        this.idTipeSisi,
        this.idDeskripsi,
        this.deskripsi,
        this.qtyRaw,
        this.tRaw,
        this.wRaw,
        this.lRaw,
        this.qtyFinal,
        this.tFinal,
        this.wFinal,
        this.lFinal,
        this.unitPrice,
        this.konstanta,
        this.kodeItem,
        this.namaItem,
        this.namaFinishingBarangJadi,
        this.namaTipeSisi,
        this.hargaSatuan,
        this.koefisien,
        this.kodeItemBahan,
    });

    final String? idRaeAnalisaBarangJadiPlywood;
    final String? idRaeDetail;
    final String? idItemBuaso;
    final String? idFinishingBarangJadi;
    final String? idTipeSisi;
    final String? idDeskripsi;
    final String? deskripsi;
    final String? qtyRaw;
    final String? tRaw;
    final String? wRaw;
    final String? lRaw;
    final String? qtyFinal;
    final String? tFinal;
    final String? wFinal;
    final String? lFinal;
    final String? unitPrice;
    final String? konstanta;
    final String? kodeItem;
    final String? namaItem;
    final String? namaFinishingBarangJadi;
    final String? namaTipeSisi;
    final String? hargaSatuan;
    final String? koefisien;
    final String? kodeItemBahan;

    factory AnalisaPlywood.fromRawJson(String str) => AnalisaPlywood.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AnalisaPlywood.fromJson(Map<String, dynamic> json) => AnalisaPlywood(
        idRaeAnalisaBarangJadiPlywood: json["id_rae_analisa_barang_jadi_plywood"] == null ? "-" : json["id_rae_analisa_barang_jadi_plywood"].toString(),
        idRaeDetail: json["id_rae_detail"] == null ? "-" : json["id_rae_detail"].toString(),
        idItemBuaso: json["id_item_buaso"] == null ? "-" : json["id_item_buaso"].toString(),
        idFinishingBarangJadi: json["id_finishing_barang_jadi"] == null ? "-" : json["id_finishing_barang_jadi"].toString(),
        idTipeSisi: json["id_tipe_sisi"] == null ? "-" : json["id_tipe_sisi"].toString(),
        idDeskripsi: json["id_deskripsi"] == null ? "-" : json["id_deskripsi"].toString(),
        deskripsi: json["deskripsi"] == null ? "-" : json["deskripsi"].toString(),
        qtyRaw: json["qty_raw"] == null ? "-" : json["qty_raw"].toString(),
        tRaw: json["t_raw"] == null ? "-" : json["t_raw"].toString(),
        wRaw: json["w_raw"] == null ? "-" : json["w_raw"].toString(),
        lRaw: json["l_raw"] == null ? "-" : json["l_raw"].toString(),
        qtyFinal: json["qty_final"] == null ? "-" : json["qty_final"].toString(),
        tFinal: json["t_final"] == null ? "-" : json["t_final"].toString(),
        wFinal: json["w_final"] == null ? "-" : json["w_final"].toString(),
        lFinal: json["l_final"] == null ? "-" : json["l_final"].toString(),
        unitPrice: json["unit_price"] == null ? "-" : json["unit_price"].toString(),
        konstanta: json["konstanta"] == null ? "-" : json["konstanta"].toString(),
        kodeItem: json["kode_item"] == null ? "-" : json["kode_item"].toString(),
        namaItem: json["nama_item"] == null ? "-" : json["nama_item"].toString(),
        namaFinishingBarangJadi: json["nama_finishing_barang_jadi"] == null ? "-" : json["nama_finishing_barang_jadi"].toString(),
        namaTipeSisi: json["nama_tipe_sisi"] == null ? "-" : json["nama_tipe_sisi"].toString(),
        hargaSatuan: json["harga_satuan"] == null ? "-" : json["harga_satuan"].toString(),
        koefisien: json["koefisien"] == null ? "-" : json["koefisien"].toString(),
        kodeItemBahan: json["kode_item_bahan"] == null ? "-" : json["kode_item_bahan"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id_rae_analisa_barang_jadi_plywood": idRaeAnalisaBarangJadiPlywood == null ? "-" : idRaeAnalisaBarangJadiPlywood.toString(),
        "id_rae_detail": idRaeDetail == null ? "-" : idRaeDetail.toString(),
        "id_item_buaso": idItemBuaso == null ? "-" : idItemBuaso.toString(),
        "id_finishing_barang_jadi": idFinishingBarangJadi == null ? "-" : idFinishingBarangJadi.toString(),
        "id_tipe_sisi": idTipeSisi == null ? "-" : idTipeSisi.toString(),
        "id_deskripsi": idDeskripsi == null ? "-" : idDeskripsi.toString(),
        "deskripsi": deskripsi == null ? "-" : deskripsi.toString(),
        "qty_raw": qtyRaw == null ? "-" : qtyRaw.toString(),
        "t_raw": tRaw == null ? "-" : tRaw.toString(),
        "w_raw": wRaw == null ? "-" : wRaw.toString(),
        "l_raw": lRaw == null ? "-" : lRaw.toString(),
        "qty_final": qtyFinal == null ? "-" : qtyFinal.toString(),
        "t_final": tFinal == null ? "-" : tFinal.toString(),
        "w_final": wFinal == null ? "-" : wFinal.toString(),
        "l_final": lFinal == null ? "-" : lFinal.toString(),
        "unit_price": unitPrice == null ? "-" : unitPrice.toString(),
        "konstanta": konstanta == null ? "-" : konstanta.toString(),
        "kode_item": kodeItem == null ? "-" : kodeItem.toString(),
        "nama_item": namaItem == null ? "-" : namaItem.toString(),
        "nama_finishing_barang_jadi": namaFinishingBarangJadi == null ? "-" : namaFinishingBarangJadi.toString(),
        "nama_tipe_sisi": namaTipeSisi == null ? "-" : namaTipeSisi.toString(),
        "harga_satuan": hargaSatuan == null ? "-" : hargaSatuan.toString(),
        "koefisien": koefisien == null ? "-" : koefisien.toString(),
        "kode_item_bahan": kodeItemBahan == null ? "-" : kodeItemBahan.toString(),
    };
}

class AnalisaFinTpF {
    AnalisaFinTpF({
        this.idRaeAnalisaBarangJadiFinishing,
        this.idRaeDetail,
        this.idItemBuaso,
        this.idFinishingBarangJadi,
        this.qty,
        this.unitPrice,
        this.konstanta,
        this.ref,
        this.kodeItem,
        this.namaItem,
        this.kodeSatuan,
        this.namaSatuan,
        this.namaFinishingBarangJadi,
        this.hargaSatuan,
        this.koefisien,
        this.kodeItemBahan,
    });

    final String? idRaeAnalisaBarangJadiFinishing;
    final String? idRaeDetail;
    final String? idItemBuaso;
    final String? idFinishingBarangJadi;
    final String? qty;
    final String? unitPrice;
    final String? konstanta;
    final String? ref;
    final String? kodeItem;
    final String? namaItem;
    final String? kodeSatuan;
    final String? namaSatuan;
    final String? namaFinishingBarangJadi;
    final String? hargaSatuan;
    final String? koefisien;
    final String? kodeItemBahan;

    factory AnalisaFinTpF.fromRawJson(String str) => AnalisaFinTpF.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AnalisaFinTpF.fromJson(Map<String, dynamic> json) => AnalisaFinTpF(
        idRaeAnalisaBarangJadiFinishing: json["id_rae_analisa_barang_jadi_finishing"] == null ? "-" : json["id_rae_analisa_barang_jadi_finishing"].toString(),
        idRaeDetail: json["id_rae_detail"] == null ? "-" : json["id_rae_detail"].toString(),
        idItemBuaso: json["id_item_buaso"] == null ? "-" : json["id_item_buaso"].toString(),
        idFinishingBarangJadi: json["id_finishing_barang_jadi"] == null ? "-" : json["id_finishing_barang_jadi"].toString(),
        qty: json["qty"] == null ? "-" : json["qty"].toString(),
        unitPrice: json["unit_price"] == null ? "-" : json["unit_price"].toString(),
        konstanta: json["konstanta"] == null ? "-" : json["konstanta"].toString(),
        ref: json["ref"] == null ? "-" : json["ref"].toString(),
        kodeItem: json["kode_item"] == null ? "-" : json["kode_item"].toString(),
        namaItem: json["nama_item"] == null ? "-" : json["nama_item"].toString(),
        kodeSatuan: json["kode_satuan"] == null ? "-" : json["kode_satuan"].toString(),
        namaSatuan: json["nama_satuan"] == null ? "-" : json["nama_satuan"].toString(),
        namaFinishingBarangJadi: json["nama_finishing_barang_jadi"] == null ? "-" : json["nama_finishing_barang_jadi"].toString(),
        hargaSatuan: json["harga_satuan"] == null ? "-" : json["harga_satuan"].toString(),
        koefisien: json["koefisien"] == null ? "-" : json["koefisien"].toString(),
        kodeItemBahan: json["kode_item_bahan"] == null ? "-" : json["kode_item_bahan"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id_rae_analisa_barang_jadi_finishing": idRaeAnalisaBarangJadiFinishing == null ? "-" : idRaeAnalisaBarangJadiFinishing.toString(),
        "id_rae_detail": idRaeDetail == null ? "-" : idRaeDetail.toString(),
        "id_item_buaso": idItemBuaso == null ? "-" : idItemBuaso.toString(),
        "id_finishing_barang_jadi": idFinishingBarangJadi == null ? "-" : idFinishingBarangJadi.toString(),
        "qty": qty == null ? "-" : qty.toString(),
        "unit_price": unitPrice == null ? "-" : unitPrice.toString(),
        "konstanta": konstanta == null ? "-" : konstanta.toString(),
        "ref": ref == null ? "-" : ref.toString(),
        "kode_item": kodeItem == null ? "-" : kodeItem.toString(),
        "nama_item": namaItem == null ? "-" : namaItem.toString(),
        "kode_satuan": kodeSatuan == null ? "-" : kodeSatuan.toString(),
        "nama_satuan": namaSatuan == null ? "-" : namaSatuan.toString(),
        "nama_finishing_barang_jadi": namaFinishingBarangJadi == null ? "-" : namaFinishingBarangJadi.toString(),
        "harga_satuan": hargaSatuan == null ? "-" : hargaSatuan.toString(),
        "koefisien": koefisien == null ? "-" : koefisien.toString(),
        "kode_item_bahan": kodeItemBahan == null ? "-" : kodeItemBahan.toString(),
    };
}

class AnalisaFinTpLc {
    AnalisaFinTpLc({
        this.idRaeAnalisaBarangJadiFinishing,
        this.idRaeDetail,
        this.idItemBuaso,
        this.idFinishingBarangJadi,
        this.qty,
        this.unitPrice,
        this.konstanta,
        this.ref,
        this.kodeItem,
        this.namaItem,
        this.kodeSatuan,
        this.namaSatuan,
        this.namaFinishingBarangJadi,
        this.hargaSatuan,
        this.koefisien,
        this.kodeItemBahan,
    });

    final String? idRaeAnalisaBarangJadiFinishing;
    final String? idRaeDetail;
    final String? idItemBuaso;
    final String? idFinishingBarangJadi;
    final String? qty;
    final String? unitPrice;
    final String? konstanta;
    final String? ref;
    final String? kodeItem;
    final String? namaItem;
    final String? kodeSatuan;
    final String? namaSatuan;
    final String? namaFinishingBarangJadi;
    final String? hargaSatuan;
    final String? koefisien;
    final String? kodeItemBahan;

    factory AnalisaFinTpLc.fromRawJson(String str) => AnalisaFinTpLc.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AnalisaFinTpLc.fromJson(Map<String, dynamic> json) => AnalisaFinTpLc(
        idRaeAnalisaBarangJadiFinishing: json["id_rae_analisa_barang_jadi_finishing"] == null ? "-" : json["id_rae_analisa_barang_jadi_finishing"].toString(),
        idRaeDetail: json["id_rae_detail"] == null ? "-" : json["id_rae_detail"].toString(),
        idItemBuaso: json["id_item_buaso"] == null ? "-" : json["id_item_buaso"].toString(),
        idFinishingBarangJadi: json["id_finishing_barang_jadi"] == null ? "-" : json["id_finishing_barang_jadi"].toString(),
        qty: json["qty"] == null ? "-" : json["qty"].toString(),
        unitPrice: json["unit_price"] == null ? "-" : json["unit_price"].toString(),
        konstanta: json["konstanta"] == null ? "-" : json["konstanta"].toString(),
        ref: json["ref"] == null ? "-" : json["ref"].toString(),
        kodeItem: json["kode_item"] == null ? "-" : json["kode_item"].toString(),
        namaItem: json["nama_item"] == null ? "-" : json["nama_item"].toString(),
        kodeSatuan: json["kode_satuan"] == null ? "-" : json["kode_satuan"].toString(),
        namaSatuan: json["nama_satuan"] == null ? "-" : json["nama_satuan"].toString(),
        namaFinishingBarangJadi: json["nama_finishing_barang_jadi"] == null ? "-" : json["nama_finishing_barang_jadi"].toString(),
        hargaSatuan: json["harga_satuan"] == null ? "-" : json["harga_satuan"].toString(),
        koefisien: json["koefisien"] == null ? "-" : json["koefisien"].toString(),
        kodeItemBahan: json["kode_item_bahan"] == null ? "-" : json["kode_item_bahan"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id_rae_analisa_barang_jadi_finishing": idRaeAnalisaBarangJadiFinishing == null ? "-" : idRaeAnalisaBarangJadiFinishing.toString(),
        "id_rae_detail": idRaeDetail == null ? "-" : idRaeDetail.toString(),
        "id_item_buaso": idItemBuaso == null ? "-" : idItemBuaso.toString(),
        "id_finishing_barang_jadi": idFinishingBarangJadi == null ? "-" : idFinishingBarangJadi.toString(),
        "qty": qty == null ? "-" : qty.toString(),
        "unit_price": unitPrice == null ? "-" : unitPrice.toString(),
        "konstanta": konstanta == null ? "-" : konstanta.toString(),
        "ref": ref == null ? "-" : ref.toString(),
        "kode_item": kodeItem == null ? "-" : kodeItem.toString(),
        "nama_item": namaItem == null ? "-" : namaItem.toString(),
        "kode_satuan": kodeSatuan == null ? "-" : kodeSatuan.toString(),
        "nama_satuan": namaSatuan == null ? "-" : namaSatuan.toString(),
        "nama_finishing_barang_jadi": namaFinishingBarangJadi == null ? "-" : namaFinishingBarangJadi.toString(),
        "harga_satuan": hargaSatuan == null ? "-" : hargaSatuan.toString(),
        "koefisien": koefisien == null ? "-" : koefisien.toString(),
        "kode_item_bahan": kodeItemBahan == null ? "-" : kodeItemBahan.toString(),
    };
}

class AnalisaFinTpMp {
    AnalisaFinTpMp({
        this.idRaeAnalisaBarangJadiFinishing,
        this.idRaeDetail,
        this.idItemBuaso,
        this.idFinishingBarangJadi,
        this.qty,
        this.unitPrice,
        this.konstanta,
        this.ref,
        this.kodeItem,
        this.namaItem,
        this.kodeSatuan,
        this.namaSatuan,
        this.namaFinishingBarangJadi,
        this.hargaSatuan,
        this.koefisien,
        this.kodeItemBahan,
    });

    final String? idRaeAnalisaBarangJadiFinishing;
    final String? idRaeDetail;
    final String? idItemBuaso;
    final String? idFinishingBarangJadi;
    final String? qty;
    final String? unitPrice;
    final String? konstanta;
    final String? ref;
    final String? kodeItem;
    final String? namaItem;
    final String? kodeSatuan;
    final String? namaSatuan;
    final String? namaFinishingBarangJadi;
    final String? hargaSatuan;
    final String? koefisien;
    final String? kodeItemBahan;

    factory AnalisaFinTpMp.fromRawJson(String str) => AnalisaFinTpMp.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AnalisaFinTpMp.fromJson(Map<String, dynamic> json) => AnalisaFinTpMp(
        idRaeAnalisaBarangJadiFinishing: json["id_rae_analisa_barang_jadi_finishing"] == null ? "-" : json["id_rae_analisa_barang_jadi_finishing"].toString(),
        idRaeDetail: json["id_rae_detail"] == null ? "-" : json["id_rae_detail"].toString(),
        idItemBuaso: json["id_item_buaso"] == null ? "-" : json["id_item_buaso"].toString(),
        idFinishingBarangJadi: json["id_finishing_barang_jadi"] == null ? "-" : json["id_finishing_barang_jadi"].toString(),
        qty: json["qty"] == null ? "-" : json["qty"].toString(),
        unitPrice: json["unit_price"] == null ? "-" : json["unit_price"].toString(),
        konstanta: json["konstanta"] == null ? "-" : json["konstanta"].toString(),
        ref: json["ref"] == null ? "-" : json["ref"].toString(),
        kodeItem: json["kode_item"] == null ? "-" : json["kode_item"].toString(),
        namaItem: json["nama_item"] == null ? "-" : json["nama_item"].toString(),
        kodeSatuan: json["kode_satuan"] == null ? "-" : json["kode_satuan"].toString(),
        namaSatuan: json["nama_satuan"] == null ? "-" : json["nama_satuan"].toString(),
        namaFinishingBarangJadi: json["nama_finishing_barang_jadi"] == null ? "-" : json["nama_finishing_barang_jadi"].toString(),
        hargaSatuan: json["harga_satuan"] == null ? "-" : json["harga_satuan"].toString(),
        koefisien: json["koefisien"] == null ? "-" : json["koefisien"].toString(),
        kodeItemBahan: json["kode_item_bahan"] == null ? "-" : json["kode_item_bahan"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id_rae_analisa_barang_jadi_finishing": idRaeAnalisaBarangJadiFinishing == null ? "-" : idRaeAnalisaBarangJadiFinishing.toString(),
        "id_rae_detail": idRaeDetail == null ? "-" : idRaeDetail.toString(),
        "id_item_buaso": idItemBuaso == null ? "-" : idItemBuaso.toString(),
        "id_finishing_barang_jadi": idFinishingBarangJadi == null ? "-" : idFinishingBarangJadi.toString(),
        "qty": qty == null ? "-" : qty.toString(),
        "unit_price": unitPrice == null ? "-" : unitPrice.toString(),
        "konstanta": konstanta == null ? "-" : konstanta.toString(),
        "ref": ref == null ? "-" : ref.toString(),
        "kode_item": kodeItem == null ? "-" : kodeItem.toString(),
        "nama_item": namaItem == null ? "-" : namaItem.toString(),
        "kode_satuan": kodeSatuan == null ? "-" : kodeSatuan.toString(),
        "nama_satuan": namaSatuan == null ? "-" : namaSatuan.toString(),
        "nama_finishing_barang_jadi": namaFinishingBarangJadi == null ? "-" : namaFinishingBarangJadi.toString(),
        "harga_satuan": hargaSatuan == null ? "-" : hargaSatuan.toString(),
        "koefisien": koefisien == null ? "-" : koefisien.toString(),
        "kode_item_bahan": kodeItemBahan == null ? "-" : kodeItemBahan.toString(),
    };
}

class AnalisaFinTpBop {
    AnalisaFinTpBop({
        this.idRaeAnalisaBarangJadiFinishing,
        this.idRaeDetail,
        this.idItemBuaso,
        this.idFinishingBarangJadi,
        this.qty,
        this.unitPrice,
        this.konstanta,
        this.ref,
        this.kodeItem,
        this.namaItem,
        this.kodeSatuan,
        this.namaSatuan,
        this.namaFinishingBarangJadi,
        this.hargaSatuan,
        this.koefisien,
        this.kodeItemBahan,
    });

    final String? idRaeAnalisaBarangJadiFinishing;
    final String? idRaeDetail;
    final String? idItemBuaso;
    final String? idFinishingBarangJadi;
    final String? qty;
    final String? unitPrice;
    final String? konstanta;
    final String? ref;
    final String? kodeItem;
    final String? namaItem;
    final String? kodeSatuan;
    final String? namaSatuan;
    final String? namaFinishingBarangJadi;
    final String? hargaSatuan;
    final String? koefisien;
    final String? kodeItemBahan;

    factory AnalisaFinTpBop.fromRawJson(String str) => AnalisaFinTpBop.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AnalisaFinTpBop.fromJson(Map<String, dynamic> json) => AnalisaFinTpBop(
        idRaeAnalisaBarangJadiFinishing: json["id_rae_analisa_barang_jadi_finishing"] == null ? "-" : json["id_rae_analisa_barang_jadi_finishing"].toString(),
        idRaeDetail: json["id_rae_detail"] == null ? "-" : json["id_rae_detail"].toString(),
        idItemBuaso: json["id_item_buaso"] == null ? "-" : json["id_item_buaso"].toString(),
        idFinishingBarangJadi: json["id_finishing_barang_jadi"] == null ? "-" : json["id_finishing_barang_jadi"].toString(),
        qty: json["qty"] == null ? "-" : json["qty"].toString(),
        unitPrice: json["unit_price"] == null ? "-" : json["unit_price"].toString(),
        konstanta: json["konstanta"] == null ? "-" : json["konstanta"].toString(),
        ref: json["ref"] == null ? "-" : json["ref"].toString(),
        kodeItem: json["kode_item"] == null ? "-" : json["kode_item"].toString(),
        namaItem: json["nama_item"] == null ? "-" : json["nama_item"].toString(),
        kodeSatuan: json["kode_satuan"] == null ? "-" : json["kode_satuan"].toString(),
        namaSatuan: json["nama_satuan"] == null ? "-" : json["nama_satuan"].toString(),
        namaFinishingBarangJadi: json["nama_finishing_barang_jadi"] == null ? "-" : json["nama_finishing_barang_jadi"].toString(),
        hargaSatuan: json["harga_satuan"] == null ? "-" : json["harga_satuan"].toString(),
        koefisien: json["koefisien"] == null ? "-" : json["koefisien"].toString(),
        kodeItemBahan: json["kode_item_bahan"] == null ? "-" : json["kode_item_bahan"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id_rae_analisa_barang_jadi_finishing": idRaeAnalisaBarangJadiFinishing == null ? "-" : idRaeAnalisaBarangJadiFinishing.toString(),
        "id_rae_detail": idRaeDetail == null ? "-" : idRaeDetail.toString(),
        "id_item_buaso": idItemBuaso == null ? "-" : idItemBuaso.toString(),
        "id_finishing_barang_jadi": idFinishingBarangJadi == null ? "-" : idFinishingBarangJadi.toString(),
        "qty": qty == null ? "-" : qty.toString(),
        "unit_price": unitPrice == null ? "-" : unitPrice.toString(),
        "konstanta": konstanta == null ? "-" : konstanta.toString(),
        "ref": ref == null ? "-" : ref.toString(),
        "kode_item": kodeItem == null ? "-" : kodeItem.toString(),
        "nama_item": namaItem == null ? "-" : namaItem.toString(),
        "kode_satuan": kodeSatuan == null ? "-" : kodeSatuan.toString(),
        "nama_satuan": namaSatuan == null ? "-" : namaSatuan.toString(),
        "nama_finishing_barang_jadi": namaFinishingBarangJadi == null ? "-" : namaFinishingBarangJadi.toString(),
        "harga_satuan": hargaSatuan == null ? "-" : hargaSatuan.toString(),
        "koefisien": koefisien == null ? "-" : koefisien.toString(),
        "kode_item_bahan": kodeItemBahan == null ? "-" : kodeItemBahan.toString(),
    };
}

class AnalisaFinFnBp {
    AnalisaFinFnBp({
        this.idRaeAnalisaBarangJadiFinishing,
        this.idRaeDetail,
        this.idItemBuaso,
        this.idFinishingBarangJadi,
        this.qty,
        this.unitPrice,
        this.konstanta,
        this.ref,
        this.kodeItem,
        this.namaItem,
        this.kodeSatuan,
        this.namaSatuan,
        this.namaFinishingBarangJadi,
        this.hargaSatuan,
        this.koefisien,
        this.kodeItemBahan,
    });

    final String? idRaeAnalisaBarangJadiFinishing;
    final String? idRaeDetail;
    final String? idItemBuaso;
    final String? idFinishingBarangJadi;
    final String? qty;
    final String? unitPrice;
    final String? konstanta;
    final String? ref;
    final String? kodeItem;
    final String? namaItem;
    final String? kodeSatuan;
    final String? namaSatuan;
    final String? namaFinishingBarangJadi;
    final String? hargaSatuan;
    final String? koefisien;
    final String? kodeItemBahan;

    factory AnalisaFinFnBp.fromRawJson(String str) => AnalisaFinFnBp.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AnalisaFinFnBp.fromJson(Map<String, dynamic> json) => AnalisaFinFnBp(
        idRaeAnalisaBarangJadiFinishing: json["id_rae_analisa_barang_jadi_finishing"] == null ? "-" : json["id_rae_analisa_barang_jadi_finishing"].toString(),
        idRaeDetail: json["id_rae_detail"] == null ? "-" : json["id_rae_detail"].toString(),
        idItemBuaso: json["id_item_buaso"] == null ? "-" : json["id_item_buaso"].toString(),
        idFinishingBarangJadi: json["id_finishing_barang_jadi"] == null ? "-" : json["id_finishing_barang_jadi"].toString(),
        qty: json["qty"] == null ? "-" : json["qty"].toString(),
        unitPrice: json["unit_price"] == null ? "-" : json["unit_price"].toString(),
        konstanta: json["konstanta"] == null ? "-" : json["konstanta"].toString(),
        ref: json["ref"] == null ? "-" : json["ref"].toString(),
        kodeItem: json["kode_item"] == null ? "-" : json["kode_item"].toString(),
        namaItem: json["nama_item"] == null ? "-" : json["nama_item"].toString(),
        kodeSatuan: json["kode_satuan"] == null ? "-" : json["kode_satuan"].toString(),
        namaSatuan: json["nama_satuan"] == null ? "-" : json["nama_satuan"].toString(),
        namaFinishingBarangJadi: json["nama_finishing_barang_jadi"] == null ? "-" : json["nama_finishing_barang_jadi"].toString(),
        hargaSatuan: json["harga_satuan"] == null ? "-" : json["harga_satuan"].toString(),
        koefisien: json["koefisien"] == null ? "-" : json["koefisien"].toString(),
        kodeItemBahan: json["kode_item_bahan"] == null ? "-" : json["kode_item_bahan"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id_rae_analisa_barang_jadi_finishing": idRaeAnalisaBarangJadiFinishing == null ? "-" : idRaeAnalisaBarangJadiFinishing.toString(),
        "id_rae_detail": idRaeDetail == null ? "-" : idRaeDetail.toString(),
        "id_item_buaso": idItemBuaso == null ? "-" : idItemBuaso.toString(),
        "id_finishing_barang_jadi": idFinishingBarangJadi == null ? "-" : idFinishingBarangJadi.toString(),
        "qty": qty == null ? "-" : qty.toString(),
        "unit_price": unitPrice == null ? "-" : unitPrice.toString(),
        "konstanta": konstanta == null ? "-" : konstanta.toString(),
        "ref": ref == null ? "-" : ref.toString(),
        "kode_item": kodeItem == null ? "-" : kodeItem.toString(),
        "nama_item": namaItem == null ? "-" : namaItem.toString(),
        "kode_satuan": kodeSatuan == null ? "-" : kodeSatuan.toString(),
        "nama_satuan": namaSatuan == null ? "-" : namaSatuan.toString(),
        "nama_finishing_barang_jadi": namaFinishingBarangJadi == null ? "-" : namaFinishingBarangJadi.toString(),
        "harga_satuan": hargaSatuan == null ? "-" : hargaSatuan.toString(),
        "koefisien": koefisien == null ? "-" : koefisien.toString(),
        "kode_item_bahan": kodeItemBahan == null ? "-" : kodeItemBahan.toString(),
    };
}

class AnalisaFinFnSc {
    AnalisaFinFnSc({
        this.idRaeAnalisaBarangJadiFinishing,
        this.idRaeDetail,
        this.idItemBuaso,
        this.idFinishingBarangJadi,
        this.qty,
        this.unitPrice,
        this.konstanta,
        this.ref,
        this.kodeItem,
        this.namaItem,
        this.kodeSatuan,
        this.namaSatuan,
        this.namaFinishingBarangJadi,
        this.hargaSatuan,
        this.koefisien,
        this.kodeItemBahan,
    });

    final String? idRaeAnalisaBarangJadiFinishing;
    final String? idRaeDetail;
    final String? idItemBuaso;
    final String? idFinishingBarangJadi;
    final String? qty;
    final String? unitPrice;
    final String? konstanta;
    final String? ref;
    final String? kodeItem;
    final String? namaItem;
    final String? kodeSatuan;
    final String? namaSatuan;
    final String? namaFinishingBarangJadi;
    final String? hargaSatuan;
    final String? koefisien;
    final String? kodeItemBahan;

    factory AnalisaFinFnSc.fromRawJson(String str) => AnalisaFinFnSc.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AnalisaFinFnSc.fromJson(Map<String, dynamic> json) => AnalisaFinFnSc(
        idRaeAnalisaBarangJadiFinishing: json["id_rae_analisa_barang_jadi_finishing"] == null ? "-" : json["id_rae_analisa_barang_jadi_finishing"].toString(),
        idRaeDetail: json["id_rae_detail"] == null ? "-" : json["id_rae_detail"].toString(),
        idItemBuaso: json["id_item_buaso"] == null ? "-" : json["id_item_buaso"].toString(),
        idFinishingBarangJadi: json["id_finishing_barang_jadi"] == null ? "-" : json["id_finishing_barang_jadi"].toString(),
        qty: json["qty"] == null ? "-" : json["qty"].toString(),
        unitPrice: json["unit_price"] == null ? "-" : json["unit_price"].toString(),
        konstanta: json["konstanta"] == null ? "-" : json["konstanta"].toString(),
        ref: json["ref"] == null ? "-" : json["ref"].toString(),
        kodeItem: json["kode_item"] == null ? "-" : json["kode_item"].toString(),
        namaItem: json["nama_item"] == null ? "-" : json["nama_item"].toString(),
        kodeSatuan: json["kode_satuan"] == null ? "-" : json["kode_satuan"].toString(),
        namaSatuan: json["nama_satuan"] == null ? "-" : json["nama_satuan"].toString(),
        namaFinishingBarangJadi: json["nama_finishing_barang_jadi"] == null ? "-" : json["nama_finishing_barang_jadi"].toString(),
        hargaSatuan: json["harga_satuan"] == null ? "-" : json["harga_satuan"].toString(),
        koefisien: json["koefisien"] == null ? "-" : json["koefisien"].toString(),
        kodeItemBahan: json["kode_item_bahan"] == null ? "-" : json["kode_item_bahan"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id_rae_analisa_barang_jadi_finishing": idRaeAnalisaBarangJadiFinishing == null ? "-" : idRaeAnalisaBarangJadiFinishing.toString(),
        "id_rae_detail": idRaeDetail == null ? "-" : idRaeDetail.toString(),
        "id_item_buaso": idItemBuaso == null ? "-" : idItemBuaso.toString(),
        "id_finishing_barang_jadi": idFinishingBarangJadi == null ? "-" : idFinishingBarangJadi.toString(),
        "qty": qty == null ? "-" : qty.toString(),
        "unit_price": unitPrice == null ? "-" : unitPrice.toString(),
        "konstanta": konstanta == null ? "-" : konstanta.toString(),
        "ref": ref == null ? "-" : ref.toString(),
        "kode_item": kodeItem == null ? "-" : kodeItem.toString(),
        "nama_item": namaItem == null ? "-" : namaItem.toString(),
        "kode_satuan": kodeSatuan == null ? "-" : kodeSatuan.toString(),
        "nama_satuan": namaSatuan == null ? "-" : namaSatuan.toString(),
        "nama_finishing_barang_jadi": namaFinishingBarangJadi == null ? "-" : namaFinishingBarangJadi.toString(),
        "harga_satuan": hargaSatuan == null ? "-" : hargaSatuan.toString(),
        "koefisien": koefisien == null ? "-" : koefisien.toString(),
        "kode_item_bahan": kodeItemBahan == null ? "-" : kodeItemBahan.toString(),
    };
}

class AnalisaFinFnLc {
    AnalisaFinFnLc({
        this.idRaeAnalisaBarangJadiFinishing,
        this.idRaeDetail,
        this.idItemBuaso,
        this.idFinishingBarangJadi,
        this.qty,
        this.unitPrice,
        this.konstanta,
        this.ref,
        this.kodeItem,
        this.namaItem,
        this.kodeSatuan,
        this.namaSatuan,
        this.namaFinishingBarangJadi,
        this.hargaSatuan,
        this.koefisien,
        this.kodeItemBahan,
    });

    final String? idRaeAnalisaBarangJadiFinishing;
    final String? idRaeDetail;
    final String? idItemBuaso;
    final String? idFinishingBarangJadi;
    final String? qty;
    final String? unitPrice;
    final String? konstanta;
    final String? ref;
    final String? kodeItem;
    final String? namaItem;
    final String? kodeSatuan;
    final String? namaSatuan;
    final String? namaFinishingBarangJadi;
    final String? hargaSatuan;
    final String? koefisien;
    final String? kodeItemBahan;

    factory AnalisaFinFnLc.fromRawJson(String str) => AnalisaFinFnLc.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AnalisaFinFnLc.fromJson(Map<String, dynamic> json) => AnalisaFinFnLc(
        idRaeAnalisaBarangJadiFinishing: json["id_rae_analisa_barang_jadi_finishing"] == null ? "-" : json["id_rae_analisa_barang_jadi_finishing"].toString(),
        idRaeDetail: json["id_rae_detail"] == null ? "-" : json["id_rae_detail"].toString(),
        idItemBuaso: json["id_item_buaso"] == null ? "-" : json["id_item_buaso"].toString(),
        idFinishingBarangJadi: json["id_finishing_barang_jadi"] == null ? "-" : json["id_finishing_barang_jadi"].toString(),
        qty: json["qty"] == null ? "-" : json["qty"].toString(),
        unitPrice: json["unit_price"] == null ? "-" : json["unit_price"].toString(),
        konstanta: json["konstanta"] == null ? "-" : json["konstanta"].toString(),
        ref: json["ref"] == null ? "-" : json["ref"].toString(),
        kodeItem: json["kode_item"] == null ? "-" : json["kode_item"].toString(),
        namaItem: json["nama_item"] == null ? "-" : json["nama_item"].toString(),
        kodeSatuan: json["kode_satuan"] == null ? "-" : json["kode_satuan"].toString(),
        namaSatuan: json["nama_satuan"] == null ? "-" : json["nama_satuan"].toString(),
        namaFinishingBarangJadi: json["nama_finishing_barang_jadi"] == null ? "-" : json["nama_finishing_barang_jadi"].toString(),
        hargaSatuan: json["harga_satuan"] == null ? "-" : json["harga_satuan"].toString(),
        koefisien: json["koefisien"] == null ? "-" : json["koefisien"].toString(),
        kodeItemBahan: json["kode_item_bahan"] == null ? "-" : json["kode_item_bahan"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id_rae_analisa_barang_jadi_finishing": idRaeAnalisaBarangJadiFinishing == null ? "-" : idRaeAnalisaBarangJadiFinishing.toString(),
        "id_rae_detail": idRaeDetail == null ? "-" : idRaeDetail.toString(),
        "id_item_buaso": idItemBuaso == null ? "-" : idItemBuaso.toString(),
        "id_finishing_barang_jadi": idFinishingBarangJadi == null ? "-" : idFinishingBarangJadi.toString(),
        "qty": qty == null ? "-" : qty.toString(),
        "unit_price": unitPrice == null ? "-" : unitPrice.toString(),
        "konstanta": konstanta == null ? "-" : konstanta.toString(),
        "ref": ref == null ? "-" : ref.toString(),
        "kode_item": kodeItem == null ? "-" : kodeItem.toString(),
        "nama_item": namaItem == null ? "-" : namaItem.toString(),
        "kode_satuan": kodeSatuan == null ? "-" : kodeSatuan.toString(),
        "nama_satuan": namaSatuan == null ? "-" : namaSatuan.toString(),
        "nama_finishing_barang_jadi": namaFinishingBarangJadi == null ? "-" : namaFinishingBarangJadi.toString(),
        "harga_satuan": hargaSatuan == null ? "-" : hargaSatuan.toString(),
        "koefisien": koefisien == null ? "-" : koefisien.toString(),
        "kode_item_bahan": kodeItemBahan == null ? "-" : kodeItemBahan.toString(),
    };
}

class AnalisaLabourCostOnsite {
    AnalisaLabourCostOnsite({
        this.idRaeAnalisaBarangJadiExtraCost,
        this.idRaeDetail,
        this.idItemBuaso,
        this.qty,
        this.unitPrice,
        this.konstanta,
        this.ref,
        this.kodeItem,
        this.namaItem,
        this.kodeSatuan,
        this.namaSatuan,
        this.hargaSatuan,
        this.koefisien,
        this.kodeItemBahan,
    });

    final String? idRaeAnalisaBarangJadiExtraCost;
    final String? idRaeDetail;
    final String? idItemBuaso;
    final String? qty;
    final String? unitPrice;
    final String? konstanta;
    final String? ref;
    final String? kodeItem;
    final String? namaItem;
    final String? kodeSatuan;
    final String? namaSatuan;
    final String? hargaSatuan;
    final String? koefisien;
    final String? kodeItemBahan;

    factory AnalisaLabourCostOnsite.fromRawJson(String str) => AnalisaLabourCostOnsite.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AnalisaLabourCostOnsite.fromJson(Map<String, dynamic> json) => AnalisaLabourCostOnsite(
        idRaeAnalisaBarangJadiExtraCost: json["id_rae_analisa_barang_jadi_extra_cost"] == null ? "-" : json["id_rae_analisa_barang_jadi_extra_cost"].toString(),
        idRaeDetail: json["id_rae_detail"] == null ? "-" : json["id_rae_detail"].toString(),
        idItemBuaso: json["id_item_buaso"] == null ? "-" : json["id_item_buaso"].toString(),
        qty: json["qty"] == null ? "-" : json["qty"].toString(),
        unitPrice: json["unit_price"] == null ? "-" : json["unit_price"].toString(),
        konstanta: json["konstanta"] == null ? "-" : json["konstanta"].toString(),
        ref: json["ref"] == null ? "-" : json["ref"].toString(),
        kodeItem: json["kode_item"] == null ? "-" : json["kode_item"].toString(),
        namaItem: json["nama_item"] == null ? "-" : json["nama_item"].toString(),
        kodeSatuan: json["kode_satuan"] == null ? "-" : json["kode_satuan"].toString(),
        namaSatuan: json["nama_satuan"] == null ? "-" : json["nama_satuan"].toString(),
        hargaSatuan: json["harga_satuan"] == null ? "-" : json["harga_satuan"].toString(),
        koefisien: json["koefisien"] == null ? "-" : json["koefisien"].toString(),
        kodeItemBahan: json["kode_item_bahan"] == null ? "-" : json["kode_item_bahan"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id_rae_analisa_barang_jadi_extra_cost": idRaeAnalisaBarangJadiExtraCost == null ? "-" : idRaeAnalisaBarangJadiExtraCost.toString(),
        "id_rae_detail": idRaeDetail == null ? "-" : idRaeDetail.toString(),
        "id_item_buaso": idItemBuaso == null ? "-" : idItemBuaso.toString(),
        "qty": qty == null ? "-" : qty.toString(),
        "unit_price": unitPrice == null ? "-" : unitPrice.toString(),
        "konstanta": konstanta == null ? "-" : konstanta.toString(),
        "ref": ref == null ? "-" : ref.toString(),
        "kode_item": kodeItem == null ? "-" : kodeItem.toString(),
        "nama_item": namaItem == null ? "-" : namaItem.toString(),
        "kode_satuan": kodeSatuan == null ? "-" : kodeSatuan.toString(),
        "nama_satuan": namaSatuan == null ? "-" : namaSatuan.toString(),
        "harga_satuan": hargaSatuan == null ? "-" : hargaSatuan.toString(),
        "koefisien": koefisien == null ? "-" : koefisien.toString(),
        "kode_item_bahan": kodeItemBahan == null ? "-" : kodeItemBahan.toString(),
    };
}

class AnalisaBiayaOverheadKantor {
    AnalisaBiayaOverheadKantor({
        this.idRaeAnalisaBarangJadiExtraCost,
        this.idRaeDetail,
        this.idItemBuaso,
        this.qty,
        this.unitPrice,
        this.konstanta,
        this.ref,
        this.kodeItem,
        this.namaItem,
        this.kodeSatuan,
        this.namaSatuan,
        this.hargaSatuan,
        this.koefisien,
        this.kodeItemBahan,
    });

    final String? idRaeAnalisaBarangJadiExtraCost;
    final String? idRaeDetail;
    final String? idItemBuaso;
    final String? qty;
    final String? unitPrice;
    final String? konstanta;
    final String? ref;
    final String? kodeItem;
    final String? namaItem;
    final String? kodeSatuan;
    final String? namaSatuan;
    final String? hargaSatuan;
    final String? koefisien;
    final String? kodeItemBahan;

    factory AnalisaBiayaOverheadKantor.fromRawJson(String str) => AnalisaBiayaOverheadKantor.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AnalisaBiayaOverheadKantor.fromJson(Map<String, dynamic> json) => AnalisaBiayaOverheadKantor(
        idRaeAnalisaBarangJadiExtraCost: json["id_rae_analisa_barang_jadi_extra_cost"] == null ? "-" : json["id_rae_analisa_barang_jadi_extra_cost"].toString(),
        idRaeDetail: json["id_rae_detail"] == null ? "-" : json["id_rae_detail"].toString(),
        idItemBuaso: json["id_item_buaso"] == null ? "-" : json["id_item_buaso"].toString(),
        qty: json["qty"] == null ? "-" : json["qty"].toString(),
        unitPrice: json["unit_price"] == null ? "-" : json["unit_price"].toString(),
        konstanta: json["konstanta"] == null ? "-" : json["konstanta"].toString(),
        ref: json["ref"] == null ? "-" : json["ref"].toString(),
        kodeItem: json["kode_item"] == null ? "-" : json["kode_item"].toString(),
        namaItem: json["nama_item"] == null ? "-" : json["nama_item"].toString(),
        kodeSatuan: json["kode_satuan"] == null ? "-" : json["kode_satuan"].toString(),
        namaSatuan: json["nama_satuan"] == null ? "-" : json["nama_satuan"].toString(),
        hargaSatuan: json["harga_satuan"] == null ? "-" : json["harga_satuan"].toString(),
        koefisien: json["koefisien"] == null ? "-" : json["koefisien"].toString(),
        kodeItemBahan: json["kode_item_bahan"] == null ? "-" : json["kode_item_bahan"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id_rae_analisa_barang_jadi_extra_cost": idRaeAnalisaBarangJadiExtraCost == null ? "-" : idRaeAnalisaBarangJadiExtraCost.toString(),
        "id_rae_detail": idRaeDetail == null ? "-" : idRaeDetail.toString(),
        "id_item_buaso": idItemBuaso == null ? "-" : idItemBuaso.toString(),
        "qty": qty == null ? "-" : qty.toString(),
        "unit_price": unitPrice == null ? "-" : unitPrice.toString(),
        "konstanta": konstanta == null ? "-" : konstanta.toString(),
        "ref": ref == null ? "-" : ref.toString(),
        "kode_item": kodeItem == null ? "-" : kodeItem.toString(),
        "nama_item": namaItem == null ? "-" : namaItem.toString(),
        "kode_satuan": kodeSatuan == null ? "-" : kodeSatuan.toString(),
        "nama_satuan": namaSatuan == null ? "-" : namaSatuan.toString(),
        "harga_satuan": hargaSatuan == null ? "-" : hargaSatuan.toString(),
        "koefisien": koefisien == null ? "-" : koefisien.toString(),
        "kode_item_bahan": kodeItemBahan == null ? "-" : kodeItemBahan.toString(),
    };
}

class AnalisaAlatBantuOnsite {
    AnalisaAlatBantuOnsite({
        this.idRaeAnalisaBarangJadiExtraCost,
        this.idRaeDetail,
        this.idItemBuaso,
        this.qty,
        this.unitPrice,
        this.konstanta,
        this.ref,
        this.kodeItem,
        this.namaItem,
        this.kodeSatuan,
        this.namaSatuan,
        this.hargaSatuan,
        this.koefisien,
        this.kodeItemBahan,
    });

    final String? idRaeAnalisaBarangJadiExtraCost;
    final String? idRaeDetail;
    final String? idItemBuaso;
    final String? qty;
    final String? unitPrice;
    final String? konstanta;
    final String? ref;
    final String? kodeItem;
    final String? namaItem;
    final String? kodeSatuan;
    final String? namaSatuan;
    final String? hargaSatuan;
    final String? koefisien;
    final String? kodeItemBahan;

    factory AnalisaAlatBantuOnsite.fromRawJson(String str) => AnalisaAlatBantuOnsite.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AnalisaAlatBantuOnsite.fromJson(Map<String, dynamic> json) => AnalisaAlatBantuOnsite(
        idRaeAnalisaBarangJadiExtraCost: json["id_rae_analisa_barang_jadi_extra_cost"] == null ? "-" : json["id_rae_analisa_barang_jadi_extra_cost"].toString(),
        idRaeDetail: json["id_rae_detail"] == null ? "-" : json["id_rae_detail"].toString(),
        idItemBuaso: json["id_item_buaso"] == null ? "-" : json["id_item_buaso"].toString(),
        qty: json["qty"] == null ? "-" : json["qty"].toString(),
        unitPrice: json["unit_price"] == null ? "-" : json["unit_price"].toString(),
        konstanta: json["konstanta"] == null ? "-" : json["konstanta"].toString(),
        ref: json["ref"] == null ? "-" : json["ref"].toString(),
        kodeItem: json["kode_item"] == null ? "-" : json["kode_item"].toString(),
        namaItem: json["nama_item"] == null ? "-" : json["nama_item"].toString(),
        kodeSatuan: json["kode_satuan"] == null ? "-" : json["kode_satuan"].toString(),
        namaSatuan: json["nama_satuan"] == null ? "-" : json["nama_satuan"].toString(),
        hargaSatuan: json["harga_satuan"] == null ? "-" : json["harga_satuan"].toString(),
        koefisien: json["koefisien"] == null ? "-" : json["koefisien"].toString(),
        kodeItemBahan: json["kode_item_bahan"] == null ? "-" : json["kode_item_bahan"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id_rae_analisa_barang_jadi_extra_cost": idRaeAnalisaBarangJadiExtraCost == null ? "-" : idRaeAnalisaBarangJadiExtraCost.toString(),
        "id_rae_detail": idRaeDetail == null ? "-" : idRaeDetail.toString(),
        "id_item_buaso": idItemBuaso == null ? "-" : idItemBuaso.toString(),
        "qty": qty == null ? "-" : qty.toString(),
        "unit_price": unitPrice == null ? "-" : unitPrice.toString(),
        "konstanta": konstanta == null ? "-" : konstanta.toString(),
        "ref": ref == null ? "-" : ref.toString(),
        "kode_item": kodeItem == null ? "-" : kodeItem.toString(),
        "nama_item": namaItem == null ? "-" : namaItem.toString(),
        "kode_satuan": kodeSatuan == null ? "-" : kodeSatuan.toString(),
        "nama_satuan": namaSatuan == null ? "-" : namaSatuan.toString(),
        "harga_satuan": hargaSatuan == null ? "-" : hargaSatuan.toString(),
        "koefisien": koefisien == null ? "-" : koefisien.toString(),
        "kode_item_bahan": kodeItemBahan == null ? "-" : kodeItemBahan.toString(),
    };
}
