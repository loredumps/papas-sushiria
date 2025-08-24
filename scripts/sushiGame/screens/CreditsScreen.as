package sushiGame.screens
{
   import flash.display.MovieClip;
   import flash.events.*;
   import package_1.class_1;
   import package_2.class_3;
   import package_2.class_6;
   import package_4.class_5;
   
   public class CreditsScreen
   {
       
      
      public var gameObj:class_5;
      
      public var container:MovieClip = null;
      
      public var params:Object = null;
      
      public var inMenu:Boolean = false;
      
      public var clip:MovieClip;
      
      public var isClosing:Boolean = false;
      
      public function CreditsScreen(param1:class_5, param2:MovieClip, param3:Object = null)
      {
         super();
         var _loc4_:CreditsScreen;
         (_loc4_ = this).gameObj = param1;
         _loc4_.container = param2;
         _loc4_.params = param3;
         if(param3 != null)
         {
            class_6.method_1("Credits Screen in Menu");
            if(param3.hasOwnProperty("inMenu"))
            {
               _loc4_.inMenu = param3.inMenu;
            }
         }
         _loc4_.setupScreen();
      }
      
      public function addToContainer() : void
      {
         var screen:CreditsScreen = this;
         try
         {
            if(Boolean(screen.container) && Boolean(screen.clip) && !screen.container.contains(screen.clip))
            {
               screen.container.addChild(screen.clip);
            }
         }
         catch(err:Error)
         {
            class_6.error("Error adding subscreen to container: " + err.message);
         }
      }
      
      public function removeFromContainer() : void
      {
         var screen:CreditsScreen = this;
         try
         {
            if(Boolean(screen.container) && Boolean(screen.clip) && screen.container.contains(screen.clip))
            {
               screen.container.removeChild(screen.clip);
            }
         }
         catch(err:Error)
         {
            class_6.error("Error adding subscreen to container: " + err.message);
         }
      }
      
      public function setupScreen() : void
      {
         var _loc1_:CreditsScreen = this;
         _loc1_.clip = new creditsScreenMC();
         _loc1_.container.addChild(_loc1_.clip);
         _loc1_.clip.addEventListener(Event.ENTER_FRAME,_loc1_.updateScreen);
         _loc1_.container.addEventListener("clickContinue",_loc1_.clickContinue);
         _loc1_.clip.flipline1_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickCreditsFlipline);
         _loc1_.clip.flipline2_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickCreditsFlipline);
         _loc1_.clip.flipline_logo_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickCreditsFlipline);
         _loc1_.clip.flipline_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickCreditsFlipline);
         _loc1_.clip.facebook_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickFacebook);
         _loc1_.clip.twitter_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickTwitter);
         if(class_3.method_56() && class_1.method_88() == false)
         {
            _loc1_.clip.flipline1_btn.visible = false;
            _loc1_.clip.flipline2_btn.visible = false;
            _loc1_.clip.flipline_btn.visible = false;
            _loc1_.clip.facebook_btn.visible = false;
            _loc1_.clip.twitter_btn.visible = false;
         }
         if(class_3.method_56() && class_1.method_97() == false)
         {
            _loc1_.clip.flipline_logo_btn.visible = false;
         }
         if(class_3.method_56() && class_1.method_81() == false)
         {
            _loc1_.clip.flipline_logo_btn.mouseEnabled = false;
         }
         if(_loc1_.inMenu)
         {
            _loc1_.clip.fader.stop();
            _loc1_.clip.fader.visible = false;
         }
         else
         {
            _loc1_.gameObj.var_128.switchMusic("order");
         }
      }
      
      public function clickCreditsFlipline(param1:MouseEvent) : void
      {
         var _loc2_:CreditsScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.gameObj.var_130.api.method_109("http://www.flipline.com");
      }
      
      public function clickCreditsPapaLouie(param1:MouseEvent) : void
      {
         var _loc2_:CreditsScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.gameObj.var_130.api.method_109("http://www.papalouie.com");
      }
      
      public function clickFacebook(param1:MouseEvent) : void
      {
         var _loc2_:CreditsScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.gameObj.var_130.api.method_109("http://www.facebook.com/pages/Flipline-Studios/121045844606187");
      }
      
      public function clickTwitter(param1:MouseEvent) : void
      {
         var _loc2_:CreditsScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.gameObj.var_130.api.method_109("http://www.twitter.com/FliplineStudios");
      }
      
      public function destroy() : void
      {
         var _loc1_:CreditsScreen = this;
         class_6.method_1("(Destroy Credits Menu)");
         _loc1_.clip.removeEventListener(Event.ENTER_FRAME,_loc1_.updateScreen);
         _loc1_.clip.flipline1_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickCreditsFlipline);
         _loc1_.clip.flipline2_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickCreditsFlipline);
         _loc1_.clip.flipline_logo_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickCreditsFlipline);
         _loc1_.clip.flipline_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickCreditsFlipline);
         _loc1_.clip.facebook_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickFacebook);
         _loc1_.clip.twitter_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickTwitter);
         _loc1_.container.removeEventListener("clickContinue",_loc1_.clickContinue);
         if(_loc1_.clip)
         {
            if(_loc1_.clip.parent)
            {
               _loc1_.clip.parent.removeChild(_loc1_.clip);
            }
         }
         _loc1_.container = null;
         _loc1_.clip = null;
      }
      
      public function clickContinue(param1:Event) : void
      {
         var _loc2_:CreditsScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.clip.fader.gotoAndPlay("quickfadeout");
         _loc2_.isClosing = true;
      }
      
      public function updateScreen(param1:Event) : void
      {
         var _loc2_:CreditsScreen = this;
         if(_loc2_.isClosing)
         {
            if(_loc2_.clip.fader.currentFrame == _loc2_.clip.fader.totalFrames)
            {
               _loc2_.gameObj.method_118();
               _loc2_.gameObj.method_243();
            }
         }
      }
   }
}
