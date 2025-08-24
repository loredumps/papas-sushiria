package package_2
{
   public class class_16
   {
       
      
      public function class_16()
      {
         super();
      }
      
      public static function method_124(param1:Array) : Array
      {
         var _loc3_:int = 0;
         var _loc2_:Array = [];
         if(param1 != null)
         {
            _loc3_ = 0;
            while(_loc3_ < param1.length)
            {
               if(param1[_loc3_] is Array)
               {
                  _loc2_[_loc3_] = class_16.method_124(param1[_loc3_]);
               }
               else
               {
                  _loc2_[_loc3_] = param1[_loc3_];
               }
               _loc3_++;
            }
         }
         return _loc2_;
      }
      
      public static function getRandom(param1:Array) : *
      {
         return param1[Math.floor(Math.random() * param1.length)];
      }
      
      public static function method_122(param1:Array, param2:Number) : *
      {
         var _loc3_:Number = param2 % param1.length;
         if(param1 == null || param1.length == 0)
         {
            return null;
         }
         if(_loc3_ < param1.length)
         {
            return param1[_loc3_];
         }
         return param1[0];
      }
   }
}
