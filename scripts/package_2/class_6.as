package package_2
{
   import flash.utils.getTimer;
   
   public class class_6
   {
      
      public static var var_241:Boolean = false;
      
      public static var var_225:Function = null;
      
      public static var var_190:Number = 99;
      
      public static const ALL:Number = 99;
      
      public static const const_13:Number = 5;
      
      public static const const_8:Number = 4;
      
      public static const const_14:Number = 3;
      
      public static const const_7:Number = 2;
      
      public static const const_10:Number = 1;
      
      public static const const_21:Number = 0;
      
      public static var var_252:Boolean = false;
      
      public static var var_220:Function = null;
       
      
      public function class_6()
      {
         super();
      }
      
      public static function debug(... rest) : void
      {
         if(class_6.var_190 >= class_6.const_8)
         {
            class_6.traceMessage(class_6.method_127() + rest);
         }
      }
      
      public static function method_1(... rest) : void
      {
         class_6.debug(rest);
      }
      
      public static function info(... rest) : void
      {
         if(class_6.var_190 >= class_6.const_14)
         {
            class_6.traceMessage(class_6.method_127() + rest);
         }
      }
      
      public static function warn(... rest) : void
      {
         if(class_6.var_190 >= class_6.const_7)
         {
            class_6.traceMessage(class_6.method_127() + rest);
         }
      }
      
      public static function error(... rest) : void
      {
         if(class_6.var_190 >= class_6.const_10)
         {
            class_6.traceMessage("3:" + class_6.method_127() + rest);
         }
      }
      
      public static function output(... rest) : void
      {
         if(class_6.var_190 >= class_6.const_13)
         {
            class_6.traceMessage(class_6.method_127() + rest);
         }
      }
      
      public static function method_302(param1:String, param2:Number = 99) : void
      {
         if(class_6.var_190 >= param2)
         {
            class_6.traceMessage(class_6.method_127() + param1);
         }
      }
      
      private static function traceMessage(... rest) : void
      {
         trace(rest);
         if(class_6.var_252 == true)
         {
            class_6.method_284(rest);
         }
      }
      
      private static function method_284(... rest) : void
      {
         if(class_6.var_220 != null)
         {
            try
            {
               class_6.var_220(rest);
            }
            catch(err:Error)
            {
            }
         }
      }
      
      private static function method_127() : String
      {
         var _loc1_:String = "";
         if(class_6.var_241 == true)
         {
            _loc1_ += "[" + class_6.method_267() + "]   ";
         }
         if(class_6.var_225 != null)
         {
            _loc1_ += class_6.var_225();
         }
         return _loc1_;
      }
      
      private static function method_267() : String
      {
         var _loc1_:Number = getTimer();
         var _loc2_:Number = Math.floor(_loc1_ / 1000);
         _loc1_ -= _loc2_ * 1000;
         var _loc3_:Number = Math.floor(_loc2_ / 60);
         _loc2_ -= _loc3_ * 60;
         var _loc4_:String = "";
         if(_loc3_ < 10)
         {
            _loc4_ += "0" + _loc3_ + ":";
         }
         else
         {
            _loc4_ += _loc3_ + ":";
         }
         if(_loc2_ < 10)
         {
            _loc4_ += "0" + _loc2_ + ":";
         }
         else
         {
            _loc4_ += _loc2_ + ":";
         }
         if(_loc1_ < 10)
         {
            _loc4_ += "00" + _loc1_;
         }
         else if(_loc1_ < 100)
         {
            _loc4_ += "0" + _loc1_;
         }
         else
         {
            _loc4_ += _loc1_;
         }
         return _loc4_;
      }
      
      public static function method_163(param1:Number, param2:Boolean = true) : void
      {
         class_6.var_190 = param1;
         class_6.var_241 = param2;
      }
      
      public static function method_211(param1:Function) : void
      {
         class_6.var_225 = param1;
      }
      
      public static function method_214(param1:Function) : void
      {
         class_6.var_252 = true;
         class_6.var_220 = param1;
      }
   }
}
