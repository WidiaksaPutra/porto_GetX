import 'package:flutter/material.dart';

// List Color
const kPrimaryColor = Color.fromRGBO(11, 163, 96, 1);
const kSecondaryColor = Color.fromRGBO(60, 186, 146, 1);
const kInActiveIconColor = Color.fromRGBO(0, 0, 0, 0.61);
const verifyButtonColor = Color.fromRGBO(76, 217, 100, 1);
const reviseButtonColor = Color.fromRGBO(255, 184, 0, 1);
const rejectButtonColor = Color.fromRGBO(255, 0, 0, 1);
const colorCardItem = Color.fromRGBO(246, 246, 246, 1);
const colorCardSearch = Color.fromRGBO(237, 237, 237, 0.79);
const colorBorderSeparator = Color.fromRGBO(246, 246, 246, 1);
const kTextColor = Color(0xFF757575);

// List Extension
List extensionGambar = [".jpg", ".png", ".gif", ".jpeg"];
List extensionFile = [".pdf", ".xlsx", ".dwg", ".docx", ".skp"];

// List Icon Modul
List iconModul = [
  "assets/icons/hrda.svg", "assets/icons/hrdu.svg", "assets/icons/crm.svg",
  "assets/icons/marketing.svg", "assets/icons/teknik.svg", "assets/icons/produksi.svg",
  "assets/icons/inventory.svg", "assets/icons/procurement.svg", "assets/icons/aset.svg",
  "assets/icons/cost_control.svg", "assets/icons/penjualan.svg", "assets/icons/sia.svg",
  "assets/icons/anggaran.svg", "assets/icons/project.svg",
];

// Form Error
const String kUsernameNullError = "Username tidak boleh kosong";
const String kPassNullError = "Password tidak boleh kosong";
const String kMatchPassError = "Password tidak cocok";
const String kCatatanError = "Catatan tidak boleh kosong";

// List Hak Akses
List hakAksesModul = [
  "HRDA", "HRDU", "CRM",
  "MKT", "TNK", "PRD",
  "INV", "PRO", "ASM",
  "COC", "SLS", "SIA",
  "ANG", "PRY"
];
List hakAksesHrduApproval = [
  "HRDU_APR_PR_V_1", "HRDU_APR_PVSPR", "HRDU_APR_REGPO", "HRDU_APR_PENPO_V_1",
  "HRDU_APR_REGSO", "HRDU_APR_REGSSPK", "HRDU_APR_REGDO_V_1", "HRDU_APR_REGSJ_V_1",
  "HRDU_APR_REGFPNJ", "HRDU_APR_REGABJ", "HRDU_APR_REGPLG", "HRDU_APR_REGRAE",
  "HRDU_APR_REGRAB", "HRDU_APR_REGPNW", "HRDU_APR_REGSPK", "HRDU_APR_REGRAP",
  "HRDU_APR_MAG_V_1", "HRDU_APR_MBJ",
];
List hakAksesHrduMasterData = ["HRDU_MAS_HPS"];
List hakAkesReportMKT = [
  "MKT_RPT_PLG", "MKT_RPT_SPK", "MKT_RPT_PNW", "MKT_RPT_GMKT",
];