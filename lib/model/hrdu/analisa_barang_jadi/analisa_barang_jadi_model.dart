import 'dart:convert';

class Regabj {
  Regabj({
    this.status,
    this.message,
    this.data,
    this.dataCount,
    this.totalPage,
  });

  final bool? status;
  final String? message;
  final Data? data;
  final int? dataCount;
  final int? totalPage;

  factory Regabj.fromRawJson(String str) => Regabj.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Regabj.fromJson(Map<String, dynamic> json) => Regabj(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
      dataCount: json["data_count"],
      totalPage: json["total_page"],
  );

  Map<String, dynamic> toJson() => {
      "status": status,
      "message": message,
      "data": data == null ? null : data!.toJson(),
      "data_count": dataCount,
      "total_page": totalPage,
  };
}

class Data {
  Data({
      required this.data,
      this.dataCount,
      this.totalPage,
  });

  final List<Datum> data;
  final int? dataCount;
  final int? totalPage;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
      data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      dataCount: json["data_count"],
      totalPage: json["total_page"],
  );

  Map<String, dynamic> toJson() => {
      "data": List<dynamic>.from(data.map((x) => x.toJson())),
      "data_count": dataCount,
      "total_page": totalPage,
  };
}

class Datum {
  Datum({
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
    this.idApprovalTransaksi,
    this.noTransaksi,
    this.kodeTransaksi,
    this.idKaryawan,
    this.idJabatan,
    this.statusApproval,
    this.catatan,
    this.createdAt,
    this.tglApproval,
    this.approvalLevel,
    this.namaKaryawan,
    this.namaJabatan,
    this.idKaryawanPengaju,
    this.idJabatanPengaju,
    this.namaKaryawanPengaju,
    this.namaJabatanPengaju,
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
  final String? idApprovalTransaksi;
  final String? noTransaksi;
  final String? kodeTransaksi;
  final String? idKaryawan;
  final String? idJabatan;
  final String? statusApproval;
  final String? catatan;
  final String? createdAt;
  final DateTime? tglApproval;
  final String? approvalLevel;
  final String? namaKaryawan;
  final String? namaJabatan;
  final String? idKaryawanPengaju;
  final String? idJabatanPengaju;
  final String? namaKaryawanPengaju;
  final String? namaJabatanPengaju;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
      idItemBuaso: json["id_item_buaso"],
      kodeItem: json["kode_item"],
      namaItem: json["nama_item"],
      idJenis: json["id_jenis"],
      idSatuanJual: json["id_satuan_jual"],
      namaSatuan: json["nama_satuan"],
      namaJenis: json["nama_jenis"],
      kodeSatuan: json["kode_satuan"],
      idBarangJadi: json["id_barang_jadi"],
      linkReferensi: json["link_referensi"],
      uraian: json["uraian"],
      isAbj: json["is_abj"],
      idKelompok: json["id_kelompok"],
      namaKelompok: json["nama_kelompok"],
      idApprovalTransaksi: json["id_approval_transaksi"],
      noTransaksi: json["no_transaksi"],
      kodeTransaksi: json["kode_transaksi"],
      idKaryawan: json["id_karyawan"],
      idJabatan: json["id_jabatan"],
      statusApproval: json["status_approval"],
      catatan: json["catatan"],
      createdAt: json["created_at"],
      tglApproval: json["tgl_approval"] == null ? null : DateTime.parse(json["tgl_approval"]),
      approvalLevel: json["approval_level"],
      namaKaryawan: json["nama_karyawan"],
      namaJabatan: json["nama_jabatan"],
      idKaryawanPengaju: json["id_karyawan_pengaju"],
      idJabatanPengaju: json["id_jabatan_pengaju"],
      namaKaryawanPengaju: json["nama_karyawan_pengaju"],
      namaJabatanPengaju: json["nama_jabatan_pengaju"],
  );

  Map<String, dynamic> toJson() => {
    "id_item_buaso": idItemBuaso,
    "kode_item": kodeItem,
    "nama_item": namaItem,
    "id_jenis": idJenis,
    "id_satuan_jual": idSatuanJual,
    "nama_satuan": namaSatuan,
    "nama_jenis": namaJenis,
    "kode_satuan": kodeSatuan,
    "id_barang_jadi": idBarangJadi,
    "link_referensi": linkReferensi,
    "uraian": uraian,
    "is_abj": isAbj,
    "id_kelompok": idKelompok,
    "nama_kelompok": namaKelompok,
    "id_approval_transaksi": idApprovalTransaksi,
    "no_transaksi": noTransaksi,
    "kode_transaksi": kodeTransaksi,
    "id_karyawan": idKaryawan,
    "id_jabatan": idJabatan,
    "status_approval": statusApproval,
    "catatan": catatan,
    "created_at": createdAt,
    "tgl_approval": tglApproval == null ? null : "${tglApproval!.year.toString().padLeft(4, '0')}-${tglApproval!.month.toString().padLeft(2, '0')}-${tglApproval!.day.toString().padLeft(2, '0')}",
    "approval_level": approvalLevel,
    "nama_karyawan": namaKaryawan,
    "nama_jabatan": namaJabatan,
    "id_karyawan_pengaju": idKaryawanPengaju,
    "id_jabatan_pengaju": idJabatanPengaju,
    "nama_karyawan_pengaju": namaKaryawanPengaju,
    "nama_jabatan_pengaju": namaJabatanPengaju,
  };
}
