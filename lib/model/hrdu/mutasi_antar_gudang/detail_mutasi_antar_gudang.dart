import 'dart:convert';

class DetailMag {
  DetailMag({
    this.status,
    this.message,
    this.data,
  });

  final bool? status;
  final String? message;
  final Data? data;

  factory DetailMag.fromRawJson(String str) => DetailMag.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DetailMag.fromJson(Map<String, dynamic> json) => DetailMag(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? null : data!.toJson(),
  };
}

class Data {
  Data({
    this.detail,
    this.behavior,
    this.approval,
  });

  final Detail? detail;
  final String? behavior;
  final List<Approval?>? approval;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    detail: json["detail"] == null ? null : Detail.fromJson(json["detail"]),
    behavior: json["behavior"],
    approval: json["approval"] == null ? null : List<Approval>.from(json["approval"].map((x) => Approval.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "detail": detail == null ? null : detail!.toJson(),
    "behavior": behavior,
    "approval": approval == null ? null : List<dynamic>.from(approval!.map((x) => x?.toJson())),
  };
}

class Detail {
  Detail({
    this.idMutasiAntarGudang,
    this.tglMutasiAntarGudang,
    this.noMutasiAntarGudang,
    this.idItemBuaso,
    this.idGudangAsal,
    this.idGudangTujuan,
    this.qtyMutasi,
    this.catatanMutasi,
    this.baseline,
    this.kodeItem,
    this.namaItem,
    this.idSatuan,
    this.namaSatuan,
    this.namaGudangAsal,
    this.namaGudangTujuan,
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
    this.namaKaryawanApproval,
    this.namaJabatanApproval,
    this.idKaryawanPengaju,
    this.idJabatanPengaju,
    this.namaKaryawanPengaju,
    this.namaJabatanPengaju,
  });

  final String? idMutasiAntarGudang;
  final DateTime? tglMutasiAntarGudang;
  final String? noMutasiAntarGudang;
  final String? idItemBuaso;
  final String? idGudangAsal;
  final String? idGudangTujuan;
  final String? qtyMutasi;
  final String? catatanMutasi;
  final String? baseline;
  final String? kodeItem;
  final String? namaItem;
  final String? idSatuan;
  final String? namaSatuan;
  final String? namaGudangAsal;
  final String? namaGudangTujuan;
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
  final String? namaKaryawanApproval;
  final String? namaJabatanApproval;
  final String? idKaryawanPengaju;
  final String? idJabatanPengaju;
  final String? namaKaryawanPengaju;
  final String? namaJabatanPengaju;

  factory Detail.fromRawJson(String str) => Detail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    idMutasiAntarGudang: json["id_mutasi_antar_gudang"],
    tglMutasiAntarGudang: json["tgl_mutasi_antar_gudang"] == null ? null : DateTime.parse(json["tgl_mutasi_antar_gudang"]),
    noMutasiAntarGudang: json["no_mutasi_antar_gudang"],
    idItemBuaso: json["id_item_buaso"],
    idGudangAsal: json["id_gudang_asal"],
    idGudangTujuan: json["id_gudang_tujuan"],
    qtyMutasi: json["qty_mutasi"],
    catatanMutasi: json["catatan_mutasi"],
    baseline: json["baseline"],
    kodeItem: json["kode_item"],
    namaItem: json["nama_item"],
    idSatuan: json["id_satuan"],
    namaSatuan: json["nama_satuan"],
    namaGudangAsal: json["nama_gudang_asal"],
    namaGudangTujuan: json["nama_gudang_tujuan"],
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
    namaKaryawanApproval: json["nama_karyawan_approval"],
    namaJabatanApproval: json["nama_jabatan_approval"],
    idKaryawanPengaju: json["id_karyawan_pengaju"],
    idJabatanPengaju: json["id_jabatan_pengaju"],
    namaKaryawanPengaju: json["nama_karyawan_pengaju"],
    namaJabatanPengaju: json["nama_jabatan_pengaju"],
  );

  Map<String, dynamic> toJson() => {
    "id_mutasi_antar_gudang": idMutasiAntarGudang,
    "tgl_mutasi_antar_gudang": tglMutasiAntarGudang == null ? null : "${tglMutasiAntarGudang?.year.toString().padLeft(4, '0')}-${tglMutasiAntarGudang?.month.toString().padLeft(2, '0')}-${tglMutasiAntarGudang?.day.toString().padLeft(2, '0')}",
    "no_mutasi_antar_gudang": noMutasiAntarGudang,
    "id_item_buaso": idItemBuaso,
    "id_gudang_asal": idGudangAsal,
    "id_gudang_tujuan": idGudangTujuan,
    "qty_mutasi": qtyMutasi,
    "catatan_mutasi": catatanMutasi,
    "baseline": baseline,
    "kode_item": kodeItem,
    "nama_item": namaItem,
    "id_satuan": idSatuan,
    "nama_satuan": namaSatuan,
    "nama_gudang_asal": namaGudangAsal,
    "nama_gudang_tujuan": namaGudangTujuan,
    "id_approval_transaksi": idApprovalTransaksi,
    "no_transaksi": noTransaksi,
    "kode_transaksi": kodeTransaksi,
    "id_karyawan": idKaryawan,
    "id_jabatan": idJabatan,
    "status_approval": statusApproval,
    "catatan": catatan,
    "created_at": createdAt,
    "tgl_approval": tglApproval == null ? null : "${tglApproval?.year.toString().padLeft(4, '0')}-${tglApproval?.month.toString().padLeft(2, '0')}-${tglApproval?.day.toString().padLeft(2, '0')}",
    "approval_level": approvalLevel,
    "nama_karyawan_approval": namaKaryawanApproval,
    "nama_jabatan_approval": namaJabatanApproval,
    "id_karyawan_pengaju": idKaryawanPengaju,
    "id_jabatan_pengaju": idJabatanPengaju,
    "nama_karyawan_pengaju": namaKaryawanPengaju,
    "nama_jabatan_pengaju": namaJabatanPengaju,
  };
}

class Approval {
  Approval({
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
    this.approvalBaseline,
  });

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
  final String? approvalBaseline;

  factory Approval.fromRawJson(String str) => Approval.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Approval.fromJson(Map<String, dynamic> json) => Approval(
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
    approvalBaseline: json["approval_baseline"],
  );

  Map<String, dynamic> toJson() => {
    "id_approval_transaksi": idApprovalTransaksi,
    "no_transaksi": noTransaksi,
    "kode_transaksi": kodeTransaksi,
    "id_karyawan": idKaryawan,
    "id_jabatan": idJabatan,
    "status_approval": statusApproval,
    "catatan": catatan,
    "created_at": createdAt,
    "tgl_approval": tglApproval == null ? null : "${tglApproval?.year.toString().padLeft(4, '0')}-${tglApproval?.month.toString().padLeft(2, '0')}-${tglApproval?.day.toString().padLeft(2, '0')}",
    "approval_level": approvalLevel,
    "nama_karyawan": namaKaryawan,
    "nama_jabatan": namaJabatan,
    "approval_baseline": approvalBaseline,
  };
}
