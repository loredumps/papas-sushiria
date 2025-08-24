package sushiGame.screens
{
   import flash.display.*;
   import flash.events.*;
   import package_4.class_5;
   
   public class class_11
   {
       
      
      public var gameObj:class_5;
      
      public var clip:MovieClip;
      
      public var var_298:Boolean = false;
      
      public function class_11(param1:class_5)
      {
         super();
         var _loc2_:class_11 = this;
         _loc2_.gameObj = param1;
         _loc2_.setupScreen();
      }
      
      public function setupScreen() : void
      {
         var _loc1_:class_11 = this;
         _loc1_.clip = new sponsorLogoMC();
         _loc1_.gameObj.addChild(_loc1_.clip);
         _loc1_.gameObj.stage.frameRate = 45;
         _loc1_.clip.addEventListener(Event.ENTER_FRAME,_loc1_.updateScreen);
         _loc1_.clip.btn.addEventListener(MouseEvent.CLICK,_loc1_.clickScreen);
      }
      
      public function updateScreen(param1:Event) : void
      {
         var _loc2_:class_11 = this;
         if(_loc2_.clip.currentFrame == _loc2_.clip.totalFrames)
         {
            _loc2_.gameObj.stage.frameRate = 30;
            if(_loc2_.var_298)
            {
               _loc2_.gameObj.var_130.api.method_106("SplashScreen");
               _loc2_.gameObj.method_182();
            }
            else
            {
               _loc2_.gameObj.method_157();
               _loc2_.gameObj.method_182();
            }
         }
      }
      
      public function clickScreen(param1:MouseEvent) : void
      {
         var _loc2_:class_11 = this;
         if(param1.shiftKey)
         {
            _loc2_.var_298 = true;
            _loc2_.clip.gotoAndPlay(_loc2_.clip.totalFrames - 3);
         }
         else
         {
            _loc2_.gameObj.var_130.api.method_109("http://www.papalouie.com?utm_source=game_links&utm_medium=game_intro&utm_campaign=papassushiria");
         }
      }
      
      public function destroy() : void
      {
         var _loc1_:class_11 = this;
         _loc1_.clip.removeEventListener(Event.ENTER_FRAME,_loc1_.updateScreen);
         _loc1_.clip.btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickScreen);
         _loc1_.gameObj.removeChild(_loc1_.clip);
         _loc1_.clip = null;
      }
   }
}
