package package_2
{
   import flash.display.*;
   import flash.utils.getDefinitionByName;
   
   public class class_14
   {
       
      
      public function class_14()
      {
         super();
      }
      
      public static function method_103(param1:String, param2:Boolean = true, param3:Boolean = true) : MovieClip
      {
         var _loc5_:MovieClip;
         var _loc4_:Class;
         (_loc5_ = new (_loc4_ = getDefinitionByName(param1) as Class)() as MovieClip).tabEnabled = false;
         _loc5_.mouseEnabled = param2;
         _loc5_.mouseChildren = param3;
         return _loc5_;
      }
      
      public static function method_197(param1:String, param2:Boolean = true, param3:Boolean = true) : DisplayObject
      {
         var _loc5_:*;
         var _loc4_:Class;
         if((_loc5_ = new (_loc4_ = getDefinitionByName(param1) as Class)()) is BitmapData)
         {
            return new Bitmap(_loc5_,"auto",true);
         }
         if(_loc5_ is MovieClip)
         {
            _loc5_.tabEnabled = false;
            _loc5_.mouseEnabled = param2;
            _loc5_.mouseChildren = param3;
            return _loc5_;
         }
         return _loc5_;
      }
      
      public static function method_301(param1:MovieClip, param2:Number, param3:Number, param4:Number, param5:Boolean = true) : Boolean
      {
         var _loc6_:Boolean = false;
         var _loc7_:Number = param2 - param1.x;
         var _loc8_:Number = param3 - param1.y;
         var _loc9_:Number = Math.sqrt(_loc7_ * _loc7_ + _loc8_ * _loc8_);
         var _loc10_:Number = Math.atan2(_loc8_,_loc7_);
         if(param4 > _loc9_ && param5)
         {
            _loc6_ = true;
            param4 = _loc9_;
         }
         var _loc11_:Number = Math.cos(_loc10_) * param4;
         var _loc12_:Number = Math.sin(_loc10_) * param4;
         param1.x += _loc11_;
         param1.y += _loc12_;
         if(param1.x == param2 && param1.y == param3)
         {
            _loc6_ = true;
         }
         return _loc6_;
      }
   }
}
