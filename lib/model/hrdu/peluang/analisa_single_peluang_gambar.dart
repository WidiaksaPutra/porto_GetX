import 'dart:convert';

class AnalisaSingleRegplgGambar {
    AnalisaSingleRegplgGambar({
        this.status,
        this.message,
        this.data,
    });

    final bool? status;
    final String? message;
    final Data? data;

    factory AnalisaSingleRegplgGambar.fromRawJson(String str) => AnalisaSingleRegplgGambar.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AnalisaSingleRegplgGambar.fromJson(Map<String, dynamic> json) => AnalisaSingleRegplgGambar(
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
        this.idItemBuaso,
        this.kodeItem,
        this.namaItem,
        this.idJenis,
        this.idSatuanJual,
        this.namaSatuan,
        this.namaJenis,
        this.kodeSatuan,
        this.idBarangJadi,
        this.linkReferensi,
        this.uraian,
        this.isAbj,
        this.idKelompok,
        this.namaKelompok,
        required this.gambar,
    });

    final String? idItemBuaso;
    final String? kodeItem;
    final String? namaItem;
    final String? idJenis;
    final String? idSatuanJual;
    final String? namaSatuan;
    final String? namaJenis;
    final String? kodeSatuan;
    final String? idBarangJadi;
    final String? linkReferensi;
    final String? uraian;
    final bool? isAbj;
    final String? idKelompok;
    final String? namaKelompok;
    final List<Gambar> gambar;

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        idItemBuaso: json["id_item_buaso"] == null ? "-" : json["id_item_buaso"].toString(),
        kodeItem: json["kode_item"] == null ? "-" : json["kode_item"].toString(),
        namaItem: json["nama_item"] == null ? "-" : json["nama_item"].toString(),
        idJenis: json["id_jenis"] == null ? "-" : json["id_jenis"].toString(),
        idSatuanJual: json["id_satuan_jual"] == null ? "-" : json["id_satuan_jual"].toString(),
        namaSatuan: json["nama_satuan"] == null ? "-" : json["nama_satuan"].toString(),
        namaJenis: json["nama_jenis"] == null ? "-" : json["nama_jenis"].toString(),
        kodeSatuan: json["kode_satuan"] == null ? "-" : json["kode_satuan"].toString(),
        idBarangJadi: json["id_barang_jadi"] == null ? "-" : json["id_barang_jadi"].toString(),
        linkReferensi: json["link_referensi"] == null ? "-" : json["link_referensi"].toString(),
        uraian: json["uraian"] == null ? "-" : json["uraian"].toString(),
        isAbj: json["is_abj"],
        idKelompok: json["id_kelompok"] == null ? "-" : json["id_kelompok"].toString(),
        namaKelompok: json["nama_kelompok"] == null ? "-" : json["nama_kelompok"].toString(),
        gambar: json["gambar"] == List.empty() ? [] : List<Gambar>.from(json["gambar"].map((x) => Gambar.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id_item_buaso": idItemBuaso == null ? "-" : idItemBuaso.toString(),
        "kode_item": kodeItem == null ? "-" : kodeItem.toString(),
        "nama_item": namaItem == null ? "-" : namaItem.toString(),
        "id_jenis": idJenis == null ? "-" : idJenis.toString(),
        "id_satuan_jual": idSatuanJual == null ? "-" : idSatuanJual.toString(),
        "nama_satuan": namaSatuan == null ? "-" : namaSatuan.toString(),
        "nama_jenis": namaJenis == null ? "-" : namaJenis.toString(),
        "kode_satuan": kodeSatuan == null ? "-" : kodeSatuan.toString(),
        "id_barang_jadi": idBarangJadi == null ? "-" : idBarangJadi.toString(),
        "link_referensi": linkReferensi == null ? "-" : linkReferensi.toString(),
        "uraian": uraian == null ? "-" : uraian.toString(),
        "is_abj": isAbj,
        "id_kelompok": idKelompok == null ? "-" : idKelompok.toString(),
        "nama_kelompok": namaKelompok == null ? "-" : namaKelompok.toString(),
        "gambar": gambar == List.empty() ? [] : List<dynamic>.from(gambar.map((x) => x.toJson())),
    };
}

class Gambar {
    Gambar({
        this.idItemBuasoGambarBarangJadi,
        this.idItemBuaso,
        this.pathGambar,
    });

    final String? idItemBuasoGambarBarangJadi;
    final String? idItemBuaso;
    final String? pathGambar;

    factory Gambar.fromRawJson(String str) => Gambar.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Gambar.fromJson(Map<String, dynamic> json) => Gambar(
        idItemBuasoGambarBarangJadi: json["id_item_buaso_gambar_barang_jadi"] == null ? "-" : json["id_item_buaso_gambar_barang_jadi"].toString(),
        idItemBuaso: json["id_item_buaso"] == null ? "-" : json["id_item_buaso"].toString(),
        pathGambar: json["path_gambar"] == null ? "-" : json["path_gambar"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id_item_buaso_gambar_barang_jadi": idItemBuasoGambarBarangJadi == null ? "-" : idItemBuasoGambarBarangJadi.toString(),
        "id_item_buaso": idItemBuaso == null ? "-" : idItemBuaso.toString(),
        "path_gambar": pathGambar == null ? "-" : pathGambar.toString(),
    };
}