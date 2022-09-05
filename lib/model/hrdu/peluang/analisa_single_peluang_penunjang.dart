// To parse this JSON data, do
//
//     final analisaSingleRegplgPenunjang = analisaSingleRegplgPenunjangFromJson(jsonString);

import 'dart:convert';

class AnalisaSingleRegplgPenunjang {
    AnalisaSingleRegplgPenunjang({
        this.status,
        this.message,
        this.data,
    });

    final bool? status;
    final String? message;
    final Data? data;

    factory AnalisaSingleRegplgPenunjang.fromRawJson(String str) => AnalisaSingleRegplgPenunjang.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AnalisaSingleRegplgPenunjang.fromJson(Map<String, dynamic> json) => AnalisaSingleRegplgPenunjang(
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
        this.analisaFinTpFs,
        this.analisaFinTpLc,
        this.analisaFinTpMp,
        this.analisaFinTpBop,
    });

    final List<AnalisaFinTp>? analisaFinTpFs;
    final List<AnalisaFinTp>? analisaFinTpLc;
    final List<AnalisaFinTp>? analisaFinTpMp;
    final List<AnalisaFinTp>? analisaFinTpBop;

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        analisaFinTpFs: json["analisa_fin_tp_fs"] == List.empty() ? [] : List<AnalisaFinTp>.from(json["analisa_fin_tp_fs"].map((x) => AnalisaFinTp.fromJson(x))),
        analisaFinTpLc: json["analisa_fin_tp_lc"] == List.empty() ? [] : List<AnalisaFinTp>.from(json["analisa_fin_tp_lc"].map((x) => AnalisaFinTp.fromJson(x))),
        analisaFinTpMp: json["analisa_fin_tp_mp"] == List.empty() ? [] : List<AnalisaFinTp>.from(json["analisa_fin_tp_mp"].map((x) => AnalisaFinTp.fromJson(x))),
        analisaFinTpBop: json["analisa_fin_tp_bop"] == List.empty() ? [] : List<AnalisaFinTp>.from(json["analisa_fin_tp_bop"].map((x) => AnalisaFinTp.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "analisa_fin_tp_fs": analisaFinTpFs == List.empty() ? [] : List<dynamic>.from(analisaFinTpFs!.map((x) => x.toJson())),
        "analisa_fin_tp_lc": analisaFinTpLc == List.empty() ? [] : List<dynamic>.from(analisaFinTpLc!.map((x) => x.toJson())),
        "analisa_fin_tp_mp": analisaFinTpMp == List.empty() ? [] : List<dynamic>.from(analisaFinTpMp!.map((x) => x.toJson())),
        "analisa_fin_tp_bop": analisaFinTpBop == List.empty() ? [] : List<dynamic>.from(analisaFinTpBop!.map((x) => x.toJson())),
    };
}

class AnalisaFinTp {
    AnalisaFinTp({
        this.idAnalisaBarangJadiTipeFs,
        this.idBarangJadi,
        this.idItemBahan,
        this.kodeItemBahan,
        this.namaItem,
        this.idSatuan,
        this.namaSatuan,
        this.qty,
        this.hargaSatuan,
        this.koefisien,
        this.ref,
        this.idFinishingBarangJadi,
        this.namaFinishingBarangJadi,
    });

    final String? idAnalisaBarangJadiTipeFs;
    final String? idBarangJadi;
    final String? idItemBahan;
    final String? kodeItemBahan;
    final String? namaItem;
    final String? idSatuan;
    final String? namaSatuan;
    final String? qty;
    final String? hargaSatuan;
    final String? koefisien;
    final String? ref;
    final String? idFinishingBarangJadi;
    final String? namaFinishingBarangJadi;

    factory AnalisaFinTp.fromRawJson(String str) => AnalisaFinTp.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AnalisaFinTp.fromJson(Map<String, dynamic> json) => AnalisaFinTp(
        idAnalisaBarangJadiTipeFs: json["id_analisa_barang_jadi_tipe_fs"] == null ? "-" : json["id_analisa_barang_jadi_tipe_fs"].toString(),
        idBarangJadi: json["id_barang_jadi"] == null ? "-" : json["id_barang_jadi"].toString(),
        idItemBahan: json["id_item_bahan"] == null ? "-" : json["id_item_bahan"].toString(),
        kodeItemBahan: json["kode_item_bahan"] == null ? "-" : json["kode_item_bahan"].toString(),
        namaItem: json["nama_item"] == null ? "-" : json["nama_item"].toString(),
        idSatuan: json["id_satuan"] == null ? "-" : json["id_satuan"].toString(),
        namaSatuan: json["nama_satuan"] == null ? "-" : json["nama_satuan"].toString(),
        qty: json["qty"] == null ? "-" : json["qty"].toString(),
        hargaSatuan: json["harga_satuan"] == null ? "-" : json["harga_satuan"].toString(),
        koefisien: json["koefisien"] == null ? "-" : json["koefisien"].toString(),
        ref: json["ref"] == null ? "-" : json["ref"].toString(),
        idFinishingBarangJadi: json["id_finishing_barang_jadi"] == null ? "-" : json["id_finishing_barang_jadi"].toString(),
        namaFinishingBarangJadi: json["nama_finishing_barang_jadi"] == null ? "-" : json["nama_finishing_barang_jadi"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id_analisa_barang_jadi_tipe_fs": idAnalisaBarangJadiTipeFs == null ? "-" : idAnalisaBarangJadiTipeFs.toString(),
        "id_barang_jadi": idBarangJadi == null ? "-" : idBarangJadi.toString(),
        "id_item_bahan": idItemBahan == null ? "-" : idItemBahan.toString(),
        "kode_item_bahan": kodeItemBahan == null ? "-" : kodeItemBahan.toString(),
        "nama_item": namaItem == null ? "-" : namaItem.toString(),
        "id_satuan": idSatuan == null ? "-" : idSatuan.toString(),
        "nama_satuan": namaSatuan == null ? "-" : namaSatuan.toString(),
        "qty": qty == null ? "-" : qty.toString(),
        "harga_satuan": hargaSatuan == null ? "-" : hargaSatuan.toString(),
        "koefisien": koefisien == null ? "-" : koefisien.toString(),
        "ref": ref == null ? "-" : ref.toString(),
        "id_finishing_barang_jadi": idFinishingBarangJadi == null ? "-" : idFinishingBarangJadi.toString(),
        "nama_finishing_barang_jadi": namaFinishingBarangJadi == null ? "-" : namaFinishingBarangJadi.toString(),
    };
}