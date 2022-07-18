import 'dart:convert';

class HistoryRegdo {
  HistoryRegdo({
    this.status,
    this.message,
    this.xqry,
    this.identity,
    required this.data,
    this.dataCount,
    this.totalPage,
  });

  final bool? status;
  final String? message;
  final Xqry? xqry;
  final Identity? identity;
  final List<Datum> data;
  final int? dataCount;
  final int? totalPage;

  factory HistoryRegdo.fromRawJson(String str) => HistoryRegdo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HistoryRegdo.fromJson(Map<String, dynamic> json) => HistoryRegdo(
    status: json["status"],
    message: json["message"],
    xqry: json["xqry"] == null ? null : Xqry.fromJson(json["xqry"]),
    identity: json["identity"] == null ? null : Identity.fromJson(json["identity"]),
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    dataCount: json["data_count"],
    totalPage: json["total_page"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "xqry": xqry == null ? null : xqry!.toJson(),
    "identity": identity == null ? null : identity!.toJson(),
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "data_count": dataCount,
    "total_page": totalPage,
  };
}

class Datum {
  Datum({
    this.idDeliveryOrder,
    this.idSalesOrder,
    this.tglDeliveryOrder,
    this.noDeliveryOrder,
    this.catatanDeliveryOrder,
    this.idPetugasGudang,
    this.idSupir,
    this.idKendaraan,
    this.tglSuratJalan,
    this.noSuratJalan,
    this.noJurnal,
    this.baseline,
    this.tglSalesOrder,
    this.noSalesOrder,
    this.tglPurchaseOrder,
    this.noPurchaseOrder,
    this.idCustomer,
    this.idKaryawan,
    this.batasWaktu,
    this.status,
    this.catatan,
    this.alamatPengiriman,
    this.diskon,
    this.ppn,
    this.createdAt,
    this.idSales,
    this.namaSales,
    this.namaCustomer,
    this.telepon,
    this.petugasGudang,
    this.namaSopir,
    this.idGudang,
    this.namaGudang,
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
    this.namaKaryawanPengaju,
    this.namaJabatanPengaju,
  });

  final String? idDeliveryOrder;
  final String? idSalesOrder;
  final DateTime? tglDeliveryOrder;
  final String? noDeliveryOrder;
  final String? catatanDeliveryOrder;
  final String? idPetugasGudang;
  final String? idSupir;
  final String? idKendaraan;
  final DateTime? tglSuratJalan;
  final String? noSuratJalan;
  final String? noJurnal;
  final String? baseline;
  final DateTime? tglSalesOrder;
  final String? noSalesOrder;
  final DateTime? tglPurchaseOrder;
  final String? noPurchaseOrder;
  final String? idCustomer;
  final String? idKaryawan;
  final DateTime? batasWaktu;
  final String? status;
  final String? catatan;
  final String? alamatPengiriman;
  final String? diskon;
  final String? ppn;
  final String? createdAt;
  final String? idSales;
  final String? namaSales;
  final String? namaCustomer;
  final String? telepon;
  final String? petugasGudang;
  final String? namaSopir;
  final String? idGudang;
  final String? namaGudang;
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
  final String? namaKaryawanPengaju;
  final String? namaJabatanPengaju;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    idDeliveryOrder: json["id_delivery_order"],
    idSalesOrder: json["id_sales_order"],
    tglDeliveryOrder: json["tgl_delivery_order"] == null ? null : DateTime.parse(json["tgl_delivery_order"]),
    noDeliveryOrder: json["no_delivery_order"],
    catatanDeliveryOrder: json["catatan_delivery_order"],
    idPetugasGudang: json["id_petugas_gudang"],
    idSupir: json["id_supir"],
    idKendaraan: json["id_kendaraan"],
    tglSuratJalan: json["tgl_surat_jalan"] == null ? null : DateTime.parse(json["tgl_surat_jalan"]),
    noSuratJalan: json["no_surat_jalan"],
    noJurnal: json["no_jurnal"],
    baseline: json["baseline"],
    tglSalesOrder: json["tgl_sales_order"] == null ? null : DateTime.parse(json["tgl_sales_order"]),
    noSalesOrder: json["no_sales_order"],
    tglPurchaseOrder: json["tgl_purchase_order"] == null ? null : DateTime.parse(json["tgl_purchase_order"]),
    noPurchaseOrder: json["no_purchase_order"],
    idCustomer: json["id_customer"],
    idKaryawan: json["id_karyawan"],
    batasWaktu: json["batas_waktu"] == null ? null : DateTime.parse(json["batas_waktu"]),
    status: json["status"],
    catatan: json["catatan"],
    alamatPengiriman: json["alamat_pengiriman"],
    diskon: json["diskon"],
    ppn: json["ppn"],
    createdAt: json["created_at"],
    idSales: json["id_sales"],
    namaSales: json["nama_sales"],
    namaCustomer: json["nama_customer"],
    telepon: json["telepon"],
    petugasGudang: json["petugas_gudang"],
    namaSopir: json["nama_sopir"],
    idGudang: json["id_gudang"],
    namaGudang: json["nama_gudang"],
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
    namaKaryawanPengaju: json["nama_karyawan_pengaju"],
    namaJabatanPengaju: json["nama_jabatan_pengaju"],
  );

