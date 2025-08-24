package
{
   import adobe.utils.*;
   import flash.accessibility.*;
   import flash.desktop.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filters.*;
   import flash.geom.*;
   import flash.globalization.*;
   import flash.media.*;
   import flash.net.*;
   import flash.net.drm.*;
   import flash.printing.*;
   import flash.profiler.*;
   import flash.sampler.*;
   import flash.sensors.*;
   import flash.system.*;
   import flash.text.*;
   import flash.text.engine.*;
   import flash.text.ime.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   
   [Embed(source="/_assets/assets.swf", symbol="workerModel")]
   public dynamic class workerModel extends MovieClip
   {
       
      
      public var back_acca:MovieClip;
      
      public var back_beard:MovieClip;
      
      public var back_bicep:MovieClip;
      
      public var back_foot:MovieClip;
      
      public var back_forearm:MovieClip;
      
      public var back_hair:MovieClip;
      
      public var back_hand:MovieClip;
      
      public var back_hat:MovieClip;
      
      public var body:MovieClip;
      
      public var front_acca:MovieClip;
      
      public var front_bicep:MovieClip;
      
      public var front_foot:MovieClip;
      
      public var front_forearm:MovieClip;
      
      public var front_hand:MovieClip;
      
      public var head:MovieClip;
      
      public var neck:MovieClip;
      
      public function workerModel()
      {
         super();
         addFrameScript(0,this.frame1,14,this.frame15,79,this.frame80,80,this.frame81,159,this.frame160,173,this.frame174,174,this.frame175,177,this.frame178,178,this.frame179,214,this.frame215,215,this.frame216,271,this.frame272,272,this.frame273,276,this.frame277,281,this.frame282,283,this.frame284,284,this.frame285,291,this.frame292,296,this.frame297,298,this.frame299,299,this.frame300,323,this.frame324,324,this.frame325,326,this.frame327,327,this.frame328,329,this.frame330,330,this.frame331,331,this.frame332,332,this.frame333,336,this.frame337,337,this.frame338,344,this.frame345,345,this.frame346,346,this.frame347,359,this.frame360,360,this.frame361,367,this.frame368,371,this.frame372,403,this.frame404,404,this.frame405,406,this.frame407,407,this.frame408,408,this.frame409,417,this.frame418,450,this.frame451,481,this.frame482,482,this.frame483,486,this.frame487,490,this.frame491,491,this.frame492,492,this.frame493,495,this.frame496,497,this.frame498,498,this.frame499,507,this.frame508,508,this.frame509,512,this.frame513,517,this.frame518,518,this.frame519,521,this.frame522,523,this.frame524,524,this.frame525,533,this.frame534,534,this.frame535,538,this.frame539,540,this.frame541,541,this.frame542,542,this.frame543,563,this.frame564,565,this.frame566,566,this.frame567,570,this.frame571,572,this.frame573,595,this.frame596,597,this.frame598,598,this.frame599,600,this.frame601,601,this.frame602,603,this.frame604,604,this.frame605,624,this.frame625,625,this.frame626,627,this.frame628,657,this.frame658,658,this.frame659,705,this.frame706,708,this.frame709,712,this.frame713,719,this.frame720,720,this.frame721,721,this.frame722,722,this.frame723,723,this.frame724,724,this.frame725,725,this.frame726,726,this.frame727,727,this.frame728,728,this.frame729,729,this.frame730,730,this.frame731,731,this.frame732,732,this.frame733,733,this.frame734,734,this.frame735,735,this.frame736,736,this.frame737,737,this.frame738,738,this.frame739,739,this.frame740,740,this.frame741,764,this.frame765,765,this.frame766,766,this.frame767,790,this.frame791,791,this.frame792,792,this.frame793,819,this.frame820,820,this.frame821,831,this.frame832,832,this.frame833,838,this.frame839,853,this.frame854,865,this.frame866,866,this.frame867,887,this.frame888,888,this.frame889,915,this.frame916,916,this.frame917,933,this.frame934,934,this.frame935,940,this.frame941,942,this.frame943,948,this.frame949,950,this.frame951,961,this.frame962,967,this.frame968,968,this.frame969,982,this.frame983,983,this.frame984,999,this.frame1000,1007,this.frame1008,1008,this.frame1009,1018,this.frame1019,1019,this.frame1020,1025,this.frame1026,1026,this.frame1027,1033,this.frame1034,1034,this.frame1035,1037,this.frame1038,1038,this.frame1039,1041,this.frame1042,1042,this.frame1043,1049,this.frame1050,1050,this.frame1051,1053,this.frame1054,1054,this.frame1055,1058,this.frame1059,1059,this.frame1060,1083,this.frame1084,1084,this.frame1085,1089,this.frame1090,1094,this.frame1095,1096,this.frame1097,1097,this.frame1098,1104,this.frame1105,1109,this.frame1110,1111,this.frame1112,1112,this.frame1113,1114,this.frame1115,1115,this.frame1116,1188,this.frame1189,1189,this.frame1190,1195,this.frame1196,1196,this.frame1197,1198,this.frame1199,1200,this.frame1201,1201,this.frame1202,1203,this.frame1204,1204,this.frame1205,1206,this.frame1207,1209,this.frame1210,1210,this.frame1211,1211,this.frame1212,1216,this.frame1217,1218,this.frame1219,1220,this.frame1221,1222,this.frame1223,1225,this.frame1226,1229,this.frame1230,1233,this.frame1234,1235,this.frame1236,1241,this.frame1242,1248,this.frame1249,1251,this.frame1252,1256,this.frame1257,1258,this.frame1259,1261,this.frame1262,1264,this.frame1265,1267,this.frame1268,1269,this.frame1270,1273,this.frame1274,1274,this.frame1275,1275,this.frame1276,1277,this.frame1278,1278,this.frame1279,1298,this.frame1299,1299,this.frame1300,1349,this.frame1350,1350,this.frame1351,1359,this.frame1360,1369,this.frame1370,1376,this.frame1377,1377,this.frame1378,1378,this.frame1379,1386,this.frame1387,1394,this.frame1395,1395,this.frame1396,1464,this.frame1465,1465,this.frame1466,1517,this.frame1518,1518,this.frame1519,1523,this.frame1524,1528,this.frame1529,1559,this.frame1560,1569,this.frame1570,1570,this.frame1571,1583,this.frame1584,1600,this.frame1601,1603,this.frame1604,1604,this.frame1605,1613,this.frame1614,1615,this.frame1616,1628,this.frame1629,1634,this.frame1635,1635,this.frame1636,1643,this.frame1644,1690,this.frame1691,1694,this.frame1695,1695,this.frame1696,1703,this.frame1704,1738,this.frame1739,1742,this.frame1743,1743,this.frame1744,1746,this.frame1747,1775,this.frame1776,1776,this.frame1777,1840,this.frame1841);
      }
      
      internal function frame1() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 0;
         this.backShoeFrame = 1;
         this.frontShoeFrame = 1;
      }
      
      internal function frame15() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 0;
         this.backShoeFrame = 1;
         this.frontShoeFrame = 1;
      }
      
      internal function frame80() : *
      {
         gotoAndPlay("stand");
      }
      
      internal function frame81() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 0;
         this.backShoeFrame = 1;
         this.frontShoeFrame = 1;
      }
      
      internal function frame160() : *
      {
         gotoAndPlay("turnaround");
      }
      
      internal function frame174() : *
      {
         this.eyeFrame = 2;
      }
      
      internal function frame175() : *
      {
         this.eyeFrame = 3;
      }
      
      internal function frame178() : *
      {
         this.eyeFrame = 2;
      }
      
      internal function frame179() : *
      {
         this.eyeFrame = 0;
      }
      
      internal function frame215() : *
      {
         gotoAndPlay("loopleanin");
      }
      
      internal function frame216() : *
      {
         this.frontHandFrame = 4;
         this.backHandFrame = 5;
      }
      
      internal function frame272() : *
      {
         gotoAndPlay("takeorder");
      }
      
      internal function frame273() : *
      {
         this.backShoeFrame = 1;
      }
      
      internal function frame277() : *
      {
         this.backShoeFrame = 2;
      }
      
      internal function frame282() : *
      {
         this.backShoeFrame = 3;
      }
      
      internal function frame284() : *
      {
         this.backShoeFrame = 2;
      }
      
      internal function frame285() : *
      {
         this.backShoeFrame = 1;
      }
      
      internal function frame292() : *
      {
         this.frontShoeFrame = 2;
      }
      
      internal function frame297() : *
      {
         this.frontShoeFrame = 3;
      }
      
      internal function frame299() : *
      {
         this.frontShoeFrame = 2;
      }
      
      internal function frame300() : *
      {
         this.frontShoeFrame = 1;
      }
      
      internal function frame324() : *
      {
         this.mouthFrame = 1;
      }
      
      internal function frame325() : *
      {
         this.mouthFrame = 16;
      }
      
      internal function frame327() : *
      {
         this.eyeFrame = 2;
      }
      
      internal function frame328() : *
      {
         this.eyeFrame = 3;
      }
      
      internal function frame330() : *
      {
         this.eyeFrame = 2;
      }
      
      internal function frame331() : *
      {
         this.eyeFrame = 0;
      }
      
      internal function frame332() : *
      {
         stop();
      }
      
      internal function frame333() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 1;
         this.frontHandFrame = 1;
         this.backHandFrame = 1;
         this.frontShoeFrame = 1;
         this.backShoeFrame = 1;
      }
      
      internal function frame337() : *
      {
         this.eyeFrame = 2;
      }
      
      internal function frame338() : *
      {
         this.eyeFrame = 3;
      }
      
      internal function frame345() : *
      {
         this.mouthFrame = 1;
      }
      
      internal function frame346() : *
      {
         this.mouthFrame = 16;
      }
      
      internal function frame347() : *
      {
         this.mouthFrame = 12;
         this.eyeFrame = 1;
      }
      
      internal function frame360() : *
      {
         stop();
      }
      
      internal function frame361() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 1;
         this.frontHandFrame = 1;
         this.backHandFrame = 1;
         this.frontShoeFrame = 1;
         this.backShoeFrame = 1;
      }
      
      internal function frame368() : *
      {
         this.backHandFrame = 2;
      }
      
      internal function frame372() : *
      {
         this.eyeFrame = 9;
         this.mouthFrame = 9;
      }
      
      internal function frame404() : *
      {
         this.eyeFrame = 2;
      }
      
      internal function frame405() : *
      {
         this.eyeFrame = 3;
      }
      
      internal function frame407() : *
      {
         this.eyeFrame = 2;
      }
      
      internal function frame408() : *
      {
         this.eyeFrame = 9;
         stop();
      }
      
      internal function frame409() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 1;
         this.frontHandFrame = 1;
         this.backHandFrame = 1;
         this.frontShoeFrame = 1;
         this.backShoeFrame = 1;
      }
      
      internal function frame418() : *
      {
         this.eyeFrame = 5;
         this.mouthFrame = 6;
      }
      
      internal function frame451() : *
      {
         this.eyeFrame = 8;
      }
      
      internal function frame482() : *
      {
         this.eyeFrame = 5;
         stop();
      }
      
      internal function frame483() : *
      {
         this.eyeFrame = 1;
         this.mouthFrame = 1;
         this.frontHandFrame = 1;
         this.backHandFrame = 1;
         this.frontShoeFrame = 1;
         this.backShoeFrame = 1;
      }
      
      internal function frame487() : *
      {
         this.eyeFrame = 3;
         this.mouthFrame = 12;
      }
      
      internal function frame491() : *
      {
         this.frontHandFrame = 2;
      }
      
      internal function frame492() : *
      {
         this.backHandFrame = 2;
      }
      
      internal function frame493() : *
      {
         this.eyeFrame = 8;
         this.mouthFrame = 11;
         this.frontShoeFrame = 2;
      }
      
      internal function frame496() : *
      {
         this.backShoeFrame = 2;
      }
      
      internal function frame498() : *
      {
         this.frontShoeFrame = 1;
      }
      
      internal function frame499() : *
      {
         this.backShoeFrame = 1;
      }
      
      internal function frame508() : *
      {
         stop();
      }
      
      internal function frame509() : *
      {
         this.eyeFrame = 1;
         this.mouthFrame = 1;
         this.frontHandFrame = 5;
         this.backHandFrame = 1;
         this.frontShoeFrame = 1;
         this.backShoeFrame = 1;
      }
      
      internal function frame513() : *
      {
         this.eyeFrame = 3;
         this.mouthFrame = 12;
      }
      
      internal function frame518() : *
      {
         this.backHandFrame = 2;
      }
      
      internal function frame519() : *
      {
         this.eyeFrame = 8;
         this.mouthFrame = 11;
         this.frontShoeFrame = 2;
      }
      
      internal function frame522() : *
      {
         this.backShoeFrame = 2;
      }
      
      internal function frame524() : *
      {
         this.frontShoeFrame = 1;
      }
      
      internal function frame525() : *
      {
         this.backShoeFrame = 1;
      }
      
      internal function frame534() : *
      {
         stop();
      }
      
      internal function frame535() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 1;
      }
      
      internal function frame539() : *
      {
         this.eyeFrame = 3;
      }
      
      internal function frame541() : *
      {
         this.eyeFrame = 1;
         this.mouthFrame = 1;
      }
      
      internal function frame542() : *
      {
         this.mouthFrame = 16;
      }
      
      internal function frame543() : *
      {
         this.mouthFrame = 12;
      }
      
      internal function frame564() : *
      {
         this.eyeFrame = 3;
         this.mouthFrame = 2;
      }
      
      internal function frame566() : *
      {
         gotoAndPlay("stand");
      }
      
      internal function frame567() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 0;
      }
      
      internal function frame571() : *
      {
         this.eyeFrame = 3;
      }
      
      internal function frame573() : *
      {
         this.eyeFrame = 1;
      }
      
      internal function frame596() : *
      {
         this.eyeFrame = 3;
      }
      
      internal function frame598() : *
      {
         gotoAndPlay("turnaround");
      }
      
      internal function frame599() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 1;
      }
      
      internal function frame601() : *
      {
         this.eyeFrame = 2;
      }
      
      internal function frame602() : *
      {
         this.eyeFrame = 3;
      }
      
      internal function frame604() : *
      {
         this.eyeFrame = 2;
      }
      
      internal function frame605() : *
      {
         this.eyeFrame = 1;
      }
      
      internal function frame625() : *
      {
         this.eyeFrame = 2;
      }
      
      internal function frame626() : *
      {
         this.eyeFrame = 3;
      }
      
      internal function frame628() : *
      {
         gotoAndPlay("stand");
      }
      
      internal function frame658() : *
      {
         gotoAndPlay("turnaround");
      }
      
      internal function frame659() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 0;
      }
      
      internal function frame706() : *
      {
         gotoAndPlay("burgerzilla_stand");
      }
      
      internal function frame709() : *
      {
         this.eyeFrame = 3;
         this.mouthFrame = 1;
      }
      
      internal function frame713() : *
      {
         this.mouthFrame = 12;
         this.eyeFrame = 3;
      }
      
      internal function frame720() : *
      {
         stop();
      }
      
      internal function frame721() : *
      {
         this.eyeFrame = 8;
         this.mouthFrame = 11;
         this.frontHandFrame = 2;
         this.backHandFrame = 2;
         this.frontShoeFrame = 1;
         this.backShoeFrame = 1;
      }
      
      internal function frame722() : *
      {
         this.eyeFrame = 1;
         this.mouthFrame = 1;
         this.frontHandFrame = 1;
         this.backHandFrame = 1;
         this.frontShoeFrame = 1;
         this.backShoeFrame = 1;
      }
      
      internal function frame723() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 5;
         this.frontHandFrame = 1;
         this.backHandFrame = 1;
         this.frontShoeFrame = 1;
         this.backShoeFrame = 1;
      }
      
      internal function frame724() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 12;
         this.frontHandFrame = 1;
         this.backHandFrame = 1;
         this.frontShoeFrame = 1;
         this.backShoeFrame = 1;
      }
      
      internal function frame725() : *
      {
         this.eyeFrame = 4;
         this.mouthFrame = 15;
         this.frontHandFrame = 1;
         this.backHandFrame = 10;
         this.frontShoeFrame = 1;
         this.backShoeFrame = 1;
      }
      
      internal function frame726() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 16;
         this.frontHandFrame = 1;
         this.backHandFrame = 16;
         this.frontShoeFrame = 1;
         this.backShoeFrame = 6;
      }
      
      internal function frame727() : *
      {
         this.eyeFrame = 5;
         this.mouthFrame = 18;
         this.frontHandFrame = 1;
         this.backHandFrame = 11;
         this.frontShoeFrame = 3;
         this.backShoeFrame = 3;
      }
      
      internal function frame728() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 11;
         this.frontHandFrame = 1;
         this.backHandFrame = 12;
         this.frontShoeFrame = 2;
         this.backShoeFrame = 1;
      }
      
      internal function frame729() : *
      {
         this.eyeFrame = 1;
         this.mouthFrame = 1;
         this.frontHandFrame = 1;
         this.backHandFrame = 1;
         this.frontShoeFrame = 1;
         this.backShoeFrame = 1;
      }
      
      internal function frame730() : *
      {
         this.eyeFrame = 9;
         this.mouthFrame = 20;
         this.frontHandFrame = 1;
         this.backHandFrame = 17;
         this.backShoeFrame = 1;
         this.frontShoeFrame = 1;
      }
      
      internal function frame731() : *
      {
         this.eyeFrame = 4;
         this.mouthFrame = 18;
         this.frontHandFrame = 1;
         this.backHandFrame = 14;
         this.backShoeFrame = 1;
         this.frontShoeFrame = 1;
      }
      
      internal function frame732() : *
      {
         this.eyeFrame = 4;
         this.mouthFrame = 15;
         this.frontHandFrame = 2;
         this.backHandFrame = 2;
         this.frontShoeFrame = 1;
         this.backShoeFrame = 1;
      }
      
      internal function frame733() : *
      {
         this.eyeFrame = 4;
         this.mouthFrame = 17;
         this.frontHandFrame = 1;
         this.backHandFrame = 18;
         this.frontShoeFrame = 1;
         this.backShoeFrame = 1;
      }
      
      internal function frame734() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 11;
         this.frontHandFrame = 1;
         this.backHandFrame = 1;
         this.frontShoeFrame = 1;
         this.backShoeFrame = 1;
      }
      
      internal function frame735() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 1;
         this.frontHandFrame = 1;
         this.backHandFrame = 1;
         this.frontShoeFrame = 1;
         this.backShoeFrame = 1;
      }
      
      internal function frame736() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 5;
         this.frontHandFrame = 1;
         this.backHandFrame = 10;
         this.frontShoeFrame = 1;
         this.backShoeFrame = 1;
      }
      
      internal function frame737() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 17;
         this.frontHandFrame = 1;
         this.backHandFrame = 1;
         this.frontShoeFrame = 1;
         this.backShoeFrame = 1;
      }
      
      internal function frame738() : *
      {
         this.eyeFrame = 5;
         this.mouthFrame = 18;
         this.frontHandFrame = 1;
         this.backHandFrame = 1;
         this.frontShoeFrame = 1;
         this.backShoeFrame = 1;
      }
      
      internal function frame739() : *
      {
         this.eyeFrame = 5;
         this.mouthFrame = 18;
         this.frontHandFrame = 1;
         this.backHandFrame = 10;
         this.frontShoeFrame = 1;
         this.backShoeFrame = 1;
      }
      
      internal function frame740() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 0;
         this.backHandFrame = 7;
      }
      
      internal function frame741() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 0;
         this.backHandFrame = 7;
      }
      
      internal function frame765() : *
      {
         gotoAndPlay("outfield1");
      }
      
      internal function frame766() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 0;
         this.backHandFrame = 7;
      }
      
      internal function frame767() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 0;
         this.backHandFrame = 7;
      }
      
      internal function frame791() : *
      {
         gotoAndPlay("outfield2");
      }
      
      internal function frame792() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 0;
         this.backHandFrame = 7;
      }
      
      internal function frame793() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 0;
         this.backHandFrame = 7;
      }
      
      internal function frame820() : *
      {
         gotoAndPlay("outfield3");
      }
      
      internal function frame821() : *
      {
         this.frontHandFrame = 6;
         this.backHandFrame = 1;
         this.eyeFrame = 1;
         this.mouthFrame = 1;
      }
      
      internal function frame832() : *
      {
         gotoAndPlay("pitchstand");
      }
      
      internal function frame833() : *
      {
         this.frontHandFrame = 6;
         this.backHandFrame = 1;
         this.eyeFrame = 1;
         this.mouthFrame = 1;
      }
      
      internal function frame839() : *
      {
         this.backHandFrame = 8;
      }
      
      internal function frame854() : *
      {
         this.backHandFrame = 1;
      }
      
      internal function frame866() : *
      {
         gotoAndPlay("pitchstand");
      }
      
      internal function frame867() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 0;
         this.frontHandFrame = 7;
         this.backHandFrame = 2;
      }
      
      internal function frame888() : *
      {
         gotoAndPlay("batterup");
      }
      
      internal function frame889() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 0;
         this.frontHandFrame = 7;
         this.backHandFrame = 2;
      }
      
      internal function frame916() : *
      {
         gotoAndPlay("batterup");
      }
      
      internal function frame917() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 0;
         this.frontHandFrame = 10;
         this.backHandFrame = 9;
      }
      
      internal function frame934() : *
      {
         gotoAndPlay("workerpitchstand");
      }
      
      internal function frame935() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 0;
         this.frontHandFrame = 10;
         this.backHandFrame = 9;
      }
      
      internal function frame941() : *
      {
         this.backHandFrame = 7;
      }
      
      internal function frame943() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 0;
         this.frontHandFrame = 11;
         this.backHandFrame = 7;
      }
      
      internal function frame949() : *
      {
         this.frontHandFrame = 10;
      }
      
      internal function frame951() : *
      {
         this.frontHandFrame = 8;
      }
      
      internal function frame962() : *
      {
         this.backHandFrame = 9;
      }
      
      internal function frame968() : *
      {
         gotoAndPlay("workerpitchstand");
      }
      
      internal function frame969() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 7;
         this.frontHandFrame = 7;
         this.backHandFrame = 2;
      }
      
      internal function frame983() : *
      {
         gotoAndPlay("otherbatterstand");
      }
      
      internal function frame984() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 7;
         this.frontHandFrame = 7;
         this.backHandFrame = 2;
      }
      
      internal function frame1000() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 7;
         this.frontHandFrame = 7;
         this.backHandFrame = 2;
      }
      
      internal function frame1008() : *
      {
         gotoAndPlay("otherbatterstand");
      }
      
      internal function frame1009() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 0;
      }
      
      internal function frame1019() : *
      {
         this.eyeFrame = 2;
      }
      
      internal function frame1020() : *
      {
         this.eyeFrame = 3;
      }
      
      internal function frame1026() : *
      {
         this.eyeFrame = 2;
      }
      
      internal function frame1027() : *
      {
         this.eyeFrame = 0;
      }
      
      internal function frame1034() : *
      {
         gotoAndPlay("stand");
      }
      
      internal function frame1035() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 0;
         this.backShoeFrame = 1;
         this.frontShoeFrame = 1;
      }
      
      internal function frame1038() : *
      {
         this.frontShoeFrame = 2;
      }
      
      internal function frame1039() : *
      {
         this.frontShoeFrame = 3;
      }
      
      internal function frame1042() : *
      {
         this.frontShoeFrame = 2;
      }
      
      internal function frame1043() : *
      {
         this.frontShoeFrame = 1;
      }
      
      internal function frame1050() : *
      {
         this.backShoeFrame = 2;
      }
      
      internal function frame1051() : *
      {
         this.backShoeFrame = 3;
      }
      
      internal function frame1054() : *
      {
         this.backShoeFrame = 2;
      }
      
      internal function frame1055() : *
      {
         this.backShoeFrame = 1;
      }
      
      internal function frame1059() : *
      {
         gotoAndPlay("run");
      }
      
      internal function frame1060() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 0;
         this.backShoeFrame = 1;
         this.frontShoeFrame = 1;
      }
      
      internal function frame1084() : *
      {
         gotoAndPlay("runreverse");
      }
      
      internal function frame1085() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 0;
         this.backShoeFrame = 1;
         this.frontShoeFrame = 1;
         this.frontHandFrame = 12;
         this.backHandFrame = 1;
      }
      
      internal function frame1090() : *
      {
         this.backShoeFrame = 2;
         this.frontShoeFrame = 1;
      }
      
      internal function frame1095() : *
      {
         this.backShoeFrame = 3;
         this.frontShoeFrame = 1;
      }
      
      internal function frame1097() : *
      {
         this.backShoeFrame = 2;
         this.frontShoeFrame = 1;
      }
      
      internal function frame1098() : *
      {
         this.backShoeFrame = 1;
         this.frontShoeFrame = 1;
      }
      
      internal function frame1105() : *
      {
         this.backShoeFrame = 1;
         this.frontShoeFrame = 2;
      }
      
      internal function frame1110() : *
      {
         this.backShoeFrame = 1;
         this.frontShoeFrame = 3;
      }
      
      internal function frame1112() : *
      {
         this.backShoeFrame = 1;
         this.frontShoeFrame = 2;
      }
      
      internal function frame1113() : *
      {
         this.backShoeFrame = 1;
         this.frontShoeFrame = 1;
      }
      
      internal function frame1115() : *
      {
         gotoAndPlay("walk");
      }
      
      internal function frame1116() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 0;
         this.backShoeFrame = 1;
         this.frontShoeFrame = 1;
         this.frontHandFrame = 12;
         this.backHandFrame = 1;
      }
      
      internal function frame1189() : *
      {
         gotoAndPlay("standpad");
      }
      
      internal function frame1190() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 0;
         this.backShoeFrame = 1;
         this.frontShoeFrame = 1;
         this.frontHandFrame = 1;
         this.backHandFrame = 5;
      }
      
      internal function frame1196() : *
      {
         stop();
      }
      
      internal function frame1197() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 0;
         this.backShoeFrame = 1;
         this.frontShoeFrame = 1;
         this.frontHandFrame = 1;
         this.backHandFrame = 5;
      }
      
      internal function frame1199() : *
      {
         this.mouthFrame = 15;
      }
      
      internal function frame1201() : *
      {
         this.eyeFrame = 2;
         this.mouthFrame = 1;
      }
      
      internal function frame1202() : *
      {
         this.eyeFrame = 3;
      }
      
      internal function frame1204() : *
      {
         this.mouthFrame = 18;
         this.eyeFrame = 2;
      }
      
      internal function frame1205() : *
      {
         this.eyeFrame = 0;
      }
      
      internal function frame1207() : *
      {
         this.mouthFrame = 16;
      }
      
      internal function frame1210() : *
      {
         this.mouthFrame = 21;
      }
      
      internal function frame1211() : *
      {
         this.mouthFrame = 20;
      }
      
      internal function frame1212() : *
      {
         this.mouthFrame = 15;
      }
      
      internal function frame1217() : *
      {
         this.mouthFrame = 1;
      }
      
      internal function frame1219() : *
      {
         this.mouthFrame = 3;
      }
      
      internal function frame1221() : *
      {
         this.mouthFrame = 8;
      }
      
      internal function frame1223() : *
      {
         this.mouthFrame = 15;
      }
      
      internal function frame1226() : *
      {
         this.mouthFrame = 16;
      }
      
      internal function frame1230() : *
      {
         this.mouthFrame = 15;
      }
      
      internal function frame1234() : *
      {
         this.mouthFrame = 18;
      }
      
      internal function frame1236() : *
      {
         this.mouthFrame = 20;
      }
      
      internal function frame1242() : *
      {
         this.mouthFrame = 3;
      }
      
      internal function frame1249() : *
      {
         this.mouthFrame = 19;
      }
      
      internal function frame1252() : *
      {
         this.mouthFrame = 15;
      }
      
      internal function frame1257() : *
      {
         this.mouthFrame = 16;
      }
      
      internal function frame1259() : *
      {
         this.mouthFrame = 21;
      }
      
      internal function frame1262() : *
      {
         this.mouthFrame = 20;
      }
      
      internal function frame1265() : *
      {
         this.mouthFrame = 5;
      }
      
      internal function frame1268() : *
      {
         this.mouthFrame = 3;
      }
      
      internal function frame1270() : *
      {
         this.mouthFrame = 1;
      }
      
      internal function frame1274() : *
      {
         gotoAndPlay("placeorder");
      }
      
      internal function frame1275() : *
      {
         this.mouthFrame = 0;
         this.eyeFrame = 2;
         this.frontHandFrame = 1;
         this.backHandFrame = 5;
      }
      
      internal function frame1276() : *
      {
         this.eyeFrame = 3;
      }
      
      internal function frame1278() : *
      {
         this.eyeFrame = 2;
      }
      
      internal function frame1279() : *
      {
         this.eyeFrame = 0;
      }
      
      internal function frame1299() : *
      {
         stop();
      }
      
      internal function frame1300() : *
      {
         this.mouthFrame = 0;
         this.eyeFrame = 0;
         this.frontHandFrame = 13;
         this.backHandFrame = 1;
      }
      
      internal function frame1350() : *
      {
         gotoAndPlay("standboat");
      }
      
      internal function frame1351() : *
      {
         this.mouthFrame = 12;
         this.eyeFrame = 0;
         this.frontHandFrame = 13;
         this.backHandFrame = 1;
      }
      
      internal function frame1360() : *
      {
         this.mouthFrame = 11;
      }
      
      internal function frame1370() : *
      {
         this.mouthFrame = 12;
      }
      
      internal function frame1377() : *
      {
         this.mouthFrame = 1;
      }
      
      internal function frame1378() : *
      {
         gotoAndPlay("standboat");
      }
      
      internal function frame1379() : *
      {
         this.eyeFrame = 4;
         this.mouthFrame = 14;
      }
      
      internal function frame1387() : *
      {
         this.eyeFrame = 3;
         this.mouthFrame = 13;
      }
      
      internal function frame1395() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 5;
         stop();
      }
      
      internal function frame1396() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 0;
         this.backShoeFrame = 1;
         this.frontShoeFrame = 1;
         this.frontHandFrame = 14;
         this.backHandFrame = 5;
      }
      
      internal function frame1465() : *
      {
         gotoAndPlay("loopplaceorder");
      }
      
      internal function frame1466() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 0;
         this.backShoeFrame = 1;
         this.frontShoeFrame = 1;
         this.frontHandFrame = 13;
         this.backHandFrame = 13;
      }
      
      internal function frame1518() : *
      {
         gotoAndPlay("drive");
      }
      
      internal function frame1519() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 0;
         this.backShoeFrame = 1;
         this.frontShoeFrame = 1;
         this.frontHandFrame = 13;
         this.backHandFrame = 10;
      }
      
      internal function frame1524() : *
      {
         this.eyeFrame = 3;
         this.mouthFrame = 16;
      }
      
      internal function frame1529() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 11;
      }
      
      internal function frame1560() : *
      {
         this.mouthFrame = 0;
      }
      
      internal function frame1570() : *
      {
         gotoAndPlay("drive");
      }
      
      internal function frame1571() : *
      {
         this.eyeFrame = 3;
         this.mouthFrame = 8;
         this.backShoeFrame = 1;
         this.frontShoeFrame = 1;
         this.frontHandFrame = 13;
         this.backHandFrame = 13;
      }
      
      internal function frame1584() : *
      {
         this.eyeFrame = 5;
         this.mouthFrame = 13;
      }
      
      internal function frame1601() : *
      {
         this.eyeFrame = 3;
         this.mouthFrame = 8;
      }
      
      internal function frame1604() : *
      {
         gotoAndPlay("drive");
      }
      
      internal function frame1605() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 0;
         this.backShoeFrame = 1;
         this.frontShoeFrame = 1;
         this.frontHandFrame = 13;
         this.backHandFrame = 1;
      }
      
      internal function frame1614() : *
      {
         this.backHandFrame = 1;
      }
      
      internal function frame1616() : *
      {
         this.mouthFrame = 12;
      }
      
      internal function frame1629() : *
      {
         this.mouthFrame = 14;
         this.backHandFrame = 1;
      }
      
      internal function frame1635() : *
      {
         gotoAndPlay("drive");
      }
      
      internal function frame1636() : *
      {
         this.eyeFrame = 3;
         this.mouthFrame = 13;
         this.backShoeFrame = 1;
         this.frontShoeFrame = 1;
         this.frontHandFrame = 13;
         this.backHandFrame = 13;
      }
      
      internal function frame1644() : *
      {
         this.eyeFrame = 4;
         this.mouthFrame = 14;
      }
      
      internal function frame1691() : *
      {
         this.eyeFrame = 3;
         this.mouthFrame = 8;
      }
      
      internal function frame1695() : *
      {
         gotoAndPlay("drive");
      }
      
      internal function frame1696() : *
      {
         this.eyeFrame = 8;
         this.mouthFrame = 12;
         this.backShoeFrame = 1;
         this.frontShoeFrame = 1;
         this.frontHandFrame = 13;
         this.backHandFrame = 13;
      }
      
      internal function frame1704() : *
      {
         this.eyeFrame = 4;
         this.mouthFrame = 11;
      }
      
      internal function frame1739() : *
      {
         this.eyeFrame = 3;
         this.mouthFrame = 16;
      }
      
      internal function frame1743() : *
      {
         gotoAndPlay("drive");
      }
      
      internal function frame1744() : *
      {
         this.eyeFrame = 3;
         this.mouthFrame = 3;
         this.backShoeFrame = 1;
         this.frontShoeFrame = 1;
         this.frontHandFrame = 13;
         this.backHandFrame = 13;
      }
      
      internal function frame1747() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 5;
         this.backShoeFrame = 1;
         this.frontShoeFrame = 1;
         this.frontHandFrame = 13;
         this.backHandFrame = 13;
      }
      
      internal function frame1776() : *
      {
         gotoAndPlay("drive");
      }
      
      internal function frame1777() : *
      {
         this.eyeFrame = 0;
         this.mouthFrame = 0;
         this.backShoeFrame = 1;
         this.frontShoeFrame = 1;
         this.frontHandFrame = 1;
         this.backHandFrame = 10;
      }
      
      internal function frame1841() : *
      {
         stop();
      }
   }
}
