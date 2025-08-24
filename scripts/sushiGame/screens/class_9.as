package sushiGame.screens
{
   import flash.display.*;
   import flash.events.*;
   import package_1.class_1;
   import package_4.class_5;
   
   public class class_9
   {
       
      
      public var gameObj:class_5;
      
      public var clip:MovieClip;
      
      public function class_9(param1:class_5)
      {
         super();
         var _loc2_:class_9 = this;
         _loc2_.gameObj = param1;
         _loc2_.setupScreen();
      }
      
      public function setupScreen() : void
      {
         var _loc1_:class_9 = this;
         _loc1_.clip = new licenseLogoMC();
         _loc1_.gameObj.addChild(_loc1_.clip);
         _loc1_.gameObj.stage.frameRate = 45;
         _loc1_.clip.addEventListener(Event.ENTER_FRAME,_loc1_.updateScreen);
         _loc1_.clip.btn.addEventListener(MouseEvent.CLICK,_loc1_.clickScreen);
         if(class_1.method_91() == false)
         {
            _loc1_.clip.btn.visible = false;
         }
      }
      
      public function updateScreen(param1:Event) : void
      {
         var _loc2_:class_9 = this;
         if(_loc2_.clip.currentFrame == _loc2_.clip.totalFrames)
         {
            _loc2_.gameObj.stage.frameRate = 30;
            if(class_1.method_84())
            {
               _loc2_.gameObj.method_157();
            }
            else
            {
               _loc2_.gameObj.var_130.api.method_106("SplashScreen");
            }
            _loc2_.gameObj.method_241();
         }
      }
      
      public function clickScreen(param1:MouseEvent) : void
      {
         var _loc2_:class_9 = this;
         _loc2_.gameObj.var_130.api.method_109(class_1.method_68());
      }
      
      public function destroy() : void
      {
         var _loc1_:class_9 = this;
         _loc1_.clip.removeEventListener(Event.ENTER_FRAME,_loc1_.updateScreen);
         _loc1_.clip.btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickScreen);
         _loc1_.gameObj.removeChild(_loc1_.clip);
         _loc1_.clip = null;
      }
   }
}
