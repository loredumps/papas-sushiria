package sushiGame.screens
{
   import flash.display.*;
   import flash.events.*;
   import package_1.class_1;
   import package_2.class_3;
   import package_4.class_5;
   
   public class class_7
   {
       
      
      public var gameObj:class_5;
      
      public var clip:MovieClip;
      
      public function class_7(param1:class_5)
      {
         super();
         var _loc2_:class_7 = this;
         _loc2_.gameObj = param1;
         _loc2_.setupScreen();
      }
      
      public function setupScreen() : void
      {
         var _loc1_:class_7 = this;
         _loc1_.clip = new fliplineLogoMC();
         _loc1_.gameObj.addChild(_loc1_.clip);
         _loc1_.clip.addEventListener(Event.ENTER_FRAME,_loc1_.updateScreen);
         _loc1_.clip.btn.addEventListener(MouseEvent.CLICK,_loc1_.clickScreen);
         if(class_3.method_56() && class_1.method_89() == false)
         {
            _loc1_.clip.btn.visible = false;
         }
         _loc1_.gameObj.stage.frameRate = 24;
      }
      
      public function updateScreen(param1:Event) : void
      {
         var _loc2_:class_7 = this;
         if(_loc2_.clip.currentLabel == "stopframe")
         {
            _loc2_.clip.stop();
            _loc2_.gameObj.stage.frameRate = 30;
            _loc2_.gameObj.var_130.api.method_106("SplashScreen");
            _loc2_.gameObj.method_208();
         }
      }
      
      public function clickScreen(param1:MouseEvent) : void
      {
         var _loc2_:class_7 = this;
         if(param1.shiftKey)
         {
            _loc2_.clip.gotoAndPlay(_loc2_.clip.totalFrames - 3);
         }
         else
         {
            _loc2_.gameObj.var_130.api.method_109("http://www.flipline.com?utm_source=game_links&utm_medium=game_intro&utm_campaign=papassushiria");
         }
      }
      
      public function destroy() : void
      {
         var _loc1_:class_7 = this;
         _loc1_.clip.removeEventListener(Event.ENTER_FRAME,_loc1_.updateScreen);
         _loc1_.clip.btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickScreen);
         _loc1_.gameObj.removeChild(_loc1_.clip);
         _loc1_.clip = null;
      }
   }
}
