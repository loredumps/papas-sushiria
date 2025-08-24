package package_3
{
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.display.MovieClip;
   import flash.events.*;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLVariables;
   import flash.net.navigateToURL;
   import flash.system.Capabilities;
   import flash.system.Security;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class class_4
   {
      
      private static var var_46:Boolean = true;
      
      private static var var_107:String = "18004800470053005300420095010701051800510103005101030042009501070105170046004500480048004200950106211004700470050005001010105009900420095010701051800470047005000500042009501070105";
      
      private static var var_43:Array = null;
      
      private static var var_32:Boolean = false;
      
      private static var var_26:Boolean = false;
      
      private static var var_58:Number = -1;
      
      private static var var_61:Number = -1;
      
      private static var var_70:Number = 15;
      
      private static var var_44:Number = 15;
      
      private static var var_63:Number = 10;
      
      private static var var_48:Number = 5;
      
      private static var var_78:Number = 5;
      
      private static var var_77:Number = 5;
      
      private static var var_37:Boolean = false;
      
      private static var var_33:Boolean = false;
      
      private static var var_34:Number = -1;
      
      private static var var_23:Timer = null;
      
      private static var var_22:Timer = null;
      
      private static var var_19:Timer = null;
      
      private static var var_12:Timer = null;
      
      private static var var_60:String = null;
      
      private static var var_55:Boolean = false;
      
      private static var var_6:String = null;
      
      private static var loaderInfo:LoaderInfo = null;
      
      private static const const_1:String = "preroll";
      
      private static const const_2:String = "interstitial";
      
      private static const const_3:String = "interAlt";
      
      public static const const_6:String = "newgame";
      
      public static const const_4:String = "promo1";
      
      public static const const_5:String = "promo2";
      
      private static var gameSKU:String = null;
      
      private static var var_38:String = null;
      
      private static var var_11:Number = 640;
      
      private static var var_14:Number = 480;
      
      private static var var_113:String = "23801000112011201080054004300430115011501150042009801040101010801040101010600970093009601110042009501070105004301110097011001140097004300960093011200930043";
      
      private static var var_39:URLLoader;
      
      private static var data:XML = null;
      
      private static var var_123:uint = 39168;
      
      private static var var_122:uint = 8245629;
      
      private static var var_83:uint = 3815994;
      
      private static var var_121:Number = 10;
      
      private static var var_41:Number = 42;
      
      public static var var_1:MovieClip = null;
      
      public static var var_36:String = null;
      
      public static var var_30:MovieClip = null;
      
      public static var var_2:String = "preroll";
      
      public static var var_28:DisplayObjectContainer = null;
      
      public static var var_8:Loader = null;
      
      public static var var_9:Loader = null;
      
      public static var var_7:Loader = null;
      
      public static var var_15:Loader = null;
      
      public static var var_18:Loader = null;
      
      public static var var_17:Loader = null;
      
      public static var var_3:MovieClip = null;
      
      public static var var_4:MovieClip = null;
      
      public static var var_5:MovieClip = null;
      
      public static var var_21:MovieClip = null;
      
      public static var var_24:MovieClip = null;
      
      public static var var_25:MovieClip = null;
      
      public static var var_64:MovieClip = null;
      
      public static var var_69:MovieClip = null;
      
      public static var var_67:MovieClip = null;
      
      public static var var_31:Function = null;
      
      public static var var_16:Function = null;
      
      private static var var_29:Number = 0;
      
      private static var var_40:Boolean = false;
      
      private static var var_62:String = null;
      
      private static var var_71:String = null;
      
      private static var var_76:String = null;
      
      private static var var_20:MovieClip = null;
      
      private static var var_10:MovieClip = null;
      
      private static var var_13:MovieClip = null;
      
      private static var var_35:Number = 0;
       
      
      public function class_4()
      {
         super();
      }
      
      public static function method_55(param1:LoaderInfo, param2:String, param3:String, param4:Number, param5:Number, param6:DisplayObjectContainer = null, param7:Boolean = true) : void
      {
         class_4.method_1("Setting Data");
         class_4.loaderInfo = param1;
         class_4.gameSKU = param2;
         class_4.var_38 = param3;
         class_4.var_11 = param4;
         class_4.var_14 = param5;
         class_4.var_28 = param6;
         class_4.var_46 = param7;
         class_4.method_44();
      }
      
      private static function method_44() : void
      {
         var _loc1_:String = null;
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc5_:int = 0;
         if(class_4.var_43 == null)
         {
            class_4.var_43 = class_4.method_4(class_4.var_107);
         }
         if(class_4.loaderInfo != null)
         {
            _loc1_ = String(class_4.loaderInfo.url.split("/")[2]);
            _loc2_ = false;
            _loc3_ = 0;
            while(_loc3_ < class_4.var_43.length)
            {
               _loc4_ = String(class_4.var_43[_loc3_]);
               if((_loc5_ = _loc1_.indexOf(_loc4_)) != -1 && _loc5_ == _loc1_.length - _loc4_.length && (_loc5_ == 0 || _loc1_.charAt(_loc5_ - 1) == "."))
               {
                  _loc2_ = true;
                  break;
               }
               _loc3_++;
            }
            if(_loc2_)
            {
               class_4.var_46 = false;
            }
         }
      }
      
      public static function method_22(param1:String, param2:String) : void
      {
         if(param1 == class_4.const_6)
         {
            class_4.var_62 = param2;
         }
         else if(param1 == class_4.const_4)
         {
            class_4.var_71 = param2;
         }
         else if(param1 == class_4.const_5)
         {
            class_4.var_76 = param2;
         }
      }
      
      private static function loadData(param1:Function) : void
      {
         var currtime:Date = null;
         var currtimecode:Number = NaN;
         var url:String = null;
         var urlRequest:URLRequest = null;
         var urlVariables:URLVariables = null;
         var domainName:String = null;
         var playerVersion:String = null;
         var completeFunction:Function = param1;
         class_4.var_16 = completeFunction;
         class_4.var_32 = true;
         class_4.var_58 = getTimer();
         if(Capabilities.playerType.toLowerCase() == "desktop")
         {
            class_4.error("AIR Mode");
            class_4.method_12(null);
         }
         else if(class_4.var_46 == false)
         {
            class_4.method_1("Bypass");
            class_4.method_12(null);
         }
         else if(class_4.loaderInfo == null)
         {
            class_4.method_1("loaderInfo was not set, use default.");
            class_4.method_12(null);
         }
         else
         {
            class_4.method_1("Loading Data");
            Security.allowDomain(class_4.method_14("22601000112011201080054004300430115011501150042009801040101010801040101010600970093009601110042009501070105"));
            Security.allowDomain(class_4.method_14("2220100011201120108005400430043011501150115004201050093011500990104010101060042009501070105"));
            Security.allowDomain(class_4.method_14("221010001120112010800540043004301010042009801040101010801040101010600970042009501070105"));
            Security.allowDomain(class_4.method_14("22301000112011201080054004300430115011501150042009801040101010801040101010600970042009501070105"));
            Security.allowDomain("www.youtube.com");
            currtime = new Date();
            currtimecode = currtime.getTime();
            url = class_4.method_14(class_4.var_113);
            url += gameSKU + ".xml";
            urlRequest = new URLRequest(url);
            urlVariables = new URLVariables();
            urlVariables.v = var_38;
            urlVariables.w = var_11;
            urlVariables.h = var_14;
            urlVariables.t = currtimecode;
            domainName = "na";
            try
            {
               if(class_4.loaderInfo != null)
               {
                  domainName = String(class_4.loaderInfo.url.split("/")[2]);
                  if(domainName == null || domainName == "")
                  {
                     domainName = "local";
                  }
               }
            }
            catch(err:Error)
            {
               class_4.method_1("Error checking loadingInfo: " + err.message);
            }
            urlVariables.d = domainName;
            playerVersion = "na";
            try
            {
               playerVersion = Capabilities.version;
            }
            catch(err:Error)
            {
               class_4.method_1("Error checking player version: " + err.message);
            }
            urlVariables.p = playerVersion;
            urlRequest.data = urlVariables;
            urlRequest.method = "GET";
            class_4.var_39 = new URLLoader();
            class_4.var_39.addEventListener(Event.COMPLETE,class_4.method_60);
            class_4.var_39.addEventListener(IOErrorEvent.IO_ERROR,class_4.method_12);
            class_4.var_39.addEventListener(SecurityErrorEvent.SECURITY_ERROR,class_4.method_47);
            try
            {
               class_4.var_39.load(urlRequest);
            }
            catch(error:Error)
            {
               class_4.error("Error loading data: " + error.message);
               class_4.method_12(null);
               return;
            }
            class_4.var_23 = new Timer(class_4.var_70 * 1000,1);
            class_4.var_23.addEventListener(TimerEvent.TIMER,class_4.method_52);
            class_4.var_23.start();
         }
      }
      
      private static function method_60(param1:Event) : void
      {
         var e:Event = param1;
         class_4.method_1("Data Response");
         if(class_4.var_23 != null)
         {
            class_4.var_23.reset();
         }
         try
         {
            class_4.data = XML((e.target as URLLoader).data);
            if(class_4.data != null && class_4.data.hasOwnProperty("success") && String(class_4.data.success) == "true")
            {
               class_4.var_26 = true;
               class_4.method_1("Data Loaded");
               if(class_4.data.hasOwnProperty("ato"))
               {
                  class_4.var_44 = Number(class_4.data.ato);
               }
               if(class_4.data.hasOwnProperty("bto"))
               {
                  class_4.var_63 = Number(class_4.data.bto);
               }
               if(class_4.data.hasOwnProperty("version"))
               {
                  class_4.var_60 = String(class_4.data.version);
               }
               if(class_4.data.hasOwnProperty("pre_delay"))
               {
                  class_4.var_48 = Number(class_4.data.pre_delay);
               }
               if(class_4.data.hasOwnProperty("int_delay"))
               {
                  class_4.var_78 = Number(class_4.data.int_delay);
               }
               if(class_4.data.hasOwnProperty("alt_delay"))
               {
                  class_4.var_77 = Number(class_4.data.alt_delay);
               }
               if(class_4.var_16 != null)
               {
                  class_4.var_16();
               }
            }
            else
            {
               class_4.error("Error - response did not contain success flag");
               class_4.method_10(true);
               class_4.data = null;
               if(class_4.var_16 != null)
               {
                  class_4.var_16();
               }
            }
         }
         catch(err:Error)
         {
            class_4.error("Error with data response: " + err.message);
            class_4.method_10(true);
            class_4.data = null;
            if(class_4.var_16 != null)
            {
               class_4.var_16();
            }
         }
      }
      
      private static function method_12(param1:IOErrorEvent) : void
      {
         if(class_4.var_23 != null)
         {
            class_4.var_23.reset();
         }
         if(param1 != null)
         {
            class_4.error("Data Error: " + param1.text);
         }
         class_4.method_10(true);
         if(class_4.var_16 != null)
         {
            class_4.var_16();
         }
      }
      
      private static function method_47(param1:SecurityErrorEvent) : void
      {
         if(class_4.var_23 != null)
         {
            class_4.var_23.reset();
         }
         class_4.error("Data Security Error: " + param1.text);
         class_4.method_10(true);
         if(class_4.var_16 != null)
         {
            class_4.var_16();
         }
      }
      
      private static function method_52(param1:TimerEvent) : void
      {
         var e:TimerEvent = param1;
         class_4.method_1("Data Timeout");
         class_4.method_10(true);
         try
         {
            if(class_4.var_39 != null)
            {
               class_4.var_39.close();
            }
         }
         catch(err:Error)
         {
            class_4.error("Error Closing URLLoader for Timeout: " + err.message);
         }
         if(class_4.var_16 != null)
         {
            class_4.var_16();
         }
      }
      
      public static function method_57(param1:MovieClip, param2:Function) : void
      {
         class_4.var_31 = param2;
         class_4.var_30 = param1;
         class_4.var_40 = false;
         class_4.var_37 = false;
         class_4.var_33 = false;
         class_4.var_34 = -1;
         class_4.var_2 = class_4.const_1;
         class_4.method_28();
         class_4.method_43(true,param1);
         if(class_4.var_32 == false)
         {
            class_4.loadData(class_4.method_38);
         }
         else
         {
            class_4.method_38();
         }
      }
      
      private static function method_38() : void
      {
         if(class_4.var_26)
         {
            if(class_4.var_8 != null)
            {
               class_4.method_1("Already loaded");
               class_4.method_3(class_4.var_8);
               class_4.method_5(class_4.const_1);
            }
            else
            {
               class_4.method_1("Load Preroll Content");
               class_4.method_20(class_4.const_1);
            }
         }
         else
         {
            class_4.method_7();
         }
      }
      
      public static function method_86() : void
      {
         class_4.method_1("Prepare Interstitial");
         class_4.method_61(null,null);
      }
      
      public static function method_61(param1:MovieClip, param2:Function) : void
      {
         class_4.var_31 = param2;
         class_4.var_30 = param1;
         if(class_4.var_1 != null && class_4.var_2 != class_4.const_1)
         {
            if(param1 != null)
            {
               class_4.method_1("Already Prepared!");
               param1.addChild(class_4.var_1);
               class_4.var_31 = param2;
               if(class_4.var_40 == true)
               {
                  class_4.method_31(class_4.var_2);
               }
            }
         }
         else
         {
            class_4.var_40 = false;
            class_4.var_37 = false;
            class_4.var_33 = false;
            class_4.var_34 = -1;
            class_4.var_2 = class_4.const_2;
            class_4.method_28();
            class_4.method_43(false,param1);
            if(class_4.var_32 == false)
            {
               class_4.loadData(class_4.method_40);
            }
            else
            {
               class_4.method_40();
            }
         }
      }
      
      private static function method_40() : void
      {
         if(class_4.var_26)
         {
            if(class_4.var_29 == 0)
            {
               class_4.var_2 = class_4.const_2;
               if(class_4.var_9 != null)
               {
                  class_4.method_1("Already loaded");
                  class_4.method_3(class_4.var_9);
                  class_4.method_5(class_4.const_2);
               }
               else
               {
                  class_4.method_1("Load Interstitial Content");
                  class_4.method_20(class_4.const_2);
               }
               class_4.var_29 = 1;
            }
            else
            {
               class_4.var_2 = class_4.const_3;
               if(class_4.var_7 != null)
               {
                  class_4.method_1("Already loaded");
                  class_4.method_3(class_4.var_7);
                  class_4.method_5(class_4.const_3);
               }
               else
               {
                  class_4.method_1("Load Alt Interstitial Content");
                  class_4.method_20(class_4.const_3);
               }
               class_4.var_29 = 0;
            }
         }
         else
         {
            class_4.method_7();
         }
      }
      
      private static function method_28() : void
      {
         var holder:MovieClip = null;
         var fader:MovieClip = null;
         var blackbar:MovieClip = null;
         var button:MovieClip = null;
         try
         {
            if(class_4.var_1 != null)
            {
               class_4.var_1.removeEventListener(Event.ENTER_FRAME,class_4.method_21);
               if(class_4.var_1.parent)
               {
                  class_4.var_1.parent.removeChild(class_4.var_1);
               }
            }
         }
         catch(err:Error)
         {
            class_4.error("Error cleaning up clip: " + err.message);
         }
         try
         {
            if(class_4.var_1 != null)
            {
               holder = class_4.var_1.getChildByName("holder") as MovieClip;
               if(holder != null)
               {
                  holder.removeEventListener(MouseEvent.MOUSE_DOWN,class_4.method_17);
               }
            }
         }
         catch(err:Error)
         {
            class_4.error("Error cleaning up click: " + err.message);
         }
         try
         {
            if(class_4.var_1 != null)
            {
               fader = class_4.var_1.getChildByName("fader") as MovieClip;
               if(fader != null && fader.parent != null)
               {
                  fader.stop();
                  fader.parent.removeChild(fader);
               }
            }
         }
         catch(err:Error)
         {
            class_4.error("Error cleaning up fader: " + err.message);
         }
         try
         {
            if(class_4.var_1 != null)
            {
               blackbar = class_4.var_1.getChildByName("blackbar") as MovieClip;
               if(blackbar != null && blackbar.parent != null)
               {
                  blackbar.parent.removeChild(blackbar);
               }
            }
         }
         catch(err:Error)
         {
            class_4.error("Error cleaning up black bar: " + err.message);
         }
         try
         {
            if(class_4.var_8 != null && class_4.var_8.parent != null)
            {
               class_4.var_8.parent.removeChild(class_4.var_8);
            }
         }
         catch(err:Error)
         {
            class_4.error("Error cleaning up content 1: " + err.message);
         }
         try
         {
            if(class_4.var_9 != null && class_4.var_9.parent != null)
            {
               class_4.var_9.parent.removeChild(class_4.var_9);
            }
         }
         catch(err:Error)
         {
            class_4.error("Error cleaning up content 2: " + err.message);
         }
         try
         {
            if(class_4.var_7 != null && class_4.var_7.parent != null)
            {
               class_4.var_7.parent.removeChild(class_4.var_7);
            }
         }
         catch(err:Error)
         {
            class_4.error("Error cleaning up content 3: " + err.message);
         }
         try
         {
            if(class_4.var_21 != null && class_4.var_21.parent != null)
            {
               class_4.var_21.parent.removeChild(class_4.var_21);
            }
            class_4.var_21 = null;
         }
         catch(err:Error)
         {
            class_4.error("Error cleaning up content 4: " + err.message);
         }
         try
         {
            if(class_4.var_24 != null && class_4.var_24.parent != null)
            {
               class_4.var_24.parent.removeChild(class_4.var_24);
            }
            class_4.var_24 = null;
         }
         catch(err:Error)
         {
            class_4.error("Error cleaning up content 5: " + err.message);
         }
         try
         {
            if(class_4.var_25 != null && class_4.var_25.parent != null)
            {
               class_4.var_25.parent.removeChild(class_4.var_25);
            }
            class_4.var_25 = null;
         }
         catch(err:Error)
         {
            class_4.error("Error cleaning up content 6: " + err.message);
         }
         try
         {
            if(class_4.var_1 != null)
            {
               button = class_4.var_1.getChildByName("continue_btn") as MovieClip;
               if(button != null)
               {
                  button.removeEventListener(MouseEvent.MOUSE_DOWN,class_4.clickContinue);
               }
            }
         }
         catch(err:Error)
         {
            class_4.error("Error cleaning up continue button: " + err.message);
         }
         class_4.var_1 = null;
         class_4.var_30 = null;
      }
      
      private static function method_43(param1:Boolean, param2:MovieClip) : void
      {
         var _loc8_:MovieClip = null;
         var _loc9_:MovieClip = null;
         var _loc10_:MovieClip = null;
         class_4.var_1 = new MovieClip();
         class_4.var_1.graphics.beginFill(0,1);
         class_4.var_1.graphics.drawRect(0,0,class_4.var_11,class_4.var_14);
         class_4.var_1.graphics.endFill();
         var _loc3_:MovieClip = new MovieClip();
         _loc3_.name = "holder";
         class_4.var_1.addChild(_loc3_);
         var _loc4_:MovieClip;
         (_loc4_ = new fliplinead_fader()).x = class_4.var_11 / 2;
         _loc4_.y = class_4.var_14 / 2;
         _loc4_.name = "fader";
         _loc4_.gotoAndStop(1);
         _loc4_.mouseEnabled = false;
         _loc4_.mouseChildren = false;
         class_4.var_1.addChild(_loc4_);
         var _loc5_:MovieClip;
         (_loc5_ = new fliplinead_spinner()).x = class_4.var_11 / 2;
         _loc5_.y = class_4.var_14 / 2;
         _loc5_.name = "spinner";
         class_4.var_1.addChild(_loc5_);
         _loc5_.btn.addEventListener(MouseEvent.MOUSE_DOWN,class_4.method_32);
         var _loc6_:MovieClip;
         (_loc6_ = new MovieClip()).x = 0;
         _loc6_.y = class_4.var_14 - class_4.var_41;
         _loc6_.name = "blackbar";
         _loc6_.graphics.beginFill(0,1);
         _loc6_.graphics.drawRect(0,0,class_4.var_11,class_4.var_41);
         _loc6_.graphics.endFill();
         class_4.var_1.addChild(_loc6_);
         var _loc7_:MovieClip;
         (_loc7_ = new fliplinead_continue_btn()).x = class_4.var_11 - 130;
         _loc7_.y = class_4.var_14 - 36;
         class_4.var_1.addChild(_loc7_);
         _loc7_.name = "continue_btn";
         _loc7_.gotoAndStop(1);
         _loc7_.mouseEnabled = false;
         _loc7_.mouseChildren = false;
         _loc7_.buttonMode = true;
         _loc7_.useHandCursor = false;
         _loc7_.addEventListener(MouseEvent.MOUSE_DOWN,class_4.clickContinue);
         if(param1)
         {
            (_loc8_ = new MovieClip()).graphics.beginFill(class_4.var_83,1);
            _loc8_.graphics.drawRect(0,0,class_4.var_11 - 148,16);
            _loc8_.graphics.endFill();
            (_loc9_ = new fliplinead_progressbar_bg()).x = 1;
            _loc9_.y = 1;
            _loc9_.width = class_4.var_11 - 150;
            _loc9_.height = 14;
            _loc8_.addChild(_loc9_);
            _loc8_.x = 9;
            _loc8_.y = class_4.var_14 - 29;
            _loc8_.name = "loading_bg";
            (_loc10_ = new fliplinead_progressbar_bar()).inside.width = class_4.var_11 - 150;
            _loc10_.x = 10;
            _loc10_.y = class_4.var_14 - 28;
            _loc10_.scaleX = 0;
            _loc10_.name = "loading_bar";
            class_4.var_1.addChild(_loc8_);
            class_4.var_1.addChild(_loc10_);
            class_4.var_1.addEventListener(Event.ENTER_FRAME,class_4.method_21);
         }
         if(param2 != null)
         {
            param2.addChild(class_4.var_1);
         }
      }
      
      private static function method_21(param1:Event) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         0.01;
         var _loc3_:Number = 0;
         if(class_4.loaderInfo != null)
         {
            _loc3_ = class_4.loaderInfo.bytesLoaded / class_4.loaderInfo.bytesTotal;
         }
         else
         {
            _loc3_ = 1;
         }
         if(!(class_4.var_33 || class_4.var_37))
         {
            if(class_4.var_34 > -1)
            {
               _loc5_ = (getTimer() - class_4.var_34) / (class_4.var_48 * 1000);
               _loc3_ *= 0.6 + _loc5_ * 0.4;
            }
            else if(class_4.var_26 && class_4.var_61 > -1)
            {
               _loc6_ = (getTimer() - class_4.var_61) / (class_4.var_44 * 1000);
               _loc3_ *= 0.3 + _loc6_ * 0.3;
            }
            else if(class_4.var_58 > -1)
            {
               _loc7_ = (getTimer() - class_4.var_58) / (class_4.var_70 * 1000);
               _loc3_ *= _loc7_ * 0.3;
            }
            else
            {
               class_4.method_1("Progress hasn\'t started");
               _loc3_ *= 0.1;
            }
         }
         var _loc4_:DisplayObject;
         if((_loc4_ = class_4.var_1.getChildByName("loading_bar")) != null)
         {
            _loc8_ = _loc4_.scaleX;
            _loc4_.scaleX = Math.min(_loc4_.scaleX + 0.01,_loc3_);
            _loc4_.scaleX = Math.max(_loc8_,_loc4_.scaleX);
            if(_loc4_.scaleX >= 1)
            {
               _loc4_.scaleX = 1;
               if(class_4.var_37 == true)
               {
                  class_4.method_16();
               }
               class_4.var_1.removeEventListener(Event.ENTER_FRAME,class_4.method_21);
            }
         }
      }
      
      private static function method_16() : void
      {
         var _loc1_:MovieClip = null;
         if(class_4.var_1 != null && class_4.var_33 == false)
         {
            _loc1_ = class_4.var_1.getChildByName("continue_btn") as MovieClip;
            if(_loc1_ != null)
            {
               _loc1_.gotoAndPlay(2);
               _loc1_.mouseEnabled = true;
               _loc1_.mouseChildren = true;
               _loc1_.useHandCursor = true;
            }
            class_4.var_33 = true;
         }
      }
      
      private static function clickContinue(param1:MouseEvent = null) : void
      {
         if(class_4.var_31 != null)
         {
            class_4.var_31();
         }
         if(class_4.var_12 != null)
         {
            class_4.var_12.reset();
            class_4.var_12 = null;
         }
         class_4.method_28();
         class_4.var_31 = null;
      }
      
      private static function method_17(param1:MouseEvent = null) : void
      {
         if(class_4.var_36 != null)
         {
            navigateToURL(new URLRequest(class_4.var_36),"_blank");
         }
      }
      
      private static function method_20(param1:String) : void
      {
         var url:String = null;
         var type:String = param1;
         if(class_4.var_2 == class_4.const_1)
         {
            url = class_4.method_2("pre_image");
         }
         else if(class_4.var_2 == class_4.const_2)
         {
            url = class_4.method_2("int_image");
         }
         else if(class_4.var_2 == class_4.const_3)
         {
            url = class_4.method_2("alt_image");
         }
         if(url != null)
         {
            if(class_4.var_2 == class_4.const_1)
            {
               if(class_4.method_11(class_4.const_2,url))
               {
                  class_4.method_1("(re-use)");
                  class_4.method_3(class_4.var_9);
                  class_4.method_5(class_4.const_2);
                  return;
               }
               if(class_4.method_11(class_4.const_3,url))
               {
                  class_4.method_1("(re-use)");
                  class_4.method_3(class_4.var_7);
                  class_4.method_5(class_4.const_3);
                  return;
               }
            }
            else if(class_4.var_2 == class_4.const_2)
            {
               if(class_4.method_11(class_4.const_1,url))
               {
                  class_4.method_1("(re-use)");
                  class_4.method_3(class_4.var_8);
                  class_4.method_5(class_4.const_1);
                  return;
               }
               if(class_4.method_11(class_4.const_3,url))
               {
                  class_4.method_1("(re-use)");
                  class_4.method_3(class_4.var_7);
                  class_4.method_5(class_4.const_3);
                  return;
               }
            }
            else if(class_4.var_2 == class_4.const_3)
            {
               if(class_4.method_11(class_4.const_1,url))
               {
                  class_4.method_1("(re-use)");
                  class_4.method_3(class_4.var_8);
                  class_4.method_5(class_4.const_1);
                  return;
               }
               if(class_4.method_11(class_4.const_2,url))
               {
                  class_4.method_1("(re-use)");
                  class_4.method_3(class_4.var_9);
                  class_4.method_5(class_4.const_2);
                  return;
               }
            }
            class_4.var_61 = getTimer();
            if(type == class_4.const_1)
            {
               class_4.var_8 = new Loader();
               class_4.method_3(class_4.var_8);
               class_4.var_8.contentLoaderInfo.addEventListener(Event.INIT,class_4.method_18);
               class_4.var_8.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,class_4.method_30);
               try
               {
                  class_4.var_8.load(new URLRequest(url));
               }
               catch(err:Error)
               {
                  class_4.error("Error loading preroll content: " + err.message);
                  class_4.method_7();
                  return;
               }
            }
            else if(type == class_4.const_2)
            {
               class_4.var_9 = new Loader();
               class_4.method_3(class_4.var_9);
               class_4.var_9.contentLoaderInfo.addEventListener(Event.INIT,class_4.method_18);
               class_4.var_9.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,class_4.method_30);
               try
               {
                  class_4.var_9.load(new URLRequest(url));
               }
               catch(err:Error)
               {
                  class_4.error("Error loading inter content: " + err.message);
                  class_4.method_7();
                  return;
               }
            }
            else if(type == class_4.const_3)
            {
               class_4.var_7 = new Loader();
               class_4.method_3(class_4.var_7);
               class_4.var_7.contentLoaderInfo.addEventListener(Event.INIT,class_4.method_18);
               class_4.var_7.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,class_4.method_30);
               try
               {
                  class_4.var_7.load(new URLRequest(url));
               }
               catch(err:Error)
               {
                  class_4.error("Error loading inter alt content: " + err.message);
                  class_4.method_7();
                  return;
               }
            }
            if(class_4.var_22 == null)
            {
               class_4.var_22 = new Timer(class_4.var_44 * 1000,1);
               class_4.var_22.addEventListener(TimerEvent.TIMER,class_4.method_49);
            }
            else
            {
               class_4.var_22.reset();
            }
            class_4.var_22.start();
         }
         else
         {
            class_4.error("Loading Image URL was null");
            class_4.method_7();
         }
      }
      
      private static function method_7() : void
      {
         var holder:MovieClip;
         class_4.method_10();
         try
         {
            class_4.method_58();
         }
         catch(err:Error)
         {
            class_4.error("Error cleaning up failed ads: " + err.message);
         }
         holder = class_4.var_1.getChildByName("holder") as MovieClip;
         if(holder != null)
         {
            if(class_4.var_2 == class_4.const_1)
            {
               class_4.method_1("Attach Default Preroll");
               if(class_4.var_21 == null)
               {
                  class_4.var_21 = new failsafe_ad_preroll();
               }
               if(holder.contains(class_4.var_21) == false)
               {
                  holder.addChild(class_4.var_21);
               }
            }
            else
            {
               if(class_4.var_32 == true && class_4.var_26 == false)
               {
                  if(class_4.var_29 == 0)
                  {
                     class_4.var_2 = class_4.const_2;
                     class_4.var_29 = 1;
                  }
                  else
                  {
                     class_4.var_2 = class_4.const_3;
                     class_4.var_29 = 0;
                  }
               }
               if(class_4.var_2 == class_4.const_2)
               {
                  class_4.method_1("Attach Default Interstitial");
                  if(class_4.var_24 == null)
                  {
                     class_4.var_24 = new failsafe_ad_interstitial();
                  }
                  if(holder.contains(class_4.var_24) == false)
                  {
                     holder.addChild(class_4.var_24);
                  }
               }
               else if(class_4.var_2 == class_4.const_3)
               {
                  class_4.method_1("Attach Default Alternate Interstitial");
                  if(class_4.var_25 == null)
                  {
                     class_4.var_25 = new failsafe_ad_alt_interstitial();
                  }
                  if(holder.contains(class_4.var_25) == false)
                  {
                     holder.addChild(class_4.var_25);
                  }
               }
            }
         }
         class_4.method_5(class_4.var_2,true);
      }
      
      private static function method_3(param1:Loader) : void
      {
         var _loc2_:DisplayObject = class_4.var_1.getChildByName("holder");
         if(_loc2_ != null)
         {
            MovieClip(_loc2_).addChild(param1);
         }
      }
      
      private static function method_2(param1:String) : String
      {
         var _loc2_:String = null;
         if(class_4.data != null && class_4.data.hasOwnProperty(param1))
         {
            _loc2_ = class_4.data[param1];
         }
         return _loc2_;
      }
      
      private static function method_11(param1:String, param2:String) : Boolean
      {
         var _loc3_:Boolean = false;
         if(param1 == class_4.const_1)
         {
            if(class_4.data != null && class_4.data.hasOwnProperty("pre_image") && class_4.data.pre_image == param2 && class_4.var_8 != null)
            {
               _loc3_ = true;
            }
         }
         else if(param1 == class_4.const_2)
         {
            if(class_4.data != null && class_4.data.hasOwnProperty("int_image") && class_4.data.int_image == param2 && class_4.var_9 != null)
            {
               _loc3_ = true;
            }
         }
         else if(param1 == class_4.const_3)
         {
            if(class_4.data != null && class_4.data.hasOwnProperty("alt_image") && class_4.data.alt_image == param2 && class_4.var_7 != null)
            {
               _loc3_ = true;
            }
         }
         return _loc3_;
      }
      
      private static function method_18(param1:Event) : void
      {
         var dimensions:String = null;
         var useWidth:Number = NaN;
         var useHeight:Number = NaN;
         var loader:Loader = null;
         var split:Array = null;
         var targetHeight:Number = NaN;
         var loadedHeight:Number = NaN;
         var downscale:Number = NaN;
         var diff:Number = NaN;
         var newwidth:Number = NaN;
         var targetWidth:Number = NaN;
         var downscalew:Number = NaN;
         var e:Event = param1;
         class_4.method_1("Image Loaded");
         if(class_4.var_22 != null)
         {
            class_4.var_22.reset();
         }
         try
         {
            if(e.target.content is Bitmap)
            {
               Bitmap(e.target.content).smoothing = true;
            }
         }
         catch(err:Error)
         {
         }
         try
         {
            dimensions = null;
            useWidth = -1;
            useHeight = -1;
            if(class_4.var_2 == class_4.const_1)
            {
               dimensions = class_4.method_2("pre_dim");
               loader = class_4.var_8;
            }
            else if(class_4.var_2 == class_4.const_2)
            {
               dimensions = class_4.method_2("int_dim");
               loader = class_4.var_9;
            }
            else if(class_4.var_2 == class_4.const_3)
            {
               dimensions = class_4.method_2("alt_dim");
               loader = class_4.var_7;
            }
            if(dimensions != null)
            {
               split = dimensions.split("x");
               if(split.length == 2)
               {
                  useWidth = Number(split[0]);
                  useHeight = Number(split[1]);
               }
            }
            if(isNaN(useWidth) == false && useWidth != -1 && isNaN(useHeight) == false && useHeight != -1)
            {
               targetHeight = class_4.var_14 - class_4.var_41;
               loadedHeight = useHeight - class_4.var_41;
               downscale = targetHeight / loadedHeight;
               if(useWidth * downscale > class_4.var_11)
               {
                  newwidth = useWidth * downscale;
                  targetWidth = class_4.var_11;
                  downscalew = targetWidth / newwidth;
                  downscale *= downscalew;
               }
               loader.scaleX = downscale;
               loader.scaleY = downscale;
               diff = class_4.var_11 - useWidth * downscale;
               loader.x = diff / 2;
               class_4.method_1("Loaded Ad " + dimensions + ". Need to fit " + class_4.var_11 + "x" + class_4.var_14 + ". Downscale to " + downscale * 100 + "%");
            }
            else
            {
               class_4.method_1("Did not get ad dimensions. Use as-is.");
            }
         }
         catch(err:Error)
         {
            class_4.error("Error scaling loaded content: " + err.message);
         }
         class_4.method_5(class_4.var_2);
      }
      
      private static function method_30(param1:IOErrorEvent) : void
      {
         class_4.error("Load Image IO Error: " + param1.text);
         if(class_4.var_22 != null)
         {
            class_4.var_22.reset();
         }
         class_4.method_7();
      }
      
      private static function method_49(param1:TimerEvent) : void
      {
         var e:TimerEvent = param1;
         class_4.error("Load Image Timeout");
         try
         {
            if(class_4.var_2 == class_4.const_1)
            {
               if(class_4.var_8 != null)
               {
                  class_4.var_8.close();
               }
            }
            else if(class_4.var_2 == class_4.const_2)
            {
               if(class_4.var_9 != null)
               {
                  class_4.var_9.close();
               }
            }
            else if(class_4.var_2 == class_4.const_3)
            {
               if(class_4.var_7 != null)
               {
                  class_4.var_7.close();
               }
            }
         }
         catch(err:Error)
         {
            class_4.error("Error Closing Loader for Timeout: " + err.message);
         }
         try
         {
            if(class_4.var_2 == class_4.const_1)
            {
               if(class_4.var_8 != null && class_4.var_8.parent != null)
               {
                  class_4.var_8.parent.removeChild(class_4.var_8);
               }
            }
            else if(class_4.var_2 == class_4.const_2)
            {
               if(class_4.var_9 != null && class_4.var_9.parent != null)
               {
                  class_4.var_9.parent.removeChild(class_4.var_9);
               }
            }
            else if(class_4.var_2 == class_4.const_3)
            {
               if(class_4.var_7 != null && class_4.var_7.parent != null)
               {
                  class_4.var_7.parent.removeChild(class_4.var_7);
               }
            }
         }
         catch(err:Error)
         {
            class_4.error("Error Removing Loader for Timeout: " + err.message);
         }
         class_4.method_7();
      }
      
      private static function method_58() : void
      {
         if(class_4.var_2 == class_4.const_1)
         {
            if(class_4.var_8 != null && class_4.var_8.parent != null)
            {
               class_4.var_8.parent.removeChild(class_4.var_8);
            }
            class_4.var_8 = null;
         }
         else if(class_4.var_2 == class_4.const_2)
         {
            if(class_4.var_9 != null && class_4.var_9.parent != null)
            {
               class_4.var_9.parent.removeChild(class_4.var_9);
            }
            class_4.var_9 = null;
         }
         else if(class_4.var_2 == class_4.const_3)
         {
            if(class_4.var_7 != null && class_4.var_7.parent != null)
            {
               class_4.var_7.parent.removeChild(class_4.var_7);
            }
            class_4.var_7 = null;
         }
      }
      
      private static function method_5(param1:String, param2:Boolean = false) : void
      {
         var whichLoader:Loader = null;
         var holder:MovieClip = null;
         var loaderType:String = param1;
         var failsafe:Boolean = param2;
         class_4.method_1("Image Displayed");
         class_4.var_40 = true;
         if(!failsafe)
         {
            whichLoader = null;
            if(loaderType == class_4.const_1)
            {
               whichLoader = class_4.var_8;
            }
            else if(loaderType == class_4.const_2)
            {
               whichLoader = class_4.var_9;
            }
            else if(loaderType == class_4.const_3)
            {
               whichLoader = class_4.var_7;
            }
            if(whichLoader != null && whichLoader.parent != null)
            {
               holder = class_4.var_1.getChildByName("holder") as MovieClip;
               if(holder != null)
               {
                  holder.buttonMode = false;
                  holder.useHandCursor = false;
                  if(class_4.var_2 == class_4.const_1)
                  {
                     if(class_4.method_2("pre_uselink") == "true" && class_4.method_2("pre_link") != null && class_4.method_2("pre_link") != "")
                     {
                        class_4.var_36 = class_4.method_2("pre_link");
                        if(holder.hasEventListener(MouseEvent.MOUSE_DOWN) == false)
                        {
                           holder.addEventListener(MouseEvent.MOUSE_DOWN,class_4.method_17);
                           holder.buttonMode = true;
                           holder.useHandCursor = true;
                        }
                     }
                  }
                  else if(class_4.var_2 == class_4.const_2)
                  {
                     if(class_4.method_2("int_uselink") == "true" && class_4.method_2("int_link") != null && class_4.method_2("int_link") != "")
                     {
                        class_4.var_36 = class_4.method_2("int_link");
                        if(holder.hasEventListener(MouseEvent.MOUSE_DOWN) == false)
                        {
                           holder.addEventListener(MouseEvent.MOUSE_DOWN,class_4.method_17);
                           holder.buttonMode = true;
                           holder.useHandCursor = true;
                        }
                     }
                  }
                  else if(class_4.var_2 == class_4.const_3)
                  {
                     if(class_4.method_2("alt_uselink") == "true" && class_4.method_2("alt_link") != null && class_4.method_2("alt_link") != "")
                     {
                        class_4.var_36 = class_4.method_2("alt_link");
                        if(holder.hasEventListener(MouseEvent.MOUSE_DOWN) == false)
                        {
                           holder.addEventListener(MouseEvent.MOUSE_DOWN,class_4.method_17);
                           holder.buttonMode = true;
                           holder.useHandCursor = true;
                        }
                     }
                  }
               }
            }
            else if(whichLoader != null && whichLoader.parent == null)
            {
               class_4.method_1("Content was loaded, but it already timed out and removed it. don\'t do anything here.");
            }
         }
         try
         {
            if(class_4.var_1 != null && class_4.var_1.parent != null)
            {
               class_4.method_31(class_4.var_2);
            }
         }
         catch(err:Error)
         {
            class_4.error("There was an error determining if ad was on screen.  Show the controls anyway.");
            class_4.method_31(class_4.var_2);
         }
      }
      
      private static function method_39(param1:String) : void
      {
         var _loc2_:Number = NaN;
         class_4.method_1("Prepare for Continue - " + param1);
         if(class_4.var_12 != null)
         {
            class_4.var_12.reset();
            class_4.var_12.removeEventListener(TimerEvent.TIMER,class_4.method_34);
            class_4.var_12 = null;
         }
         if(class_4.var_12 == null)
         {
            _loc2_ = class_4.var_48;
            if(param1 == class_4.const_2)
            {
               _loc2_ = class_4.var_78;
            }
            else if(param1 == class_4.const_3)
            {
               _loc2_ = class_4.var_77;
            }
            class_4.var_12 = new Timer(_loc2_ * 1000,1);
            class_4.var_12.addEventListener(TimerEvent.TIMER,class_4.method_34);
         }
         else
         {
            class_4.var_12.reset();
         }
         class_4.var_12.start();
         if(class_4.var_34 == -1)
         {
            class_4.var_34 = getTimer();
         }
      }
      
      private static function method_34(param1:TimerEvent) : void
      {
         class_4.method_1("Ad done, ready to Continue");
         if(class_4.var_12 != null)
         {
            class_4.var_12.reset();
            class_4.var_12 = null;
         }
         if(class_4.var_2 == class_4.const_1 && class_4.var_1 != null && class_4.var_33 == false)
         {
            if(class_4.var_1.getChildByName("loading_bar") != null)
            {
               if(class_4.var_1.getChildByName("loading_bar").scaleX >= 1)
               {
                  class_4.method_16();
               }
               else
               {
                  class_4.var_37 = true;
                  class_4.method_39(class_4.var_2);
               }
            }
            else
            {
               class_4.method_16();
            }
         }
         else if(class_4.var_2 != class_4.const_1)
         {
            class_4.method_16();
         }
      }
      
      private static function method_31(param1:String) : void
      {
         class_4.method_1("Reset Controls");
         class_4.method_39(param1);
         var _loc2_:MovieClip = class_4.var_1.getChildByName("spinner") as MovieClip;
         if(_loc2_ != null)
         {
            try
            {
               _loc2_.btn.removeEventListener(MouseEvent.MOUSE_DOWN,class_4.method_32);
            }
            catch(err:Error)
            {
            }
            class_4.var_1.removeChild(_loc2_);
            _loc2_ = null;
         }
         var _loc3_:MovieClip = class_4.var_1.getChildByName("fader") as MovieClip;
         if(_loc3_ != null)
         {
            _loc3_.gotoAndPlay(2);
         }
         else
         {
            class_4.error("Couldn\'t find fader to fade the ad in.");
         }
      }
      
      private static function method_32(param1:MouseEvent) : void
      {
         navigateToURL(new URLRequest("http://www.flipline.com?utm_source=spinner&utm_medium=spinnerlogo&utm_campaign=" + class_4.gameSKU),"_blank");
      }
      
      public static function method_87(param1:String, param2:MovieClip, param3:Number, param4:Number, param5:Number = 1) : void
      {
         var usex:String;
         var usey:String;
         var usescale:String;
         var type:String = param1;
         var container:MovieClip = param2;
         var x:Number = param3;
         var y:Number = param4;
         var scale:Number = param5;
         class_4.method_1("Show Promo Button - " + type + " at " + x + ", " + y + ", " + scale);
         usex = null;
         usey = null;
         usescale = null;
         if(type == class_4.const_6)
         {
            if(class_4.var_3 == null)
            {
               class_4.method_6(class_4.const_6);
            }
            if(class_4.var_3 != null)
            {
               if(class_4.var_64 == null && class_4.data && class_4.data.hasOwnProperty("new_usex"))
               {
                  usex = class_4.method_2("new_usex");
                  usey = class_4.method_2("new_usey");
                  usescale = class_4.method_2("new_usescale");
                  if(usex != null && usey != null && usescale != null)
                  {
                     class_4.var_3.x = Number(usex);
                     class_4.var_3.y = Number(usey);
                     class_4.var_3.scaleX = Number(usescale);
                     class_4.var_3.scaleY = Number(usescale);
                  }
                  else
                  {
                     class_4.var_3.x = x;
                     class_4.var_3.y = y;
                     class_4.var_3.scaleX = scale;
                     class_4.var_3.scaleY = scale;
                  }
               }
               else
               {
                  class_4.var_3.x = x;
                  class_4.var_3.y = y;
                  class_4.var_3.scaleX = scale;
                  class_4.var_3.scaleY = scale;
               }
               if(!container.contains(class_4.var_3))
               {
                  container.addChild(class_4.var_3);
               }
               class_4.var_3.gotoAndPlay(1);
               try
               {
                  if(class_4.var_3.getChildByName("nocontainerclip") != null)
                  {
                     MovieClip(Loader(class_4.var_3.getChildByName("nocontainerclip")).content).gotoAndPlay(1);
                  }
               }
               catch(err:Error)
               {
                  class_4.error("Error playing a no-container clip: " + err.message);
               }
            }
         }
         else if(type == class_4.const_4)
         {
            if(class_4.var_4 == null)
            {
               class_4.method_6(class_4.const_4);
            }
            if(class_4.var_4 != null)
            {
               if(class_4.var_69 == null && class_4.data && class_4.data.hasOwnProperty("promo1_usex"))
               {
                  usex = class_4.method_2("promo1_usex");
                  usey = class_4.method_2("promo1_usey");
                  usescale = class_4.method_2("promo1_usescale");
                  if(usex != null && usey != null && usescale != null)
                  {
                     class_4.var_4.x = Number(usex);
                     class_4.var_4.y = Number(usey);
                     class_4.var_4.scaleX = Number(usescale);
                     class_4.var_4.scaleY = Number(usescale);
                  }
                  else
                  {
                     class_4.var_4.x = x;
                     class_4.var_4.y = y;
                     class_4.var_4.scaleX = scale;
                     class_4.var_4.scaleY = scale;
                  }
               }
               else
               {
                  class_4.var_4.x = x;
                  class_4.var_4.y = y;
                  class_4.var_4.scaleX = scale;
                  class_4.var_4.scaleY = scale;
               }
               if(!container.contains(class_4.var_4))
               {
                  container.addChild(class_4.var_4);
               }
               class_4.var_4.gotoAndPlay(1);
               try
               {
                  if(class_4.var_4.getChildByName("nocontainerclip") != null)
                  {
                     MovieClip(Loader(class_4.var_4.getChildByName("nocontainerclip")).content).gotoAndPlay(1);
                  }
               }
               catch(err:Error)
               {
                  class_4.error("Error playing a no-container clip: " + err.message);
               }
            }
         }
         else if(type == class_4.const_5)
         {
            if(class_4.var_5 == null)
            {
               class_4.method_6(class_4.const_5);
            }
            if(class_4.var_5 != null)
            {
               if(class_4.var_67 == null && class_4.data && class_4.data.hasOwnProperty("promo2_usex"))
               {
                  usex = class_4.method_2("promo2_usex");
                  usey = class_4.method_2("promo2_usey");
                  usescale = class_4.method_2("promo2_usescale");
                  if(usex != null && usey != null && usescale != null)
                  {
                     class_4.var_5.x = Number(usex);
                     class_4.var_5.y = Number(usey);
                     class_4.var_5.scaleX = Number(usescale);
                     class_4.var_5.scaleY = Number(usescale);
                  }
                  else
                  {
                     class_4.var_5.x = x;
                     class_4.var_5.y = y;
                     class_4.var_5.scaleX = scale;
                     class_4.var_5.scaleY = scale;
                  }
               }
               else
               {
                  class_4.var_5.x = x;
                  class_4.var_5.y = y;
                  class_4.var_5.scaleX = scale;
                  class_4.var_5.scaleY = scale;
               }
               if(!container.contains(class_4.var_5))
               {
                  container.addChild(class_4.var_5);
               }
               class_4.var_5.gotoAndPlay(1);
               try
               {
                  if(class_4.var_5.getChildByName("nocontainerclip") != null)
                  {
                     MovieClip(Loader(class_4.var_5.getChildByName("nocontainerclip")).content).gotoAndPlay(1);
                  }
               }
               catch(err:Error)
               {
                  class_4.error("Error playing a no-container clip: " + err.message);
               }
            }
         }
      }
      
      public static function method_62() : void
      {
         try
         {
            if(class_4.var_3 != null && class_4.var_3.parent != null)
            {
               class_4.var_3.parent.removeChild(class_4.var_3);
            }
         }
         catch(err:Error)
         {
            class_4.error("Error removing newgame promo: " + err.message);
         }
         try
         {
            if(class_4.var_4 != null && class_4.var_4.parent != null)
            {
               class_4.var_4.parent.removeChild(class_4.var_4);
            }
         }
         catch(err:Error)
         {
            class_4.error("Error removing promo1 promo: " + err.message);
         }
         try
         {
            if(class_4.var_5 != null && class_4.var_5.parent != null)
            {
               class_4.var_5.parent.removeChild(class_4.var_5);
            }
         }
         catch(err:Error)
         {
            class_4.error("Error removing promo2 promo: " + err.message);
         }
      }
      
      public static function method_41() : void
      {
         if(class_4.var_32 == false)
         {
            class_4.loadData(class_4.method_41);
         }
         else if(class_4.var_55 == false)
         {
            class_4.method_1("Load Promo Images");
            class_4.var_6 = class_4.const_6;
            class_4.method_23(class_4.var_6);
         }
      }
      
      private static function method_48(param1:String) : void
      {
         var type:String = param1;
         try
         {
            if(type == class_4.const_6)
            {
               if(class_4.var_15 != null)
               {
                  class_4.var_15.close();
               }
            }
            else if(type == class_4.const_4)
            {
               if(class_4.var_18 != null)
               {
                  class_4.var_18.close();
               }
            }
            else if(type == class_4.const_5)
            {
               if(class_4.var_17 != null)
               {
                  class_4.var_17.close();
               }
            }
         }
         catch(err:Error)
         {
            class_4.error("Error cleaning up failed promo image: " + err.message);
         }
      }
      
      private static function method_23(param1:String) : void
      {
         var url:String = null;
         var type:String = param1;
         if(class_4.var_6 == class_4.const_6)
         {
            url = class_4.method_2("new_image");
         }
         else if(class_4.var_6 == class_4.const_4)
         {
            url = class_4.method_2("promo1_image");
         }
         else if(class_4.var_6 == class_4.const_5)
         {
            url = class_4.method_2("promo2_image");
         }
         if(url != null)
         {
            class_4.method_1("Load Promo Image - " + type);
            if(type == class_4.const_6)
            {
               class_4.var_15 = new Loader();
               class_4.var_15.contentLoaderInfo.addEventListener(Event.INIT,class_4.method_26);
               class_4.var_15.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,class_4.method_29);
               try
               {
                  class_4.var_15.load(new URLRequest(url));
               }
               catch(err:Error)
               {
                  class_4.error("Error loading newgame image: " + err.message);
                  class_4.method_6(class_4.var_6);
                  class_4.method_9();
                  return;
               }
            }
            else if(type == class_4.const_4)
            {
               class_4.var_18 = new Loader();
               class_4.var_18.contentLoaderInfo.addEventListener(Event.INIT,class_4.method_26);
               class_4.var_18.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,class_4.method_29);
               try
               {
                  class_4.var_18.load(new URLRequest(url));
               }
               catch(err:Error)
               {
                  class_4.error("Error loading promo1 image: " + err.message);
                  class_4.method_6(class_4.var_6);
                  class_4.method_9();
                  return;
               }
            }
            else if(type == class_4.const_5)
            {
               class_4.var_17 = new Loader();
               class_4.var_17.contentLoaderInfo.addEventListener(Event.INIT,class_4.method_26);
               class_4.var_17.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,class_4.method_29);
               try
               {
                  class_4.var_17.load(new URLRequest(url));
               }
               catch(err:Error)
               {
                  class_4.error("Error loading promo 2 image: " + err.message);
                  class_4.method_6(class_4.var_6);
                  class_4.method_9();
                  return;
               }
            }
            if(class_4.var_19 == null)
            {
               class_4.var_19 = new Timer(class_4.var_63 * 1000,1);
               class_4.var_19.addEventListener(TimerEvent.TIMER,class_4.method_54);
            }
            else
            {
               class_4.var_19.reset();
            }
            class_4.var_19.start();
         }
         else
         {
            class_4.error("Promo URL was null.");
            class_4.method_6(class_4.var_6);
            class_4.method_9();
         }
      }
      
      private static function method_9() : void
      {
         class_4.method_1("Load Next Image");
         if(class_4.var_55 == false)
         {
            if(class_4.var_6 == class_4.const_6)
            {
               class_4.var_6 = class_4.const_4;
               class_4.method_23(class_4.const_4);
            }
            else if(class_4.var_6 == class_4.const_4)
            {
               class_4.var_6 = class_4.const_5;
               class_4.method_23(class_4.const_5);
            }
            else
            {
               class_4.method_1("Promos Finished Loading.");
               class_4.var_55 = true;
            }
         }
      }
      
      private static function method_6(param1:String) : void
      {
         var img1:MovieClip = null;
         var url1:String = null;
         var img2:MovieClip = null;
         var url2:String = null;
         var img3:MovieClip = null;
         var url3:String = null;
         var type:String = param1;
         class_4.method_1("Create Default Promo: " + type);
         class_4.method_10();
         class_4.method_48(type);
         if(type == class_4.const_6 && class_4.var_3 == null)
         {
            class_4.var_3 = new fliplinead_promobutton_clip();
            class_4.var_64 = class_4.var_3;
            img1 = new failsafe_promo_newgame();
            class_4.var_3.inside.holder.addChild(img1);
            url1 = class_4.var_62;
            if(url1 != null && url1 != "")
            {
               class_4.var_3.inside.btn.addEventListener(MouseEvent.MOUSE_DOWN,function f7(param1:MouseEvent = null):void
               {
                  if(!_loc2_)
                  {
                     navigateToURL(new URLRequest(url1),"_blank");
                  }
               });
            }
         }
         else if(type == class_4.const_4 && class_4.var_4 == null)
         {
            class_4.var_4 = new fliplinead_promobutton_clip();
            class_4.var_69 = class_4.var_4;
            img2 = new failsafe_promo_promo1();
            class_4.var_4.inside.holder.addChild(img2);
            url2 = class_4.var_71;
            if(url2 != null && url2 != "")
            {
               class_4.var_4.inside.btn.addEventListener(MouseEvent.MOUSE_DOWN,function f8(param1:MouseEvent = null):void
               {
                  if(!_loc2_)
                  {
                     navigateToURL(new URLRequest(url2),"_blank");
                  }
               });
            }
         }
         else if(type == class_4.const_5 && class_4.var_5 == null)
         {
            class_4.var_5 = new fliplinead_promobutton_clip();
            class_4.var_67 = class_4.var_5;
            img3 = new failsafe_promo_promo2();
            class_4.var_5.inside.holder.addChild(img3);
            url3 = class_4.var_76;
            if(url3 != null && url3 != "")
            {
               class_4.var_5.inside.btn.addEventListener(MouseEvent.MOUSE_DOWN,function f9(param1:MouseEvent = null):void
               {
                  if(!_loc2_)
                  {
                     navigateToURL(new URLRequest(url3),"_blank");
                  }
               });
            }
         }
      }
      
      private static function method_26(param1:Event) : void
      {
         var useContainer:String;
         var useLink:String;
         var linkURL:String = null;
         var e:Event = param1;
         class_4.method_1("Promo Image Loaded - " + class_4.var_6);
         if(class_4.var_19 != null)
         {
            class_4.var_19.reset();
         }
         useContainer = null;
         useLink = null;
         linkURL = null;
         if(class_4.var_6 == class_4.const_6)
         {
            useContainer = class_4.method_2("new_usecont");
            useLink = class_4.method_2("new_uselink");
            linkURL = class_4.method_2("new_link");
         }
         else if(class_4.var_6 == class_4.const_4)
         {
            useContainer = class_4.method_2("promo1_usecont");
            useLink = class_4.method_2("promo1_uselink");
            linkURL = class_4.method_2("promo1_link");
         }
         else if(class_4.var_6 == class_4.const_5)
         {
            useContainer = class_4.method_2("promo2_usecont");
            useLink = class_4.method_2("promo2_uselink");
            linkURL = class_4.method_2("promo2_link");
         }
         if(useContainer == "false")
         {
            if(class_4.var_6 == class_4.const_6 && class_4.var_3 == null)
            {
               class_4.var_3 = new MovieClip();
               class_4.var_3.addChild(class_4.var_15);
               class_4.var_15.name = "nocontainerclip";
               if(useLink == "true" && linkURL != "" && linkURL != null)
               {
                  class_4.var_3.addEventListener(MouseEvent.MOUSE_DOWN,function f1(param1:MouseEvent = null):void
                  {
                     if(!_loc3_)
                     {
                        navigateToURL(new URLRequest(linkURL),"_blank");
                     }
                  });
                  class_4.var_3.buttonMode = true;
                  class_4.var_3.useHandCursor = true;
               }
            }
            else if(class_4.var_6 == class_4.const_4 && class_4.var_4 == null)
            {
               class_4.var_4 = new MovieClip();
               class_4.var_4.addChild(class_4.var_18);
               class_4.var_18.name = "nocontainerclip";
               if(useLink == "true" && linkURL != "" && linkURL != null)
               {
                  class_4.var_4.addEventListener(MouseEvent.MOUSE_DOWN,function f2(param1:MouseEvent = null):void
                  {
                     if(!_loc3_)
                     {
                        navigateToURL(new URLRequest(linkURL),"_blank");
                     }
                  });
                  class_4.var_4.buttonMode = true;
                  class_4.var_4.useHandCursor = true;
               }
            }
            else if(class_4.var_6 == class_4.const_5 && class_4.var_5 == null)
            {
               class_4.var_5 = new MovieClip();
               class_4.var_5.addChild(class_4.var_17);
               class_4.var_17.name = "nocontainerclip";
               if(useLink == "true" && linkURL != "" && linkURL != null)
               {
                  class_4.var_5.addEventListener(MouseEvent.MOUSE_DOWN,function f3(param1:MouseEvent = null):void
                  {
                     if(!_loc2_)
                     {
                        navigateToURL(new URLRequest(linkURL),"_blank");
                     }
                  });
                  class_4.var_5.buttonMode = true;
                  class_4.var_5.useHandCursor = true;
               }
            }
         }
         else if(class_4.var_6 == class_4.const_6 && class_4.var_3 == null)
         {
            class_4.var_3 = new fliplinead_promobutton_clip();
            class_4.var_3.inside.holder.addChild(class_4.var_15);
            if(useLink == "true" && linkURL != "" && linkURL != null)
            {
               class_4.var_3.inside.btn.addEventListener(MouseEvent.MOUSE_DOWN,function f4(param1:MouseEvent = null):void
               {
                  if(!_loc3_)
                  {
                     navigateToURL(new URLRequest(linkURL),"_blank");
                  }
               });
            }
            else
            {
               class_4.var_3.inside.btn.mouseEnabled = false;
            }
            try
            {
               if(class_4.var_15.content is Bitmap)
               {
                  Bitmap(class_4.var_15.content).smoothing = true;
               }
            }
            catch(err:Error)
            {
               class_4.error("Error smoothing newgame content: " + err.message);
            }
         }
         else if(class_4.var_6 == class_4.const_4 && class_4.var_4 == null)
         {
            class_4.var_4 = new fliplinead_promobutton_clip();
            class_4.var_4.inside.holder.addChild(class_4.var_18);
            if(useLink == "true" && linkURL != "" && linkURL != null)
            {
               class_4.var_4.inside.btn.addEventListener(MouseEvent.MOUSE_DOWN,function f5(param1:MouseEvent = null):void
               {
                  if(!_loc3_)
                  {
                     navigateToURL(new URLRequest(linkURL),"_blank");
                  }
               });
            }
            else
            {
               class_4.var_4.inside.btn.mouseEnabled = false;
            }
            try
            {
               if(class_4.var_18.content is Bitmap)
               {
                  Bitmap(class_4.var_18.content).smoothing = true;
               }
            }
            catch(err:Error)
            {
               class_4.error("Error smoothing promo1 content: " + err.message);
            }
         }
         else if(class_4.var_6 == class_4.const_5 && class_4.var_5 == null)
         {
            class_4.var_5 = new fliplinead_promobutton_clip();
            class_4.var_5.inside.holder.addChild(class_4.var_17);
            if(useLink == "true" && linkURL != "" && linkURL != null)
            {
               class_4.var_5.inside.btn.addEventListener(MouseEvent.MOUSE_DOWN,function f6(param1:MouseEvent = null):void
               {
                  if(!_loc2_)
                  {
                     navigateToURL(new URLRequest(linkURL),"_blank");
                  }
               });
            }
            else
            {
               class_4.var_5.inside.btn.mouseEnabled = false;
            }
            try
            {
               if(class_4.var_17.content is Bitmap)
               {
                  Bitmap(class_4.var_17.content).smoothing = true;
               }
            }
            catch(err:Error)
            {
               class_4.error("Error smoothing promo2 content: " + err.message);
            }
         }
         class_4.method_9();
      }
      
      private static function method_29(param1:IOErrorEvent = null) : void
      {
         if(param1 != null)
         {
            class_4.error("Load Promo Image IO Error: " + param1.text);
         }
         if(class_4.var_19 != null)
         {
            class_4.var_19.reset();
         }
         class_4.method_6(class_4.var_6);
         class_4.method_9();
      }
      
      private static function method_54(param1:TimerEvent) : void
      {
         var e:TimerEvent = param1;
         class_4.error("Button Image Timeout - " + class_4.var_6);
         if(class_4.var_19 != null)
         {
            class_4.var_19.reset();
         }
         try
         {
            if(class_4.var_6 == class_4.const_6)
            {
               if(class_4.var_15 != null)
               {
                  class_4.var_15.close();
               }
            }
            else if(class_4.var_6 == class_4.const_4)
            {
               if(class_4.var_18 != null)
               {
                  class_4.var_18.close();
               }
            }
            else if(class_4.var_6 == class_4.const_5)
            {
               if(class_4.var_17 != null)
               {
                  class_4.var_17.close();
               }
            }
         }
         catch(err:Error)
         {
            class_4.error("Error Closing Loader for Button Timeout: " + err.message);
         }
         class_4.method_6(class_4.var_6);
         class_4.method_9();
      }
      
      public static function method_79(param1:MovieClip, param2:Number, param3:Number, param4:Number) : void
      {
         if(class_4.var_26 == true)
         {
            if(class_4.var_10 == null && class_4.var_38 != null && class_4.var_60 != null)
            {
               class_4.var_10 = new fliplinead_versionbox();
               class_4.var_10.version_txt.text = class_4.var_38;
               if(class_4.method_45(var_38,var_60))
               {
                  class_4.var_10.gotoAndStop(2);
                  class_4.var_10.update_btn.mouseEnabled = true;
               }
               else
               {
                  class_4.var_10.gotoAndStop(1);
                  class_4.var_10.update_btn.mouseEnabled = false;
               }
               class_4.var_10.update_btn.addEventListener(MouseEvent.MOUSE_DOWN,class_4.method_46);
            }
            if(class_4.var_10 != null)
            {
               param1.addChild(class_4.var_10);
               class_4.var_10.x = param2;
               class_4.var_10.y = param4;
               class_4.var_35 = param3;
               if(class_4.var_10.hasEventListener(Event.ENTER_FRAME) == false)
               {
                  class_4.var_10.addEventListener(Event.ENTER_FRAME,class_4.method_35);
               }
            }
         }
      }
      
      private static function method_35(param1:Event) : void
      {
         if(class_4.var_10.y != class_4.var_35)
         {
            class_4.var_10.y += (class_4.var_35 - class_4.var_10.y) / 4;
            if(Math.abs(class_4.var_35 - class_4.var_10.y) <= 1)
            {
               class_4.var_10.y = class_4.var_35;
            }
         }
      }
      
      private static function method_45(param1:String, param2:String) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:Array = param1.split(".");
         var _loc5_:Array = param2.split(".");
         var _loc6_:Number = 0;
         var _loc7_:Number = 0;
         _loc3_ = 0;
         while(_loc3_ < _loc4_.length)
         {
            if(_loc3_ == 0)
            {
               _loc6_ += Number(_loc4_[_loc3_]) * 1000000;
            }
            else if(_loc3_ == 1)
            {
               _loc6_ += Number(_loc4_[_loc3_]) * 1000;
            }
            else if(_loc3_ == 2)
            {
               _loc6_ += Number(_loc4_[_loc3_]);
            }
            else if(_loc3_ == 3)
            {
               _loc6_ += Number(_loc4_[_loc3_]) / 1000;
            }
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < _loc5_.length)
         {
            if(_loc3_ == 0)
            {
               _loc7_ += Number(_loc5_[_loc3_]) * 1000000;
            }
            else if(_loc3_ == 1)
            {
               _loc7_ += Number(_loc5_[_loc3_]) * 1000;
            }
            else if(_loc3_ == 2)
            {
               _loc7_ += Number(_loc5_[_loc3_]);
            }
            else if(_loc3_ == 3)
            {
               _loc7_ += Number(_loc5_[_loc3_]) / 1000;
            }
            _loc3_++;
         }
         class_4.method_1("Current Version: " + _loc6_ + ", Latest Version: " + _loc7_);
         if(isNaN(_loc6_) || isNaN(_loc7_))
         {
            if(param1 != param2)
            {
               return true;
            }
            return false;
         }
         if(_loc7_ > _loc6_)
         {
            return true;
         }
         return false;
      }
      
      private static function method_46(param1:MouseEvent = null) : void
      {
         var e:MouseEvent = param1;
         class_4.method_1("Click Update");
         if(class_4.var_28 != null)
         {
            if(class_4.var_13 == null)
            {
               class_4.var_13 = new fliplinead_versionpopup();
               class_4.var_13.x = class_4.var_11 / 2;
               class_4.var_13.y = class_4.var_14 / 2;
               class_4.var_13.close_btn.addEventListener(MouseEvent.MOUSE_DOWN,class_4.method_37);
               class_4.var_13.link_btn.addEventListener(MouseEvent.MOUSE_DOWN,function func(param1:MouseEvent = null):void
               {
                  if(!_loc2_)
                  {
                     navigateToURL(new URLRequest("http://www.flipline.com/freegames.html"),"_blank");
                  }
               });
               class_4.var_13.graphics.beginFill(0,0.4);
               class_4.var_13.graphics.drawRect(0 - class_4.var_11 / 2,0 - class_4.var_14 / 2,class_4.var_11,class_4.var_14);
               class_4.var_13.graphics.endFill();
            }
            if(!class_4.var_28.contains(class_4.var_13))
            {
               class_4.var_28.addChild(class_4.var_13);
            }
         }
      }
      
      private static function method_37(param1:MouseEvent = null) : void
      {
         if(class_4.var_13 != null)
         {
            if(class_4.var_13.parent != null)
            {
               class_4.var_13.parent.removeChild(class_4.var_13);
            }
         }
      }
      
      public static function method_99() : void
      {
         if(class_4.var_10 != null)
         {
            if(class_4.var_10.parent != null)
            {
               class_4.var_10.parent.removeChild(class_4.var_10);
            }
            class_4.var_10.removeEventListener(Event.ENTER_FRAME,class_4.method_35);
         }
         class_4.method_37();
      }
      
      private static function method_1(param1:String) : void
      {
         trace(getTimer() + " [AS] " + param1);
      }
      
      private static function error(param1:String) : void
      {
         trace(getTimer() + " [AS] [ERROR] " + param1);
      }
      
      private static function method_14(param1:String) : String
      {
         var _loc2_:String = "";
         var _loc3_:Array = class_4.method_4(param1);
         try
         {
            _loc2_ = String(_loc3_[0]);
         }
         catch(err:Error)
         {
         }
         return _loc2_;
      }
      
      private static function method_4(param1:String) : Array
      {
         var _loc2_:Array = [];
         4;
         var _loc4_:String = "";
         var _loc5_:Number = 0;
         var _loc6_:Number = 0;
         var _loc7_:String = "";
         var _loc8_:Number = 0;
         var _loc9_:String = "";
         var _loc10_:int = 0;
         while(_loc10_ < param1.length)
         {
            if(_loc4_.length == 0 && _loc8_ == 0)
            {
               if(_loc5_ == 0)
               {
                  _loc5_ = Number(param1.charAt(_loc10_));
                  _loc6_ = _loc10_;
               }
               else if(_loc8_ == 0)
               {
                  if(_loc10_ <= _loc5_ + _loc6_)
                  {
                     _loc7_ += param1.charAt(_loc10_);
                     if(_loc10_ == _loc5_ + _loc6_)
                     {
                        _loc8_ = Number(_loc7_);
                     }
                  }
               }
            }
            else if(_loc10_ <= _loc6_ + _loc5_ + _loc8_ * 4)
            {
               if((_loc9_ += param1.charAt(_loc10_)).length == 4)
               {
                  _loc4_ += String.fromCharCode(Number(_loc9_) + 4);
                  _loc9_ = "";
               }
               if(_loc10_ == _loc6_ + _loc5_ + _loc8_ * 4)
               {
                  _loc2_.push(_loc4_);
                  _loc4_ = "";
                  _loc5_ = 0;
                  _loc6_ = 0;
                  _loc7_ = "";
                  _loc8_ = 0;
                  _loc9_ = "";
               }
            }
            _loc10_++;
         }
         return _loc2_;
      }
      
      private static function method_10(param1:Boolean = false) : void
      {
         if(class_4.var_20 == null)
         {
            class_4.var_20 = new fliplinead_failsafealert();
         }
         class_4.var_20.x = 0;
         class_4.var_20.y = class_4.var_14;
         if(class_4.var_28 != null)
         {
            if(!class_4.var_28.contains(class_4.var_20))
            {
               class_4.var_28.addChild(class_4.var_20);
            }
         }
         else if(class_4.var_30 != null)
         {
            if(!class_4.var_30.contains(class_4.var_20))
            {
               class_4.var_30.addChild(class_4.var_20);
            }
         }
         if(param1 || class_4.var_32 == true && class_4.var_26 == false)
         {
            class_4.var_20.gotoAndPlay(50);
         }
         else
         {
            class_4.var_20.gotoAndPlay(1);
         }
      }
   }
}
