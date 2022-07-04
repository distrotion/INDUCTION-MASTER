class JGCreportEachPOVAR {
  static bool isControl = false;
  //--------------------------
  static String PO = '';

  //--------------------------
  static bool GOODbutton = true;
  static bool WNGbutton = true;
  static bool NGbutton = true;
  static bool AENGbutton = true;
  //--------------------------
  static String POsum = '';
  static double ALL_AUTOsum = 0;
  static double OKsum = 0;
  static double WNGsum = 0;
  static double NGsum = 0;
  static double AENGsum = 0;
  //--------------------------
}

class datainEachPO {
  datainEachPO({
    this.STATUS = '',
    this.PO = '',
    this.ALL_AUTO = 0,
    this.OK = 0.0,
    this.WNG = 0.0,
    this.NG = 0.0,
    this.AENG = 0.0,
  });

  String STATUS;
  String PO;
  double ALL_AUTO;
  double OK;
  double WNG;
  double NG;
  double AENG;
}

// {
//     "STATUS": "OK",
//     "DATE": "(2022-6-1)-(2022-6-10)",
//     "ALL_AUTO": 3646,
//     "OK": 3617,
//     "WNG": 0,
//     "NG": 3,
//     "AENG": 26
// }