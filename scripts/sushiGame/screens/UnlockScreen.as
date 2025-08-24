package sushiGame.screens
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.media.SoundChannel;
   import flash.text.TextFormat;
   import package_2.class_6;
   import package_4.class_5;
   import sushiGame.data.*;
   import sushiGame.managers.CustomerManager;
   import sushiGame.models.Worker;
   
   public class UnlockScreen
   {
       
      
      public var gameObj:class_5;
      
      public var lineupTypes:Array;
      
      public var lineupDetails:Array;
      
      public var clip:MovieClip;
      
      public var subclip:MovieClip = null;
      
      public var currentLineupIndex:Number = -1;
      
      public var moneyFrame:Number = 40;
      
      public var worker:Worker;
      
      public var customerClip:MovieClip = null;
      
      public var toppingClip:MovieClip = null;
      
      public var shouldShowNewHire:Boolean = false;
      
      public var musicClip:SoundChannel = null;
      
      public var kernFormat:TextFormat;
      
      public function UnlockScreen(param1:class_5, param2:Boolean = false)
      {
         this.lineupTypes = [];
         this.lineupDetails = [];
         super();
         var _loc3_:UnlockScreen = this;
         _loc3_.gameObj = param1;
         _loc3_.kernFormat = new TextFormat();
         _loc3_.kernFormat.kerning = true;
         _loc3_.decideLineup(param2);
         _loc3_.setupScreen();
      }
      
      public function decideLineup(param1:Boolean = false) : void
      {
         var _loc4_:int = 0;
         var _loc2_:UnlockScreen = this;
         var _loc3_:UserData = _loc2_.gameObj.var_127;
         if(_loc3_.didCreateWaiter == false && _loc3_.currentDay >= GameData.DAY_TO_HIRE)
         {
            _loc2_.shouldShowNewHire = true;
            return;
         }
         if(_loc2_.gameObj.var_127.currentDay == GameData.DAY_TO_HIRE || param1)
         {
            _loc2_.lineupTypes.push("hire");
            _loc2_.lineupDetails.push(_loc2_.gameObj.var_127.waiterName);
         }
         if(_loc3_.isPayday())
         {
            _loc2_.lineupTypes.push("payday");
            _loc2_.lineupDetails.push("");
         }
         if(_loc3_.getMonth() != _loc3_.lastMonthSeen && _loc3_.getHolidayMonth() > 0)
         {
            if(_loc3_.getMonth() == 3)
            {
               _loc2_.lineupTypes.push("season");
               _loc2_.lineupDetails.push("spring");
            }
            else if(_loc3_.getMonth() == 6)
            {
               _loc2_.lineupTypes.push("season");
               _loc2_.lineupDetails.push("summer");
            }
            else if(_loc3_.getMonth() == 9)
            {
               _loc2_.lineupTypes.push("season");
               _loc2_.lineupDetails.push("fall");
            }
            else if(_loc3_.getMonth() == 12)
            {
               _loc2_.lineupTypes.push("season");
               _loc2_.lineupDetails.push("winter");
            }
            if(_loc3_.getMonth() != GameData.STARTER_MONTH || _loc3_.isNewYear())
            {
               _loc2_.lineupTypes.push("holiday");
               _loc2_.lineupDetails.push(_loc3_.getMonth());
            }
            _loc3_.lastMonthSeen = _loc3_.getMonth();
         }
         if(_loc2_.gameObj.var_133.showNewCustomer)
         {
            _loc2_.lineupTypes.push("customer");
            _loc2_.lineupDetails.push(_loc2_.gameObj.var_133.showNewCustomerNum);
         }
         var _loc5_:Array;
         if((_loc5_ = _loc3_.getAllToppingsToReveal()).length > 0)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc5_.length)
            {
               _loc2_.lineupTypes.push("topping");
               _loc2_.lineupDetails.push(_loc5_[_loc4_]);
               _loc4_++;
            }
         }
         if(_loc2_.lineupTypes.length > 0)
         {
            _loc2_.lineupTypes.unshift("fadein");
            _loc2_.lineupDetails.unshift("");
            _loc2_.lineupTypes.push("fadeout");
            _loc2_.lineupDetails.push("");
         }
         class_6.method_1("Unlocks: " + _loc2_.lineupTypes.toString());
      }
      
      public function setupScreen() : void
      {
         var _loc1_:UnlockScreen = this;
         if(_loc1_.lineupTypes.length > 0)
         {
            _loc1_.gameObj.var_128.switchMusic("none");
            _loc1_.clip = new MovieClip();
            _loc1_.clip.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickScreen);
            _loc1_.setupNewUnlock();
         }
         else
         {
            _loc1_.clip = new MovieClip();
            _loc1_.clip.graphics.beginFill(0,1);
            _loc1_.clip.graphics.drawRect(-400,-400,1440,1280);
            _loc1_.clip.graphics.endFill();
         }
         _loc1_.gameObj.var_150.addChild(_loc1_.clip);
         _loc1_.clip.addEventListener(Event.ENTER_FRAME,_loc1_.updateScreen);
      }
      
      public function clickScreen(param1:MouseEvent = null) : void
      {
         var _loc2_:UnlockScreen = this;
         try
         {
            if(Boolean(_loc2_.subclip) && _loc2_.subclip.currentFrame <= _loc2_.subclip.totalFrames - 6)
            {
               _loc2_.subclip.gotoAndPlay(_loc2_.subclip.totalFrames - 6);
            }
         }
         catch(err:Error)
         {
         }
      }
      
      public function updateScreen(param1:Event = null) : void
      {
         var _loc3_:String = null;
         var _loc2_:UnlockScreen = this;
         if(_loc2_.lineupTypes.length == 0)
         {
            if(_loc2_.shouldShowNewHire)
            {
               class_6.method_1("Show the NEW HIRE screen before doing anything!");
               _loc2_.showNewHireScreen();
            }
            else
            {
               class_6.method_1("No unlocks.");
               _loc2_.finishUnlocks();
            }
         }
         else
         {
            _loc3_ = String(_loc2_.lineupTypes[_loc2_.currentLineupIndex]);
            if(_loc3_ == "payday")
            {
               if(_loc2_.worker)
               {
                  _loc2_.worker.animateModel();
               }
               if(_loc2_.subclip.currentFrame == _loc2_.moneyFrame)
               {
                  _loc2_.gameObj.var_128.playSound("multicoin.wav");
                  _loc2_.subclip.starburst.gotoAndPlay(2);
               }
            }
            else if(_loc3_ == "hire")
            {
               if(_loc2_.worker)
               {
                  _loc2_.worker.animateModel();
               }
            }
            if(Boolean(_loc2_.subclip) && _loc2_.subclip.currentFrame == _loc2_.subclip.totalFrames)
            {
               if(_loc2_.currentLineupIndex + 1 < _loc2_.lineupTypes.length)
               {
                  class_6.method_1(_loc2_.currentLineupIndex + 1 + " < " + _loc2_.lineupTypes.length + " -- Do the next unlock.");
                  _loc2_.destroyCurrentUnlock();
                  _loc2_.setupNewUnlock();
               }
               else
               {
                  class_6.method_1("Finished with the unlock lineup.");
                  _loc2_.finishUnlocks();
               }
            }
         }
      }
      
      public function setupNewUnlock() : void
      {
         var _loc1_:UnlockScreen = this;
         if(_loc1_.musicClip != null)
         {
            _loc1_.musicClip.stop();
            _loc1_.musicClip = null;
         }
         if(_loc1_.subclip)
         {
            _loc1_.subclip.stop();
            _loc1_.subclip = null;
         }
         ++_loc1_.currentLineupIndex;
         var _loc2_:String = String(_loc1_.lineupTypes[_loc1_.currentLineupIndex]);
         var _loc3_:* = _loc1_.lineupDetails[_loc1_.currentLineupIndex];
         if(_loc2_ == "fadein")
         {
            _loc1_.subclip = new unlockfadein_screen();
         }
         else if(_loc2_ == "fadeout")
         {
            _loc1_.subclip = new unlockfadeout_screen();
         }
         else if(_loc2_ == "payday")
         {
            _loc1_.subclip = new payday_screen();
            _loc1_.setupPayDay();
         }
         else if(_loc2_ == "hire")
         {
            _loc1_.subclip = new newhire_screen();
            _loc1_.setupNewHire();
         }
         else if(_loc2_ == "topping")
         {
            _loc1_.subclip = new newtopping_screen();
            _loc1_.setupTopping();
         }
         else if(_loc2_ == "customer")
         {
            _loc1_.subclip = new newcustomer_screen();
            _loc1_.setupCustomer();
         }
         else if(_loc2_ == "holiday")
         {
            _loc1_.subclip = new newholiday_screen();
            _loc1_.subclip.labelMC.gotoAndStop(_loc3_);
            _loc1_.musicClip = _loc1_.gameObj.var_128.playMusicClip("music_newcustomer");
            _loc1_.gameObj.var_136.recordUnlockHoliday(Number(_loc3_));
         }
         else if(_loc2_ == "season")
         {
            _loc1_.subclip = new newseason_screen();
            _loc1_.subclip.labelMC.gotoAndStop(_loc3_);
            _loc1_.musicClip = _loc1_.gameObj.var_128.playMusicClip("music_newseason");
            _loc1_.gameObj.var_136.recordUnlockSeason(String(_loc3_));
         }
         _loc1_.clip.addChildAt(_loc1_.subclip,0);
      }
      
      public function destroyCurrentUnlock() : void
      {
         var _loc1_:UnlockScreen = this;
         var _loc2_:String = String(_loc1_.lineupTypes[_loc1_.currentLineupIndex]);
         if(_loc2_ == "payday" || _loc2_ == "hire")
         {
            if(_loc1_.worker)
            {
               _loc1_.worker.destroy();
               _loc1_.worker = null;
            }
         }
         else if(_loc2_ == "customer")
         {
            _loc1_.destroyCustomer();
         }
         else if(_loc2_ == "topping")
         {
            if(_loc1_.toppingClip)
            {
               _loc1_.toppingClip.parent.removeChild(_loc1_.toppingClip);
               _loc1_.toppingClip = null;
            }
         }
         _loc1_.clip.removeChild(_loc1_.subclip);
         _loc1_.subclip = null;
      }
      
      public function finishUnlocks() : void
      {
         var _loc1_:UnlockScreen = this;
         _loc1_.gameObj.method_154();
         _loc1_.gameObj.method_166();
      }
      
      public function showNewHireScreen() : void
      {
         var _loc1_:UnlockScreen = this;
         _loc1_.gameObj.showNewHireScreen();
         _loc1_.gameObj.method_166();
      }
      
      public function setupPayDay() : void
      {
         var _loc1_:UnlockScreen = this;
         var _loc2_:UserData = _loc1_.gameObj.var_127;
         _loc1_.musicClip = _loc1_.gameObj.var_128.playMusicClip("endofday.wav");
         _loc1_.worker = new Worker(_loc1_.gameObj,_loc1_.subclip.circleMC,_loc1_.gameObj.workerData,130,80,1,false,false);
         _loc1_.worker.playAnimation("payday");
         var _loc3_:String = _loc2_.getWeeklyWage(true);
         _loc1_.subclip.starburst.burst.money.text = _loc3_;
         _loc2_.totalTips += _loc2_.getWeeklyWage();
         _loc1_.gameObj.var_136.recordPayDay();
      }
      
      public function setupNewHire() : void
      {
         var _loc1_:UnlockScreen = this;
         var _loc2_:UserData = _loc1_.gameObj.var_127;
         _loc1_.musicClip = _loc1_.gameObj.var_128.playMusicClip("customer_overjoyed.wav");
         _loc1_.worker = new Worker(_loc1_.gameObj,_loc1_.subclip.circleMC,_loc1_.gameObj.var_143,138,75,0.85,false,false);
         _loc1_.worker.playAnimation("levelup");
         _loc1_.subclip.circleMC.customername.text = _loc1_.lineupDetails[_loc1_.currentLineupIndex];
         _loc1_.subclip.circleMC.customername.setTextFormat(_loc1_.kernFormat);
      }
      
      public function setupTopping() : void
      {
         var screen:UnlockScreen = null;
         screen = this;
         var data:UserData = screen.gameObj.var_127;
         var toppingName:String = String(screen.lineupDetails[screen.currentLineupIndex]);
         var toppingIndex:Number = data.toppingIndexes.indexOf(toppingName);
         screen.gameObj.var_136.recordUnlockTopping();
         screen.subclip.circleMC.customername.text = data.toppingNames[toppingIndex];
         screen.subclip.circleMC.customername.setTextFormat(screen.kernFormat);
         screen.toppingClip = new newtopping_topping();
         try
         {
            screen.toppingClip.gotoAndStop(toppingName);
         }
         catch(err:Error)
         {
            screen.toppingClip.gotoAndStop(1);
         }
         screen.subclip.circleMC.topping.inside.addChild(screen.toppingClip);
         screen.toppingClip.cacheAsBitmap = true;
         data.rememberRevealedTopping(toppingName);
         screen.musicClip = screen.gameObj.var_128.playMusicClip("music_newtopping");
      }
      
      public function setupCustomer() : void
      {
         var _loc1_:UnlockScreen = this;
         var _loc2_:CustomerData = _loc1_.gameObj.var_131;
         var _loc3_:CustomerManager = _loc1_.gameObj.var_133;
         _loc1_.buildCustomer(_loc3_.showNewCustomerNum);
         _loc1_.subclip.circleMC.customername.text = _loc2_.getCustomerName(_loc3_.showNewCustomerNum);
         _loc1_.subclip.circleMC.customername.setTextFormat(_loc1_.kernFormat);
         _loc1_.musicClip = _loc1_.gameObj.var_128.playMusicClip("music_newholiday");
         _loc1_.gameObj.var_136.recordUnlockCustomer(_loc2_.getCustomerName(_loc3_.showNewCustomerNum));
      }
      
      public function destroy() : void
      {
         var _loc1_:UnlockScreen = this;
         _loc1_.musicClip = null;
         _loc1_.kernFormat = null;
         if(_loc1_.worker)
         {
            _loc1_.worker.destroy();
            _loc1_.worker = null;
         }
         try
         {
            _loc1_.destroyCurrentUnlock();
         }
         catch(err:Error)
         {
         }
         _loc1_.clip.stop();
         _loc1_.clip.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickScreen);
         _loc1_.clip.removeEventListener(Event.ENTER_FRAME,_loc1_.updateScreen);
         _loc1_.gameObj.var_150.removeChild(_loc1_.clip);
         _loc1_.clip = null;
      }
      
      public function buildCustomer(param1:Number) : void
      {
         var _loc2_:UnlockScreen = this;
         _loc2_.customerClip = new customerMC();
         var _loc3_:String = _loc2_.gameObj.var_131.getCustomerClipName(param1);
         _loc2_.gameObj.var_131.buildCustomer(_loc3_,_loc2_.customerClip);
         _loc2_.customerClip.gotoAndPlay("overjoyed1");
         _loc2_.customerClip.scaleX = 0.8;
         _loc2_.customerClip.scaleY = 0.8;
         _loc2_.customerClip.x = 141;
         _loc2_.customerClip.y = 75;
         _loc2_.subclip.circleMC.addChild(_loc2_.customerClip);
      }
      
      public function destroyCustomer() : void
      {
         var screen:UnlockScreen = this;
         if(screen.customerClip)
         {
            try
            {
               screen.customerClip.stop();
               screen.customerClip.body.removeChildAt(0);
               screen.customerClip.head.removeChildAt(0);
               screen.customerClip.eyes.removeChildAt(0);
               screen.customerClip.mouth.removeChildAt(0);
               screen.customerClip.neck.removeChildAt(0);
               screen.customerClip.front_shoe.removeChildAt(0);
               screen.customerClip.back_shoe.removeChildAt(0);
               screen.customerClip.fronthand.removeChildAt(0);
               screen.customerClip.backhand.removeChildAt(0);
               screen.customerClip.front_upperarm.removeChildAt(0);
               screen.customerClip.back_upperarm.removeChildAt(0);
               screen.customerClip.front_forearm.removeChildAt(0);
               screen.customerClip.back_forearm.removeChildAt(0);
            }
            catch(err:Error)
            {
               class_6.error("Error removing parts of customer");
            }
            try
            {
               screen.customerClip.hair.removeChildAt(0);
            }
            catch(err:Error)
            {
            }
            try
            {
               screen.customerClip.back_hair.removeChildAt(0);
            }
            catch(err:Error)
            {
            }
            screen.subclip.circleMC.removeChild(screen.customerClip);
            screen.customerClip = null;
         }
      }
   }
}
