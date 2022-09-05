// To parse this JSON data, do
//
//     final regspk = regspkFromJson(jsonString);

import 'dart:convert';

class Regspk {
    Regspk({
        this.status,
        this.message,
        this.xqry,
        required this.data,
        this.dataCount,
        this.totalPage,
    });

    final bool? status;
    final String? message;
    final Xqry? xqry;
    final List<Datum> data;
    final int? dataCount;
    final int? totalPage;

    factory Regspk.fromRawJson(String str) => Regspk.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Regspk.fromJson(Map<String, dynamic> json) => Regspk(
        status: json["status"],
        message: json["message"] == null ? "-" : json["message"].toString(),
        xqry: Xqry.fromJson(json["xqry"]),
        data: json["data"] == List.empty() ? [] : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        dataCount: json["data_count"] == null ? 0 : json["data_count"].toInt(),
        totalPage: json["total_page"] == null ? 0 : json["total_page"].toInt(),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message == null ? "-" : message.toString(),
        "xqry": xqry == null ? null : xqry!.toJson(),
        "data": data == List.empty() ? [] : List<dynamic>.from(data.map((x) => x.toJson())),
        "data_count": dataCount == null ? 0 : dataCount!.toInt(),
        "total_page": totalPage == null ? 0 : totalPage!.toInt(),
    };
}

class Datum {
    Datum({
        this.idSpk,
        this.noSpk,
        this.tglSpk,
        this.tglSelesaiSpk,
        this.idPenawaran,
        this.catatan,
        this.ppn,
        this.baseline,
        this.tglPenawaran,
        this.noPenawaran,
        this.namaCustomer,
        this.att,
        this.tglSelesai,
        this.idApprovalTransaksi,
        this.noTransaksi,
        this.kodeTransaksi,
        this.idKaryawanApproval,
        this.idJabatanApproval,
        this.statusApproval,
        this.catatanApproval,
        this.createdAt,
        this.tglApproval,
        this.approvalLevel,
        this.namaKaryawanApproval,
        this.namaJabatanApproval,
        this.idKaryawanPengaju,
        this.idJabatanPengaju,
        this.namaKaryawanPengaju,
        this.namaJabatanPengaju,
        this.idRae,
        this.idRab,
        this.idPeluang,
        this.noRab,
        this.diskon,
        this.namaProyek,
        this.uangMuka,
        this.barangJadi,
    });

