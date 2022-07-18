import 'dart:convert';

class DetailRk {
  DetailRk({
    this.status,
    this.message,
    this.data,
  });

  final bool? status;
  final String? message;
  final Data? data;

  factory DetailRk.fromRawJson(String str) => DetailRk.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DetailRk.fromJson(Map<String, dynamic> json) => DetailRk(
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

class Detail {
  Detail({
    this.idKegiatan,
    this.noKegiatan,
    this.namaKegiatan,
    this.deskripsiKegiatan,
    this.tglInput,
    this.idKaryawan,
    this.tglMulai,
    this.tglSelesai,
    this.idProgram,
    this.isClose,
    this.baseline,
    this.createdAt,
    this.bulanTahun,
    this.noProgram,
    this.namaProgram,
    this.idJabatan,
    this.namaJabatan,
    this.idSubKelompokAnggaran,
    this.namaSubKelompokAnggaran,
    this.idUnitOrganisasi,
    this.namaUnitOrganisasi,
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
    this.namaKaryawan,
    this.program,
    this.sumberDaya,
  });

  final String? idKegiatan;
  final String? noKegiatan;
  final String? namaKegiatan;
  final String? deskripsiKegiatan;
  final DateTime? tglInput;
  final String? idKaryawan;
  final DateTime? tglMulai;
  final DateTime? tglSelesai;
  final String? idProgram;
  final bool? isClose;
  final String? baseline;
  final String? createdAt;
  final DateTime? bulanTahun;
  final String? noProgram;
  final String? namaProgram;
  final String? idJabatan;
  final String? namaJabatan;
  final String? idSubKelompokAnggaran;
  final String? namaSubKelompokAnggaran;
  final String? idUnitOrganisasi;
  final String? namaUnitOrganisasi;
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
  final String? namaKaryawan;
  final Program? program;
  final List<SumberDaya?>? sumberDaya;

  factory Detail.fromRawJson(String str) => Detail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    idKegiatan: json["id_kegiatan"],
    noKegiatan: json["no_kegiatan"],
    namaKegiatan: json["nama_kegiatan"],
    deskripsiKegiatan: json["deskripsi_kegiatan"],
    tglInput: json["tgl_input"] == null ? null : DateTime.parse(json["tgl_input"]),
    idKaryawan: json["id_karyawan"],
    tglMulai: json["tgl_mulai"] == null ? null : DateTime.parse(json["tgl_mulai"]),
    tglSelesai: json["tgl_selesai"] == null ? null : DateTime.parse(json["tgl_selesai"]),
    idProgram: json["id_program"],
    isClose: json["is_close"],
    baseline: json["baseline"],
    createdAt: json["created_at"],
    bulanTahun: json["bulan_tahun"] == null ? null : DateTime.parse(json["bulan_tahun"]),
    noProgram: json["no_program"],
    namaProgram: json["nama_program"],
    idJabatan: json["id_jabatan"],
    namaJabatan: json["nama_jabatan"],
    idSubKelompokAnggaran: json["id_sub_kelompok_anggaran"],
    namaSubKelompokAnggaran: json["nama_sub_kelompok_anggaran"],
    idUnitOrganisasi: json["id_unit_organisasi"],
    namaUnitOrganisasi: json["nama_unit_organisasi"],
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
    namaKaryawan: json["nama_karyawan"],
    program: json["program"] == null ? null : Program.fromJson(json["program"]),
    sumberDaya: json["sumber_daya"] == null ? null : List<SumberDaya>.from(json["sumber_daya"].map((x) => SumberDaya.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id_kegiatan": idKegiatan,
    "no_kegiatan": noKegiatan,
    "nama_kegiatan": namaKegiatan,
    "deskripsi_kegiatan": deskripsiKegiatan,
    "tgl_input": tglInput == null ? null : "${tglInput?.year.toString().padLeft(4, '0')}-${tglInput?.month.toString().padLeft(2, '0')}-${tglInput?.day.toString().padLeft(2, '0')}",
    "id_karyawan": idKaryawan,
    "tgl_mulai": tglMulai == null ? null : "${tglMulai?.year.toString().padLeft(4, '0')}-${tglMulai?.month.toString().padLeft(2, '0')}-${tglMulai?.day.toString().padLeft(2, '0')}",
    "tgl_selesai": tglSelesai == null ? null : "${tglSelesai?.year.toString().padLeft(4, '0')}-${tglSelesai?.month.toString().padLeft(2, '0')}-${tglSelesai?.day.toString().padLeft(2, '0')}",
    "id_program": idProgram,
    "is_close": isClose,
    "baseline": baseline,
    "created_at": createdAt,
    "bulan_tahun": bulanTahun == null ? null : "${bulanTahun?.year.toString().padLeft(4, '0')}-${bulanTahun?.month.toString().padLeft(2, '0')}-${bulanTahun?.day.toString().padLeft(2, '0')}",
    "no_program": noProgram,
    "nama_program": namaProgram,
    "id_jabatan": idJabatan,
    "nama_jabatan": namaJabatan,
    "id_sub_kelompok_anggaran": idSubKelompokAnggaran,
    "nama_sub_kelompok_anggaran": namaSubKelompokAnggaran,
    "id_unit_organisasi": idUnitOrganisasi,
    "nama_unit_organisasi": namaUnitOrganisasi,
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
    "nama_karyawan": namaKaryawan,
    "program": program!.toJson(),
    "sumber_daya": sumberDaya == null ? null : List<dynamic>.from(sumberDaya!.map((x) => x?.toJson())),
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

class Program {
  Program({
    this.idProgram,
    this.noProgram,
    this.namaProgram,
    this.deskripsiProgram,
    this.bulanDanTahun,
    this.idJabatan,
    this.namaJabatan,
    this.idUnitOrganisasi,
    this.namaUnitOrganisasi,
    this.idJenisAnggaran,
    this.namaJenisAnggaran,
    this.idKelompokAnggaran,
    this.namaKelompokAnggaran,
    this.idSubKelompokAnggaran,
    this.namaSubKelompokAnggaran,
    this.tglInput,
  });

  final String? idProgram;
  final String? noProgram;
  final String? namaProgram;
  final String? deskripsiProgram;
  final DateTime? bulanDanTahun;
  final String? idJabatan;
  final String? namaJabatan;
  final String? idUnitOrganisasi;
  final String? namaUnitOrganisasi;
  final String? idJenisAnggaran;
  final String? namaJenisAnggaran;
  final String? idKelompokAnggaran;
  final String? namaKelompokAnggaran;
  final String? idSubKelompokAnggaran;
  final String? namaSubKelompokAnggaran;
  final DateTime? tglInput;

  factory Program.fromRawJson(String str) => Program.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Program.fromJson(Map<String, dynamic> json) => Program(
    idProgram: json["id_program"],
    noProgram: json["no_program"],
    namaProgram: json["nama_program"],
    deskripsiProgram: json["deskripsi_program"],
    bulanDanTahun: json["bulan_dan_tahun"] == null ? null : DateTime.parse(json["bulan_dan_tahun"]),
    idJabatan: json["id_jabatan"],
    namaJabatan: json["nama_jabatan"],
    idUnitOrganisasi: json["id_unit_organisasi"],
    namaUnitOrganisasi: json["nama_unit_organisasi"],
    idJenisAnggaran: json["id_jenis_anggaran"],
    namaJenisAnggaran: json["nama_jenis_anggaran"],
    idKelompokAnggaran: json["id_kelompok_anggaran"],
    namaKelompokAnggaran: json["nama_kelompok_anggaran"],
    idSubKelompokAnggaran: json["id_sub_kelompok_anggaran"],
    namaSubKelompokAnggaran: json["nama_sub_kelompok_anggaran"],
    tglInput: json["tgl_input"] == null ? null : DateTime.parse(json["tgl_input"]),
  );

  Map<String, dynamic> toJson() => {
    "id_program": idProgram,
    "no_program": noProgram,
    "nama_program": namaProgram,
    "deskripsi_program": deskripsiProgram,
    "bulan_dan_tahun": bulanDanTahun == null ? null : "${bulanDanTahun?.year.toString().padLeft(4, '0')}-${bulanDanTahun?.month.toString().padLeft(2, '0')}-${bulanDanTahun?.day.toString().padLeft(2, '0')}",
    "id_jabatan": idJabatan,
    "nama_jabatan": namaJabatan,
    "id_unit_organisasi": idUnitOrganisasi,
    "nama_unit_organisasi": namaUnitOrganisasi,
    "id_jenis_anggaran": idJenisAnggaran,
    "nama_jenis_anggaran": namaJenisAnggaran,
    "id_kelompok_anggaran": idKelompokAnggaran,
    "nama_kelompok_anggaran": namaKelompokAnggaran,
    "id_sub_kelompok_anggaran": idSubKelompokAnggaran,
    "nama_sub_kelompok_anggaran": namaSubKelompokAnggaran,
    "tgl_input": tglInput == null ? null : "${tglInput?.year.toString().padLeft(4, '0')}-${tglInput?.month.toString().padLeft(2, '0')}-${tglInput?.day.toString().padLeft(2, '0')}",
  };
}

class SumberDaya {
  SumberDaya({
    this.idKegiatanSumberDaya,
    this.idKegiatan,
    this.idKategoriSumberDaya,
    this.itemSumberDaya,
    this.namaKategoriSumberDaya,
    this.qty,
    this.satuan,
    this.hargaSatuan,
    this.idCoa,
    this.nomorAkun,
  });

  final String? idKegiatanSumberDaya;
  final String? idKegiatan;
  final String? idKategoriSumberDaya;
  final String? itemSumberDaya;
  final String? namaKategoriSumberDaya;
  final String? qty;
  final String? satuan;
  final String? hargaSatuan;
  final String? idCoa;
  final String? nomorAkun;

  factory SumberDaya.fromRawJson(String str) => SumberDaya.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SumberDaya.fromJson(Map<String, dynamic> json) => SumberDaya(
    idKegiatanSumberDaya: json["id_kegiatan_sumber_daya"],
    idKegiatan: json["id_kegiatan"],
    idKategoriSumberDaya: json["id_kategori_sumber_daya"],
    itemSumberDaya: json["item_sumber_daya"],
    namaKategoriSumberDaya: json["nama_kategori_sumber_daya"],
    qty: json["qty"],
    satuan: json["satuan"],
    hargaSatuan: json["harga_satuan"],
    idCoa: json["id_coa"],
    nomorAkun: json["nomor_akun"],
  );

  Map<String, dynamic> toJson() => {
    "id_kegiatan_sumber_daya": idKegiatanSumberDaya,
    "id_kegiatan": idKegiatan,
    "id_kategori_sumber_daya": idKategoriSumberDaya,
    "item_sumber_daya": itemSumberDaya,
    "nama_kategori_sumber_daya": namaKategoriSumberDaya,
    "qty": qty,
    "satuan": satuan,
    "harga_satuan": hargaSatuan,
    "id_coa": idCoa,
    "nomor_akun": nomorAkun,
  };
}
