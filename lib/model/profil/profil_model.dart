import 'dart:convert';

class Profil {
  Profil({
    this.status,
    this.message,
    this.data,
  });

  final bool? status;
  final String? message;
  final Data? data;

  factory Profil.fromRawJson(String str) => Profil.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Profil.fromJson(Map<String, dynamic> json) => Profil(
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
    this.idKaryawan,
    this.noKaryawan,
    this.namaKaryawan,
    this.idJabatan,
    this.kodeJabatan,
    this.namaJabatan,
    this.username,
    this.profileImg,
    this.idGrade,
    this.namaGrade,
    this.idPangkat,
    this.namaPangkat,
    this.jenisPangkat,
    this.idUnitOrganisasi,
    this.kodeUnitOrganisasi,
    this.namaUnitOrganisasi,
    this.idHirarkiUnitOrganisasi,
    this.namaHirarkiUnitOrganisasi,
    this.levelHirarkiUnitOrganisasi,
    this.noKtp,
    this.tempatLahir,
    this.tglLahir,
    this.jenisKelamin,
    this.agama,
    this.statusPerkawinan,
    this.tglBergabung,
    this.tglPengangkatan,
    this.idStatusKaryawan,
    this.namaStatusKaryawan,
    this.noNpwp,
    this.idLokasiKerja,
    this.namaLokasiKerja,
    this.idProvinsiAsal,
    this.namaProvinsiAsal,
    this.idKabupatenAsal,
    this.namaKabupatenAsal,
    this.idKecamatanAsal,
    this.namaKecamatanAsal,
    this.idDesaAsal,
    this.namaDesaAsal,
    this.alamatAsal,
    this.kodePosAsal,
    this.idProvinsiSaatIni,
    this.namaProvinsiSaatIni,
    this.idKabupatenSaatIni,
    this.namaKabupatenSaatIni,
    this.idKecamatanSaatIni,
    this.namaKecamatanSaatIni,
    this.idDesaSaatIni,
    this.namaDesaSaatIni,
    this.alamatSaatIni,
    this.kodePosSaatIni,
    this.noRekening,
    this.kodeBank,
    this.namaBank,
    this.atasNama,
    this.cabang,
    this.noTelp,
    this.noHp,
    this.email,
    this.kontakDarurat,
    this.keteranganKontakDarurat,
    this.idJenjangPendidikan,
    this.namaJenjangPendidikan,
    this.lembagaPendidikan,
    this.tahunSelesai,
    this.ketPendidikan,
  });

  final String? idKaryawan;
  final String? noKaryawan;
  final String? namaKaryawan;
  final String? idJabatan;
  final String? kodeJabatan;
  final String? namaJabatan;
  final String? username;
  final String? profileImg;
  final String? idGrade;
  final String? namaGrade;
  final String? idPangkat;
  final String? namaPangkat;
  final String? jenisPangkat;
  final String? idUnitOrganisasi;
  final String? kodeUnitOrganisasi;
  final String? namaUnitOrganisasi;
  final String? idHirarkiUnitOrganisasi;
  final String? namaHirarkiUnitOrganisasi;
  final String? levelHirarkiUnitOrganisasi;
  final String? noKtp;
  final String? tempatLahir;
  final DateTime? tglLahir;
  final String? jenisKelamin;
  final String? agama;
  final String? statusPerkawinan;
  final DateTime? tglBergabung;
  final DateTime? tglPengangkatan;
  final String? idStatusKaryawan;
  final String? namaStatusKaryawan;
  final String? noNpwp;
  final String? idLokasiKerja;
  final String? namaLokasiKerja;
  final String? idProvinsiAsal;
  final String? namaProvinsiAsal;
  final String? idKabupatenAsal;
  final String? namaKabupatenAsal;
  final String? idKecamatanAsal;
  final String? namaKecamatanAsal;
  final String? idDesaAsal;
  final String? namaDesaAsal;
  final String? alamatAsal;
  final String? kodePosAsal;
  final String? idProvinsiSaatIni;
  final String? namaProvinsiSaatIni;
  final String? idKabupatenSaatIni;
  final String? namaKabupatenSaatIni;
  final String? idKecamatanSaatIni;
  final String? namaKecamatanSaatIni;
  final String? idDesaSaatIni;
  final String? namaDesaSaatIni;
  final String? alamatSaatIni;
  final String? kodePosSaatIni;
  final String? noRekening;
  final String? kodeBank;
  final String? namaBank;
  final String? atasNama;
  final String? cabang;
  final String? noTelp;
  final String? noHp;
  final String? email;
  final String? kontakDarurat;
  final String? keteranganKontakDarurat;
  final String? idJenjangPendidikan;
  final String? namaJenjangPendidikan;
  final String? lembagaPendidikan;
  final String? tahunSelesai;
  final String? ketPendidikan;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    idKaryawan: json["id_karyawan"],
    noKaryawan: json["no_karyawan"],
    namaKaryawan: json["nama_karyawan"],
    idJabatan: json["id_jabatan"],
    kodeJabatan: json["kode_jabatan"],
    namaJabatan: json["nama_jabatan"],
    username: json["username"],
    profileImg: json["profile_img"],
    idGrade: json["id_grade"],
    namaGrade: json["nama_grade"],
    idPangkat: json["id_pangkat"],
    namaPangkat: json["nama_pangkat"],
    jenisPangkat: json["jenis_pangkat"],
    idUnitOrganisasi: json["id_unit_organisasi"],
    kodeUnitOrganisasi: json["kode_unit_organisasi"],
    namaUnitOrganisasi: json["nama_unit_organisasi"],
    idHirarkiUnitOrganisasi: json["id_hirarki_unit_organisasi"],
    namaHirarkiUnitOrganisasi: json["nama_hirarki_unit_organisasi"],
    levelHirarkiUnitOrganisasi: json["level_hirarki_unit_organisasi"],
    noKtp: json["no_ktp"],
    tempatLahir: json["tempat_lahir"],
    tglLahir: json["tgl_lahir"] == null ? null : DateTime.parse(json["tgl_lahir"]),
    jenisKelamin: json["jenis_kelamin"],
    agama: json["agama"],
    statusPerkawinan: json["status_perkawinan"],
    tglBergabung: json["tgl_bergabung"] == null ? null : DateTime.parse(json["tgl_bergabung"]),
    tglPengangkatan: json["tgl_pengangkatan"] == null ? null : DateTime.parse(json["tgl_pengangkatan"]),
    idStatusKaryawan: json["id_status_karyawan"],
    namaStatusKaryawan: json["nama_status_karyawan"],
    noNpwp: json["no_npwp"],
    idLokasiKerja: json["id_lokasi_kerja"],
    namaLokasiKerja: json["nama_lokasi_kerja"],
    idProvinsiAsal: json["id_provinsi_asal"],
    namaProvinsiAsal: json["nama_provinsi_asal"],
    idKabupatenAsal: json["id_kabupaten_asal"],
    namaKabupatenAsal: json["nama_kabupaten_asal"],
    idKecamatanAsal: json["id_kecamatan_asal"],
    namaKecamatanAsal: json["nama_kecamatan_asal"],
    idDesaAsal: json["id_desa_asal"],
    namaDesaAsal: json["nama_desa_asal"],
    alamatAsal: json["alamat_asal"],
    kodePosAsal: json["kode_pos_asal"],
    idProvinsiSaatIni: json["id_provinsi_saat_ini"],
    namaProvinsiSaatIni: json["nama_provinsi_saat_ini"],
    idKabupatenSaatIni: json["id_kabupaten_saat_ini"],
    namaKabupatenSaatIni: json["nama_kabupaten_saat_ini"],
    idKecamatanSaatIni: json["id_kecamatan_saat_ini"],
    namaKecamatanSaatIni: json["nama_kecamatan_saat_ini"],
    idDesaSaatIni: json["id_desa_saat_ini"],
    namaDesaSaatIni: json["nama_desa_saat_ini"],
    alamatSaatIni: json["alamat_saat_ini"],
    kodePosSaatIni: json["kode_pos_saat_ini"],
    noRekening: json["no_rekening"],
    kodeBank: json["kode_bank"],
    namaBank: json["nama_bank"],
    atasNama: json["atas_nama"],
    cabang: json["cabang"],
    noTelp: json["no_telp"],
    noHp: json["no_hp"],
    email: json["email"],
    kontakDarurat: json["kontak_darurat"],
    keteranganKontakDarurat: json["keterangan_kontak_darurat"],
    idJenjangPendidikan: json["id_jenjang_pendidikan"],
    namaJenjangPendidikan: json["nama_jenjang_pendidikan"],
    lembagaPendidikan: json["lembaga_pendidikan"],
    tahunSelesai: json["tahun_selesai"],
    ketPendidikan: json["ket_pendidikan"],
  );

  Map<String, dynamic> toJson() => {
    "id_karyawan": idKaryawan,
    "no_karyawan": noKaryawan,
    "nama_karyawan": namaKaryawan,
    "id_jabatan": idJabatan,
    "kode_jabatan": kodeJabatan,
    "nama_jabatan": namaJabatan,
    "username": username,
    "profile_img": profileImg,
    "id_grade": idGrade,
    "nama_grade": namaGrade,
    "id_pangkat": idPangkat,
    "nama_pangkat": namaPangkat,
    "jenis_pangkat": jenisPangkat,
    "id_unit_organisasi": idUnitOrganisasi,
    "kode_unit_organisasi": kodeUnitOrganisasi,
    "nama_unit_organisasi": namaUnitOrganisasi,
    "id_hirarki_unit_organisasi": idHirarkiUnitOrganisasi,
    "nama_hirarki_unit_organisasi": namaHirarkiUnitOrganisasi,
    "level_hirarki_unit_organisasi": levelHirarkiUnitOrganisasi,
    "no_ktp": noKtp,
    "tempat_lahir": tempatLahir,
    "tgl_lahir": tglLahir == null ? null : "${tglLahir?.year.toString().padLeft(4, '0')}-${tglLahir?.month.toString().padLeft(2, '0')}-${tglLahir?.day.toString().padLeft(2, '0')}",
    "jenis_kelamin": jenisKelamin,
    "agama": agama,
    "status_perkawinan": statusPerkawinan,
    "tgl_bergabung": tglBergabung == null ? null : "${tglBergabung?.year.toString().padLeft(4, '0')}-${tglBergabung?.month.toString().padLeft(2, '0')}-${tglBergabung?.day.toString().padLeft(2, '0')}",
    "tgl_pengangkatan": tglPengangkatan == null ? null : "${tglPengangkatan?.year.toString().padLeft(4, '0')}-${tglPengangkatan?.month.toString().padLeft(2, '0')}-${tglPengangkatan?.day.toString().padLeft(2, '0')}",
    "id_status_karyawan": idStatusKaryawan,
    "nama_status_karyawan": namaStatusKaryawan,
    "no_npwp": noNpwp,
    "id_lokasi_kerja": idLokasiKerja,
    "nama_lokasi_kerja": namaLokasiKerja,
    "id_provinsi_asal": idProvinsiAsal,
    "nama_provinsi_asal": namaProvinsiAsal,
    "id_kabupaten_asal": idKabupatenAsal,
    "nama_kabupaten_asal": namaKabupatenAsal,
    "id_kecamatan_asal": idKecamatanAsal,
    "nama_kecamatan_asal": namaKecamatanAsal,
    "id_desa_asal": idDesaAsal,
    "nama_desa_asal": namaDesaAsal,
    "alamat_asal": alamatAsal,
    "kode_pos_asal": kodePosAsal,
    "id_provinsi_saat_ini": idProvinsiSaatIni,
    "nama_provinsi_saat_ini": namaProvinsiSaatIni,
    "id_kabupaten_saat_ini": idKabupatenSaatIni,
    "nama_kabupaten_saat_ini": namaKabupatenSaatIni,
    "id_kecamatan_saat_ini": idKecamatanSaatIni,
    "nama_kecamatan_saat_ini": namaKecamatanSaatIni,
    "id_desa_saat_ini": idDesaSaatIni,
    "nama_desa_saat_ini": namaDesaSaatIni,
    "alamat_saat_ini": alamatSaatIni,
    "kode_pos_saat_ini": kodePosSaatIni,
    "no_rekening": noRekening,
    "kode_bank": kodeBank,
    "nama_bank": namaBank,
    "atas_nama": atasNama,
    "cabang": cabang,
    "no_telp": noTelp,
    "no_hp": noHp,
    "email": email,
    "kontak_darurat": kontakDarurat,
    "keterangan_kontak_darurat": keteranganKontakDarurat,
    "id_jenjang_pendidikan": idJenjangPendidikan,
    "nama_jenjang_pendidikan": namaJenjangPendidikan,
    "lembaga_pendidikan": lembagaPendidikan,
    "tahun_selesai": tahunSelesai,
    "ket_pendidikan": ketPendidikan,
  };
}