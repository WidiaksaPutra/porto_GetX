import 'dart:convert';

class DetailRegdo {
  DetailRegdo({
    this.status,
    this.message,
    this.data,
  });

  final bool? status;
  final String? message;
  final Data? data;

  factory DetailRegdo.fromRawJson(String str) => DetailRegdo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DetailRegdo.fromJson(Map<String, dynamic> json) => DetailRegdo(
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

  final DataDetail? detail;
  final String? behavior;
  final List<Approval?>? approval;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    detail: json["detail"] == null ? null : DataDetail.fromJson(json["detail"]),
    behavior: json["behavior"],
    approval: json["approval"] == null ? null : List<Approval>.from(json["approval"].map((x) => Approval.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "detail": detail == null ? null : detail!.toJson(),
    "behavior": behavior,
    "approval": approval == null ? null : List<dynamic>.from(approval!.map((x) => x!.toJson())),
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
    "tgl_approval": tglApproval == null ? null : "${tglApproval!.year.toString().padLeft(4, '0')}-${tglApproval!.month.toString().padLeft(2, '0')}-${tglApproval!.day.toString().padLeft(2, '0')}",
    "approval_level": approvalLevel,
    "nama_karyawan": namaKaryawan,
    "nama_jabatan": namaJabatan,
    "approval_baseline": approvalBaseline,
  };
}

class DataDetail {
  DataDetail({
    this.idDeliveryOrder,
    this.idSalesOrder,
    this.tglDeliveryOrder,
    this.noDeliveryOrder,
    this.catatanDeliveryOrder,
    this.tglSuratJalan,
    this.noSuratJalan,
    this.noJurnal,
    this.baseline,
    this.tglSalesOrder,
    this.noSalesOrder,
    this.batasWaktu,
    this.catatan,
    this.alamatPengiriman,
    this.diskon,
    this.ppn,
    this.namaSales,
    this.namaCustomer,
    this.petugasGudang,
    this.namaSopir,
    this.idApprovalTransaksi,
    this.noTransaksi,
    this.kodeTransaksi,
    this.idKaryawanApproval,
    this.idJabatanApproval,
    this.statusApproval,
    this.catatanApproval,
    this.approvalCreatedAt,
    this.tglApproval,
    this.approvalLevel,
    this.namaKaryawanApproval,
    this.namaJabatanApproval,
    this.idKaryawanPengaju,
    this.idJabatanPengaju,
    this.namaKaryawanPengaju,
    this.namaJabatanPengaju,
    this.idGudang,
    this.namaGudang,
    this.statusProgress,
    this.namaProyek,
    this.detail,
  });

  final String? idDeliveryOrder;
  final String? idSalesOrder;
  final DateTime? tglDeliveryOrder;
  final String? noDeliveryOrder;
  final String? catatanDeliveryOrder;
  final DateTime? tglSuratJalan;
  final String? noSuratJalan;
  final String? noJurnal;
  final String? baseline;
  final DateTime? tglSalesOrder;
  final String? noSalesOrder;
  final DateTime? batasWaktu;
  final String? catatan;
  final String? alamatPengiriman;
  final String? diskon;
  final String? ppn;
  final String? namaSales;
  final String? namaCustomer;
  final String? petugasGudang;
  final String? namaSopir;
  final String? idApprovalTransaksi;
  final String? noTransaksi;
  final String? kodeTransaksi;
  final String? idKaryawanApproval;
  final String? idJabatanApproval;
  final String? statusApproval;
  final String? catatanApproval;
  final String? approvalCreatedAt;
  final DateTime? tglApproval;
  final String? approvalLevel;
  final String? namaKaryawanApproval;
  final String? namaJabatanApproval;
  final String? idKaryawanPengaju;
  final String? idJabatanPengaju;
  final String? namaKaryawanPengaju;
  final String? namaJabatanPengaju;
  final String? idGudang;
  final String? namaGudang;
  final String? statusProgress;
  final String? namaProyek;
  final List<DetailElement?>? detail;

  factory DataDetail.fromRawJson(String str) => DataDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DataDetail.fromJson(Map<String, dynamic> json) => DataDetail(
    idDeliveryOrder: json["id_delivery_order"],
    idSalesOrder: json["id_sales_order"],
    tglDeliveryOrder: json["tgl_delivery_order"] == null ? null : DateTime.parse(json["tgl_delivery_order"]),
    noDeliveryOrder: json["no_delivery_order"],
    catatanDeliveryOrder: json["catatan_delivery_order"],
    tglSuratJalan: json["tgl_surat_jalan"] == null ? null : DateTime.parse(json["tgl_surat_jalan"]),
    noSuratJalan: json["no_surat_jalan"],
    noJurnal: json["no_jurnal"],
    baseline: json["baseline"],
    tglSalesOrder: json["tgl_sales_order"] == null ? null : DateTime.parse(json["tgl_sales_order"]),
    noSalesOrder: json["no_sales_order"],
    batasWaktu: json["batas_waktu"] == null ? null : DateTime.parse(json["batas_waktu"]),
    catatan: json["catatan"],
    alamatPengiriman: json["alamat_pengiriman"],
    diskon: json["diskon"],
    ppn: json["ppn"],
    namaSales: json["nama_sales"],
    namaCustomer: json["nama_customer"],
    petugasGudang: json["petugas_gudang"],
    namaSopir: json["nama_sopir"],
    idApprovalTransaksi: json["id_approval_transaksi"],
    noTransaksi: json["no_transaksi"],
    kodeTransaksi: json["kode_transaksi"],
    idKaryawanApproval: json["id_karyawan_approval"],
    idJabatanApproval: json["id_jabatan_approval"],
    statusApproval: json["status_approval"],
    catatanApproval: json["catatan_approval"],
    approvalCreatedAt: json["approval_created_at"],
    tglApproval: json["tgl_approval"] == null ? null : DateTime.parse(json["tgl_approval"]),
    approvalLevel: json["approval_level"],
    namaKaryawanApproval: json["nama_karyawan_approval"],
    namaJabatanApproval: json["nama_jabatan_approval"],
    idKaryawanPengaju: json["id_karyawan_pengaju"],
    idJabatanPengaju: json["id_jabatan_pengaju"],
    namaKaryawanPengaju: json["nama_karyawan_pengaju"],
    namaJabatanPengaju: json["nama_jabatan_pengaju"],
    idGudang: json["id_gudang"],
    namaGudang: json["nama_gudang"],
    statusProgress: json["status_progress"],
    namaProyek: json["nama_proyek"],
    detail: json["detail"] == null ? null : List<DetailElement>.from(json["detail"].map((x) => DetailElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id_delivery_order": idDeliveryOrder,
    "id_sales_order": idSalesOrder,
    "tgl_delivery_order": tglDeliveryOrder == null ? null : "${tglDeliveryOrder!.year.toString().padLeft(4, '0')}-${tglDeliveryOrder!.month.toString().padLeft(2, '0')}-${tglDeliveryOrder!.day.toString().padLeft(2, '0')}",
    "no_delivery_order": noDeliveryOrder,
    "catatan_delivery_order": catatanDeliveryOrder,
    "tgl_surat_jalan": tglSuratJalan == null ? null : "${tglSuratJalan!.year.toString().padLeft(4, '0')}-${tglSuratJalan!.month.toString().padLeft(2, '0')}-${tglSuratJalan!.day.toString().padLeft(2, '0')}",
    "no_surat_jalan": noSuratJalan,
    "no_jurnal": noJurnal,
    "baseline": baseline,
    "tgl_sales_order": tglSalesOrder == null ? null : "${tglSalesOrder!.year.toString().padLeft(4, '0')}-${tglSalesOrder!.month.toString().padLeft(2, '0')}-${tglSalesOrder!.day.toString().padLeft(2, '0')}",
    "no_sales_order": noSalesOrder,
    "batas_waktu": batasWaktu == null ? null : "${batasWaktu!.year.toString().padLeft(4, '0')}-${batasWaktu!.month.toString().padLeft(2, '0')}-${batasWaktu!.day.toString().padLeft(2, '0')}",
    "catatan": catatan,
    "alamat_pengiriman": alamatPengiriman,
    "diskon": diskon,
    "ppn": ppn,
    "nama_sales": namaSales,
    "nama_customer": namaCustomer,
    "petugas_gudang": petugasGudang,
    "nama_sopir": namaSopir,
    "id_approval_transaksi": idApprovalTransaksi,
    "no_transaksi": noTransaksi,
    "kode_transaksi": kodeTransaksi,
    "id_karyawan_approval": idKaryawanApproval,
    "id_jabatan_approval": idJabatanApproval,
    "status_approval": statusApproval,
    "catatan_approval": catatanApproval,
    "approval_created_at": approvalCreatedAt,
    "tgl_approval": tglApproval == null ? null : "${tglApproval!.year.toString().padLeft(4, '0')}-${tglApproval!.month.toString().padLeft(2, '0')}-${tglApproval!.day.toString().padLeft(2, '0')}",
    "approval_level": approvalLevel,
    "nama_karyawan_approval": namaKaryawanApproval,
    "nama_jabatan_approval": namaJabatanApproval,
    "id_karyawan_pengaju": idKaryawanPengaju,
    "id_jabatan_pengaju": idJabatanPengaju,
    "nama_karyawan_pengaju": namaKaryawanPengaju,
    "nama_jabatan_pengaju": namaJabatanPengaju,
    "id_gudang": idGudang,
    "nama_gudang": namaGudang,
    "status_progress": statusProgress,
    "nama_proyek": namaProyek,
    "detail": detail == null ? null : List<dynamic>.from(detail!.map((x) => x!.toJson())),
  };
}

class DetailElement {
  DetailElement({
    this.idDeliveryOrderDetail,
    this.idDeliveryOrder,
    this.idSalesOrder,
    this.idSalesOrderDetail,
    this.idBarang,
    this.idSatuan,
    this.kodeBarang,
    this.namaBarang,
    this.namaSatuan,
    this.idGudang,
    this.namaGudang,
    this.qty,
    this.qtyJalan,
  });

  final String? idDeliveryOrderDetail;
  final String? idDeliveryOrder;
  final String? idSalesOrder;
  final String? idSalesOrderDetail;
  final String? idBarang;
  final String? idSatuan;
  final String? kodeBarang;
  final String? namaBarang;
  final String? namaSatuan;
  final String? idGudang;
  final String? namaGudang;
  final String? qty;
  final String? qtyJalan;

  factory DetailElement.fromRawJson(String str) => DetailElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DetailElement.fromJson(Map<String, dynamic> json) => DetailElement(
    idDeliveryOrderDetail: json["id_delivery_order_detail"],
    idDeliveryOrder: json["id_delivery_order"],
    idSalesOrder: json["id_sales_order"],
    idSalesOrderDetail: json["id_sales_order_detail"],
    idBarang: json["id_barang"],
    idSatuan: json["id_satuan"],
    kodeBarang: json["kode_barang"],
    namaBarang: json["nama_barang"],
    namaSatuan: json["nama_satuan"],
    idGudang: json["id_gudang"],
    namaGudang: json["nama_gudang"],
    qty: json["qty"],
    qtyJalan: json["qty_jalan"],
  );

  Map<String, dynamic> toJson() => {
    "id_delivery_order_detail": idDeliveryOrderDetail,
    "id_delivery_order": idDeliveryOrder,
    "id_sales_order": idSalesOrder,
    "id_sales_order_detail": idSalesOrderDetail,
    "id_barang": idBarang,
    "id_satuan": idSatuan,
    "kode_barang": kodeBarang,
    "nama_barang": namaBarang,
    "nama_satuan": namaSatuan,
    "id_gudang": idGudang,
    "nama_gudang": namaGudang,
    "qty": qty,
    "qty_jalan": qtyJalan,
  };
}
