class JGCreportVAR {
  //--------------------------
  // static String startMONTH = '';
  // static List<String> startMONTHlist = [];
  // static dateout startMONTHout = dateout();
  // static String endMONTH = '';
  // static List<String> endMONTHlist = [];
  // static dateout endMONTHout = dateout();
  static String startDATE = '';
  static List<String> startDATElist = [];
  static dateout startDATEout = dateout();
  static String endDATE = '';
  static List<String> endDATElist = [];
  static dateout endDATEout = dateout();
  //--------------------------
  static bool GOODbutton = true;
  static bool WNGbutton = true;
  static bool NGbutton = true;
  static bool AENGbutton = true;
  //--------------------------
  static String DATEsum = '';
  static double ALL_AUTOsum = 0;
  static double OKsum = 0;
  static double WNGsum = 0;
  static double NGsum = 0;
  static double AENGsum = 0;
  //--------------------------
}

class dateout {
  dateout({
    this.year = '',
    this.month = '',
    this.day = '',
  });

  String year;
  String month;
  String day;
}

class datain {
  datain({
    this.STATUS = '',
    this.DATE = '',
    this.ALL_AUTO = 0,
    this.OK = 0.0,
    this.WNG = 0.0,
    this.NG = 0.0,
    this.AENG = 0.0,
  });

  String STATUS;
  String DATE;
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