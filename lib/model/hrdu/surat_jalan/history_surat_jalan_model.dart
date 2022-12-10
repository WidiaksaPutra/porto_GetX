import 'dart:convert';

class HistoryRegsj {
  HistoryRegsj({
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

  factory HistoryRegsj.fromRawJson(String str) => HistoryRegsj.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HistoryRegsj.fromJson(Map<String, dynamic> json) => HistoryRegsj(
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
    this.idSuratJalan,
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
    this.tglPurchaseOrder,
    this.noPurchaseOrder,
    this.batasWaktu,
    this.status,
    this.catatan,
    this.alamatPengiriman,
    this.diskon,
    this.ppn,
    this.createdAt,
    this.namaSales,
    this.namaCustomer,
    this.telepon,
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
    this.namaItemAset,
    this.platNomor,
    this.namaGudang,
    this.namaSopir,
  });

  final String? idSuratJalan;
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
  final DateTime? tglPurchaseOrder;
  final String? noPurchaseOrder;
  final DateTime? batasWaktu;
  final String? status;
  final String? catatan;
  final String? alamatPengiriman;
  final String? diskon;
  final String? ppn;
  final String? createdAt;
  final String? namaSales;
  final String? namaCustomer;
  final String? telepon;
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
  final String? namaItemAset;
  final String? platNomor;
  final String? namaGudang;
  final String? namaSopir;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    idSuratJalan: json["id_surat_jalan"],
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
    tglPurchaseOrder: json["tgl_purchase_order"] == null ? null : DateTime.parse(json["tgl_purchase_order"]),
    noPurchaseOrder: json["no_purchase_order"],
    batasWaktu: json["batas_waktu"] == null ? null : DateTime.parse(json["batas_waktu"]),
    status: json["status"],
    catatan: json["catatan"],
    alamatPengiriman: json["alamat_pengiriman"],
    diskon: json["diskon"],
    ppn: json["ppn"],
    createdAt: json["created_at"],
    namaSales: json["nama_sales"],
    namaCustomer: json["nama_customer"],
    telepon: json["telepon"],
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
    namaItemAset: json["nama_item_aset"],
    platNomor: json["plat_nomor"],
    namaGudang: json["nama_gudang"],
    namaSopir: json["nama_sopir"],
  );

  Map<String, dynamic> toJson() => {
    "id_surat_jalan": idSuratJalan,
    "id_delivery_order": idDeliveryOrder,
    "id_sales_order": idSalesOrder,
    "tgl_delivery_order": tglDeliveryOrder == null ? null : "${tglDeliveryOrder?.year.toString().padLeft(4, '0')}-${tglDeliveryOrder?.month.toString().padLeft(2, '0')}-${tglDeliveryOrder?.day.toString().padLeft(2, '0')}",
    "no_delivery_order": noDeliveryOrder,
    "catatan_delivery_order": catatanDeliveryOrder,
    "tgl_surat_jalan": tglSuratJalan == null ? null : "${tglSuratJalan?.year.toString().padLeft(4, '0')}-${tglSuratJalan?.month.toString().padLeft(2, '0')}-${tglSuratJalan?.day.toString().padLeft(2, '0')}",
    "no_surat_jalan": noSuratJalan,
    "no_jurnal": noJurnal,
    "baseline": baseline,
    "tgl_sales_order": tglSalesOrder == null ? null : "${tglSalesOrder?.year.toString().padLeft(4, '0')}-${tglSalesOrder?.month.toString().padLeft(2, '0')}-${tglSalesOrder?.day.toString().padLeft(2, '0')}",
    "no_sales_order": noSalesOrder,
    "tgl_purchase_order": tglPurchaseOrder == null ? null : "${tglPurchaseOrder?.year.toString().padLeft(4, '0')}-${tglPurchaseOrder?.month.toString().padLeft(2, '0')}-${tglPurchaseOrder?.day.toString().padLeft(2, '0')}",
    "no_purchase_order": noPurchaseOrder,
    "batas_waktu": batasWaktu == null ? null : "${batasWaktu?.year.toString().padLeft(4, '0')}-${batasWaktu?.month.toString().padLeft(2, '0')}-${batasWaktu?.day.toString().padLeft(2, '0')}",
    "status": status,
    "catatan": catatan,
    "alamat_pengiriman": alamatPengiriman,
    "diskon": diskon,
    "ppn": ppn,
    "created_at": createdAt,
    "nama_sales": namaSales,
    "nama_customer": namaCustomer,
    "telepon": telepon,
    "id_approval_transaksi": idApprovalTransaksi,
    "no_transaksi": noTransaksi,
    "kode_transaksi": kodeTransaksi,
    "id_karyawan_approval": idKaryawanApproval,
    "id_jabatan_approval": idJabatanApproval,
    "status_approval": statusApproval,
    "catatan_approval": catatanApproval,
    "approval_created_at": approvalCreatedAt,
    "tgl_approval": tglApproval == null ? null : "${tglApproval?.year.toString().padLeft(4, '0')}-${tglApproval?.month.toString().padLeft(2, '0')}-${tglApproval?.day.toString().padLeft(2, '0')}",
    "approval_level": approvalLevel,
    "nama_karyawan_approval": namaKaryawanApproval,
    "nama_jabatan_approval": namaJabatanApproval,
    "id_karyawan_pengaju": idKaryawanPengaju,
    "id_jabatan_pengaju": idJabatanPengaju,
    "nama_karyawan_pengaju": namaKaryawanPengaju,
    "nama_jabatan_pengaju": namaJabatanPengaju,
    "nama_item_aset": namaItemAset,
    "plat_nomor": platNomor,
    "nama_gudang": namaGudang,
    "nama_sopir": namaSopir,
  };
}