    final String? idSpk;
    final String? noSpk;
    final DateTime? tglSpk;
    final DateTime? tglSelesaiSpk;
    final String? idPenawaran;
    final String? catatan;
    final String? ppn;
    final String? baseline;
    final DateTime? tglPenawaran;
    final String? noPenawaran;
    final String? namaCustomer;
    final String? att;
    final DateTime? tglSelesai;
    final String? idApprovalTransaksi;
    final String? noTransaksi;
    final String? kodeTransaksi;
    final String? idKaryawanApproval;
    final String? idJabatanApproval;
    final String? statusApproval;
    final String? catatanApproval;
    final DateTime? createdAt;
    final DateTime? tglApproval;
    final String? approvalLevel;
    final String? namaKaryawanApproval;
    final String? namaJabatanApproval;
    final String? idKaryawanPengaju;
    final String? idJabatanPengaju;
    final String? namaKaryawanPengaju;
    final String? namaJabatanPengaju;
    final String? idRae;
    final String? idRab;
    final String? idPeluang;
    final String? noRab;
    final String? diskon;
    final String? namaProyek;
    final String? uangMuka;
    final List<BarangJadi>? barangJadi;

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idSpk: json["id_spk"] == null ? "-" : json["id_spk"].toString(),
        noSpk: json["no_spk"] == null ? "-" : json["no_spk"].toString(),
        tglSpk: json["tgl_spk"] == null ? null : DateTime.parse(json["tgl_spk"]),
        tglSelesaiSpk: json["tgl_selesai_spk"] == null ? null : DateTime.parse(json["tgl_selesai_spk"]),
        idPenawaran: json["id_penawaran"] == null ? "-" : json["id_penawaran"].toString(),
        catatan: json["catatan"] == null ? "-" : json["catatan"].toString(),
        ppn: json["ppn"] == null ? "-" : json["ppn"].toString(),
        baseline: json["baseline"] == null ? "-" : json["baseline"].toString(),
        tglPenawaran: json["tgl_penawaran"] == null ? null : DateTime.parse(json["tgl_penawaran"]),
        noPenawaran: json["no_penawaran"] == null ? "-" : json["no_penawaran"].toString(),
        namaCustomer: json["nama_customer"] == null ? "-" : json["nama_customer"].toString(),
        att: json["att"] == null ? "-" : json["att"].toString(),
        tglSelesai: json["tgl_selesai"] == null ? null : DateTime.parse(json["tgl_selesai"]),
        idApprovalTransaksi: json["id_approval_transaksi"] == null ? "-" : json["id_approval_transaksi"].toString(),
        noTransaksi: json["no_transaksi"] == null ? "-" : json["no_transaksi"].toString(),
        kodeTransaksi: json["kode_transaksi"] == null ? "-" : json["kode_transaksi"].toString(),
        idKaryawanApproval: json["id_karyawan_approval"] == null ? "-" : json["id_karyawan_approval"].toString(),
        idJabatanApproval: json["id_jabatan_approval"] == null ? "-" : json["id_jabatan_approval"].toString(),
        statusApproval: json["status_approval"] == null ? "-" : json["status_approval"].toString(),
        catatanApproval: json["catatan_approval"] == null ? "-" : json["catatan_approval"].toString(),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        tglApproval: json["tgl_approval"] == null ? null : DateTime.parse(json["tgl_approval"]),
        approvalLevel: json["approval_level"] == null ? "-" : json["approval_level"].toString(),
        namaKaryawanApproval: json["nama_karyawan_approval"] == null ? "-" : json["nama_karyawan_approval"].toString(),
        namaJabatanApproval: json["nama_jabatan_approval"] == null ? "-" : json["nama_jabatan_approval"].toString(),
        idKaryawanPengaju: json["id_karyawan_pengaju"] == null ? "-" : json["id_karyawan_pengaju"].toString(),
        idJabatanPengaju: json["id_jabatan_pengaju"] == null ? "-" : json["id_jabatan_pengaju"].toString(),
        namaKaryawanPengaju: json["nama_karyawan_pengaju"] == null ? "-" : json["nama_karyawan_pengaju"].toString(),
        namaJabatanPengaju: json["nama_jabatan_pengaju"] == null ? "-" : json["nama_jabatan_pengaju"].toString(),
        idRae: json["id_rae"] == null ? "-" : json["id_rae"].toString(),
        idRab: json["id_rab"] == null ? "-" : json["id_rab"].toString(),
        idPeluang: json["id_peluang"] == null ? "-" : json["id_peluang"].toString(),
        noRab: json["no_rab"] == null ? "-" : json["no_rab"].toString(),
        diskon: json["diskon"] == null ? "-" : json["diskon"].toString(),
        namaProyek: json["nama_proyek"] == null ? "-" : json["nama_proyek"].toString(),
        uangMuka: json["uang_muka"] == null ? "-" : json["uang_muka"].toString(),
        barangJadi: json["barang_jadi"] == List.empty() ? [] : List<BarangJadi>.from(json["barang_jadi"].map((x) => BarangJadi.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id_spk": idSpk == null ? "-" : idSpk.toString(),
        "no_spk": noSpk == null ? "-" : noSpk.toString(),
        "tgl_spk": tglSpk == null ? null : "${tglSpk?.year.toString().padLeft(4, '0')}-${tglSpk?.month.toString().padLeft(2, '0')}-${tglSpk?.day.toString().padLeft(2, '0')}",
        "tgl_selesai_spk": tglSelesaiSpk == null ? null : "${tglSelesaiSpk?.year.toString().padLeft(4, '0')}-${tglSelesaiSpk?.month.toString().padLeft(2, '0')}-${tglSelesaiSpk?.day.toString().padLeft(2, '0')}",
        "id_penawaran": idPenawaran == null ? "-" : idPenawaran.toString(),
        "catatan": catatan == null ? "-" : catatan.toString(),
        "ppn": ppn == null ? "-" : ppn.toString(),
        "baseline": baseline == null ? "-" : baseline.toString(),
        "tgl_penawaran": tglPenawaran == null ? null : "${tglPenawaran?.year.toString().padLeft(4, '0')}-${tglPenawaran?.month.toString().padLeft(2, '0')}-${tglPenawaran?.day.toString().padLeft(2, '0')}",
        "no_penawaran": noPenawaran == null ? "-" : noPenawaran.toString(),
        "nama_customer": namaCustomer == null ? "-" : namaCustomer.toString(),
        "att": att == null ? "-" : att.toString(),
        "tgl_selesai": tglSelesai == null ? null : "${tglSelesai?.year.toString().padLeft(4, '0')}-${tglSelesai?.month.toString().padLeft(2, '0')}-${tglSelesai?.day.toString().padLeft(2, '0')}",
        "id_approval_transaksi": idApprovalTransaksi == null ? "-" : idApprovalTransaksi.toString(),
        "no_transaksi": noTransaksi == null ? "-" : noTransaksi.toString(),
        "kode_transaksi": kodeTransaksi == null ? "-" : kodeTransaksi.toString(),
        "id_karyawan_approval": idKaryawanApproval == null ? "-" : idKaryawanApproval.toString(),
        "id_jabatan_approval": idJabatanApproval == null ? "-" : idJabatanApproval.toString(),
        "status_approval": statusApproval == null ? "-" : statusApproval.toString(),
        "catatan_approval": catatanApproval == null ? "-" : catatanApproval.toString(),
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "tgl_approval": tglApproval == null ? null : "${tglApproval?.year.toString().padLeft(4, '0')}-${tglApproval?.month.toString().padLeft(2, '0')}-${tglApproval?.day.toString().padLeft(2, '0')}",
        "approval_level": approvalLevel == null ? "-" : approvalLevel.toString(),
        "nama_karyawan_approval": namaKaryawanApproval == null ? "-" : namaKaryawanApproval.toString(),
        "nama_jabatan_approval": namaJabatanApproval == null ? "-" : namaJabatanApproval.toString(),
        "id_karyawan_pengaju": idKaryawanPengaju == null ? "-" : idKaryawanPengaju.toString(),
        "id_jabatan_pengaju": idJabatanPengaju == null ? "-" : idJabatanPengaju.toString(),
        "nama_karyawan_pengaju": namaKaryawanPengaju == null ? "-" : namaKaryawanPengaju.toString(),
        "nama_jabatan_pengaju": namaJabatanPengaju == null ? "-" : namaJabatanPengaju.toString(),
        "id_rae": idRae == null ? "-" : idRae.toString(),
        "id_rab": idRab == null ? "-" : idRab.toString(),
        "id_peluang": idPeluang == null ? "-" : idPeluang.toString(),
        "no_rab": noRab == null ? "-" : noRab.toString(),
        "diskon": diskon == null ? "-" : diskon.toString(),
        "nama_proyek": namaProyek == null ? "-" : namaProyek.toString(),
        "uang_muka": uangMuka == null ? "-" : uangMuka.toString(),
        "barang_jadi": barangJadi == List.empty() ? [] : List<dynamic>.from(barangJadi!.map((x) => x.toJson())),
    };
}

class BarangJadi {
    BarangJadi({
        this.idRabDetail,
        this.idRab,
        this.idRaeDetail,
        this.idBarangJadi,
        this.qtyRab,
        this.hargaSatuanRab,
        this.kodeItem,
        this.namaItem,
        this.namaSatuan,
        this.idJenis,
        this.rounded,
    });

