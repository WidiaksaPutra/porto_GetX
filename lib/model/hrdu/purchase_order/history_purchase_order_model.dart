import 'dart:convert';

class HistoryRegpo {
  HistoryRegpo({
    this.status,
    this.message,
    required this.data,
    this.dataCount,
    this.totalPage,
  });

  final bool? status;
  final String? message;
  final List<Datum> data;
  final int? dataCount;
  final int? totalPage;

  factory HistoryRegpo.fromRawJson(String str) => HistoryRegpo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HistoryRegpo.fromJson(Map<String, dynamic> json) => HistoryRegpo(
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
    this.idPurchaseOrder,
    this.tglPurchaseOrder,
    this.noPurchaseOrder,
    this.idVendor,
    this.namaVendor,
    this.diskon,
    this.ppn,
    this.tglPengiriman,
    this.alamatTujuanPengiriman,
    this.keterangan,
    this.statusPurchaseOrder,
    this.baseline,
    this.tglSeleksiVendor,
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
    this.contactPerson,
    this.alamatVendor,
    this.kodeVendor,
    this.pembayaran,
  });

  final String? idPurchaseOrder;
  final DateTime? tglPurchaseOrder;
  final String? noPurchaseOrder;
  final String? idVendor;
  final String? namaVendor;
  final String? diskon;
  final String? ppn;
  final DateTime? tglPengiriman;
  final String? alamatTujuanPengiriman;
  final String? keterangan;
  final String? statusPurchaseOrder;
  final String? baseline;
  final DateTime? tglSeleksiVendor;
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
  final String? contactPerson;
  final String? alamatVendor;
  final String? kodeVendor;
  final String? pembayaran;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    idPurchaseOrder: json["id_purchase_order"],
    tglPurchaseOrder: json["tgl_purchase_order"] == null ? null : DateTime.parse(json["tgl_purchase_order"]),
    noPurchaseOrder: json["no_purchase_order"],
    idVendor: json["id_vendor"],
    namaVendor: json["nama_vendor"],
    diskon: json["diskon"],
    ppn: json["ppn"],
    tglPengiriman: json["tgl_pengiriman"] == null ? null : DateTime.parse(json["tgl_pengiriman"]),
    alamatTujuanPengiriman: json["alamat_tujuan_pengiriman"],
    keterangan: json["keterangan"],
    statusPurchaseOrder: json["status_purchase_order"],
    baseline: json["baseline"],
    tglSeleksiVendor: json["tgl_seleksi_vendor"] == null ? null : DateTime.parse(json["tgl_seleksi_vendor"]),
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
    contactPerson: json["contact_person"],
    alamatVendor: json["alamat_vendor"],
    kodeVendor: json["kode_vendor"],
    pembayaran: json["pembayaran"],
  );

  Map<String, dynamic> toJson() => {
    "id_purchase_order": idPurchaseOrder,
    "tgl_purchase_order": tglPurchaseOrder == null ? null : "${tglPurchaseOrder?.year.toString().padLeft(4, '0')}-${tglPurchaseOrder?.month.toString().padLeft(2, '0')}-${tglPurchaseOrder?.day.toString().padLeft(2, '0')}",
    "no_purchase_order": noPurchaseOrder,
    "id_vendor": idVendor,
    "nama_vendor": namaVendor,
    "diskon": diskon,
    "ppn": ppn,
    "tgl_pengiriman": tglPengiriman == null ? null : "${tglPengiriman?.year.toString().padLeft(4, '0')}-${tglPengiriman?.month.toString().padLeft(2, '0')}-${tglPengiriman?.day.toString().padLeft(2, '0')}",
    "alamat_tujuan_pengiriman": alamatTujuanPengiriman,
    "keterangan": keterangan,
    "status_purchase_order": statusPurchaseOrder,
    "baseline": baseline,
    "tgl_seleksi_vendor": tglSeleksiVendor == null ? null : "${tglSeleksiVendor?.year.toString().padLeft(4, '0')}-${tglSeleksiVendor?.month.toString().padLeft(2, '0')}-${tglSeleksiVendor?.day.toString().padLeft(2, '0')}",
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
    "id_karyawan_pengaju": idKaryawanPengaju,
    "id_jabatan_pengaju": idJabatanPengaju,
    "nama_karyawan_pengaju": namaKaryawanPengaju,
    "nama_jabatan_pengaju": namaJabatanPengaju,
    "contact_person": contactPerson,
    "alamat_vendor": alamatVendor,
    "kode_vendor": kodeVendor,
    "pembayaran": pembayaran,
  };
}
