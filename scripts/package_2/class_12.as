package package_2
{
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class class_12
   {
       
      
      public function class_12()
      {
         super();
      }
      
      public static function method_114(param1:Number) : String
      {
         var _loc5_:Number = NaN;
         var _loc2_:String = String(param1);
         var _loc3_:String = "";
         var _loc4_:int = _loc2_.length - 1;
         while(_loc4_ >= 0)
         {
            if((_loc5_ = _loc2_.length - 1 - _loc4_) % 3 == 0 && _loc5_ > 0 && _loc2_.charAt(_loc4_) != "-")
            {
               _loc3_ = "," + _loc3_;
            }
            _loc3_ = _loc2_.charAt(_loc4_) + _loc3_;
            _loc4_--;
         }
         return _loc3_;
      }
      
      public static function method_141(param1:Number) : String
      {
         var _loc2_:String = "";
         var _loc3_:Number = Math.floor(param1 / 100);
         var _loc4_:Number = param1 - _loc3_ * 100;
         var _loc5_:String;
         if((_loc5_ = String(_loc4_)).length < 2)
         {
            _loc5_ = "0" + _loc5_;
         }
         return "$" + _loc3_ + "." + _loc5_;
      }
      
      public static function method_291(param1:Number, param2:Boolean = true, param3:Boolean = false) : String
      {
         var _loc4_:Number = param1;
         var _loc5_:* = "";
         var _loc6_:Number = 0;
         if(param3)
         {
            _loc6_ = Math.floor(param1 / 30 / 60 / 60);
            _loc4_ -= _loc6_ * 30 * 60 * 60;
         }
         var _loc7_:Number = Math.floor(_loc4_ / 30 / 60);
         _loc4_ -= _loc7_ * 30 * 60;
         var _loc8_:Number = Math.floor(_loc4_ / 30);
         _loc4_ -= _loc8_ * 30;
         var _loc9_:Number = Math.round(_loc4_ / 30 * 100);
         if(param3)
         {
            if(_loc6_ < 10)
            {
               _loc5_ += "0";
            }
            _loc5_ += String(_loc6_) + ":";
         }
         if(_loc7_ < 10)
         {
            _loc5_ += "0";
         }
         _loc5_ += String(_loc7_) + ":";
         if(_loc8_ < 10)
         {
            _loc5_ += "0";
         }
         _loc5_ += String(_loc8_);
         if(param2)
         {
            _loc5_ += ":";
            if(_loc9_ < 10)
            {
               _loc5_ += "0";
            }
            _loc5_ += String(_loc9_);
         }
         return _loc5_;
      }
      
      public static function method_194(param1:Number, param2:String = "MM-DD-YYYY", param3:Boolean = true) : String
      {
         var _loc8_:String = null;
         var _loc9_:String = null;
         var _loc10_:String = null;
         var _loc4_:Date = new Date(param1);
         var _loc5_:String = param2;
         var _loc6_:Array = ["","January","February","March","April","May","June","July","August","September","October","November","December"];
         var _loc7_:Array = ["","Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
         if(param3)
         {
            _loc8_ = String(_loc4_.getUTCDate());
            _loc9_ = String(_loc4_.getUTCMonth() + 1);
            _loc10_ = String(_loc4_.getUTCFullYear());
         }
         else
         {
            _loc8_ = String(_loc4_.getDate());
            _loc9_ = String(_loc4_.getMonth() + 1);
            _loc10_ = String(_loc4_.getFullYear());
         }
         var _loc11_:String = "unset";
         var _loc12_:String = "unset";
         var _loc13_:String = "unset";
         if(param2.indexOf("MM") > -1)
         {
            _loc11_ = "MM";
         }
         else if(param2.indexOf("mm") > -1)
         {
            _loc11_ = "mm";
         }
         else if(param2.indexOf("M") > -1)
         {
            _loc11_ = "M";
         }
         else if(param2.indexOf("m") > -1)
         {
            _loc11_ = "m";
         }
         if(param2.indexOf("DD") > -1)
         {
            _loc12_ = "DD";
         }
         else if(param2.indexOf("dd") > -1)
         {
            _loc12_ = "dd";
         }
         if(param2.indexOf("YYYY") > -1)
         {
            _loc13_ = "YYYY";
         }
         else if(param2.indexOf("YY") > -1)
         {
            _loc13_ = "YY";
         }
         if(_loc11_ == "MM" && _loc9_.length == 1)
         {
            _loc9_ = "0" + _loc9_;
         }
         else if(_loc11_ == "M")
         {
            _loc9_ = String(_loc6_[Number(_loc9_)]);
         }
         else if(_loc11_ == "m")
         {
            _loc9_ = String(_loc7_[Number(_loc9_)]);
         }
         if(_loc12_ == "DD" && _loc8_.length == 1)
         {
            _loc8_ = "0" + _loc8_;
         }
         if(_loc13_ == "YY")
         {
            _loc10_ = _loc10_.substr(2);
         }
         return (_loc5_ = (_loc5_ = _loc5_.replace(_loc11_,_loc9_)).replace(_loc12_,_loc8_)).replace(_loc13_,_loc10_);
      }
      
      public static function method_158(param1:TextField, param2:String, param3:Number = 5, param4:String = "center") : void
      {
         var skipper:Boolean = false;
         var origHeight:Number = NaN;
         var diffHeight:Number = NaN;
         var tf:TextFormat = null;
         var textField:TextField = param1;
         var useText:String = param2;
         var minimumSize:Number = param3;
         var verticalAlign:String = param4;
         try
         {
            skipper = false;
            textField.text = useText;
            origHeight = textField.textHeight;
            while(textField.textWidth > textField.width && skipper == false)
            {
               tf = textField.getTextFormat();
               tf.size = Number(tf.size) - 1;
               textField.defaultTextFormat = tf;
               textField.text = useText;
               if(tf.size <= minimumSize)
               {
                  skipper = true;
               }
            }
            diffHeight = origHeight - textField.textHeight;
            if(verticalAlign == "center")
            {
               textField.y += diffHeight / 2;
            }
            else if(!(verticalAlign == null || verticalAlign == "none"))
            {
               class_6.error("Text not set up for this alignment: " + verticalAlign);
            }
         }
         catch(err:Error)
         {
            class_6.error("Error resizing text: " + err.message);
         }
      }
   }
}
