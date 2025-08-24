package sushiGame.screens
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.events.*;
   import flash.geom.ColorTransform;
   import flash.geom.Rectangle;
   import flash.text.TextFormat;
   import package_2.class_12;
   import package_2.class_6;
   import package_4.*;
   import sushiGame.data.UserData;
   import sushiGame.models.Worker;
   
   public class EndOfDayScreen
   {
       
      
      public var gameObj:class_5;
      
      public var clip:MovieClip;
      
      public var container:MovieClip;
      
      public var initialRank:Number = 0;
      
      public var newRank:Number = 0;
      
      public var showRankUpgrade:Boolean = false;
      
      public var scoreStopFrame:Number = 24;
      
      public var tipStopFrame:Number = 36;
      
      public var revealTimer:Number = 0;
      
      public var revealTodayLabel:Number = 5;
      
      public var revealTodayPoints:Number = 45;
      
      public var revealTodayPointsWaiter:Number = 51;
      
      public var revealTotalLabel:Number = 60;
      
      public var revealTotalPoints:Number = 100;
      
      public var revealRank:Number = 140;
      
      public var revealMax:Number = 200;
      
      public var tipRevealTimer:Number = 0;
      
      public var tipRevealRaise:Number = 15;
      
      public var tipRevealMax:Number = 60;
      
      public var scoreToday:Number = 0;
      
      public var customersToday:Number = 0;
      
      public var endAction:String = "none";
      
      public var worker:Worker = null;
      
      public var waiter:Worker = null;
      
      public var backdropBitmap:Bitmap = null;
      
      public var hasSubmittedScore:Boolean = false;
      
      public var kernFormat:TextFormat = null;
      
      public function EndOfDayScreen(param1:class_5, param2:MovieClip, param3:Object = null)
      {
         super();
         var _loc4_:EndOfDayScreen;
         (_loc4_ = this).gameObj = param1;
         _loc4_.container = param2;
         _loc4_.setupScreen();
      }
      
      public function setupScreen() : void
      {
         var _loc1_:EndOfDayScreen = this;
         var _loc2_:UserData = _loc1_.gameObj.var_127;
         var _loc3_:Number = _loc2_.getDay();
         _loc1_.clip = new endOfDayMC();
         _loc1_.container.addChild(_loc1_.clip);
         _loc1_.kernFormat = new TextFormat();
         _loc1_.kernFormat.kerning = true;
         _loc1_.gameObj.var_130.api.method_133("DAY " + _loc2_.getDay() + " COMPLETE!");
         _loc1_.clip.taco.customers_txt.txt.text = String(_loc2_.todayCustomers);
         _loc1_.clip.taco.waiting_txt.txt.text = _loc2_.getTodayWaitingAverage() + "%";
         _loc1_.clip.taco.build_txt.txt.text = _loc2_.getTodayBuildAverage() + "%";
         _loc1_.clip.taco.cook_txt.txt.text = _loc2_.getTodayCookAverage() + "%";
         _loc1_.clip.taco.tea_txt.txt.text = _loc2_.getTodayTeaAverage() + "%";
         _loc1_.clip.taco.total_txt.txt.text = _loc2_.getTodayTotalAverage() + "%";
         _loc1_.clip.taco.customers_txt.txt.setTextFormat(_loc1_.kernFormat);
         _loc1_.clip.taco.waiting_txt.txt.setTextFormat(_loc1_.kernFormat);
         _loc1_.clip.taco.build_txt.txt.setTextFormat(_loc1_.kernFormat);
         _loc1_.clip.taco.cook_txt.txt.setTextFormat(_loc1_.kernFormat);
         _loc1_.clip.taco.tea_txt.txt.setTextFormat(_loc1_.kernFormat);
         _loc1_.clip.taco.total_txt.txt.setTextFormat(_loc1_.kernFormat);
         _loc1_.gameObj.var_136.recordTagged("piggybank");
         _loc1_.gameObj.var_136.recordServiceQuality(_loc2_.getTodayTotalAverage());
         _loc1_.clip.scoreclip.tips.today_txt.text = _loc2_.getTipsToday(true);
         _loc1_.clip.scoreclip.tips.total_txt.text = _loc2_.getTipsTotal(true,true);
         _loc1_.clip.scoreclip.tips.today_txt.setTextFormat(_loc1_.kernFormat);
         _loc1_.clip.scoreclip.tips.total_txt.setTextFormat(_loc1_.kernFormat);
         var _loc4_:Number = Math.floor(_loc2_.getTipsToday() / 100);
         _loc1_.clip.scoreclip.tips.wage_txt.text = _loc2_.getWeeklyWage(true);
         _loc1_.clip.scoreclip.tips.payday_txt.text = _loc2_.getPaydayMessage(true);
         _loc1_.clip.scoreclip.tips.wage_txt.setTextFormat(_loc1_.kernFormat);
         _loc1_.clip.scoreclip.tips.payday_txt.setTextFormat(_loc1_.kernFormat);
         _loc1_.clip.scoreclip.points.today_txt.text = class_12.method_114(_loc2_.getTodayTotalScore());
         _loc1_.clip.scoreclip.points.total_txt.text = class_12.method_114(_loc2_.getTotalPoints(true));
         _loc1_.clip.scoreclip.points.rank_txt.text = _loc2_.getRank();
         _loc1_.clip.scoreclip.points.rank_title.text = _loc2_.getRankTitle();
         _loc1_.clip.scoreclip.points.today_txt.setTextFormat(_loc1_.kernFormat);
         _loc1_.clip.scoreclip.points.total_txt.setTextFormat(_loc1_.kernFormat);
         _loc1_.clip.scoreclip.points.rank_txt.setTextFormat(_loc1_.kernFormat);
         _loc1_.clip.scoreclip.points.rank_title.setTextFormat(_loc1_.kernFormat);
         _loc1_.initialRank = _loc2_.getRank();
         _loc1_.scoreToday = _loc2_.getTodayTotalScore();
         _loc1_.customersToday = _loc2_.todayCustomers;
         var _loc5_:Number;
         if((_loc5_ = _loc2_.saveScores()) > _loc1_.initialRank)
         {
            _loc1_.newRank = _loc5_;
            _loc1_.showRankUpgrade = true;
         }
         else
         {
            _loc1_.showRankUpgrade = false;
         }
         _loc2_.playedALevel = true;
         ++_loc2_.playedLevelsToday;
         var _loc6_:Number;
         if((_loc6_ = _loc2_.getPointsUntilNextRank()) < 0)
         {
            _loc6_ = 0;
         }
         _loc1_.clip.scoreclip.points.nextrank.nextrank_txt.text = class_12.method_114(_loc6_);
         _loc1_.clip.scoreclip.points.nextrank.nextrank_txt.setTextFormat(_loc1_.kernFormat);
         _loc1_.clip.scoreclip.gotoAndStop(1);
         _loc1_.clip.scoreclip.points.total_label.visible = false;
         _loc1_.clip.scoreclip.points.today_label.visible = false;
         _loc1_.clip.scoreclip.points.today_txt.visible = false;
         _loc1_.clip.scoreclip.points.total_txt.visible = false;
         _loc1_.clip.scoreclip.points.nextrank.visible = false;
         _loc1_.container.addEventListener("clickQuit",_loc1_.clickQuit);
         _loc1_.container.addEventListener("clickContinue",_loc1_.clickContinue);
         _loc1_.container.addEventListener("clickSubmitScore",_loc1_.clickSubmitScore);
         _loc1_.container.addEventListener("clickSaveBackup",_loc1_.clickSaveBackup);
         _loc1_.clip.bg.gotoAndStop(4);
         _loc1_.initBackdrop();
         _loc1_.gameObj.var_128.switchMusic("build");
         _loc1_.clip.taco.gotoAndPlay(2);
         if(_loc1_.gameObj.var_127.didCreateWaiter)
         {
            _loc1_.waiter = new Worker(_loc1_.gameObj,_loc1_.clip.workerholder,_loc1_.gameObj.var_143,196,75,0.77,false,true);
            _loc1_.waiter.playAnimation("standoffset");
            _loc1_.clip.servershadow.visible = true;
         }
         else
         {
            _loc1_.clip.servershadow.visible = false;
         }
         _loc1_.worker = new Worker(_loc1_.gameObj,_loc1_.clip.workerholder,_loc1_.gameObj.workerData,125,106,0.8,false,true);
         _loc1_.worker.playAnimation("stand");
         _loc1_.clip.addEventListener(Event.ENTER_FRAME,_loc1_.updateScreen);
      }
      
      public function updateScreen(param1:Event = null) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc2_:EndOfDayScreen = this;
         if(_loc2_.clip)
         {
            if(_loc2_.worker)
            {
               _loc2_.worker.animateModel();
            }
            if(_loc2_.waiter)
            {
               _loc2_.waiter.animateModel();
            }
            if(_loc2_.clip.taco.currentFrame == _loc2_.clip.taco.totalFrames && _loc2_.clip.scoreclip.currentFrame == 1)
            {
               _loc2_.clip.scoreclip.gotoAndPlay(2);
            }
            else if(_loc2_.clip.taco.currentFrame < _loc2_.clip.taco.totalFrames)
            {
               if(_loc2_.clip.taco.currentFrame == 31 || _loc2_.clip.taco.currentFrame == 43 || _loc2_.clip.taco.currentFrame == 55 || _loc2_.clip.taco.currentFrame == 67 || _loc2_.clip.taco.currentFrame == 110)
               {
                  _loc2_.gameObj.var_128.playSound("droptopping.wav");
               }
               else if(_loc2_.clip.taco.currentFrame == 172)
               {
                  _loc2_.gameObj.var_128.playSound("trayslide.wav");
               }
            }
            else if(_loc2_.clip.scoreclip.currentFrame == _loc2_.scoreStopFrame)
            {
               ++_loc2_.revealTimer;
               if(_loc2_.revealTimer == _loc2_.revealTodayLabel)
               {
                  _loc2_.clip.scoreclip.points.today_label.visible = true;
                  _loc2_.gameObj.var_128.playSound("talkbubble.wav");
               }
               else if(_loc2_.revealTimer == _loc2_.revealTodayPoints)
               {
                  _loc2_.clip.scoreclip.points.today_txt.visible = true;
                  _loc3_ = _loc2_.scoreToday / _loc2_.customersToday;
                  if(_loc3_ > 80)
                  {
                     _loc2_.worker.playAnimation("score_happy");
                  }
                  else if(_loc3_ > 60)
                  {
                     _loc2_.worker.playAnimation("score_ok");
                  }
                  else
                  {
                     _loc2_.worker.playAnimation("score_sad");
                  }
               }
               else if(_loc2_.revealTimer == _loc2_.revealTodayPointsWaiter)
               {
                  if(_loc2_.waiter != null)
                  {
                     if((_loc4_ = _loc2_.scoreToday / _loc2_.customersToday) > 80)
                     {
                        _loc2_.waiter.playAnimation("score_happy");
                     }
                     else if(_loc4_ > 60)
                     {
                        _loc2_.waiter.playAnimation("score_ok");
                     }
                     else
                     {
                        _loc2_.waiter.playAnimation("score_sad");
                     }
                  }
               }
               else if(_loc2_.revealTimer == _loc2_.revealTotalLabel)
               {
                  _loc2_.clip.scoreclip.points.total_label.visible = true;
                  _loc2_.gameObj.var_128.playSound("talkbubble.wav");
               }
               else if(_loc2_.revealTimer == _loc2_.revealTotalPoints)
               {
                  _loc2_.clip.scoreclip.points.total_txt.visible = true;
               }
               else if(_loc2_.revealTimer == _loc2_.revealRank)
               {
                  if(_loc2_.newRank > _loc2_.initialRank)
                  {
                     _loc2_.clip.scoreclip.points.rank_txt.text = _loc2_.gameObj.var_127.getRank();
                     _loc2_.clip.scoreclip.points.rank_title.text = _loc2_.gameObj.var_127.getRankTitle();
                     _loc2_.clip.scoreclip.points.fireworks.gotoAndPlay(2);
                     _loc2_.clip.scoreclip.points.rank_txt.setTextFormat(_loc2_.kernFormat);
                     _loc2_.clip.scoreclip.points.rank_title.setTextFormat(_loc2_.kernFormat);
                     _loc2_.gameObj.var_128.playMusicClip("customer_overjoyed.wav");
                     _loc2_.worker.playAnimation("levelup");
                     if(_loc2_.waiter)
                     {
                        _loc2_.waiter.playAnimation("levelup");
                     }
                  }
                  else
                  {
                     _loc2_.clip.scoreclip.gotoAndPlay("showtips");
                     _loc2_.gameObj.var_128.playSound("dropticket.wav");
                  }
               }
               else if(_loc2_.revealTimer == _loc2_.revealMax)
               {
                  _loc2_.clip.scoreclip.gotoAndPlay("showtips");
                  _loc2_.gameObj.var_128.playSound("dropticket.wav");
               }
            }
            else if(_loc2_.clip.scoreclip.currentFrame == _loc2_.tipStopFrame)
            {
               ++_loc2_.tipRevealTimer;
               if(_loc2_.tipRevealTimer == _loc2_.tipRevealRaise)
               {
                  if(_loc2_.newRank > _loc2_.initialRank)
                  {
                     _loc2_.clip.scoreclip.tips.wage_txt.text = _loc2_.gameObj.var_127.getWeeklyWage(true);
                     _loc2_.clip.scoreclip.tips.wage_txt.setTextFormat(_loc2_.kernFormat);
                     _loc2_.clip.scoreclip.tips.fireworks.gotoAndPlay(2);
                     _loc2_.gameObj.var_128.playSound("getstar.wav");
                  }
                  else
                  {
                     _loc2_.clip.scoreclip.points.nextrank.visible = true;
                     _loc2_.gameObj.var_128.playSound("talkbubble.wav");
                     _loc2_.gameObj.var_130.api.enableButtons();
                  }
               }
               else if(_loc2_.tipRevealTimer == _loc2_.tipRevealMax)
               {
                  _loc2_.clip.scoreclip.points.nextrank.visible = true;
                  _loc2_.gameObj.var_128.playSound("talkbubble.wav");
                  _loc2_.gameObj.var_130.api.enableButtons();
               }
            }
            else if(_loc2_.clip.scoreclip.currentFrame == _loc2_.clip.scoreclip.totalFrames)
            {
               if(_loc2_.endAction == "continue")
               {
                  _loc2_.startNextDay();
               }
               else if(_loc2_.endAction == "quit")
               {
                  _loc2_.quitToTitle();
               }
            }
         }
      }
      
      public function clickContinue(param1:Event) : void
      {
         var _loc2_:EndOfDayScreen = this;
         _loc2_.endAction = "continue";
         _loc2_.clip.curtains.gotoAndPlay("close");
         _loc2_.clip.scoreclip.gotoAndPlay("raise");
         _loc2_.gameObj.var_130.api.method_126("EndOfDay");
         _loc2_.gameObj.var_130.method_128();
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
      }
      
      public function clickSubmitScore(param1:Event) : void
      {
         var _loc2_:EndOfDayScreen = this;
         if(_loc2_.gameObj.var_130.api.method_181())
         {
            _loc2_.gameObj.var_130.method_128();
         }
         else if(!_loc2_.hasSubmittedScore)
         {
            _loc2_.gameObj.var_128.playSound("buttonclick.wav");
            _loc2_.gameObj.var_130.submitScore(_loc2_.gameObj.var_127.getTotalPoints(),_loc2_.gameObj.var_127.myName,_loc2_.showButtonsAfterScore,_loc2_.gameObj.workerData.getDataToSave());
            _loc2_.hideButtonsDuringScore();
            _loc2_.hasSubmittedScore = true;
            _loc2_.gameObj.var_130.api.disableButtons("EndOfDay",["Submit Score"],false,false);
         }
      }
      
      public function hideButtonsDuringScore() : void
      {
         this;
      }
      
      public function showButtonsAfterScore() : void
      {
         this;
      }
      
      public function clickQuit(param1:Event) : void
      {
         var _loc2_:EndOfDayScreen = this;
         _loc2_.endAction = "quit";
         _loc2_.clip.fader.gotoAndPlay("fadeout");
         _loc2_.clip.scoreclip.gotoAndPlay("raise");
         _loc2_.gameObj.var_130.api.method_126("EndOfDay");
         _loc2_.gameObj.var_130.method_128();
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
      }
      
      public function destroy() : void
      {
         var _loc1_:EndOfDayScreen = this;
         _loc1_.kernFormat = null;
         _loc1_.worker.destroy();
         _loc1_.worker = null;
         if(_loc1_.waiter != null)
         {
            _loc1_.waiter.destroy();
            _loc1_.waiter = null;
         }
         if(_loc1_.backdropBitmap != null)
         {
            _loc1_.backdropBitmap.bitmapData.dispose();
            try
            {
               _loc1_.clip.backdrop_holder.removeChild(_loc1_.backdropBitmap);
            }
            catch(err:Error)
            {
            }
            _loc1_.backdropBitmap = null;
         }
         _loc1_.clip.removeEventListener(Event.ENTER_FRAME,_loc1_.updateScreen);
         _loc1_.container.removeEventListener("clickQuit",_loc1_.clickQuit);
         _loc1_.container.removeEventListener("clickContinue",_loc1_.clickContinue);
         _loc1_.container.removeEventListener("clickSubmitScore",_loc1_.clickSubmitScore);
         _loc1_.container.removeEventListener("clickSaveBackup",_loc1_.clickSaveBackup);
         _loc1_.container.removeChild(_loc1_.clip);
         _loc1_.clip = null;
      }
      
      public function startNextDay() : void
      {
         var _loc1_:EndOfDayScreen = this;
         class_6.method_1("[ERASE]");
         _loc1_.clip.removeEventListener(Event.ENTER_FRAME,_loc1_.updateScreen);
         _loc1_.gameObj.method_174();
      }
      
      public function quitToTitle() : void
      {
         var _loc1_:EndOfDayScreen = this;
         class_6.method_1("[ERASE]");
         _loc1_.clip.removeEventListener(Event.ENTER_FRAME,_loc1_.updateScreen);
         _loc1_.gameObj.method_145();
      }
      
      private function createLobbyBackdropBitmap() : Bitmap
      {
         var _loc4_:Number = NaN;
         var _loc1_:EndOfDayScreen = this;
         var _loc2_:UserData = _loc1_.gameObj.var_127;
         var _loc3_:Bitmap = null;
         var _loc5_:MovieClip = new nowindowBackdropMC();
         _loc4_ = 1;
         while(_loc4_ <= 9)
         {
            _loc5_.holder.wallparts["wall" + _loc4_].gotoAndStop(_loc2_.lobbyWallpaper);
            _loc4_++;
         }
         _loc4_ = 1;
         while(_loc4_ <= 7)
         {
            _loc5_.holder.floorparts["floor" + _loc4_].gotoAndStop(_loc2_.lobbyFlooring);
            _loc4_++;
         }
         _loc5_.holder.trim.transform.colorTransform = _loc1_.createColorTransform(_loc2_.lobbyTrim);
         _loc5_.holder.wallparts.mask = _loc5_.holder.wallmask;
         _loc5_.holder.floorparts.mask = _loc5_.holder.floormask;
         var _loc6_:BitmapData;
         (_loc6_ = new BitmapData(706,552,true,0)).draw(_loc5_,null,null,null,new Rectangle(0,0,706,552));
         _loc3_ = new Bitmap(_loc6_);
         _loc5_ = null;
         return _loc3_;
      }
      
      private function createColorTransform(param1:Number) : ColorTransform
      {
         var _loc2_:ColorTransform = new ColorTransform();
         _loc2_.redMultiplier = ((param1 & 16711680) >>> 16) / 255;
         _loc2_.greenMultiplier = ((param1 & 65280) >>> 8) / 255;
         _loc2_.blueMultiplier = (param1 & 255) / 255;
         return _loc2_;
      }
      
      public function initBackdrop() : void
      {
         var _loc1_:EndOfDayScreen = this;
         if(_loc1_.backdropBitmap != null)
         {
            _loc1_.backdropBitmap.bitmapData.dispose();
            try
            {
               _loc1_.clip.backdrop_holder.removeChild(_loc1_.backdropBitmap);
            }
            catch(err:Error)
            {
            }
            _loc1_.backdropBitmap = null;
         }
         _loc1_.backdropBitmap = _loc1_.createLobbyBackdropBitmap();
         _loc1_.clip.backdrop_holder.addChild(_loc1_.backdropBitmap);
         _loc1_.backdropBitmap.x = -24;
         _loc1_.backdropBitmap.y = -40;
      }
      
      public function clickSaveBackup(param1:Event) : void
      {
         var _loc2_:EndOfDayScreen = this;
         var _loc3_:UserData = _loc2_.gameObj.var_127;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         if(_loc3_.so != null)
         {
            _loc2_.gameObj.var_130.api.method_143(_loc3_.so.data,_loc3_.saveSlotPrefix,_loc3_.saveSlotPrefix + "_backup_" + _loc3_.myName + "_day" + (_loc3_.getDay() - 1),null);
         }
      }
   }
}
