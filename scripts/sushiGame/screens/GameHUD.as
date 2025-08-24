package sushiGame.screens
{
   import flash.display.MovieClip;
   import flash.events.*;
   import flash.utils.getTimer;
   import package_2.class_6;
   import package_4.*;
   import sushiGame.data.UserData;
   
   public class GameHUD
   {
       
      
      public var gameObj:class_5;
      
      public var clip:MovieClip;
      
      public var currentStation:String = "none";
      
      public var duringTransition:Boolean = false;
      
      public var transitionToScreen:String = "none";
      
      private var transitionSpeed:Number = 0.2;
      
      private var switchedTransition:Boolean = false;
      
      public var trainingClip:MovieClip;
      
      public var whichContextTraining:String = "none";
      
      public var timersGoingOff:Number = 0;
      
      public var toppingTimersGoingOff:Number = 0;
      
      public var shouldShowFPS:Boolean = false;
      
      public var lastTime:Number = 0;
      
      public var shouldCheckStickerTraining:Boolean = true;
      
      public function GameHUD(param1:class_5)
      {
         super();
         var _loc2_:GameHUD = this;
         _loc2_.gameObj = param1;
         _loc2_.setupScreen();
      }
      
      public function setupScreen() : void
      {
         var _loc1_:GameHUD = this;
         _loc1_.clip = new hudMC();
         _loc1_.gameObj.var_150.addChild(_loc1_.clip);
         _loc1_.clip.mouseEnabled = false;
         _loc1_.clip.order_ring.visible = false;
         _loc1_.clip.cook_ring.visible = false;
         _loc1_.clip.build_ring.visible = false;
         _loc1_.clip.tea_ring.visible = false;
         _loc1_.clip.order_ring.mouseEnabled = false;
         _loc1_.clip.cook_ring.mouseEnabled = false;
         _loc1_.clip.build_ring.mouseEnabled = false;
         _loc1_.clip.tea_ring.mouseEnabled = false;
         _loc1_.clip.order_ring.mouseChildren = false;
         _loc1_.clip.cook_ring.mouseChildren = false;
         _loc1_.clip.build_ring.mouseChildren = false;
         _loc1_.clip.tea_ring.mouseChildren = false;
         _loc1_.clip.order_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickOrder);
         _loc1_.clip.cook_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickCook);
         _loc1_.clip.build_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickBuild);
         _loc1_.clip.tea_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickTea);
         _loc1_.clip.mute_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickMute);
         _loc1_.clip.unmute_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickUnmute);
         _loc1_.clip.menu_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickMenu);
         _loc1_.clip.mute_music_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickMuteMusic);
         _loc1_.clip.unmute_music_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickUnmuteMusic);
         _loc1_.clip.special_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickSpecial);
         _loc1_.updateMuteButton();
         _loc1_.clip.pausedBG.visible = false;
         _loc1_.clip.pausedBG.mouseEnabled = true;
         _loc1_.clip.doorchime_alert.visible = false;
         _loc1_.clip.doorchime_alert.stop();
         _loc1_.clip.doorchime_alert.mouseEnabled = false;
         _loc1_.clip.red_timer.visible = false;
         _loc1_.clip.red_timer.mouseEnabled = false;
         _loc1_.clip.yellow_timer.visible = false;
         _loc1_.clip.yellow_timer.mouseEnabled = false;
         _loc1_.clip.blue_timer.visible = false;
         _loc1_.clip.blue_timer.mouseEnabled = false;
         _loc1_.clip.red_timer.stop();
         _loc1_.clip.yellow_timer.stop();
         _loc1_.clip.blue_timer.stop();
         if(_loc1_.gameObj.var_127.currentDay == 1 && _loc1_.gameObj.training)
         {
            _loc1_.trainingClip = new trainingMC();
            _loc1_.clip.addChild(_loc1_.trainingClip);
            _loc1_.trainingClip.mouseEnabled = false;
            _loc1_.trainingClip.mouseChildren = false;
            _loc1_.clip.skiptraining_btn.visible = true;
            _loc1_.clip.skiptraining_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickSkipTraining);
            _loc1_.clip.skip_yes_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickSkipTrainingYes);
            _loc1_.clip.skip_no_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickSkipTrainingNo);
            _loc1_.clip.menu_btn.visible = false;
         }
         else
         {
            _loc1_.clip.skiptraining_btn.visible = false;
         }
         _loc1_.clip.skip_yes_btn.visible = false;
         _loc1_.clip.skip_no_btn.visible = false;
         _loc1_.clip.sureMC.visible = false;
         if(_loc1_.shouldShowFPS)
         {
            _loc1_.clip.fps_txt.visible = true;
         }
         else
         {
            _loc1_.clip.fps_txt.visible = false;
         }
         _loc1_.clip.mem_txt.visible = false;
         _loc1_.clip.fps_warning.visible = false;
         _loc1_.gameObj.var_130.api.addEventListener("earnedSticker",_loc1_.onEarnedSticker);
      }
      
      public function destroy() : void
      {
         var _loc1_:GameHUD = this;
         _loc1_.gameObj.var_130.api.removeEventListener("earnedSticker",_loc1_.onEarnedSticker);
         _loc1_.clip.order_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickOrder);
         _loc1_.clip.cook_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickCook);
         _loc1_.clip.build_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickBuild);
         _loc1_.clip.tea_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickTea);
         _loc1_.clip.mute_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickMute);
         _loc1_.clip.unmute_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickUnmute);
         _loc1_.clip.mute_music_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickMuteMusic);
         _loc1_.clip.unmute_music_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickUnmuteMusic);
         _loc1_.clip.menu_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickMenu);
         _loc1_.clip.special_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickSpecial);
         _loc1_.clip.skiptraining_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickSkipTraining);
         _loc1_.clip.skip_yes_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickSkipTrainingYes);
         _loc1_.clip.skip_no_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickSkipTrainingNo);
         if(_loc1_.trainingClip)
         {
            _loc1_.clip.removeChild(_loc1_.trainingClip);
            _loc1_.trainingClip = null;
         }
         _loc1_.gameObj.var_150.removeChild(_loc1_.clip);
         _loc1_.clip = null;
      }
      
      public function removeSkipButtons() : void
      {
         var _loc1_:GameHUD = this;
         _loc1_.clip.skiptraining_btn.visible = false;
         _loc1_.clip.skip_yes_btn.visible = false;
         _loc1_.clip.skip_no_btn.visible = false;
         _loc1_.clip.sureMC.visible = false;
         _loc1_.clip.menu_btn.visible = true;
      }
      
      public function clickSkipTraining(param1:MouseEvent) : void
      {
         var _loc2_:GameHUD = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.clip.skiptraining_btn.visible = false;
         _loc2_.clip.skip_yes_btn.visible = true;
         _loc2_.clip.skip_no_btn.visible = true;
         _loc2_.clip.sureMC.visible = true;
      }
      
      public function clickSkipTrainingYes(param1:MouseEvent) : void
      {
         var _loc2_:GameHUD = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.removeSkipButtons();
         if(_loc2_.gameObj.training)
         {
            _loc2_.gameObj.var_196 = _loc2_.gameObj.var_304 + 1;
            if(_loc2_.trainingClip)
            {
               _loc2_.trainingClip.gotoAndStop(_loc2_.gameObj.var_196);
            }
            _loc2_.gameObj.var_133.didSkipTraining = true;
            _loc2_.gameObj.var_133.lastSpawnTime = _loc2_.gameObj.controls.gameplayTimer;
            _loc2_.gameObj.method_217();
         }
      }
      
      public function clickSkipTrainingNo(param1:MouseEvent) : void
      {
         var _loc2_:GameHUD = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.clip.skiptraining_btn.visible = true;
         _loc2_.clip.skip_yes_btn.visible = false;
         _loc2_.clip.skip_no_btn.visible = false;
         _loc2_.clip.sureMC.visible = false;
      }
      
      public function clickSpecial(param1:MouseEvent = null) : void
      {
         var _loc2_:GameHUD = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         if(_loc2_.clip.build_btn.visible != false)
         {
            _loc2_.gameObj.method_195();
            if(_loc2_.whichContextTraining == "cheatsheet")
            {
               _loc2_.removeContextTraining();
               _loc2_.gameObj.var_127.setTrained("cheatsheet");
            }
         }
      }
      
      public function clickOrder(param1:MouseEvent = null) : void
      {
         var _loc2_:GameHUD = this;
         if(_loc2_.currentStation != "order" && _loc2_.canClickInTraining(param1))
         {
            _loc2_.gameObj.var_145.registerClickForForcing();
            _loc2_.startTransition("order");
            _loc2_.gameObj.var_130.method_117("station","1");
         }
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
      }
      
      public function clickCook(param1:MouseEvent = null) : void
      {
         var _loc2_:GameHUD = this;
         if(_loc2_.currentStation != "cook" && _loc2_.canClickInTraining(param1))
         {
            _loc2_.startTransition("cook");
            _loc2_.gameObj.var_130.method_117("station","2");
         }
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
      }
      
      public function clickBuild(param1:MouseEvent = null) : void
      {
         var _loc2_:GameHUD = this;
         if(_loc2_.currentStation != "build" && _loc2_.canClickInTraining(param1))
         {
            _loc2_.startTransition("build");
            _loc2_.gameObj.var_130.method_117("station","3");
         }
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
      }
      
      public function clickTea(param1:MouseEvent = null) : void
      {
         var _loc2_:GameHUD = this;
         if(_loc2_.currentStation != "tea" && _loc2_.canClickInTraining(param1))
         {
            _loc2_.startTransition("tea");
            _loc2_.gameObj.var_130.method_117("station","4");
         }
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
      }
      
      public function updateMuteButton() : void
      {
         var _loc1_:GameHUD = this;
         _loc1_.clip.mute_btn.visible = !_loc1_.gameObj.var_128.isMute;
         _loc1_.clip.unmute_btn.visible = _loc1_.gameObj.var_128.isMute;
         _loc1_.clip.mute_music_btn.visible = !_loc1_.gameObj.var_128.isMusicMute;
         _loc1_.clip.unmute_music_btn.visible = _loc1_.gameObj.var_128.isMusicMute;
      }
      
      public function clickMute(param1:MouseEvent = null) : void
      {
         var _loc2_:GameHUD = this;
         _loc2_.gameObj.var_128.muteSound();
         _loc2_.updateMuteButton();
      }
      
      public function clickUnmute(param1:MouseEvent = null) : void
      {
         var _loc2_:GameHUD = this;
         _loc2_.gameObj.var_128.unmuteSound();
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.updateMuteButton();
      }
      
      public function clickMuteMusic(param1:MouseEvent = null) : void
      {
         var _loc2_:GameHUD = this;
         _loc2_.gameObj.var_128.muteMusic();
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.updateMuteButton();
      }
      
      public function clickUnmuteMusic(param1:MouseEvent = null) : void
      {
         var _loc2_:GameHUD = this;
         _loc2_.gameObj.var_128.unmuteMusic();
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.updateMuteButton();
      }
      
      public function clickMenu(param1:MouseEvent = null) : void
      {
         var _loc2_:GameHUD = this;
         if(_loc2_.canClickInTraining(param1))
         {
            _loc2_.gameObj.var_128.playSound("buttonclick.wav");
            _loc2_.gameObj.method_248();
            _loc2_.gameObj.var_135.quietSoundWhenPaused();
            _loc2_.gameObj.var_137.quietSoundWhenPaused();
            _loc2_.gameObj.var_145.stopFurniMusic();
            if(_loc2_.whichContextTraining == "stickeropenmenu")
            {
               _loc2_.removeContextTraining();
               _loc2_.gameObj.var_127.setTrained("stickeropenmenu");
            }
         }
      }
      
      public function closedMenu() : void
      {
         var _loc1_:GameHUD = this;
         _loc1_.gameObj.var_135.resumeSoundAfterPaused();
         _loc1_.gameObj.var_137.resumeSoundAfterPaused();
      }
      
      public function startTransition(param1:String, param2:Boolean = false) : void
      {
         var _loc3_:GameHUD = this;
         if(!_loc3_.duringTransition)
         {
            _loc3_.transitionToScreen = param1;
            _loc3_.duringTransition = true;
            _loc3_.switchedTransition = false;
            _loc3_.clip.transition.visible = true;
            _loc3_.clip.transition.alpha = 0;
            if(param2)
            {
               _loc3_.clip.transition.alpha = 1;
            }
            if(_loc3_.whichContextTraining != "none")
            {
               _loc3_.removeContextTraining();
            }
         }
      }
      
      private function triggerTransition() : void
      {
         var _loc1_:GameHUD = this;
         _loc1_.clip.order_ring.visible = false;
         _loc1_.clip.cook_ring.visible = false;
         _loc1_.clip.build_ring.visible = false;
         _loc1_.clip.tea_ring.visible = false;
         if(_loc1_.currentStation == "build")
         {
            _loc1_.gameObj.var_129.deactivateScreen();
         }
         else if(_loc1_.currentStation == "cook")
         {
            _loc1_.gameObj.var_135.deactivateScreen();
         }
         else if(_loc1_.currentStation == "tea")
         {
            _loc1_.gameObj.var_137.deactivateScreen();
         }
         else if(_loc1_.currentStation == "order")
         {
            _loc1_.gameObj.var_145.deactivateScreen();
         }
         else if(_loc1_.currentStation == "takeOrder")
         {
            _loc1_.gameObj.var_186.deactivateScreen();
         }
         else if(_loc1_.currentStation == "giveOrder")
         {
            _loc1_.gameObj.var_188.deactivateScreen();
         }
         else if(_loc1_.currentStation == "diningGiveOrder")
         {
            _loc1_.gameObj.var_191.deactivateScreen();
         }
         else if(_loc1_.currentStation == "diningTakeOrder")
         {
            _loc1_.gameObj.var_195.deactivateScreen();
         }
         if(_loc1_.transitionToScreen == "order")
         {
            _loc1_.gameObj.var_145.activateScreen();
            _loc1_.clip.order_ring.visible = true;
            _loc1_.gameObj.method_104(3,35);
         }
         else if(_loc1_.transitionToScreen == "cook")
         {
            _loc1_.gameObj.var_135.activateScreen();
            _loc1_.clip.cook_ring.visible = true;
            _loc1_.gameObj.method_104(4);
         }
         else if(_loc1_.transitionToScreen == "tea")
         {
            _loc1_.gameObj.var_137.activateScreen();
            _loc1_.clip.tea_ring.visible = true;
            _loc1_.gameObj.method_104(24);
         }
         else if(_loc1_.transitionToScreen == "build")
         {
            _loc1_.gameObj.var_129.activateScreen();
            _loc1_.clip.build_ring.visible = true;
            _loc1_.gameObj.method_104(11);
         }
         else if(_loc1_.transitionToScreen == "takeOrder")
         {
            _loc1_.gameObj.var_186.activateScreen();
         }
         else if(_loc1_.transitionToScreen == "giveOrder")
         {
            _loc1_.gameObj.var_188.activateScreen();
         }
         else if(_loc1_.transitionToScreen == "diningGiveOrder")
         {
            _loc1_.gameObj.var_191.activateScreen();
         }
         else if(_loc1_.transitionToScreen == "diningTakeOrder")
         {
            _loc1_.gameObj.var_195.activateScreen();
         }
         if(_loc1_.transitionToScreen == "order" && _loc1_.gameObj.var_127.hasRibbon() && !_loc1_.gameObj.var_127.hasTrained("ribbon") && !_loc1_.gameObj.var_145.isWaitingToEnd)
         {
            _loc1_.showContextTraining("ribbon");
            _loc1_.gameObj.var_127.setTrained("ribbon");
         }
         else if(_loc1_.transitionToScreen == "order" && _loc1_.gameObj.var_127.getDay() > 1 && _loc1_.gameObj.var_127.getRank() > 6 && !_loc1_.gameObj.var_127.hasTrained("clothingbonus"))
         {
            _loc1_.showContextTraining("clothingbonus");
            _loc1_.gameObj.var_127.setTrained("clothingbonus");
         }
         else if(!_loc1_.gameObj.var_145.isWaitingToEnd && _loc1_.shouldCheckStickerTraining && !_loc1_.gameObj.var_127.hasTrained("stickeropenmenu") && _loc1_.gameObj.var_131.anyCustomersHaveGiftBox())
         {
            _loc1_.showContextTraining("stickeropenmenu");
            _loc1_.shouldCheckStickerTraining = false;
         }
         else if(_loc1_.shouldCheckStickerTraining)
         {
            _loc1_.shouldCheckStickerTraining = false;
         }
         if(_loc1_.transitionToScreen == "takeOrder" || _loc1_.transitionToScreen == "giveOrder" || _loc1_.transitionToScreen == "diningGiveOrder" || _loc1_.transitionToScreen == "diningTakeOrder" || _loc1_.gameObj.var_145.isWaitingToEnd)
         {
            _loc1_.clip.build_btn.visible = false;
            _loc1_.clip.cook_btn.visible = false;
            _loc1_.clip.order_btn.visible = false;
            _loc1_.clip.tea_btn.visible = false;
         }
         else
         {
            _loc1_.clip.build_btn.visible = true;
            _loc1_.clip.cook_btn.visible = true;
            _loc1_.clip.order_btn.visible = true;
            _loc1_.clip.tea_btn.visible = true;
         }
         if(_loc1_.transitionToScreen == "ending")
         {
            _loc1_.gameObj.method_279();
         }
         else
         {
            _loc1_.currentStation = _loc1_.transitionToScreen;
            _loc1_.transitionToScreen = "none";
         }
      }
      
      public function disableStationButtons() : void
      {
         var _loc1_:GameHUD = this;
         _loc1_.clip.build_btn.visible = false;
         _loc1_.clip.cook_btn.visible = false;
         _loc1_.clip.order_btn.visible = false;
         _loc1_.clip.tea_btn.visible = false;
      }
      
      public function enableStationButtons() : void
      {
         var _loc1_:GameHUD = this;
         _loc1_.clip.build_btn.visible = true;
         _loc1_.clip.cook_btn.visible = true;
         _loc1_.clip.order_btn.visible = true;
         _loc1_.clip.tea_btn.visible = true;
      }
      
      public function updateHUD() : void
      {
         var _loc1_:GameHUD = this;
         if(_loc1_.duringTransition)
         {
            if(!_loc1_.switchedTransition)
            {
               _loc1_.clip.transition.alpha += _loc1_.transitionSpeed;
               if(_loc1_.clip.transition.alpha >= 1)
               {
                  _loc1_.clip.transition.alpha = 1;
                  _loc1_.triggerTransition();
                  _loc1_.switchedTransition = true;
               }
            }
            else
            {
               _loc1_.clip.transition.alpha -= _loc1_.transitionSpeed;
               if(_loc1_.clip.transition.alpha <= 0)
               {
                  _loc1_.clip.transition.alpha = 0;
                  _loc1_.clip.transition.visible = false;
                  _loc1_.duringTransition = false;
               }
            }
         }
      }
      
      public function startHUD() : void
      {
         var _loc1_:GameHUD = this;
         _loc1_.updateMuteButton();
         _loc1_.startTransition("order",true);
         if(_loc1_.gameObj.var_127.currentSpecial > -1)
         {
            _loc1_.clip.special_btn.visible = true;
         }
         else
         {
            _loc1_.clip.special_btn.visible = false;
         }
      }
      
      public function showCustomerAlert(param1:Boolean = false) : void
      {
         var _loc4_:Number = NaN;
         var _loc2_:GameHUD = this;
         var _loc3_:UserData = _loc2_.gameObj.var_127;
         if(_loc3_.hasBonus("doorbell"))
         {
            if((_loc4_ = _loc2_.gameObj.var_133.orderline.length) > 0)
            {
               if(_loc2_.currentStation != "order" && _loc2_.transitionToScreen != "order")
               {
                  _loc2_.clip.doorchime_alert.visible = true;
                  _loc2_.clip.doorchime_alert.play();
                  _loc2_.clip.doorchime_alert.num_txt.text = String(_loc4_);
               }
               if(param1)
               {
                  _loc2_.gameObj.var_128.playSound("waiter_bell.wav");
               }
               else
               {
                  _loc2_.gameObj.var_128.playSound("doorchime.wav");
               }
            }
         }
      }
      
      public function showTimerAlert(param1:String = "cook") : void
      {
         var _loc2_:GameHUD = this;
         var _loc3_:UserData = _loc2_.gameObj.var_127;
         if(param1 == "cook" && _loc2_.currentStation != "cook" && _loc2_.transitionToScreen != "cook")
         {
            ++_loc2_.timersGoingOff;
            if(_loc2_.timersGoingOff == 1)
            {
               _loc2_.clip.blue_timer.visible = true;
               _loc2_.clip.blue_timer.play();
            }
            else if(_loc2_.timersGoingOff == 2)
            {
               _loc2_.clip.yellow_timer.visible = true;
               _loc2_.clip.yellow_timer.play();
            }
            else if(_loc2_.timersGoingOff > 2)
            {
               _loc2_.clip.red_timer.visible = true;
               _loc2_.clip.red_timer.play();
            }
         }
      }
      
      public function hideTimerAlerts(param1:String = "cook") : void
      {
         var _loc2_:GameHUD = this;
         if(param1 == "cook")
         {
            _loc2_.timersGoingOff = 0;
            _loc2_.clip.blue_timer.visible = false;
            _loc2_.clip.yellow_timer.visible = false;
            _loc2_.clip.red_timer.visible = false;
            _loc2_.clip.blue_timer.stop();
            _loc2_.clip.yellow_timer.stop();
            _loc2_.clip.red_timer.stop();
         }
      }
      
      public function canClickInTraining(param1:Event) : Boolean
      {
         var _loc2_:GameHUD = this;
         var _loc3_:class_5 = _loc2_.gameObj;
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         if(param1.currentTarget == _loc2_.clip.menu_btn)
         {
            _loc5_ = true;
         }
         if(_loc3_.training)
         {
            if(param1.currentTarget == _loc2_.clip.cook_btn && _loc3_.method_105(4))
            {
               return true;
            }
         }
         else if(_loc2_.currentStation == "build" && _loc3_.var_129 && _loc3_.var_129.canLeaveStation(_loc5_) == false)
         {
            _loc4_ = false;
         }
         else if(_loc2_.currentStation == "tea" && _loc3_.var_137 && _loc3_.var_137.canLeaveStation(_loc5_) == false)
         {
            _loc4_ = false;
         }
         else if(_loc2_.currentStation == "cook" && _loc3_.var_135 && _loc3_.var_135.canLeaveStation(_loc5_) == false)
         {
            _loc4_ = false;
         }
         else if(_loc3_.var_202)
         {
            _loc4_ = false;
         }
         else
         {
            _loc4_ = true;
         }
         return _loc4_;
      }
      
      public function showContextTraining(param1:String) : void
      {
         var _loc2_:GameHUD = this;
         if(!_loc2_.trainingClip && !_loc2_.gameObj.training)
         {
            _loc2_.trainingClip = new trainingMC();
            _loc2_.clip.addChild(_loc2_.trainingClip);
            _loc2_.trainingClip.mouseEnabled = false;
            _loc2_.trainingClip.mouseChildren = false;
         }
         class_6.method_1("  ---  Show context training: " + param1);
         _loc2_.whichContextTraining = param1;
         _loc2_.trainingClip.gotoAndStop(param1);
      }
      
      public function removeContextTraining(param1:String = null) : void
      {
         var _loc2_:GameHUD = this;
         if(param1 == null || param1 == _loc2_.whichContextTraining)
         {
            if(!_loc2_.gameObj.training && Boolean(_loc2_.trainingClip))
            {
               _loc2_.clip.removeChild(_loc2_.trainingClip);
               _loc2_.trainingClip = null;
            }
            _loc2_.whichContextTraining = "none";
         }
      }
      
      public function showTrainingWarning(param1:String) : void
      {
         var _loc2_:GameHUD = this;
         if(_loc2_.trainingClip)
         {
            try
            {
               _loc2_.trainingClip.warningMC.gotoAndPlay(param1);
               if(param1 != "hidden")
               {
                  _loc2_.gameObj.var_128.playSound("boing.wav");
               }
            }
            catch(err:Error)
            {
            }
         }
      }
      
      public function toggleFPS() : void
      {
         var _loc1_:GameHUD = this;
         _loc1_.shouldShowFPS = !_loc1_.shouldShowFPS;
         if(_loc1_.clip)
         {
            _loc1_.clip.fps_txt.visible = _loc1_.shouldShowFPS;
         }
         _loc1_.lastTime = getTimer();
      }
      
      public function updateFPS() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc1_:GameHUD = this;
         if(_loc1_.shouldShowFPS)
         {
            _loc2_ = getTimer();
            _loc3_ = Math.round(1000 / (_loc2_ - this.lastTime));
            if(_loc2_ == this.lastTime)
            {
               _loc3_ = 0;
            }
            if(_loc1_.clip)
            {
               _loc1_.clip.fps_txt.text = _loc3_ + " fps";
            }
            _loc1_.lastTime = _loc2_;
         }
      }
      
      public function onEarnedSticker(param1:Event) : void
      {
         var _loc2_:GameHUD = this;
         class_6.method_1("HUD heard you earned a sticker!");
         if(_loc2_.gameObj.var_127.hasTrained("stickeropenmenu") == false)
         {
            _loc2_.shouldCheckStickerTraining = true;
         }
      }
   }
}