    final String? idRabDetail;
    final String? idRab;
    final String? idRaeDetail;
    final String? idBarangJadi;
    final String? qtyRab;
    final String? hargaSatuanRab;
    final String? kodeItem;
    final String? namaItem;
    final String? namaSatuan;
    final String? idJenis;
    final String? rounded;

    factory BarangJadi.fromRawJson(String str) => BarangJadi.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BarangJadi.fromJson(Map<String, dynamic> json) => BarangJadi(
        idRabDetail: json["id_rab_detail"] == null ? "-" : json["id_rab_detail"].toString(),
        idRab: json["id_rab"] == null ? "-" : json["id_rab"].toString(),
        idRaeDetail: json["id_rae_detail"] == null ? "-" : json["id_rae_detail"].toString(),
        idBarangJadi: json["id_barang_jadi"] == null ? "-" : json["id_barang_jadi"].toString(),
        qtyRab: json["qty_rab"] == null ? "-" : json["qty_rab"].toString(),
        hargaSatuanRab: json["harga_satuan_rab"] == null ? "-" : json["harga_satuan_rab"].toString(),
        kodeItem: json["kode_item"] == null ? "-" : json["kode_item"].toString(),
        namaItem: json["nama_item"] == null ? "-" : json["nama_item"].toString(),
        namaSatuan: json["nama_satuan"] == null ? "-" : json["nama_satuan"].toString(),
        idJenis: json["id_jenis"] == null ? "-" : json["id_jenis"].toString(),
        rounded: json["rounded"] == null ? "-" : json["rounded"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id_rab_detail": idRabDetail == null ? "-" : idRabDetail.toString(),
        "id_rab": idRab == null ? "-" : idRab.toString(),
        "id_rae_detail": idRaeDetail == null ? "-" : idRaeDetail.toString(),
        "id_barang_jadi": idBarangJadi == null ? "-" : idBarangJadi.toString(),
        "qty_rab": qtyRab == null ? "-" : qtyRab.toString(),
        "harga_satuan_rab": hargaSatuanRab == null ? "-" : hargaSatuanRab.toString(),
        "kode_item": kodeItem == null ? "-" : kodeItem.toString(),
        "nama_item": namaItem == null ? "-" : namaItem.toString(),
        "nama_satuan": namaSatuan == null ? "-" : namaSatuan.toString(),
        "id_jenis": idJenis == null ? "-" : idJenis.toString(),
        "rounded": rounded == null ? "-" : rounded.toString(),
    };
}

class Xqry {
    Xqry({
        this.page,
        this.perPage,
        this.approvalLevel,
        this.statusApproval,
    });

    final String? page;
    final String? perPage;
    final int? approvalLevel;
    final List<String>? statusApproval;

    factory Xqry.fromRawJson(String str) => Xqry.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Xqry.fromJson(Map<String, dynamic> json) => Xqry(
        page: json["page"] == null ? "-" : json["page"].toString(),
        perPage: json["per_page"] == null ? "-" : json["per_page"].toString(),
        approvalLevel: json["approval_level"] == null ? 0 : json["approval_level"].toInt(),
        statusApproval: json["status_approval"] == List.empty() ? [] : List<String>.from(json["status_approval"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "page": page == null ? "-" : page.toString(),
        "per_page": perPage == null ? "-" : perPage.toString(),
        "approval_level": approvalLevel == null ? 0 : approvalLevel!.toInt(),
        "status_approval": statusApproval == List.empty() ? [] : List<dynamic>.from(statusApproval!.map((x) => x)),
    };
}