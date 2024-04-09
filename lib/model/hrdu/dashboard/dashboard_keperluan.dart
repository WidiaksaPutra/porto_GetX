import 'dart:convert';

class DashInvPersentaseKeperluan {
    final bool? status;
    final String? message;
    final Data? data;

    DashInvPersentaseKeperluan({
        this.status,
        this.message,
        this.data,
    });

    factory DashInvPersentaseKeperluan.fromRawJson(String str) => DashInvPersentaseKeperluan.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DashInvPersentaseKeperluan.fromJson(Map<String, dynamic> json) => DashInvPersentaseKeperluan(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    final PengadaanAset? stok;
    final PengadaanAset? produksi;
    final PengadaanAset? pengadaanAset;
    final PengadaanAset? pengadaanBarangNonAset;
    final PengadaanAset? perbaikanDanPemeliharaanAlatDanMesin;
    final PengadaanAset? perawatanGedungDanKantor;

    Data({
        this.stok,
        this.produksi,
        this.pengadaanAset,
        this.pengadaanBarangNonAset,
        this.perbaikanDanPemeliharaanAlatDanMesin,
        this.perawatanGedungDanKantor,
    });

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        stok: json["stok"] == null ? null : PengadaanAset.fromJson(json["stok"]),
        produksi: json["produksi"] == null ? null : PengadaanAset.fromJson(json["produksi"]),
        pengadaanAset: json["Pengadaan Aset"] == null ? null : PengadaanAset.fromJson(json["Pengadaan Aset"]),
        pengadaanBarangNonAset: json["Pengadaan Barang Non Aset"] == null ? null : PengadaanAset.fromJson(json["Pengadaan Barang Non Aset"]),
        perbaikanDanPemeliharaanAlatDanMesin: json["Perbaikan dan Pemeliharaan Alat dan Mesin"] == null ? null : PengadaanAset.fromJson(json["Perbaikan dan Pemeliharaan Alat dan Mesin"]),
        perawatanGedungDanKantor: json["Perawatan Gedung dan Kantor"] == null ? null : PengadaanAset.fromJson(json["Perawatan Gedung dan Kantor"]),
    );

    Map<String, dynamic> toJson() => {
        "stok": stok?.toJson(),
        "produksi": produksi?.toJson(),
        "Pengadaan Aset": pengadaanAset?.toJson(),
        "Pengadaan Barang Non Aset": pengadaanBarangNonAset?.toJson(),
        "Perbaikan dan Pemeliharaan Alat dan Mesin": perbaikanDanPemeliharaanAlatDanMesin?.toJson(),
        "Perawatan Gedung dan Kantor": perawatanGedungDanKantor?.toJson(),
    };
}

class PengadaanAset {
    final int? value;
    final String? persen;

    PengadaanAset({
        this.value,
        this.persen,
    });

    factory PengadaanAset.fromRawJson(String str) => PengadaanAset.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PengadaanAset.fromJson(Map<String, dynamic> json) => PengadaanAset(
        value: json["value"],
        persen: json["persen"],
    );

    Map<String, dynamic> toJson() => {
        "value": value,
        "persen": persen,
    };
}