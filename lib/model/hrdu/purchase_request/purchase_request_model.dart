import 'dart:convert';

class Pr {
  final bool? status;
  final String? message;
  final List<Datum> data;
  final int? dataCount;
  final int? totalPage;

  Pr({
    this.status,
    this.message,
    required this.data,
    this.dataCount,
    this.totalPage,
  });

  factory Pr.fromRawJson(String str) => Pr.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pr.fromJson(Map<String, dynamic> json) => Pr(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    dataCount: json["data_count"],
    totalPage: json["total_page"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "data_count": dataCount,
    "total_page": totalPage,
  };
}

class Datum {
  Datum({
    this.idPurchaseRequest,
    this.tglPurchaseRequest,
    this.noPurchaseRequest,
    this.tglPemakaian,
    this.keperluan,
    this.catatanPurchaseRequest,
    this.baseline,
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

  final String? idPurchaseRequest;
  final DateTime? tglPurchaseRequest;
  final String? noPurchaseRequest;
  final DateTime? tglPemakaian;
  final String? keperluan;
  final String? catatanPurchaseRequest;
  final String? baseline;
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
    idPurchaseRequest: json["id_purchase_request"],
    tglPurchaseRequest: json["tgl_purchase_request"] == null
        ? null
        : DateTime.parse(json["tgl_purchase_request"]),
    noPurchaseRequest: json["no_purchase_request"],
    tglPemakaian: json["tgl_pemakaian"] == null
        ? null
        : DateTime.parse(json["tgl_pemakaian"]),
    keperluan: json["keperluan"],
    catatanPurchaseRequest: json["catatan_purchase_request"],
    baseline: json["baseline"],
    idApprovalTransaksi: json["id_approval_transaksi"],
    noTransaksi: json["no_transaksi"],
    kodeTransaksi:
        json["kode_transaksi"],
    idKaryawan: json["id_karyawan"],
    idJabatan: json["id_jabatan"],
    statusApproval:
        json["status_approval"],
    catatan: json["catatan"],
    createdAt: json["created_at"],
    tglApproval: json["tgl_approval"] == null
        ? null
        : DateTime.parse(json["tgl_approval"]),
    approvalLevel:
        json["approval_level"],
    namaKaryawan:
        json["nama_karyawan"],
    namaJabatan: json["nama_jabatan"],
    idKaryawanPengaju: json["id_karyawan_pengaju"],
    idJabatanPengaju: json["id_jabatan_pengaju"],
    namaKaryawanPengaju: json["nama_karyawan_pengaju"],
    namaJabatanPengaju: json["nama_jabatan_pengaju"],
  );

  Map<String, dynamic> toJson() => {
    "id_purchase_request":
        idPurchaseRequest,
    "tgl_purchase_request": tglPurchaseRequest == null
        ? null
        : "${tglPurchaseRequest?.year.toString().padLeft(4, '0')}-${tglPurchaseRequest?.month.toString().padLeft(2, '0')}-${tglPurchaseRequest?.day.toString().padLeft(2, '0')}",
    "no_purchase_request":
        noPurchaseRequest,
    "tgl_pemakaian": tglPemakaian == null
        ? null
        : "${tglPemakaian?.year.toString().padLeft(4, '0')}-${tglPemakaian?.month.toString().padLeft(2, '0')}-${tglPemakaian?.day.toString().padLeft(2, '0')}",
    "keperluan": keperluan,
    "catatan_purchase_request":
        catatanPurchaseRequest,
    "baseline": baseline,
    "id_approval_transaksi":
        idApprovalTransaksi,
    "no_transaksi": noTransaksi,
    "kode_transaksi": kodeTransaksi,
    "id_karyawan": idKaryawan,
    "id_jabatan": idJabatan,
    "status_approval": statusApproval,
    "catatan": catatan,
    "created_at": createdAt,
    "tgl_approval": tglApproval == null
        ? null
        : "${tglApproval?.year.toString().padLeft(4, '0')}-${tglApproval?.month.toString().padLeft(2, '0')}-${tglApproval?.day.toString().padLeft(2, '0')}",
    "approval_level": approvalLevel,
    "nama_karyawan": namaKaryawan,
    "nama_jabatan": namaJabatan,
    "id_karyawan_pengaju":
        idKaryawanPengaju,
    "id_jabatan_pengaju":
        idJabatanPengaju,
    "nama_karyawan_pengaju":
        namaKaryawanPengaju,
    "nama_jabatan_pengaju":
        namaJabatanPengaju,
  };
}