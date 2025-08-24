package package_2
{
   import flash.display.LoaderInfo;
   
   public class class_3
   {
      
      private static var var_54:Array = [];
      
      private static var var_47:Array = [];
      
      private static var var_49:Array = [];
      
      private static var var_45:Array = [];
      
      private static var var_51:Array = [];
      
      private static var var_57:Array = [];
      
      private static var var_59:Array = [];
      
      private static var var_98:String = "235009801010104009700540043004300430072012000430067009301050097011100430072010100950097010601110097003300460044007900930106009600940107011600432350098010101040097005400430043004300720054004300670093010500970111004300720101009500970106011100970033004600440079009301060096009401070116004323300980101010400970054004300430043007200540043006700930105009701110043007201010095009701060111009700280079009301060096009401070116004322900980101010400970054004300430043006401200043007201010095009701060111009700330046004400790093010600960094010701160043229009801010104009700540043004300430064005400430072010100950097010601110097003300460044007900930106009600940107011600432270098010101040097005400430043004300640054004300720101009500970106011100970028007900930106009600940107011600432290098010101040097005400430043004300700120004300720101009500970106011100970033004600440079009301060096009401070116004322900980101010400970054004300430043007000540043007201010095009701060111009700330046004400790093010600960094010701160043227009801010104009700540043004300430070005400430072010100950097010601110097002800790093010600960094010701160043";
      
      private static var var_86:String = "235009801010104009700540043004300430072012000430067009301050097011100430079010801070106011101070110003300460044007900930106009600940107011600432350098010101040097005400430043004300720054004300670093010500970111004300790108010701060111010701100033004600440079009301060096009401070116004323300980101010400970054004300430043007200540043006700930105009701110043007901080107010601110107011000280079009301060096009401070116004322900980101010400970054004300430043006401200043007901080107010601110107011000330046004400790093010600960094010701160043229009801010104009700540043004300430064005400430079010801070106011101070110003300460044007900930106009600940107011600432270098010101040097005400430043004300640054004300790108010701060111010701100028007900930106009600940107011600432290098010101040097005400430043004300700120004300790108010701060111010701100033004600440079009301060096009401070116004322900980101010400970054004300430043007000540043007901080107010601110107011000330046004400790093010600960094010701160043227009801010104009700540043004300430070005400430079010801070106011101070110002800790093010600960094010701160043";
      
      private static var var_81:String = "21401030107010600990110009700990093011200970042009501070105";
      
      private static var var_50:Array = [];
      
      private static var var_52:Array = [];
      
      private static var var_53:Array = [];
      
      private static var var_74:Boolean = false;
      
      private static var var_68:Boolean = false;
      
      private static var var_56:Boolean = false;
      
      private static var loaderInfo:LoaderInfo = null;
       
      
      public function class_3()
      {
         super();
      }
      
      public static function method_59(param1:LoaderInfo, param2:String, param3:String, param4:String, param5:String, param6:String, param7:String, param8:String, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false) : void
      {
         class_3.loaderInfo = param1;
         class_3.var_54 = class_3.method_4(param2);
         class_3.var_47 = class_3.method_4(param3);
         class_3.var_49 = class_3.method_4(param4);
         class_3.var_45 = class_3.method_4(param5);
         class_3.var_51 = class_3.method_4(param6);
         class_3.var_57 = class_3.method_4(param7);
         class_3.var_59 = class_3.method_4(class_3.var_81);
         class_3.var_53 = class_3.method_4(param8);
         class_3.var_50 = class_3.method_4(class_3.var_98);
         class_3.var_52 = class_3.method_4(class_3.var_86);
         class_3.var_74 = param9;
         class_3.var_68 = param10;
         class_3.var_56 = param11;
      }
      
      public static function method_36() : LoaderInfo
      {
         return class_3.loaderInfo;
      }
      
      private static function method_8(param1:String) : Boolean
      {
         var _loc2_:Boolean = false;
         var _loc3_:String = class_3.method_50();
         var _loc4_:int;
         if((_loc4_ = _loc3_.indexOf(param1)) != -1 && _loc4_ == _loc3_.length - param1.length && (_loc4_ == 0 || _loc3_.charAt(_loc4_ - 1) == "."))
         {
            _loc2_ = true;
         }
         return _loc2_;
      }
      
      private static function method_50() : String
      {
         var _loc1_:String = "???";
         if(class_3.loaderInfo == null)
         {
            _loc1_ = "UNKNOWN";
         }
         else
         {
            _loc1_ = String(class_3.loaderInfo.url.split("/")[2]);
         }
         return _loc1_;
      }
      
      private static function method_24() : String
      {
         var _loc1_:String = "???";
         if(class_3.loaderInfo == null)
         {
            _loc1_ = "UNKNOWN";
         }
         else
         {
            _loc1_ = class_3.loaderInfo.url;
         }
         return _loc1_;
      }
      
      private static function method_13() : Boolean
      {
         if(class_3.loaderInfo != null && class_3.loaderInfo.url.split("/")[2] == "")
         {
            return true;
         }
         return false;
      }
      
      public static function method_65() : Boolean
      {
         var _loc3_:String = null;
         var _loc1_:Boolean = false;
         var _loc2_:int = 0;
         while(_loc2_ < class_3.var_54.length)
         {
            _loc3_ = String(class_3.var_54[_loc2_]);
            if(class_3.method_8(_loc3_))
            {
               _loc1_ = true;
               break;
            }
            if(class_3.method_13() && (class_3.method_15() || class_3.method_19() || class_3.method_27()))
            {
               _loc1_ = true;
               break;
            }
            _loc2_++;
         }
         if(class_3.var_68)
         {
            _loc1_ = true;
         }
         return _loc1_;
      }
      
      private static function method_15() : Boolean
      {
         var _loc1_:Boolean = false;
         var _loc2_:int = 0;
         while(_loc2_ < class_3.var_53.length)
         {
            if(class_3.method_24().indexOf(class_3.var_53[_loc2_]) == 0)
            {
               _loc1_ = true;
               break;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      private static function method_19() : Boolean
      {
         var _loc1_:Boolean = false;
         var _loc2_:int = 0;
         while(_loc2_ < class_3.var_50.length)
         {
            if(class_3.method_24().indexOf(class_3.var_50[_loc2_]) == 0)
            {
               _loc1_ = true;
               break;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      private static function method_27() : Boolean
      {
         var _loc1_:Boolean = false;
         var _loc2_:int = 0;
         while(_loc2_ < class_3.var_52.length)
         {
            if(class_3.method_24().indexOf(class_3.var_52[_loc2_]) == 0)
            {
               _loc1_ = true;
               break;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public static function method_42() : Boolean
      {
         var _loc3_:String = null;
         var _loc1_:Boolean = false;
         var _loc2_:int = 0;
         while(_loc2_ < class_3.var_47.length)
         {
            _loc3_ = String(class_3.var_47[_loc2_]);
            if(class_3.method_8(_loc3_))
            {
               _loc1_ = true;
               break;
            }
            if(class_3.method_13() && (class_3.method_19() || class_3.method_27()))
            {
               _loc1_ = true;
               break;
            }
            if(class_3.method_13() && class_3.method_15() && class_3.var_74 == true)
            {
               _loc1_ = true;
               break;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public static function method_74() : Boolean
      {
         var _loc3_:String = null;
         var _loc1_:Boolean = false;
         var _loc2_:int = 0;
         while(_loc2_ < class_3.var_49.length)
         {
            _loc3_ = String(class_3.var_49[_loc2_]);
            if(class_3.method_8(_loc3_))
            {
               _loc1_ = true;
               break;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public static function method_76() : Boolean
      {
         var _loc3_:String = null;
         var _loc1_:Boolean = false;
         var _loc2_:int = 0;
         while(_loc2_ < class_3.var_45.length)
         {
            _loc3_ = String(class_3.var_45[_loc2_]);
            if(class_3.method_8(_loc3_))
            {
               _loc1_ = true;
               break;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public static function method_53() : Boolean
      {
         var _loc3_:String = null;
         var _loc1_:Boolean = false;
         var _loc2_:int = 0;
         while(_loc2_ < class_3.var_51.length)
         {
            _loc3_ = String(class_3.var_51[_loc2_]);
            if(class_3.method_8(_loc3_))
            {
               _loc1_ = true;
               break;
            }
            if(class_3.method_13() && (class_3.method_15() && class_3.var_56 == false || class_3.method_27()))
            {
               _loc1_ = true;
               break;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public static function method_56() : Boolean
      {
         var _loc3_:String = null;
         var _loc1_:Boolean = false;
         var _loc2_:int = 0;
         while(_loc2_ < class_3.var_57.length)
         {
            _loc3_ = String(class_3.var_57[_loc2_]);
            if(class_3.method_8(_loc3_))
            {
               _loc1_ = true;
               break;
            }
            if(class_3.method_13() && (class_3.method_15() && class_3.var_56 == true || class_3.method_19()))
            {
               _loc1_ = true;
               break;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public static function method_75() : Boolean
      {
         var _loc3_:String = null;
         var _loc1_:Boolean = false;
         var _loc2_:int = 0;
         while(_loc2_ < class_3.var_59.length)
         {
            _loc3_ = String(class_3.var_59[_loc2_]);
            if(class_3.method_8(_loc3_))
            {
               _loc1_ = true;
               break;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public static function method_25(param1:String) : String
      {
         var _loc2_:String = "";
         var _loc3_:Array = class_3.method_4(param1);
         try
         {
            _loc2_ = String(_loc3_[0]);
         }
         catch(err:Error)
         {
         }
         return _loc2_;
      }
      
      public static function method_4(param1:String) : Array
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
   }
}
