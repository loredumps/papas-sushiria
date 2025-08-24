package sushiGame.events
{
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import package_2.class_12;
   import package_2.class_6;
   import package_4.class_5;
   
   public class GameControls
   {
       
      
      public var gameObj:class_5;
      
      public var gameplayTimer:Number = 0;
      
      public var lastTime:Number = 0;
      
      public var lastFPSWarning:Number = 0;
      
      public var alreadyCheated:Boolean = false;
      
      public var cheatm:Number = 0;
      
      public var debugMode:Number = 1;
      
      public var debugCheckOffset:Number = 6;
      
      public var debugDropDistance:Number = 4;
      
      public function GameControls(param1:class_5)
      {
         super();
         var _loc2_:GameControls = this;
         _loc2_.gameObj = param1;
      }
      
      public function setupGameCycle() : void
      {
         var _loc1_:GameControls = this;
         _loc1_.gameObj.var_139.addEventListener(Event.ENTER_FRAME,_loc1_.gameCycle);
         _loc1_.gameObj.stage.focus = _loc1_.gameObj.stage;
         _loc1_.gameObj.stage.addEventListener(KeyboardEvent.KEY_UP,_loc1_.keyListener);
         _loc1_.alreadyCheated = false;
      }
      
      public function removeGameCycle() : void
      {
         var _loc1_:GameControls = this;
         class_6.error("-------------------------------------------");
         class_6.error("");
         class_6.error("Day " + _loc1_.gameObj.var_127.currentDay + ".  Time = " + class_12.method_291(this.gameplayTimer));
         class_6.error("");
         class_6.error("-------------------------------------------");
         if(_loc1_.gameObj.var_139.hasEventListener(Event.ENTER_FRAME))
         {
            _loc1_.gameObj.var_139.removeEventListener(Event.ENTER_FRAME,_loc1_.gameCycle);
         }
         _loc1_.gameObj.stage.removeEventListener(KeyboardEvent.KEY_UP,_loc1_.keyListener);
      }
      
      public function resetKeyFocus() : void
      {
         var _loc1_:GameControls = this;
         _loc1_.gameObj.stage.focus = _loc1_.gameObj.stage;
      }
      
      public function keyListener(param1:KeyboardEvent) : void
      {
         this;
      }
      
      public function gameCycle(param1:Event) : void
      {
         var _loc2_:GameControls = this;
         var _loc3_:class_5 = _loc2_.gameObj;
         if(!_loc3_.var_169)
         {
            ++_loc2_.gameplayTimer;
            if(_loc3_.hud)
            {
               _loc3_.hud.updateHUD();
            }
            if(!_loc3_.var_202)
            {
               _loc3_.var_133.updateManager();
               _loc3_.var_186.updateScreen();
               _loc3_.var_188.updateScreen();
               _loc3_.var_191.updateScreen();
               _loc3_.var_195.updateScreen();
               _loc3_.var_145.updateScreen();
               _loc3_.var_137.updateScreen();
               _loc3_.var_135.updateScreen();
               _loc3_.var_129.updateScreen();
            }
         }
         if(_loc3_.hud)
         {
            _loc3_.hud.updateFPS();
         }
      }
      
      public function destroy() : void
      {
         var _loc1_:GameControls = this;
         _loc1_.removeGameCycle();
      }
   }
}
