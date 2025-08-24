package package_3
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flipline.api.class_18;
   
   public class class_24
   {
       
      
      private var clip:MovieClip;
      
      private var api:class_18;
      
      private var var_332:Boolean = false;
      
      private var var_287:Number = -1;
      
      private var timer:Timer = null;
      
      public function class_24(param1:class_18, param2:String, param3:Boolean = false, param4:Number = -1)
      {
         super();
         var _loc5_:class_24;
         (_loc5_ = this).api = param1;
         _loc5_.var_332 = param3;
         _loc5_.var_287 = param4;
         _loc5_.setupScreen(param2);
      }
      
      public function setupScreen(param1:String) : void
      {
         var _loc2_:class_24 = this;
         _loc2_.clip = new saveBannerMC();
         if(_loc2_.var_332)
         {
            _loc2_.clip.message_txt.htmlText = String(param1);
         }
         else
         {
            _loc2_.clip.message_txt.text = String(param1);
         }
         if(_loc2_.var_287 > 0)
         {
            _loc2_.timer = new Timer(_loc2_.var_287,1);
            _loc2_.timer.addEventListener(TimerEvent.TIMER,_loc2_.method_140);
            _loc2_.timer.start();
            _loc2_.clip.close_btn.visible = false;
         }
         else
         {
            _loc2_.clip.close_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.method_140);
         }
         MovieClip(_loc2_.api.var_256).addChild(_loc2_.clip);
      }
      
      public function method_140(param1:Event = null) : void
      {
         var _loc2_:class_24 = this;
         _loc2_.api.method_138();
      }
      
      public function destroy() : void
      {
         var _loc1_:class_24 = this;
         if(_loc1_.timer != null)
         {
            _loc1_.timer.stop();
            _loc1_.timer.removeEventListener(TimerEvent.TIMER,_loc1_.method_140);
            _loc1_.timer = null;
         }
         _loc1_.clip.close_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.method_140);
         _loc1_.clip.parent.removeChild(_loc1_.clip);
         _loc1_.clip = null;
      }
   }
}
