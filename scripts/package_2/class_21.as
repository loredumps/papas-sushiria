package package_2
{
   public class class_21
   {
       
      
      public function class_21()
      {
         super();
      }
      
      public static function radsToDegrees(param1:Number) : Number
      {
         return param1 * 180 / Math.PI;
      }
      
      public static function degreesToRads(param1:Number) : Number
      {
         return param1 * Math.PI / 180;
      }
      
      public static function method_167(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         var _loc5_:Number = param2 - param1;
         var _loc6_:Number = param4 - param3;
         return Math.sqrt(_loc5_ * _loc5_ + _loc6_ * _loc6_);
      }
      
      public static function getRandom(param1:Number) : Number
      {
         return Math.floor(Math.random() * param1);
      }
   }
}
