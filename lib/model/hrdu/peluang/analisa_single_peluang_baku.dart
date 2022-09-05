// To parse this JSON data, do
//
//     final analisaSingleRegplgBaku = analisaSingleRegplgBakuFromJson(jsonString);

import 'dart:convert';

class AnalisaSingleRegplgBaku {
    AnalisaSingleRegplgBaku({
        this.status,
        this.message,
        this.data,
    });

    final bool? status;
    final String? message;
    final Data? data;

    factory AnalisaSingleRegplgBaku.fromRawJson(String str) => AnalisaSingleRegplgBaku.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AnalisaSingleRegplgBaku.fromJson(Map<String, dynamic> json) => AnalisaSingleRegplgBaku(
        status: json["status"],
        message: json["message"] == null ? "-" : json["message"].toString(),
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message == null ? "-" : message.toString(),
        "data": data,
    };
}

class Data {
    Data({
        this.analisaHardwood,
        this.analisaPlywood,
    });

    final List<AnalisaWood>? analisaHardwood;
    final List<AnalisaWood>? analisaPlywood;

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        analisaHardwood: json["analisa_hardwood"] == List.empty() ? [] : List<AnalisaWood>.from(json["analisa_hardwood"].map((x) => AnalisaWood.fromJson(x))),
        analisaPlywood: json["analisa_plywood"] == List.empty() ? [] : List<AnalisaWood>.from(json["analisa_plywood"].map((x) => AnalisaWood.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "analisa_hardwood": analisaHardwood == List.empty() ? [] : List<dynamic>.from(analisaHardwood!.map((x) => x.toJson())),
        "analisa_plywood": analisaPlywood == List.empty() ? [] : List<dynamic>.from(analisaPlywood!.map((x) => x.toJson())),
    };
}

class AnalisaWood {
    AnalisaWood({
        this.idAnalisaBarangJadiHardwood,
        this.idBarangJadi,
        this.urutanItem,
        this.idDeskripsi,
        this.deskripsi,
        this.isHeader,
        this.idKayu,
        this.qtyRaw,
        this.tRaw,
        this.wRaw,
        this.lRaw,
        this.qtyFinal,
        this.tFinal,
        this.wFinal,
        this.lFinal,
        this.hargaSatuan,
        this.koefisien,
        this.kodeItemBahan,
        this.namaItem,
        this.namaKayu,
        this.idSatuan,
        this.namaSatuan,
        this.idJenisKayu,
        this.namaJenisKayu,
        this.idFinishingBarangJadi,
        this.namaFinishingBarangJadi,
        this.idTipeSisi,
        this.namaTipeSisi,
        this.idPartKayu,
        this.namaPartKayu,
        this.idAnalisaBarangJadiPlywood,
        this.idPlywood,
        this.namaPlywood,
    });

    final String? idAnalisaBarangJadiHardwood;
    final String? idBarangJadi;
    final String? urutanItem;
    final String? idDeskripsi;
    final String? deskripsi;
    final bool? isHeader;
    final String? idKayu;
    final String? qtyRaw;
    final String? tRaw;
    final String? wRaw;
    final String? lRaw;
    final String? qtyFinal;
    final String? tFinal;
    final String? wFinal;
    final String? lFinal;
    final String? hargaSatuan;
    final String? koefisien;
    final String? kodeItemBahan;
    final String? namaItem;
    final String? namaKayu;
    final String? idSatuan;
    final String? namaSatuan;
    final String? idJenisKayu;
    final String? namaJenisKayu;
    final String? idFinishingBarangJadi;
    final String? namaFinishingBarangJadi;
    final String? idTipeSisi;
    final String? namaTipeSisi;
    final String? idPartKayu;
    final String? namaPartKayu;
    final String? idAnalisaBarangJadiPlywood;
    final String? idPlywood;
    final String? namaPlywood;

