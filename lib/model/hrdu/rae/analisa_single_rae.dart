// To parse this JSON data, do
//
//     final analisaSingleRegrae = analisaSingleRegraeFromJson(jsonString);

import 'dart:convert';

class AnalisaSingleRegrae {
    AnalisaSingleRegrae({
        this.status,
        this.message,
        this.data,
    });

    final bool? status;
    final String? message;
    final Data? data;

    factory AnalisaSingleRegrae.fromRawJson(String str) => AnalisaSingleRegrae.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AnalisaSingleRegrae.fromJson(Map<String, dynamic> json) => AnalisaSingleRegrae(
        status: json["status"],
        message: json["message"] == null ? "-" : json["message"].toString(),
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message == null ? "-" : message.toString(),
        "data": data!.toJson(),
    };
}

class Data {
    Data({
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
        this.gambar,
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
    final List<Gambar>? gambar;
    final List<AnalisaWood>? analisaHardwood;
    final List<AnalisaWood>? analisaPlywood;
    final List<Analisa>? analisaFinTpFs;
    final List<Analisa>? analisaFinTpLc;
    final List<Analisa>? analisaFinTpMp;
    final List<Analisa>? analisaFinTpBop;
    final List<Analisa>? analisaFinFnBp;
    final List<Analisa>? analisaFinFnSc;
    final List<Analisa>? analisaFinFnLc;
    final List<Analisa>? analisaLabourCostOnsite;
    final List<Analisa>? analisaBiayaOverheadKantor;
    final List<Analisa>? analisaAlatBantuOnsite;

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
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
        gambar: json["gambar"] == List.empty() ? [] : json["gambar"] == null ? null : List<Gambar>.from(json["gambar"].map((x) => Gambar.fromJson(x))),
        analisaHardwood: json["analisa_hardwood"] == List.empty() ? [] : json["analisa_hardwood"] == null ? null : List<AnalisaWood>.from(json["analisa_hardwood"].map((x) => AnalisaWood.fromJson(x))),
        analisaPlywood: json["analisa_plywood"] == List.empty() ? [] : json["analisa_plywood"] == null ? null : List<AnalisaWood>.from(json["analisa_plywood"].map((x) => AnalisaWood.fromJson(x))),
        analisaFinTpFs: json["analisa_fin_tp_fs"] == List.empty() ? [] : json["analisa_fin_tp_fs"] == null ? null : List<Analisa>.from(json["analisa_fin_tp_fs"].map((x) => Analisa.fromJson(x))),
        analisaFinTpLc: json["analisa_fin_tp_lc"] == List.empty() ? [] : json["analisa_fin_tp_lc"] == null ? null : List<Analisa>.from(json["analisa_fin_tp_lc"].map((x) => Analisa.fromJson(x))),
        analisaFinTpMp: json["analisa_fin_tp_mp"] == List.empty() ? [] : json["analisa_fin_tp_mp"] == null ? null : List<Analisa>.from(json["analisa_fin_tp_mp"].map((x) => Analisa.fromJson(x))),
        analisaFinTpBop: json["analisa_fin_tp_bop"] == List.empty() ? [] : json["analisa_fin_tp_bop"] == null ? null : List<Analisa>.from(json["analisa_fin_tp_bop"].map((x) => Analisa.fromJson(x))),
        analisaFinFnBp: json["analisa_fin_fn_bp"] == List.empty() ? [] : json["analisa_fin_fn_bp"] == null ? null : List<Analisa>.from(json["analisa_fin_fn_bp"].map((x) => Analisa.fromJson(x))),
        analisaFinFnSc: json["analisa_fin_fn_sc"] == List.empty() ? [] : json["analisa_fin_fn_sc"] == null ? null : List<Analisa>.from(json["analisa_fin_fn_sc"].map((x) => Analisa.fromJson(x))),
        analisaFinFnLc: json["analisa_fin_fn_lc"] == List.empty() ? [] : json["analisa_fin_fn_lc"] == null ? null : List<Analisa>.from(json["analisa_fin_fn_lc"].map((x) => Analisa.fromJson(x))),
        analisaLabourCostOnsite: json["analisa_labour_cost_onsite"] == List.empty() ? [] : json["analisa_labour_cost_onsite"] == null ? null : List<Analisa>.from(json["analisa_labour_cost_onsite"].map((x) => Analisa.fromJson(x))),
        analisaBiayaOverheadKantor: json["analisa_biaya_overhead_kantor"] == List.empty() ? [] : json["analisa_biaya_overhead_kantor"] == null ? null : List<Analisa>.from(json["analisa_biaya_overhead_kantor"].map((x) => Analisa.fromJson(x))),
        analisaAlatBantuOnsite: json["analisa_alat_bantu_onsite"] == List.empty() ? [] : json["analisa_alat_bantu_onsite"] == null ? null : List<Analisa>.from(json["analisa_alat_bantu_onsite"].map((x) => Analisa.fromJson(x))),
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
        "gambar": gambar == List.empty() ? [] : gambar == null ? null : List<dynamic>.from(gambar!.map((x) => x.toJson())),
        "analisa_hardwood": analisaHardwood == List.empty() ? [] : analisaHardwood == null ? null : List<dynamic>.from(analisaHardwood!.map((x) => x.toJson())),
        "analisa_plywood": analisaPlywood == List.empty() ? [] : analisaPlywood == null ? null : List<dynamic>.from(analisaPlywood!.map((x) => x.toJson())),
        "analisa_fin_tp_fs": analisaFinTpFs == List.empty() ? [] : analisaFinTpFs == null ? null : List<dynamic>.from(analisaFinTpFs!.map((x) => x.toJson())),
        "analisa_fin_tp_lc": analisaFinTpLc == List.empty() ? [] : analisaFinTpLc == null ? null : List<dynamic>.from(analisaFinTpLc!.map((x) => x.toJson())),
        "analisa_fin_tp_mp": analisaFinTpMp == List.empty() ? [] : analisaFinTpMp == null ? null : List<dynamic>.from(analisaFinTpMp!.map((x) => x.toJson())),
        "analisa_fin_tp_bop": analisaFinTpBop == List.empty() ? [] : analisaFinTpBop == null ? null : List<dynamic>.from(analisaFinTpBop!.map((x) => x.toJson())),
        "analisa_fin_fn_bp": analisaFinFnBp == List.empty() ? [] : analisaFinFnBp == null ? null : List<dynamic>.from(analisaFinFnBp!.map((x) => x.toJson())),
        "analisa_fin_fn_sc": analisaFinFnSc == List.empty() ? [] : analisaFinFnSc == null ? null : List<dynamic>.from(analisaFinFnSc!.map((x) => x.toJson())),
        "analisa_fin_fn_lc": analisaFinFnLc == List.empty() ? [] : analisaFinFnLc == null ? null : List<dynamic>.from(analisaFinFnLc!.map((x) => x.toJson())),
        "analisa_labour_cost_onsite": analisaLabourCostOnsite == List.empty() ? [] : analisaLabourCostOnsite == null ? null : List<dynamic>.from(analisaLabourCostOnsite!.map((x) => x.toJson())),
        "analisa_biaya_overhead_kantor": analisaBiayaOverheadKantor == List.empty() ? [] : analisaBiayaOverheadKantor == null ? null : List<dynamic>.from(analisaBiayaOverheadKantor!.map((x) => x.toJson())),
        "analisa_alat_bantu_onsite": analisaAlatBantuOnsite == List.empty() ? [] : analisaAlatBantuOnsite == null ? null : List<dynamic>.from(analisaAlatBantuOnsite!.map((x) => x.toJson())),
    };
}

class Analisa {
    Analisa({
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
        this.idRaeAnalisaBarangJadiFinishing,
        this.idFinishingBarangJadi,
        this.namaFinishingBarangJadi,
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
    final String? idRaeAnalisaBarangJadiFinishing;
    final String? idFinishingBarangJadi;
    final String? namaFinishingBarangJadi;

    factory Analisa.fromRawJson(String str) => Analisa.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Analisa.fromJson(Map<String, dynamic> json) => Analisa(
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
        idRaeAnalisaBarangJadiFinishing: json["id_rae_analisa_barang_jadi_finishing"] == null ? "-" : json["id_rae_analisa_barang_jadi_finishing"].toString(),
        idFinishingBarangJadi: json["id_finishing_barang_jadi"] == null ? "-" : json["id_finishing_barang_jadi"].toString(),
        namaFinishingBarangJadi: json["nama_finishing_barang_jadi"] == null ? "-" : json["nama_finishing_barang_jadi"].toString(),
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
        "id_rae_analisa_barang_jadi_finishing": idRaeAnalisaBarangJadiFinishing == null ? "-" : idRaeAnalisaBarangJadiFinishing.toString(),
        "id_finishing_barang_jadi": idFinishingBarangJadi == null ? "-" : idFinishingBarangJadi.toString(),
        "nama_finishing_barang_jadi": namaFinishingBarangJadi == null ? "-" : namaFinishingBarangJadi.toString(),
    };
}

class AnalisaWood {
    AnalisaWood({
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
        this.idRaeAnalisaBarangJadiPlywood,
        this.idItemBuaso,
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
    final String? idRaeAnalisaBarangJadiPlywood;
    final String? idItemBuaso;

    factory AnalisaWood.fromRawJson(String str) => AnalisaWood.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AnalisaWood.fromJson(Map<String, dynamic> json) => AnalisaWood(
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
        idRaeAnalisaBarangJadiPlywood: json["id_rae_analisa_barang_jadi_plywood"] == null ? "-" : json["id_rae_analisa_barang_jadi_plywood"].toString(),
        idItemBuaso: json["id_item_buaso"] == null ? "-" : json["id_item_buaso"].toString(),
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
        "id_rae_analisa_barang_jadi_plywood": idRaeAnalisaBarangJadiPlywood == null ? "-" : idRaeAnalisaBarangJadiPlywood.toString(),
        "id_item_buaso": idItemBuaso == null ? "-" : idItemBuaso.toString(),
    };
}

class Gambar {
    Gambar({
        this.idItemBuasoGambarBarangJadi,
        this.idItemBuaso,
        this.pathGambar,
        this.tglUpload,
    });

    final String? idItemBuasoGambarBarangJadi;
    final String? idItemBuaso;
    final String? pathGambar;
    final DateTime? tglUpload;

    factory Gambar.fromRawJson(String str) => Gambar.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Gambar.fromJson(Map<String, dynamic> json) => Gambar(
        idItemBuasoGambarBarangJadi: json["id_item_buaso_gambar_barang_jadi"] == null ? "-" : json["id_item_buaso_gambar_barang_jadi"].toString(),
        idItemBuaso: json["id_item_buaso"] == null ? "-" : json["id_item_buaso"].toString(),
        pathGambar: json["path_gambar"] == null ? "-" : json["path_gambar"].toString(),
        tglUpload: json["tgl_upload"] == null ? null : DateTime.parse(json["tgl_upload"]),
    );

    Map<String, dynamic> toJson() => {
        "id_item_buaso_gambar_barang_jadi": idItemBuasoGambarBarangJadi == null ? "-" : idItemBuasoGambarBarangJadi.toString(),
        "id_item_buaso": idItemBuaso == null ? "-" : idItemBuaso.toString(),
        "path_gambar": pathGambar == null ? "-" : pathGambar.toString(),
        "tgl_upload": tglUpload == null ? null : tglUpload!.toIso8601String(),
    };
}