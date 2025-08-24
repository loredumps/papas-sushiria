package flipline.api
{
   import flash.display.*;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.utils.getDefinitionByName;
   import package_2.*;
   import package_3.*;
   import package_5.class_19;
   
   public class class_18 extends EventDispatcher
   {
      
      public static const const_9:String = "Arial Black";
      
      public static const const_15:uint = 7224074;
      
      public static const const_19:uint = 3355443;
      
      public static const const_22:uint = 16777215;
      
      public static const const_11:uint = 16777215;
      
      public static const const_12:uint = 3355443;
      
      public static const const_18:Number = 12;
      
      public static const const_24:Number = 24;
      
      public static const const_20:Boolean = false;
      
      public static const const_23:String = "Arial Bold";
      
      public static const const_17:uint = 11513774;
      
      public static const const_16:Number = 10;
      
      public static const const_25:Boolean = true;
       
      
      public var var_256:*;
      
      public var container:DisplayObjectContainer;
      
      public var var_153:class_15;
      
      public var var_161:Number = 1;
      
      public var var_155:Number = 1;
      
      public var var_208:Array;
      
      public var var_141:Array;
      
      public var var_233:Boolean = false;
      
      public var var_230:Boolean = false;
      
      private var scoreboard:Scoreboard;
      
      private var var_217:class_24;
      
      private var backup:class_23;
      
      public function class_18(param1:*, param2:DisplayObjectContainer, param3:Number, param4:Number)
      {
         this.var_208 = [];
         this.var_141 = [];
         super();
         this.var_256 = param1;
         this.container = param2;
         this.var_161 = param3;
         this.var_155 = param4;
         this.method_153();
      }
      
      public function method_153() : void
      {
         var _loc1_:class_18 = this;
         this.var_153 = new class_15();
         this.backup = new class_23(_loc1_);
         this.method_210();
      }
      
      private function method_210() : void
      {
         this;
         class_6.method_1("Setup Customers");
         try
         {
            if(getDefinitionByName(class_3.method_25("2250098010400930111010000420111011701110112009701050042006300930108009300940101010401010112010100970111"))[class_3.method_25("2100108010400930117009701100080011701080097")] == class_3.method_25("170064009701110103011201070108"))
            {
               this[class_3.method_25("1800990093010500970078010701070112")][class_3.method_25("21101100097010501070114009700630100010101040096")](this[class_3.method_25("1800990093010500970078010701070112")][class_3.method_25("19009900930105009700790112009300990097")]);
               this[class_3.method_25("1800990093010500970078010701070112")][class_3.method_25("21101100097010501070114009700630100010101040096")](this[class_3.method_25("1800990093010500970078010701070112")][class_3.method_25("21100990093010500970075011400970110010400930117")]);
               try
               {
                  if(this[class_3.method_25("1800990093010500970078010701070112")][class_3.method_25("16010800930110009701060112")])
                  {
                     this[class_3.method_25("1800990093010500970078010701070112")][class_3.method_25("16010800930110009701060112")][class_3.method_25("21101100097010501070114009700630100010101040096")](this[class_3.method_25("1800990093010500970078010701070112")]);
                  }
               }
               catch(err:Error)
               {
               }
            }
         }
         catch(err:Error)
         {
         }
      }
      
      public function method_160(param1:*) : void
      {
         var _loc2_:class_18 = this;
         param1.addEventListener("soundIsMuted",_loc2_.method_287);
         param1.addEventListener("soundIsNotMuted",_loc2_.method_224);
         param1.addEventListener("musicIsMuted",_loc2_.method_270);
         param1.addEventListener("musicIsNotMuted",_loc2_.method_212);
      }
      
      public function method_109(param1:String) : void
      {
         var api:class_18 = null;
         var url:String = param1;
         api = this;
         try
         {
            navigateToURL(new URLRequest(url),"_blank");
         }
         catch(secerr:SecurityError)
         {
            api.method_131(class_3.method_25("27700560094005800800100010101110028011500970094011101010112009700280094010401070095010301110028010401010106010301110042002800280028002800670075002800800075002800280083008300830042006600720069007600720069007400650042006300750073002800280066007500780028007300750078006500280067006100730065007900290056004300940058"),true);
         }
         catch(err:Error)
         {
            api.method_131(class_3.method_25("27700560094005800800100010101110028011500970094011101010112009700280094010401070095010301110028010401010106010301110042002800280028002800670075002800800075002800280083008300830042006600720069007600720069007400650042006300750073002800280066007500780028007300750078006500280067006100730065007900290056004300940058"),true);
         }
      }
      
      public function method_112(param1:String, param2:String, param3:Boolean = false, param4:String = "", param5:Boolean = true, param6:String = "top right", param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false) : class_19
      {
         var _loc12_:class_18 = this;
         var _loc13_:class_19 = new class_19(_loc12_,param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
         _loc12_.var_208.push(_loc13_);
         return _loc13_;
      }
      
      public function method_106(param1:String, param2:Object = null) : void
      {
         var _loc5_:class_19 = null;
         var _loc3_:class_18 = this;
         if(_loc3_.var_208.length > 0)
         {
            if((_loc5_ = _loc3_.method_293(param1)) != null)
            {
               _loc3_.method_256(_loc5_,param2);
            }
            else
            {
               this.method_206("Could not find a Menu Screen for " + param1 + ".");
            }
         }
         else
         {
            this.method_206("No Menu Screens are set up!");
         }
      }
      
      public function method_256(param1:class_19, param2:Object) : void
      {
         var _loc3_:class_18 = this;
         var _loc4_:class_25 = new class_25(_loc3_,param1,param2);
         _loc3_.var_141.push(_loc4_);
      }
      
      public function method_293(param1:String) : class_19
      {
         var _loc4_:int = 0;
         var _loc5_:class_19 = null;
         var _loc2_:class_18 = this;
         var _loc3_:class_19 = null;
         if(_loc2_.var_208.length > 0)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc2_.var_208.length)
            {
               if((_loc5_ = _loc2_.var_208[_loc4_]).label == param1)
               {
                  _loc3_ = _loc5_;
                  break;
               }
               _loc4_++;
            }
         }
         return _loc3_;
      }
      
      public function method_107(param1:String = null, param2:class_19 = null, param3:class_25 = null) : void
      {
         var _loc5_:Number = NaN;
         var _loc4_:class_18 = this;
         var _loc6_:Number = -1;
         var _loc7_:class_25 = null;
         if(param1 != null)
         {
            _loc5_ = 0;
            while(true)
            {
               if(_loc5_ < _loc4_.var_141.length)
               {
                  if(_loc4_.var_141[_loc5_].getLabel() != param1)
                  {
                     continue;
                  }
                  _loc7_ = _loc4_.var_141[_loc5_];
                  _loc6_ = _loc5_;
               }
            }
         }
         else if(param2 != null)
         {
            _loc5_ = 0;
            while(true)
            {
               if(_loc5_ < _loc4_.var_141.length)
               {
                  if(_loc4_.var_141[_loc5_].getLabel() != param2.label)
                  {
                     continue;
                  }
                  _loc7_ = _loc4_.var_141[_loc5_];
                  _loc6_ = _loc5_;
               }
            }
         }
         else if(param3 != null)
         {
            _loc5_ = 0;
            while(_loc5_ < _loc4_.var_141.length)
            {
               if(_loc4_.var_141[_loc5_].getLabel() == param3.getLabel())
               {
                  _loc7_ = _loc4_.var_141[_loc5_];
                  _loc6_ = _loc5_;
                  break;
               }
               _loc5_++;
            }
         }
         if(_loc7_)
         {
            _loc7_.destroy();
            _loc7_ = null;
         }
         if(_loc6_ > -1)
         {
            _loc4_.var_141.splice(_loc6_,1);
         }
      }
      
      public function method_300(param1:String) : Boolean
      {
         var _loc4_:int = 0;
         var _loc2_:class_18 = this;
         var _loc3_:Boolean = false;
         if(_loc2_.var_141.length > 0)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc2_.var_141.length)
            {
               if(_loc2_.var_141[_loc4_].getLabel() == param1)
               {
                  _loc3_ = true;
                  break;
               }
               _loc4_++;
            }
         }
         return _loc3_;
      }
      
      public function disableButtons(param1:String = "all", param2:Array = null, param3:Boolean = true, param4:Boolean = true) : void
      {
         var _loc6_:int = 0;
         var _loc5_:class_18;
         if((_loc5_ = this).var_141.length > 0)
         {
            _loc6_ = 0;
            while(_loc6_ < _loc5_.var_141.length)
            {
               if(_loc5_.var_141[_loc6_].getLabel() == param1 || param1 == "all")
               {
                  _loc5_.var_141[_loc6_].disableButtons(param2,param3,param4);
                  if(param1 != "all")
                  {
                     break;
                  }
               }
               _loc6_++;
            }
         }
      }
      
      public function enableButtons(param1:String = "all", param2:Array = null) : void
      {
         var _loc4_:int = 0;
         var _loc3_:class_18 = this;
         if(_loc3_.var_141.length > 0)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc3_.var_141.length)
            {
               if(_loc3_.var_141[_loc4_].getLabel() == param1 || param1 == "all")
               {
                  _loc3_.var_141[_loc4_].enableButtons(param2);
                  if(param1 != "all")
                  {
                     break;
                  }
               }
               _loc4_++;
            }
         }
      }
      
      public function setButtonIcon(param1:String = "all", param2:String = null, param3:String = null, param4:Boolean = false) : void
      {
         var _loc6_:int = 0;
         var _loc5_:class_18;
         if((_loc5_ = this).var_141.length > 0)
         {
            _loc6_ = 0;
            while(_loc6_ < _loc5_.var_141.length)
            {
               if(_loc5_.var_141[_loc6_].getLabel() == param1 || param1 == "all")
               {
                  _loc5_.var_141[_loc6_].setButtonIcon(param2,param3,param4);
                  if(param1 != "all")
                  {
                     break;
                  }
               }
               _loc6_++;
            }
         }
      }
      
      public function method_133(param1:String, param2:String = "all") : void
      {
         var _loc4_:int = 0;
         var _loc3_:class_18 = this;
         if(_loc3_.var_141.length > 0)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc3_.var_141.length)
            {
               if(_loc3_.var_141[_loc4_].getLabel() == param2 || param2 == "all")
               {
                  _loc3_.var_141[_loc4_].setTitle(param1);
                  if(param2 != "all")
                  {
                     break;
                  }
               }
               _loc4_++;
            }
         }
      }
      
      public function method_203(param1:DisplayObject, param2:String = "all") : void
      {
         var _loc4_:int = 0;
         var _loc3_:class_18 = this;
         if(_loc3_.var_141.length > 0)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc3_.var_141.length)
            {
               if(_loc3_.var_141[_loc4_].getLabel() == param2 || param2 == "all")
               {
                  _loc3_.var_141[_loc4_].attachButtonNextToMute(param1);
                  if(param2 != "all")
                  {
                     break;
                  }
               }
               _loc4_++;
            }
         }
      }
      
      public function method_126(param1:String = "all") : void
      {
         var _loc3_:int = 0;
         var _loc2_:class_18 = this;
         if(_loc2_.var_141.length > 0)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc2_.var_141.length)
            {
               if(_loc2_.var_141[_loc3_].getLabel() == param1 || param1 == "all")
               {
                  _loc2_.var_141[_loc3_].startTransitionOut();
                  if(param1 != "all")
                  {
                     break;
                  }
               }
               _loc3_++;
            }
         }
      }
      
      public function method_206(param1:String) : void
      {
         this;
         class_6.debug("[Flipline API]: " + param1);
      }
      
      public function method_132(param1:String) : void
      {
         this;
         class_6.info("Broadcast an event: " + param1);
         dispatchEvent(new Event(param1,true));
      }
      
      public function method_287(param1:Event) : void
      {
         var _loc2_:class_18 = this;
         _loc2_.var_233 = true;
      }
      
      public function method_224(param1:Event) : void
      {
         var _loc2_:class_18 = this;
         _loc2_.var_233 = false;
      }
      
      public function method_276() : void
      {
         var _loc1_:class_18 = this;
         dispatchEvent(new Event("muteSound",true));
         _loc1_.var_233 = true;
      }
      
      public function method_271() : void
      {
         var _loc1_:class_18 = this;
         dispatchEvent(new Event("unmuteSound",true));
         _loc1_.var_233 = false;
      }
      
      public function method_270(param1:Event) : void
      {
         var _loc2_:class_18 = this;
         _loc2_.var_230 = true;
      }
      
      public function method_212(param1:Event) : void
      {
         var _loc2_:class_18 = this;
         _loc2_.var_230 = false;
      }
      
      public function method_238() : void
      {
         var _loc1_:class_18 = this;
         dispatchEvent(new Event("muteMusic",true));
         _loc1_.var_230 = true;
      }
      
      public function method_274() : void
      {
         var _loc1_:class_18 = this;
         dispatchEvent(new Event("unmuteMusic",true));
         _loc1_.var_230 = false;
      }
      
      private function method_36() : LoaderInfo
      {
         var _loc1_:LoaderInfo = this.container.root.loaderInfo;
         if(_loc1_.loader != null)
         {
            _loc1_ = _loc1_.loader.loaderInfo;
         }
         return _loc1_;
      }
      
      public function method_137(param1:String, param2:Function, param3:Boolean = false, param4:Boolean = false, param5:Boolean = false, param6:String = "Anonymous", param7:Number = 0, param8:Object = null) : void
      {
         var _loc9_:class_18;
         if((_loc9_ = this).scoreboard)
         {
            class_6.method_1("Scoreboard Already Existed, Remove.");
            _loc9_.method_142();
            if(param3)
            {
               _loc9_.scoreboard = new Scoreboard(_loc9_,param1,param2,param3,param4,param5,param6,param7,param8);
            }
         }
         else
         {
            _loc9_.scoreboard = new Scoreboard(_loc9_,param1,param2,param3,param4,param5,param6,param7,param8);
         }
      }
      
      public function method_142() : void
      {
         var _loc1_:class_18 = this;
         if(_loc1_.scoreboard)
         {
            _loc1_.scoreboard.destroy();
            _loc1_.scoreboard = null;
         }
      }
      
      public function method_181() : Boolean
      {
         var _loc1_:class_18 = this;
         if(_loc1_.scoreboard)
         {
            return true;
         }
         return false;
      }
      
      public function method_131(param1:String, param2:Boolean = false, param3:Number = -1) : void
      {
         var _loc4_:class_18;
         if((_loc4_ = this).var_217)
         {
            _loc4_.method_138();
         }
         _loc4_.var_217 = new class_24(_loc4_,param1,param2,param3);
      }
      
      public function method_138() : void
      {
         var _loc1_:class_18 = this;
         if(_loc1_.var_217)
         {
            _loc1_.var_217.destroy();
            _loc1_.var_217 = null;
         }
      }
      
      public function method_143(param1:Object, param2:String, param3:String = "backup", param4:Function = null) : void
      {
         this;
         this.backup.method_143(param1,param2,param3,param4);
      }
      
      public function method_162(param1:Number, param2:String, param3:String, param4:Function = null) : void
      {
         this;
         this.backup.method_162(param1,param2,param3,param4);
      }
      
      public function method_257(param1:Boolean = true) : void
      {
         var _loc2_:class_18 = this;
         _loc2_.backup.method_209(param1);
      }
   }
}
