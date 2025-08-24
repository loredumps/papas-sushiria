package sushiGame.screens
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import package_4.class_5;
   import sushiGame.models.CookbookPage;
   
   public class SpecialPopup
   {
       
      
      public var gameObj:class_5;
      
      public var clip:MovieClip;
      
      public var inGame:Boolean = false;
      
      public var page:CookbookPage;
      
      public function SpecialPopup(param1:class_5, param2:MovieClip, param3:Boolean)
      {
         super();
         this.gameObj = param1;
         this.inGame = param3;
         this.setupScreen(param2);
      }
      
      public function setupScreen(param1:MovieClip) : void
      {
         var _loc2_:SpecialPopup = this;
         _loc2_.clip = new popup_special_clip();
         param1.addChild(_loc2_.clip);
         _loc2_.page = new CookbookPage(_loc2_.gameObj,null,_loc2_.clip.inside,_loc2_.gameObj.var_127.currentSpecial);
         _loc2_.page.clip.x = 10;
         _loc2_.page.clip.y = 42;
         _loc2_.clip.inside.close_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickClose);
         _loc2_.clip.addEventListener(Event.ENTER_FRAME,_loc2_.updateScreen);
         if(_loc2_.inGame)
         {
            _loc2_.clip.extraclose_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickClose);
         }
         else
         {
            _loc2_.clip.extraclose_btn.visible = false;
         }
         _loc2_.gameObj.var_128.playSound("trayslide.wav");
      }
      
      public function updateScreen(param1:Event) : void
      {
         var _loc2_:SpecialPopup = this;
         if(_loc2_.clip.currentFrame == _loc2_.clip.totalFrames)
         {
            _loc2_.gameObj.method_265();
         }
      }
      
      public function clickClose(param1:MouseEvent) : void
      {
         var _loc2_:SpecialPopup = this;
         _loc2_.clip.gotoAndPlay("close");
         _loc2_.clip.inside.close_btn.mouseEnabled = false;
         _loc2_.clip.extraclose_btn.mouseEnabled = false;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.gameObj.var_128.playSound("trayslide.wav");
      }
      
      public function destroy() : void
      {
         var _loc1_:SpecialPopup = this;
         _loc1_.clip.inside.close_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickClose);
         _loc1_.clip.extraclose_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickClose);
         _loc1_.clip.removeEventListener(Event.ENTER_FRAME,_loc1_.updateScreen);
         if(_loc1_.clip.parent)
         {
            _loc1_.clip.parent.removeChild(_loc1_.clip);
         }
         if(_loc1_.page)
         {
            _loc1_.page.destroy();
            _loc1_.page = null;
         }
         _loc1_.clip = null;
      }
   }
}
