package sushiGame.screens
{
   import flash.display.*;
   import flash.events.*;
   import flash.ui.*;
   import package_2.class_3;
   import package_3.class_4;
   import package_4.class_5;
   
   public class SplashScreen
   {
       
      
      public var gameObj:class_5;
      
      public var container:MovieClip;
      
      public var clip:MovieClip;
      
      public function SplashScreen(param1:class_5, param2:MovieClip, param3:Object = null)
      {
         super();
         var _loc4_:SplashScreen;
         (_loc4_ = this).gameObj = param1;
         _loc4_.container = param2;
         _loc4_.setupScreen();
      }
      
      public function setupScreen() : void
      {
         var _loc1_:SplashScreen = this;
         _loc1_.clip = new splashScreenMC();
         _loc1_.clip.iris.gotoAndStop(1);
         _loc1_.container.addChild(_loc1_.clip);
         _loc1_.container.addEventListener("clickStart",_loc1_.clickStart);
         _loc1_.container.addEventListener("clickCredits",_loc1_.clickCredits);
         _loc1_.container.addEventListener("clickHighScores",_loc1_.clickHighScores);
         _loc1_.clip.fader.mouseEnabled = false;
         _loc1_.gameObj.var_128.switchMusic("title");
         _loc1_.clip.addEventListener(Event.ENTER_FRAME,_loc1_.animateScreen);
         if(class_3.method_56() == false)
         {
            class_4.method_87(class_4.const_6,_loc1_.gameObj,568,184);
            if(Math.random() > 0.5)
            {
               class_4.method_87(class_4.const_4,_loc1_.gameObj,72,184);
            }
            else
            {
               class_4.method_87(class_4.const_5,_loc1_.gameObj,72,184);
            }
         }
      }
      
      public function animateScreen(param1:Event) : void
      {
         var _loc2_:SplashScreen = this;
         --_loc2_.clip.anim.y;
         if(_loc2_.clip.anim.y <= -492)
         {
            _loc2_.clip.anim.y += 492;
         }
         if(_loc2_.clip.iris.currentFrame == _loc2_.clip.iris.totalFrames)
         {
            _loc2_.closeSplashScreen();
         }
      }
      
      public function clickStart(param1:Event) : void
      {
         var _loc2_:SplashScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.gameObj.var_130.method_128();
         _loc2_.clip.iris.gotoAndPlay("irisout");
         _loc2_.gameObj.var_130.api.method_126("SplashScreen");
         class_4.method_62();
         _loc2_.gameObj.var_130.method_117("start");
      }
      
      public function clickHighScores(param1:Event) : void
      {
         var _loc2_:SplashScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         if(_loc2_.gameObj.var_130.api.method_181())
         {
            _loc2_.gameObj.var_130.method_128();
         }
         else
         {
            _loc2_.gameObj.var_130.method_237();
         }
      }
      
      public function clickCredits(param1:Event) : void
      {
         var _loc2_:SplashScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.gameObj.var_130.method_128();
         class_4.method_62();
         _loc2_.gameObj.var_130.api.method_106("SplashCredits",{"useSection":"credits"});
         _loc2_.gameObj.var_130.api.method_107("SplashScreen");
      }
      
      public function destroy() : void
      {
         var _loc1_:SplashScreen = this;
         class_4.method_62();
         _loc1_.container.removeEventListener("clickStart",_loc1_.clickStart);
         _loc1_.container.removeEventListener("clickCredits",_loc1_.clickCredits);
         _loc1_.container.removeEventListener("clickHighScores",_loc1_.clickHighScores);
         _loc1_.clip.removeEventListener(Event.ENTER_FRAME,_loc1_.animateScreen);
         _loc1_.container.removeChild(_loc1_.clip);
         _loc1_.clip = null;
      }
      
      public function closeSplashScreen(param1:MouseEvent = null) : void
      {
         var _loc2_:SplashScreen = this;
         _loc2_.gameObj.var_130.api.method_106("SlotSelect");
         _loc2_.gameObj.var_130.api.method_107("SplashScreen");
      }
   }
}