    factory AnalisaWood.fromRawJson(String str) => AnalisaWood.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AnalisaWood.fromJson(Map<String, dynamic> json) => AnalisaWood(
        idAnalisaBarangJadiHardwood: json["id_analisa_barang_jadi_hardwood"].toString(),
        idBarangJadi: json["id_barang_jadi"] == null ? "-" : json["id_barang_jadi"].toString(),
        urutanItem: json["urutan_item"] == null ? "-" : json["urutan_item"].toString(),
        idDeskripsi: json["id_deskripsi"] == null ? "-" : json["id_deskripsi"].toString(),
        deskripsi: json["deskripsi"] == null ? "-" : json["deskripsi"].toString(),
        isHeader: json["is_header"],
        idKayu: json["id_kayu"] == null ? "-" : json["id_kayu"].toString(),
        qtyRaw: json["qty_raw"] == null ? "0.0" : json["qty_raw"].toString(),
        tRaw: json["t_raw"] == null ? "0.0" : json["t_raw"].toString(),
        wRaw: json["w_raw"] == null ? "0.0" : json["w_raw"].toString(),
        lRaw: json["l_raw"] == null ? "0.0" : json["l_raw"].toString(),
        qtyFinal: json["qty_final"] == null ? "0.0" : json["qty_final"].toString(),
        tFinal: json["t_final"] == null ? "0.0" : json["t_final"].toString(),
        wFinal: json["w_final"] == null ? "0.0" : json["w_final"].toString(),
        lFinal: json["l_final"] == null ? "0.0" : json["l_final"].toString(),
        hargaSatuan: json["harga_satuan"] == null ? "0" : json["harga_satuan"].toString(),
        koefisien: json["koefisien"] == null ? "0.0" : json["koefisien"].toString(),
        kodeItemBahan: json["kode_item_bahan"] == null ? "-" : json["kode_item_bahan"].toString(),
        namaItem: json["nama_item"] == null ? "-" : json["nama_item"].toString(),
        namaKayu: json["nama_kayu"] == null ? "-" : json["nama_kayu"].toString(),
        idSatuan: json["id_satuan"] == null ? "-" : json["id_satuan"].toString(),
        namaSatuan: json["nama_satuan"] == null ? "-" : json["nama_satuan"].toString(),
        idJenisKayu: json["id_jenis_kayu"] == null ? "-" : json["id_jenis_kayu"].toString(),
        namaJenisKayu: json["nama_jenis_kayu"] == null ? "-" : json["nama_jenis_kayu"].toString(),
        idFinishingBarangJadi: json["id_finishing_barang_jadi"] == null ? "-" : json["id_finishing_barang_jadi"].toString(),
        namaFinishingBarangJadi: json["nama_finishing_barang_jadi"] == null ? "-" : json["nama_finishing_barang_jadi"].toString(),
        idTipeSisi: json["id_tipe_sisi"] == null ? "-" : json["id_tipe_sisi"].toString(),
        namaTipeSisi: json["nama_tipe_sisi"] == null ? "-" : json["nama_tipe_sisi"].toString(),
        idPartKayu: json["id_part_kayu"] == null ? "-" : json["id_part_kayu"].toString(),
        namaPartKayu: json["nama_part_kayu"] == null ? "-" : json["nama_part_kayu"].toString(),
        idAnalisaBarangJadiPlywood: json["id_analisa_barang_jadi_plywood"] == null ? "-" : json["id_analisa_barang_jadi_plywood"].toString(),
        idPlywood: json["id_plywood"] == null ? "-" : json["id_plywood"].toString(),
        namaPlywood: json["nama_plywood"] == null ? "-" : json["nama_plywood"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id_analisa_barang_jadi_hardwood": idAnalisaBarangJadiHardwood == null ? "-" : idAnalisaBarangJadiHardwood.toString(),
        "id_barang_jadi": idBarangJadi == null ? "-" : idBarangJadi.toString(),
        "urutan_item": urutanItem == null ? "-" : urutanItem.toString(),
        "id_deskripsi": idDeskripsi == null ? "-" : idDeskripsi.toString(),
        "deskripsi": deskripsi == null ? "-" : deskripsi.toString(),
        "is_header": isHeader,
        "id_kayu": idKayu == null ? "-" : idKayu.toString(),
        "qty_raw": qtyRaw == null ? "0.0" : qtyRaw.toString(),
        "t_raw": tRaw == null ? "0.0" : tRaw.toString(),
        "w_raw": wRaw == null ? "0.0" : wRaw.toString(),
        "l_raw": lRaw == null ? "0.0" : lRaw.toString(),
        "qty_final": qtyFinal == null ? "0.0" : qtyFinal.toString(),
        "t_final": tFinal == null ? "0.0" : tFinal.toString(),
        "w_final": wFinal == null ? "0.0" : wFinal.toString(),
        "l_final": lFinal == null ? "0.0" : lFinal.toString(),
        "harga_satuan": hargaSatuan == null ? "0" : hargaSatuan.toString(),
        "koefisien": koefisien == null ? "0.0" : koefisien.toString(),
        "kode_item_bahan": kodeItemBahan == null ? "-" : kodeItemBahan.toString(),
        "nama_item": namaItem == null ? "-" : namaItem.toString(),
        "nama_kayu": namaKayu == null ? "-" : namaKayu.toString(),
        "id_satuan": idSatuan == null ? "-" : idSatuan.toString(),
        "nama_satuan": namaSatuan == null ? "-" : namaSatuan.toString(),
        "id_jenis_kayu": idJenisKayu == null ? "-" : idJenisKayu.toString(),
        "nama_jenis_kayu": namaJenisKayu == null ? "-" : namaJenisKayu.toString(),
        "id_finishing_barang_jadi": idFinishingBarangJadi == null ? "-" : idFinishingBarangJadi.toString(),
        "nama_finishing_barang_jadi": namaFinishingBarangJadi == null ? "-" : namaFinishingBarangJadi.toString(),
        "id_tipe_sisi": idTipeSisi == null ? "-" : idTipeSisi.toString(),
        "nama_tipe_sisi": namaTipeSisi == null ? "-" : namaTipeSisi.toString(),
        "id_part_kayu": idPartKayu == null ? "-" : idPartKayu.toString(),
        "nama_part_kayu": namaPartKayu == null ? "-" : namaPartKayu.toString(),
        "id_analisa_barang_jadi_plywood": idAnalisaBarangJadiPlywood == null ? "-" : idAnalisaBarangJadiPlywood.toString(),
        "id_plywood": idPlywood == null ? "-" : idPlywood.toString(),
        "nama_plywood": namaPlywood == null ? "-" : namaPlywood.toString(),
    };
}