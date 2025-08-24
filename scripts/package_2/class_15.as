package package_2
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.utils.getDefinitionByName;
   
   public class class_15
   {
       
      
      public function class_15()
      {
         super();
      }
      
      public function method_103(param1:String) : MovieClip
      {
         var _loc2_:Class = getDefinitionByName(param1) as Class;
         var _loc3_:MovieClip = new _loc2_() as MovieClip;
         _loc3_.tabEnabled = false;
         return _loc3_;
      }
      
      public function method_135(param1:String) : SimpleButton
      {
         var _loc2_:Class = getDefinitionByName(param1) as Class;
         var _loc3_:SimpleButton = new _loc2_() as SimpleButton;
         _loc3_.tabEnabled = false;
         return _loc3_;
      }
      
      public function method_247(param1:String, param2:*, param3:*, param4:Object = null) : *
      {
         var _loc5_:Class;
         return new (_loc5_ = getDefinitionByName(param1) as Class)(param2,param3,param4);
      }
   }
}
