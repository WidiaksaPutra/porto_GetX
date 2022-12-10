// To parse this JSON data, do
//
//     final regpnw = regpnwFromJson(jsonString);

import 'dart:convert';

class Regpnw {
    Regpnw({
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

    factory Regpnw.fromRawJson(String str) => Regpnw.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Regpnw.fromJson(Map<String, dynamic> json) => Regpnw(
        status: json["status"],
        message: json["message"] == null ? "-" : json["message"].toString(),
        xqry: Xqry.fromJson(json["xqry"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        dataCount: json["data_count"] == null ? 0 : json["data_count"].toInt(),
        totalPage: json["total_page"] == null ? 0 : json["total_page"].toInt(),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message == null ? "-" : message.toString(),
        "xqry": xqry!.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "data_count": dataCount == null ? 0 : dataCount!.toInt(),
        "total_page": totalPage == null ? 0 : totalPage!.toInt(),
    };
}

class Datum {
    Datum({
        this.idPenawaran,
        this.tglPenawaran,
        this.noPenawaran,
        this.ppn,
        this.idRab,
        this.tglRab,
        this.noRab,
        this.profit,
        this.prelim,
        this.idRae,
        this.noRae,
        this.tglRae,
        this.idPeluang,
        this.noPeluang,
        this.tglPeluang,
        this.idCustomer,
        this.idProyek,
        this.idPeringkatPeluang,
        this.keteranganPengiriman,
        this.lokasiPengiriman,
        this.tglSelesai,
        this.att,
        this.instalasi,
        this.lainLain,
        this.isHidden,
        this.namaCustomer,
        this.teksPembuka,
        this.teksPenutup,
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
        this.namaPeringkatPeluang,
        this.baseline,
        this.statusDeal,
        this.diskon,
        this.namaProyek,
        this.realisasiPenawaran,
        this.keterangan,
        this.barangJadi,
    });

    final String? idPenawaran;
    final DateTime? tglPenawaran;
    final String? noPenawaran;
    final String? ppn;
    final String? idRab;
    final DateTime? tglRab;
    final String? noRab;
    final String? profit;
    final String? prelim;
    final String? idRae;
    final String? noRae;
    final DateTime? tglRae;
    final String? idPeluang;
    final String? noPeluang;
    final DateTime? tglPeluang;
    final String? idCustomer;
    final String? idProyek;
    final String? idPeringkatPeluang;
    final String? keteranganPengiriman;
    final String? lokasiPengiriman;
    final DateTime? tglSelesai;
    final String? att;
    final bool? instalasi;
    final String? lainLain;
    final bool? isHidden;
    final String? namaCustomer;
    final String? teksPembuka;
    final String? teksPenutup;
    final String? idApprovalTransaksi;
    final String? noTransaksi;
    final String? kodeTransaksi;
    final String? idKaryawan;
    final String? idJabatan;
    final String? statusApproval;
    final String? catatan;
    final DateTime? createdAt;
    final DateTime? tglApproval;
    final String? approvalLevel;
    final String? namaKaryawan;
    final String? namaJabatan;
    final String? idKaryawanPengaju;
    final String? idJabatanPengaju;
    final String? namaKaryawanPengaju;
    final String? namaJabatanPengaju;
    final String? namaPeringkatPeluang;
    final String? baseline;
    final String? statusDeal;
    final String? diskon;
    final String? namaProyek;
    final DateTime? realisasiPenawaran;
    final String? keterangan;
    final List<BarangJadi>? barangJadi;

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idPenawaran: json["id_penawaran"] == null ? "-" : json["id_penawaran"].toString(),
        tglPenawaran: json["tgl_penawaran"] == null ? null : DateTime.parse(json["tgl_penawaran"]),
        noPenawaran: json["no_penawaran"] == null ? "-" : json["no_penawaran"].toString(),
        ppn: json["ppn"] == null ? "-" : json["ppn"].toString(),
        idRab: json["id_rab"] == null ? "-" : json["id_rab"].toString(),
        tglRab: json["tgl_rab"] == null ? null : DateTime.parse(json["tgl_rab"]),
        noRab: json["no_rab"] == null ? "-" : json["no_rab"].toString(),
        profit: json["profit"] == null ? "-" : json["profit"].toString(),
        prelim: json["prelim"] == null ? "-" : json["prelim"].toString(),
        idRae: json["id_rae"] == null ? "-" : json["id_rae"].toString(),
        noRae: json["no_rae"] == null ? "-" : json["no_rae"].toString(),
        tglRae: json["tgl_rae"] == null ? null : DateTime.parse(json["tgl_rae"]),
        idPeluang: json["id_peluang"] == null ? "-" : json["id_peluang"].toString(),
        noPeluang: json["no_peluang"] == null ? "-" : json["no_peluang"].toString(),
        tglPeluang: json["tgl_peluang"] == null ? null : DateTime.parse(json["tgl_peluang"]),
        idCustomer: json["id_customer"] == null ? "-" : json["id_customer"].toString(),
        idProyek: json["id_proyek"] == null ? "-" : json["id_proyek"].toString(),
        idPeringkatPeluang: json["id_peringkat_peluang"] == null ? "-" : json["id_peringkat_peluang"].toString(),
        keteranganPengiriman: json["keterangan_pengiriman"] == null ? "-" : json["keterangan_pengiriman"].toString(),
        lokasiPengiriman: json["lokasi_pengiriman"] == null ? "-" : json["lokasi_pengiriman"].toString(),
        tglSelesai: json["tgl_selesai"] == null ? null : DateTime.parse(json["tgl_selesai"]),
        att: json["att"] == null ? "-" : json["att"].toString(),
        instalasi: json["instalasi"],
        lainLain: json["lain_lain"] == null ? "-" : json["lain_lain"].toString(),
        isHidden: json["is_hidden"],
        namaCustomer: json["nama_customer"] == null ? "-" : json["nama_customer"].toString(),
        teksPembuka: json["teks_pembuka"] == null ? "-" : json["teks_pembuka"].toString(),
        teksPenutup: json["teks_penutup"] == null ? "-" : json["teks_penutup"].toString(),
        idApprovalTransaksi: json["id_approval_transaksi"] == null ? "-" : json["id_approval_transaksi"].toString(),
        noTransaksi: json["no_transaksi"] == null ? "-" : json["no_transaksi"].toString(),
        kodeTransaksi: json["kode_transaksi"] == null ? "-" : json["kode_transaksi"].toString(),
        idKaryawan: json["id_karyawan"] == null ? "-" : json["id_karyawan"].toString(),
        idJabatan: json["id_jabatan"] == null ? "-" : json["id_jabatan"].toString(),
        statusApproval: json["status_approval"] == null ? "-" : json["status_approval"].toString(),
        catatan: json["catatan"] == null ? "-" : json["catatan"].toString(),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        tglApproval: json["tgl_approval"] == null ? null : DateTime.parse(json["tgl_approval"]),
        approvalLevel: json["approval_level"] == null ? "-" : json["approval_level"].toString(),
        namaKaryawan: json["nama_karyawan"] == null ? "-" : json["nama_karyawan"].toString(),
        namaJabatan: json["nama_jabatan"] == null ? "-" : json["nama_jabatan"].toString(),
        idKaryawanPengaju: json["id_karyawan_pengaju"] == null ? "-" : json["id_karyawan_pengaju"].toString(),
        idJabatanPengaju: json["id_jabatan_pengaju"] == null ? "-" : json["id_jabatan_pengaju"].toString(),
        namaKaryawanPengaju: json["nama_karyawan_pengaju"] == null ? "-" : json["nama_karyawan_pengaju"].toString(),
        namaJabatanPengaju: json["nama_jabatan_pengaju"] == null ? "-" : json["nama_jabatan_pengaju"].toString(),
        namaPeringkatPeluang: json["nama_peringkat_peluang"] == null ? "-" : json["nama_peringkat_peluang"].toString(),
        baseline: json["baseline"] == null ? "-" : json["baseline"].toString(),
        statusDeal: json["status_deal"] == null ? "-" : json["status_deal"].toString(),
        diskon: json["diskon"] == null ? "-" : json["diskon"].toString(),
        namaProyek: json["nama_proyek"] == null ? "-" : json["nama_proyek"].toString(),
        realisasiPenawaran: json["realisasi_penawaran"] == null ? null : DateTime.parse(json["realisasi_penawaran"]),
        keterangan: json["keterangan"] == null ? "-" : json["keterangan"].toString(),
        barangJadi: json["barang_jadi"] == List.empty() ? [] : json["barang_jadi"] == null ? null : List<BarangJadi>.from(json["barang_jadi"].map((x) => BarangJadi.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id_penawaran": idPenawaran == null ? "-" : idPenawaran.toString(),
        "tgl_penawaran": tglPenawaran == null ? null : "${tglPenawaran?.year.toString().padLeft(4, '0')}-${tglPenawaran?.month.toString().padLeft(2, '0')}-${tglPenawaran?.day.toString().padLeft(2, '0')}",
        "no_penawaran": noPenawaran == null ? "-" : noPenawaran.toString(),
        "ppn": ppn == null ? "-" : ppn.toString(),
        "id_rab": idRab == null ? "-" : idRab.toString(),
        "tgl_rab": tglRab == null ? null : "${tglRab?.year.toString().padLeft(4, '0')}-${tglRab?.month.toString().padLeft(2, '0')}-${tglRab?.day.toString().padLeft(2, '0')}",
        "no_rab": noRab == null ? "-" : noRab.toString(),
        "profit": profit == null ? "-" : profit.toString(),
        "prelim": prelim == null ? "-" : prelim.toString(),
        "id_rae": idRae == null ? "-" : idRae.toString(),
        "no_rae": noRae == null ? "-" : noRae.toString(),
        "tgl_rae": tglRae == null ? null : "${tglRae?.year.toString().padLeft(4, '0')}-${tglRae?.month.toString().padLeft(2, '0')}-${tglRae?.day.toString().padLeft(2, '0')}",
        "id_peluang": idPeluang == null ? "-" : idPeluang.toString(),
        "no_peluang": noPeluang == null ? "-" : noPeluang.toString(),
        "tgl_peluang": tglPeluang == null ? null : "${tglPeluang?.year.toString().padLeft(4, '0')}-${tglPeluang?.month.toString().padLeft(2, '0')}-${tglPeluang?.day.toString().padLeft(2, '0')}",
        "id_customer": idCustomer == null ? "-" : idCustomer.toString(),
        "id_proyek": idProyek == null ? "-" : idProyek.toString(),
        "id_peringkat_peluang": idPeringkatPeluang == null ? "-" : idPeringkatPeluang.toString(),
        "keterangan_pengiriman": keteranganPengiriman == null ? "-" : keteranganPengiriman.toString(),
        "lokasi_pengiriman": lokasiPengiriman == null ? "-" : lokasiPengiriman.toString(),
        "tgl_selesai": tglSelesai == null ? null : "${tglSelesai?.year.toString().padLeft(4, '0')}-${tglSelesai?.month.toString().padLeft(2, '0')}-${tglSelesai?.day.toString().padLeft(2, '0')}",
        "att": att == null ? "-" : att.toString(),
        "instalasi": instalasi == null ? "-" : instalasi.toString(),
        "lain_lain": lainLain == null ? "-" : lainLain.toString(),
        "is_hidden": isHidden == null ? "-" : isHidden.toString(),
        "nama_customer": namaCustomer == null ? "-" : namaCustomer.toString(),
        "teks_pembuka": teksPembuka == null ? "-" : teksPembuka.toString(),
        "teks_penutup": teksPenutup == null ? "-" : teksPenutup.toString(),
        "id_approval_transaksi": idApprovalTransaksi == null ? "-" : idApprovalTransaksi.toString(),
        "no_transaksi": noTransaksi == null ? "-" : noTransaksi.toString(),
        "kode_transaksi": kodeTransaksi == null ? "-" : kodeTransaksi.toString(),
        "id_karyawan": idKaryawan == null ? "-" : idKaryawan.toString(),
        "id_jabatan": idJabatan == null ? "-" : idJabatan.toString(),
        "status_approval": statusApproval == null ? "-" : statusApproval.toString(),
        "catatan": catatan == null ? "-" : catatan.toString(),
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "tgl_approval": tglApproval == null ? null : "${tglApproval?.year.toString().padLeft(4, '0')}-${tglApproval?.month.toString().padLeft(2, '0')}-${tglApproval?.day.toString().padLeft(2, '0')}",
        "approval_level": approvalLevel == null ? "-" : approvalLevel.toString(),
        "nama_karyawan": namaKaryawan == null ? "-" : namaKaryawan.toString(),
        "nama_jabatan": namaJabatan == null ? "-" : namaJabatan.toString(),
        "id_karyawan_pengaju": idKaryawanPengaju == null ? "-" : idKaryawanPengaju.toString(),
        "id_jabatan_pengaju": idJabatanPengaju == null ? "-" : idJabatanPengaju.toString(),
        "nama_karyawan_pengaju": namaKaryawanPengaju == null ? "-" : namaKaryawanPengaju.toString(),
        "nama_jabatan_pengaju": namaJabatanPengaju == null ? "-" : namaJabatanPengaju.toString(),
        "nama_peringkat_peluang": namaPeringkatPeluang == null ? "-" : namaPeringkatPeluang.toString(),
        "baseline": baseline == null ? "-" : baseline.toString(),
        "status_deal": statusDeal == null ? "-" : statusDeal.toString(),
        "diskon": diskon == null ? "-" : diskon.toString(),
        "nama_proyek": namaProyek == null ? "-" : namaProyek.toString(),
        "realisasi_penawaran": realisasiPenawaran == null ? null : "${realisasiPenawaran?.year.toString().padLeft(4, '0')}-${realisasiPenawaran?.month.toString().padLeft(2, '0')}-${realisasiPenawaran?.day.toString().padLeft(2, '0')}",
        "keterangan": keterangan == null ? "-" : keterangan.toString(),
        "barang_jadi": barangJadi == List.empty() ? [] : barangJadi == null ? null : List<dynamic>.from(barangJadi!.map((x) => x.toJson())),
    };
}

class BarangJadi {
    BarangJadi({
        this.idItemBuaso,
        this.kodeItem,
        this.namaItem,
        this.idJenis,
        this.idSatuanJual,
        this.namaSatuan,
        this.namaJenis,
        this.kodeSatuan,
        this.idBarangJadi,
        this.linkReferensi,
        this.uraian,
        this.totalAnalisa,
        this.hargaSatuanRae,
        this.qtyRae,
        this.rounded,
        this.idRabDetail,
        this.idRae,
        this.idRaeDetail,
        this.idRab,
        this.hargaSatuanRab,
    });

    final String? idItemBuaso;
    final String? kodeItem;
    final String? namaItem;
    final String? idJenis;
    final String? idSatuanJual;
    final String? namaSatuan;
    final String? namaJenis;
    final String? kodeSatuan;
    final String? idBarangJadi;
    final String? linkReferensi;
    final String? uraian;
    final String? totalAnalisa;
    final String? hargaSatuanRae;
    final String? qtyRae;
    final String? rounded;
    final String? idRabDetail;
    final String? idRae;
    final String? idRaeDetail;
    final String? idRab;
    final String? hargaSatuanRab;

    factory BarangJadi.fromRawJson(String str) => BarangJadi.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BarangJadi.fromJson(Map<String, dynamic> json) => BarangJadi(
        idItemBuaso: json["id_item_buaso"] == null ? "-" : json["id_item_buaso"].toString(),
        kodeItem: json["kode_item"] == null ? "-" : json["kode_item"].toString(),
        namaItem: json["nama_item"] == null ? "-" : json["nama_item"].toString(),
        idJenis: json["id_jenis"] == null ? "-" : json["id_jenis"].toString(),
        idSatuanJual: json["id_satuan_jual"] == null ? "-" : json["id_satuan_jual"].toString(),
        namaSatuan: json["nama_satuan"] == null ? "-" : json["nama_satuan"].toString(),
        namaJenis: json["nama_jenis"] == null ? "-" : json["nama_jenis"].toString(),
        kodeSatuan: json["kode_satuan"] == null ? "-" : json["kode_satuan"].toString(),
        idBarangJadi: json["id_barang_jadi"] == null ? "-" : json["id_barang_jadi"].toString(),
        linkReferensi: json["link_referensi"] == null ? "-" : json["link_referensi"].toString(),
        uraian: json["uraian"] == null ? "-" : json["uraian"].toString(),
        totalAnalisa: json["total_analisa"] == null ? "-" : json["total_analisa"].toString(),
        hargaSatuanRae: json["harga_satuan_rae"] == null ? "-" : json["harga_satuan_rae"].toString(),
        qtyRae: json["qty_rae"] == null ? "-" : json["qty_rae"].toString(),
        rounded: json["rounded"] == null ? "-" : json["rounded"].toString(),
        idRabDetail: json["id_rab_detail"] == null ? "-" : json["id_rab_detail"].toString(),
        idRae: json["id_rae"] == null ? "-" : json["id_rae"].toString(),
        idRaeDetail: json["id_rae_detail"] == null ? "-" : json["id_rae_detail"].toString(),
        idRab: json["id_rab"] == null ? "-" : json["id_rab"].toString(),
        hargaSatuanRab: json["harga_satuan_rab"] == null ? "-" : json["harga_satuan_rab"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id_item_buaso": idItemBuaso == null ? "-" : idItemBuaso.toString(),
        "kode_item": kodeItem == null ? "-" : kodeItem.toString(),
        "nama_item": namaItem == null ? "-" : namaItem.toString(),
        "id_jenis": idJenis == null ? "-" : idJenis.toString(),
        "id_satuan_jual": idSatuanJual == null ? "-" : idSatuanJual.toString(),
        "nama_satuan": namaSatuan == null ? "-" : namaSatuan.toString(),
        "nama_jenis": namaJenis == null ? "-" : namaJenis.toString(),
        "kode_satuan": kodeSatuan == null ? "-" : kodeSatuan.toString(),
        "id_barang_jadi": idBarangJadi == null ? "-" : idBarangJadi.toString(),
        "link_referensi": linkReferensi == null ? "-" : linkReferensi.toString(),
        "uraian": uraian == null ? "-" : uraian.toString(),
        "total_analisa": totalAnalisa == null ? "-" : totalAnalisa.toString(),
        "harga_satuan_rae": hargaSatuanRae == null ? "-" : hargaSatuanRae.toString(),
        "qty_rae": qtyRae == null ? "-" : qtyRae.toString(),
        "rounded": rounded == null ? "-" : rounded.toString(),
        "id_rab_detail": idRabDetail == null ? "-" : idRabDetail.toString(),
        "id_rae": idRae == null ? "-" : idRae.toString(),
        "id_rae_detail": idRaeDetail == null ? "-" : idRaeDetail.toString(),
        "id_rab": idRab == null ? "-" : idRab.toString(),
        "harga_satuan_rab": hargaSatuanRab == null ? "-" : hargaSatuanRab.toString(),
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
        statusApproval: json["status_approval"] == null ? null : List<String>.from(json["status_approval"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "page": page == null ? "-" : page.toString(),
        "per_page": perPage == null ? "-" : perPage.toString(),
        "approval_level": approvalLevel == null ? 0 : approvalLevel!.toInt(),
        "status_approval": statusApproval == List.empty() ? [] : statusApproval == null ? null : List<dynamic>.from(statusApproval!.map((x) => x)),
    };
}