  Map<String, dynamic> toJson() => {
    "id_delivery_order": idDeliveryOrder,
    "id_sales_order": idSalesOrder,
    "tgl_delivery_order": tglDeliveryOrder == null ? null : "${tglDeliveryOrder?.year.toString().padLeft(4, '0')}-${tglDeliveryOrder?.month.toString().padLeft(2, '0')}-${tglDeliveryOrder?.day.toString().padLeft(2, '0')}",
    "no_delivery_order": noDeliveryOrder,
    "catatan_delivery_order": catatanDeliveryOrder,
    "id_petugas_gudang": idPetugasGudang,
    "id_supir": idSupir,
    "id_kendaraan": idKendaraan,
    "tgl_surat_jalan": tglSuratJalan == null ? null : "${tglSuratJalan?.year.toString().padLeft(4, '0')}-${tglSuratJalan?.month.toString().padLeft(2, '0')}-${tglSuratJalan?.day.toString().padLeft(2, '0')}",
    "no_surat_jalan": noSuratJalan, 
    "no_jurnal": noJurnal,
    "baseline": baseline,
    "tgl_sales_order": tglSalesOrder == null ? null : "${tglSalesOrder?.year.toString().padLeft(4, '0')}-${tglSalesOrder?.month.toString().padLeft(2, '0')}-${tglSalesOrder?.day.toString().padLeft(2, '0')}",
    "no_sales_order": noSalesOrder,
    "tgl_purchase_order": tglPurchaseOrder == null ? null : "${tglPurchaseOrder?.year.toString().padLeft(4, '0')}-${tglPurchaseOrder?.month.toString().padLeft(2, '0')}-${tglPurchaseOrder?.day.toString().padLeft(2, '0')}",
    "no_purchase_order": noPurchaseOrder,
    "id_customer": idCustomer,
    "id_karyawan": idKaryawan,
    "batas_waktu": batasWaktu == null ? null : "${batasWaktu?.year.toString().padLeft(4, '0')}-${batasWaktu?.month.toString().padLeft(2, '0')}-${batasWaktu?.day.toString().padLeft(2, '0')}",
    "status": status,
    "catatan": catatan,
    "alamat_pengiriman": alamatPengiriman,
    "diskon": diskon,
    "ppn": ppn,
    "created_at": createdAt,
    "id_sales": idSales,
    "nama_sales": namaSales,
    "nama_customer": namaCustomer,
    "telepon": telepon,
    "petugas_gudang": petugasGudang,
    "nama_sopir": namaSopir,
    "id_gudang": idGudang,
    "nama_gudang": namaGudang,
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
    "nama_karyawan_pengaju": namaKaryawanPengaju,
    "nama_jabatan_pengaju": namaJabatanPengaju,
  };
}

class Identity {
  Identity({
    this.idJabatan,
    this.idUnitOrganisasi,
    this.idKaryawan,
    this.kodeProses,
    this.behavior,
    this.approvalLevel,
  });

  final String? idJabatan;
  final String? idUnitOrganisasi;
  final String? idKaryawan;
  final String? kodeProses;
  final String? behavior;
  final String? approvalLevel;

  factory Identity.fromRawJson(String str) => Identity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Identity.fromJson(Map<String, dynamic> json) => Identity(
    idJabatan: json["id_jabatan"],
    idUnitOrganisasi: json["id_unit_organisasi"],
    idKaryawan: json["id_karyawan"],
    kodeProses: json["kode_proses"],
    behavior: json["behavior"],
    approvalLevel: json["approval_level"],
  );

  Map<String, dynamic> toJson() => {
    "id_jabatan": idJabatan,
    "id_unit_organisasi": idUnitOrganisasi,
    "id_karyawan": idKaryawan,
    "kode_proses": kodeProses,
    "behavior": behavior,
    "approval_level": approvalLevel,
  };
}

class Xqry {
  Xqry({
    this.page,
    this.perPage,
    this.idJabatanApproval,
  });

  final String? page;
  final String? perPage;
  final String? idJabatanApproval;

  factory Xqry.fromRawJson(String str) => Xqry.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Xqry.fromJson(Map<String, dynamic> json) => Xqry(
    page: json["page"],
    perPage: json["per_page"],
    idJabatanApproval: json["id_jabatan_approval"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "per_page": perPage,
    "id_jabatan_approval": idJabatanApproval,
  };
}
