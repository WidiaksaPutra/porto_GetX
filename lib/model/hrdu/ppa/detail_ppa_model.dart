import 'dart:convert';

class DetailRegppa {
  DetailRegppa({
    this.status,
    this.message,
    this.data,
  });

  final bool? status;
  final String? message;
  final Data? data;

  factory DetailRegppa.fromRawJson(String str) => DetailRegppa.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DetailRegppa.fromJson(Map<String, dynamic> json) => DetailRegppa(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
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
    "detail": detail!.toJson(),
    "behavior": behavior,
    "approval": approval == null ? null : List<dynamic>.from(approval!.map((x) => x?.toJson())),
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

class Detail {
  Detail({
    this.idPpa,
    this.tglPpa,
    this.noPpa,
    this.qty,
    this.satuan,
    this.hargaSatuan,
    this.idKegiatanSumberDaya,
    this.baseline,
    this.bukti,
    this.idApprovalTransaksi,
    this.noTransaksi,
    this.kodeTransaksi,
    this.idKaryawanApproval,
    this.idJabatanApproval,
    this.statusApproval,
    this.catatan,
    this.tglApproval,
    this.approvalLevel,
    this.namaKaryawanApproval,
    this.namaJabatanApproval,
    this.idKaryawanPengaju,
    this.idJabatanPengaju,
    this.namaKaryawanPengaju,
    this.namaJabatanPengaju,
    this.itemSumberDaya,
    this.namaKegiatan,
    this.namaProgram,
    this.statusPpa,
    this.namaUnitOrganisasi,
    this.sumberDaya,
    this.bulanTahun,
    this.nomorAkun,
    this.namaAkun,
    this.tipeAnggaran,
  });

  final String? idPpa;
  final DateTime? tglPpa;
  final String? noPpa;
  final String? qty;
  final String? satuan;
  final String? hargaSatuan;
  final String? idKegiatanSumberDaya;
  final String? baseline;
  final String? bukti;
  final String? idApprovalTransaksi;
  final String? noTransaksi;
  final String? kodeTransaksi;
  final String? idKaryawanApproval;
  final String? idJabatanApproval;
  final String? statusApproval;
  final String? catatan;
  final DateTime? tglApproval;
  final String? approvalLevel;
  final String? namaKaryawanApproval;
  final String? namaJabatanApproval;
  final String? idKaryawanPengaju;
  final String? idJabatanPengaju;
  final String? namaKaryawanPengaju;
  final String? namaJabatanPengaju;
  final String? itemSumberDaya;
  final String? namaKegiatan;
  final String? namaProgram;
  final String? statusPpa;
  final String? namaUnitOrganisasi;
  final String? sumberDaya;
  final DateTime? bulanTahun;
  final String? nomorAkun;
  final String? namaAkun;
  final String? tipeAnggaran;

  factory Detail.fromRawJson(String str) => Detail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    idPpa: json["id_ppa"],
    tglPpa: json["tgl_ppa"] == null ? null : DateTime.parse(json["tgl_ppa"]),
    noPpa: json["no_ppa"],
    qty: json["qty"],
    satuan: json["satuan"],
    hargaSatuan: json["harga_satuan"],
    idKegiatanSumberDaya: json["id_kegiatan_sumber_daya"],
    baseline: json["baseline"],
    bukti: json["bukti"],
    idApprovalTransaksi: json["id_approval_transaksi"],
    noTransaksi: json["no_transaksi"],
    kodeTransaksi: json["kode_transaksi"],
    idKaryawanApproval: json["id_karyawan_approval"],
    idJabatanApproval: json["id_jabatan_approval"],
    statusApproval: json["status_approval"],
    catatan: json["catatan"],
    tglApproval: json["tgl_approval"] == null ? null : DateTime.parse(json["tgl_approval"]),
    approvalLevel: json["approval_level"],
    namaKaryawanApproval: json["nama_karyawan_approval"],
    namaJabatanApproval: json["nama_jabatan_approval"],
    idKaryawanPengaju: json["id_karyawan_pengaju"],
    idJabatanPengaju: json["id_jabatan_pengaju"],
    namaKaryawanPengaju: json["nama_karyawan_pengaju"],
    namaJabatanPengaju: json["nama_jabatan_pengaju"],
    itemSumberDaya: json["item_sumber_daya"],
    namaKegiatan: json["nama_kegiatan"],
    namaProgram: json["nama_program"],
    statusPpa: json["status_ppa"],
    namaUnitOrganisasi: json["nama_unit_organisasi"],
    sumberDaya: json["sumber_daya"],
    bulanTahun: json["bulan_tahun"] == null ? null : DateTime.parse(json["bulan_tahun"]),
    nomorAkun: json["nomor_akun"],
    namaAkun: json["nama_akun"],
    tipeAnggaran: json["tipe_anggaran"],
  );

  Map<String, dynamic> toJson() => {
    "id_ppa": idPpa,
    "tgl_ppa": tglPpa == null ? null : "${tglPpa?.year.toString().padLeft(4, '0')}-${tglPpa?.month.toString().padLeft(2, '0')}-${tglPpa?.day.toString().padLeft(2, '0')}",
    "no_ppa": noPpa,
    "qty": qty,
    "satuan": satuan,
    "harga_satuan": hargaSatuan,
    "id_kegiatan_sumber_daya": idKegiatanSumberDaya,
    "baseline": baseline,
    "bukti": bukti,
    "id_approval_transaksi": idApprovalTransaksi,
    "no_transaksi": noTransaksi,
    "kode_transaksi": kodeTransaksi,
    "id_karyawan_approval": idKaryawanApproval,
    "id_jabatan_approval": idJabatanApproval,
    "status_approval": statusApproval,
    "catatan": catatan,
    "tgl_approval": tglApproval == null ? null : "${tglApproval?.year.toString().padLeft(4, '0')}-${tglApproval?.month.toString().padLeft(2, '0')}-${tglApproval?.day.toString().padLeft(2, '0')}",
    "approval_level": approvalLevel,
    "nama_karyawan_approval": namaKaryawanApproval,
    "nama_jabatan_approval": namaJabatanApproval,
    "id_karyawan_pengaju": idKaryawanPengaju,
    "id_jabatan_pengaju": idJabatanPengaju,
    "nama_karyawan_pengaju": namaKaryawanPengaju,
    "nama_jabatan_pengaju": namaJabatanPengaju,
    "item_sumber_daya": itemSumberDaya,
    "nama_kegiatan": namaKegiatan,
    "nama_program": namaProgram,
    "status_ppa": statusPpa,
    "nama_unit_organisasi": namaUnitOrganisasi,
    "sumber_daya": sumberDaya,
    "bulan_tahun": bulanTahun == null ? null : "${bulanTahun?.year.toString().padLeft(4, '0')}-${bulanTahun?.month.toString().padLeft(2, '0')}-${bulanTahun?.day.toString().padLeft(2, '0')}",
    "nomor_akun": nomorAkun,
    "nama_akun": namaAkun,
    "tipe_anggaran": tipeAnggaran,
  };
}
