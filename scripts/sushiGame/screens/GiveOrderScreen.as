package sushiGame.screens
{
   import flash.display.*;
   import flash.filters.GlowFilter;
   import flash.geom.ColorTransform;
   import flash.geom.Rectangle;
   import flash.media.SoundChannel;
   import flash.text.TextFormat;
   import package_2.class_6;
   import package_4.*;
   import sushiGame.data.CustomerData;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.SpecialItem;
   import sushiGame.data.ToppingItem;
   import sushiGame.data.UserData;
   import sushiGame.managers.*;
   import sushiGame.models.*;
   
   public class GiveOrderScreen
   {
       
      
      public var gameObj:class_5;
      
      public var clip:MovieClip;
      
      public var isActive:Boolean = false;
      
      public var customerScale:Number = 1;
      
      public var customerX:Number = 245;
      
      public var customerY:Number = 109;
      
      public var trayScale:Number = 0.6;
      
      public var trayX:Number = 140;
      
      public var trayY:Number = 319;
      
      public var trayStartX:Number = -400;
      
      public var whichStep:Number = -1;
      
      public var stepTimer:Number = 0;
      
      public var lastStepTime:Number = 0;
      
      public var shorterTimingSpacing:Number = 20;
      
      public var timingSpacing:Number = 60;
      
      public var useTimingSpacing:Number = 120;
      
      public var isPresentingOrder:Boolean = false;
      
      public var currentTicket:Ticket;
      
      public var currentCustomer:Customer;
      
      public var customerReaction:String;
      
      public var customerReactionNumber:Number = 1;
      
      public var workerReactionTimer:Number = 0;
      
      public var workerReactionTimerMax:Number = 26;
      
      public var shouldShowWorkerReaction:Boolean = false;
      
      public var currentStep:String = "look";
      
      public var waitTimer:Number = 0;
      
      public var currentWaitMax:Number = 90;
      
      public var waitLookMax:Number = 70;
      
      public var waitBubblesMax:Number = 30;
      
      public var waitReactMax:Number = 45;
      
      public var waitTipMax:Number = 30;
      
      public var waitTipTotalMax:Number = 60;
      
      public var waitEndingMax:Number = 60;
      
      public var seal0WaitPercent:Number = 1;
      
      public var seal1WaitPercent:Number = 0.8;
      
      public var seal2WaitPercent:Number = 0.6;
      
      public var seal3WaitPercent:Number = 0.4;
      
      public var useWaitPercent:Number = 1;
      
      public var waitScore:Number = 0;
      
      public var cookScore:Number = 0;
      
      public var buildScore:Number = 0;
      
      public var teaScore:Number = 0;
      
      public var buildHadParticlesOff:Boolean = false;
      
      public var totalScore:Number = 0;
      
      public var closerCutoff:Number = 60;
      
      public var maxTip:Number = 500;
      
      public var extraTipPerBadge:Number = 100;
      
      public var extraTipForRibbon:Number = 200;
      
      public var extraPercentagePerBadge:Number = 0.333;
      
      public var extraTipPerClothingItem:Number = 50;
      
      public var extraTipForHolidaySpirit:Number = 300;
      
      public var earnStarNumber:Number = 0;
      
      public var loseStarNumber:Number = 0;
      
      public var coinFrame:Number = 0;
      
      public var earnTicketAmount:Number = 0;
      
      public var idealWaitBeforeOrder:Number = 750;
      
      public var idealWaitForOrderBuffer:Number = 1800;
      
      public var timeDivisions:Number = 8;
      
      public var drumrollSound:SoundChannel;
      
      public var backdropBitmap:Bitmap = null;
      
      public var countertopMC:MovieClip = null;
      
      public var prizeTicketSpeed:Number = 18;
      
      public var prizeTickets:Array;
      
      public var shouldAnimateTickets:Boolean = false;
      
      public var ticketsEarned:Number = 0;
      
      public var maxTicketsToEarn:Number = 3;
      
      public var targetMeterPercent:Number = 0;
      
      public var meterSpeed:Number = 0.025;
      
      public var shouldAnimateMeter:Boolean = false;
      
      public var didMakeSpecialProgress:Boolean = false;
      
      public var didMasterSpecial:Boolean = false;
      
      public var wasSecretSpecial:Boolean = false;
      
      public var wasSecretAndOrderedSpecial:Boolean = false;
      
      public var chickenPiece:MovieClip = null;
      
      public var worker:Worker = null;
      
      public var reactions_overjoyed:Array;
      
      public var reactions_happy:Array;
      
      public var reactions_decent:Array;
      
      public var reactions_worried:Array;
      
      public var reactions_upset:Array;
      
      public var reactions_pissed:Array;
      
      public var newSpecialLogo:BitmapData = null;
      
      public var newSpecialBitmap:Bitmap = null;
      
      public var shouldEarnSpecial:Boolean = false;
      
      public var wasQuickQuinn:Boolean = false;
      
      public var wasQuickWhiff:Boolean = false;
      
      public var wasFirstLast:Boolean = false;
      
      public var wasFriendlyFillup:Boolean = false;
      
      public var wasTeaParty:Boolean = false;
      
      public var kernFormat:TextFormat;
      
      public function GiveOrderScreen(param1:class_5)
      {
         this.prizeTickets = [];
         this.reactions_overjoyed = [1,2,3,4,5];
         this.reactions_happy = [1,2,3,4,5];
         this.reactions_decent = [1,2];
         this.reactions_worried = [1];
         this.reactions_upset = [1];
         this.reactions_pissed = [1,2,3];
         super();
         var _loc2_:GiveOrderScreen = this;
         _loc2_.gameObj = param1;
         _loc2_.kernFormat = new TextFormat();
         _loc2_.kernFormat.kerning = true;
         _loc2_.setupScreen();
      }
      
      public function setupScreen() : void
      {
         var _loc1_:GiveOrderScreen = this;
         _loc1_.clip = new giveOrderMC();
         _loc1_.clip.bubbles.stop();
         _loc1_.worker = new Worker(_loc1_.gameObj,_loc1_.clip,_loc1_.gameObj.workerData,-40,192,1.14,true);
         _loc1_.clip.ticketmeter.bar.mask = _loc1_.clip.ticketmeter.masker;
         _loc1_.clip.ticketmeter.bar.scaleX = 0;
         _loc1_.clip.ticketmeter.ball1.gotoAndStop(1);
         _loc1_.clip.ticketmeter.ball2.gotoAndStop(1);
         _loc1_.clip.ticketmeter.ball3.gotoAndStop(1);
      }
      
      public function destroy() : void
      {
         var _loc2_:int = 0;
         var _loc1_:GiveOrderScreen = this;
         _loc1_.kernFormat = null;
         _loc1_.worker.destroy();
         _loc1_.worker = null;
         if(_loc1_.newSpecialLogo)
         {
            _loc1_.newSpecialLogo.dispose();
            _loc1_.newSpecialLogo = null;
         }
         if(_loc1_.newSpecialBitmap)
         {
            if(_loc1_.newSpecialBitmap.parent)
            {
               _loc1_.newSpecialBitmap.parent.removeChild(_loc1_.newSpecialBitmap);
            }
            _loc1_.newSpecialBitmap.bitmapData = null;
            _loc1_.newSpecialBitmap = null;
         }
         if(_loc1_.countertopMC != null)
         {
            _loc1_.clip.countertop.removeChild(_loc1_.countertopMC);
            _loc1_.countertopMC = null;
         }
         if(_loc1_.prizeTickets.length > 0)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc1_.prizeTickets.length)
            {
               try
               {
                  _loc1_.clip.gameticketholder.removeChild(_loc1_.prizeTickets[_loc2_]);
                  _loc1_.prizeTickets[_loc2_] = null;
               }
               catch(err:Error)
               {
               }
               _loc2_++;
            }
            _loc1_.prizeTickets = null;
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
         if(_loc1_.drumrollSound)
         {
            _loc1_.drumrollSound.stop();
            _loc1_.drumrollSound = null;
         }
         if(_loc1_.gameObj.var_139.contains(_loc1_.clip))
         {
            _loc1_.gameObj.var_139.removeChild(_loc1_.clip);
         }
         _loc1_.clip = null;
      }
      
      public function addPrizeTickets(param1:Number = 1) : void
      {
         var _loc3_:int = 0;
         var _loc4_:MovieClip = null;
         var _loc2_:GiveOrderScreen = this;
         if(param1 > 0)
         {
            _loc3_ = 0;
            while(_loc3_ < param1)
            {
               (_loc4_ = new game_ticket_counter()).x = -3 + Math.floor(Math.random() * 7);
               _loc4_.y = -366 - _loc3_ * 50;
               _loc2_.prizeTickets.push(_loc4_);
               _loc2_.clip.gameticketholder.addChild(_loc4_);
               _loc3_++;
            }
            _loc2_.shouldAnimateTickets = true;
         }
      }
      
      public function getOtherScreen() : GiveOrderScreen
      {
         var _loc1_:GiveOrderScreen = this;
         class_6.method_1("(with Dining Room)");
         return _loc1_.gameObj.var_191;
      }
      
      public function syncPrizeMeters() : void
      {
         var otherScreen:GiveOrderScreen = null;
         var i:int = 0;
         var targetTickets:Number = NaN;
         var targetPercent:Number = NaN;
         var diff:Number = NaN;
         var screen:GiveOrderScreen = this;
         class_6.method_1("Sync Prize Meters");
         try
         {
            otherScreen = screen.getOtherScreen();
            if(otherScreen != null)
            {
               targetTickets = screen.gameObj.var_127.todayTickets;
               targetPercent = screen.gameObj.var_127.getCurrentPercentQuality(screen.gameObj.var_133.customerLineup.length);
               if(otherScreen.prizeTickets.length < targetTickets)
               {
                  diff = targetTickets - otherScreen.prizeTickets.length;
                  otherScreen.addPrizeTickets(diff);
               }
               otherScreen.clip.ticketmeter.bar.scaleX = targetPercent / 100;
               if(otherScreen.clip.ticketmeter.bar.scaleX >= 0.3)
               {
                  otherScreen.clip.ticketmeter.ball1.gotoAndPlay("earn");
               }
               if(otherScreen.clip.ticketmeter.bar.scaleX >= 0.6)
               {
                  otherScreen.clip.ticketmeter.ball2.gotoAndPlay("earn");
               }
               if(otherScreen.clip.ticketmeter.bar.scaleX >= 0.9)
               {
                  otherScreen.clip.ticketmeter.ball3.gotoAndPlay("earn");
               }
            }
         }
         catch(err:Error)
         {
            class_6.error("Error syncing prize meters: " + err.message);
         }
      }
      
      public function activateScreen() : void
      {
         var _loc1_:GiveOrderScreen = this;
         if(!_loc1_.gameObj.var_139.contains(_loc1_.clip))
         {
            _loc1_.gameObj.var_139.addChild(_loc1_.clip);
         }
         var _loc2_:SushiRoll = _loc1_.gameObj.var_137.currentOrder;
         _loc1_.currentCustomer = _loc1_.gameObj.var_133.getWaitingCustomer(_loc2_.attachedTicket.customerType);
         _loc1_.currentCustomer.moveToReceiveOrder();
         _loc2_.moveToGiveOrder(_loc1_.clip.plate_holder);
         _loc1_.shouldAnimateMeter = false;
         _loc1_.shouldShowWorkerReaction = false;
         _loc1_.clip.tipjar.gotoAndStop(1);
         _loc1_.clip.tips.gotoAndStop(1);
         _loc1_.clip.starburst.gotoAndStop(1);
         _loc1_.adjustJarCoins();
         _loc1_.startPresentation();
         _loc1_.gameObj.var_128.switchMusic("none");
         _loc1_.drumrollSound = _loc1_.gameObj.var_128.playMusicClip("giveorder_drumroll.wav");
         _loc1_.isActive = true;
      }
      
      public function deactivateScreen() : void
      {
         var _loc1_:GiveOrderScreen = this;
         if(_loc1_.gameObj.var_139.contains(_loc1_.clip))
         {
            _loc1_.gameObj.var_139.removeChild(_loc1_.clip);
         }
         _loc1_.gameObj.var_137.restoreAfterServing();
         _loc1_.gameObj.var_133.deleteCustomer(_loc1_.currentCustomer);
         _loc1_.currentCustomer = null;
         _loc1_.syncPrizeMeters();
         _loc1_.isActive = false;
      }
      
      public function startPresentation() : void
      {
         var _loc1_:GiveOrderScreen = this;
         _loc1_.isPresentingOrder = true;
         _loc1_.currentStep = "look";
         _loc1_.waitTimer = 0;
         _loc1_.earnStarNumber = 0;
         _loc1_.loseStarNumber = 0;
         _loc1_.earnTicketAmount = 0;
         _loc1_.didMakeSpecialProgress = false;
         _loc1_.didMasterSpecial = false;
         _loc1_.worker.playAnimation("turnaround");
         if(_loc1_.currentCustomer.isWaiter == false)
         {
            _loc1_.currentCustomer.playAnimation("look");
         }
         else
         {
            _loc1_.currentCustomer.playAnimation("stand");
         }
         _loc1_.clip.customername_txt.text = _loc1_.gameObj.var_131.getCustomerName(_loc1_.currentCustomer.customerType,true);
         _loc1_.clip.customername_txt.setTextFormat(_loc1_.kernFormat);
         class_6.error("===========================================================================================");
         class_6.error(_loc1_.currentCustomer.customerName + " GIVING ORDER");
         class_6.error("===========================================================================================");
         var _loc2_:Number = _loc1_.gameObj.var_127.getCustomerStars(_loc1_.currentCustomer.customerType);
         var _loc3_:Number = _loc1_.gameObj.var_127.getCustomerSeal(_loc1_.currentCustomer.customerType);
         var _loc4_:int = 1;
         while(_loc4_ <= 5)
         {
            if(_loc2_ >= _loc4_)
            {
               if(_loc3_ == 0)
               {
                  _loc1_.clip.stars["star" + _loc4_].gotoAndStop(2);
               }
               else if(_loc3_ == 1)
               {
                  _loc1_.clip.stars["star" + _loc4_].gotoAndStop(3);
               }
               else
               {
                  _loc1_.clip.stars["star" + _loc4_].gotoAndStop(4);
               }
            }
            else
            {
               _loc1_.clip.stars["star" + _loc4_].gotoAndStop(1);
            }
            _loc4_++;
         }
         if(_loc3_ == 0)
         {
            _loc1_.clip.stars.currentseal.visible = false;
         }
         else
         {
            _loc1_.clip.stars.currentseal.visible = true;
            _loc1_.clip.stars.currentseal.gotoAndStop(_loc3_);
         }
         _loc1_.clip.stars.award.gotoAndStop(1);
         _loc1_.clip.stars.ribbon.gotoAndStop(1);
         var _loc5_:GlowFilter = _loc1_.clip.customername_txt.filters[0];
         if(_loc1_.currentCustomer.isCloser)
         {
            _loc5_.color = 13830400;
         }
         else if(_loc1_.gameObj.var_133.isBringingSpecial(_loc1_.currentCustomer.customerType))
         {
            _loc5_.color = 11692041;
         }
         else
         {
            _loc5_.color = _loc1_.getTextGlowColor();
         }
         if(_loc1_.gameObj.var_133.isBringingSpecial(_loc1_.currentCustomer.customerType))
         {
            _loc1_.clip.customername_txt.textColor = 16775783;
         }
         else
         {
            _loc1_.clip.customername_txt.textColor = 16777215;
         }
         _loc1_.clip.customername_txt.filters = [_loc5_];
         var _loc6_:Number = _loc1_.gameObj.controls.gameplayTimer / _loc1_.gameObj.var_206;
         var _loc7_:Number = _loc1_.gameObj.var_132.getSkyStartingFrame();
         if(_loc6_ > 0.98)
         {
            _loc1_.clip.bg.gotoAndStop(_loc7_ + 6);
         }
         else if(_loc6_ > 0.8)
         {
            _loc1_.clip.bg.gotoAndStop(_loc7_ + 5);
         }
         else if(_loc6_ > 0.65)
         {
            _loc1_.clip.bg.gotoAndStop(_loc7_ + 4);
         }
         else if(_loc6_ > 0.5)
         {
            _loc1_.clip.bg.gotoAndStop(_loc7_ + 3);
         }
         else if(_loc6_ > 0.35)
         {
            _loc1_.clip.bg.gotoAndStop(_loc7_ + 2);
         }
         else if(_loc6_ > 0.2)
         {
            _loc1_.clip.bg.gotoAndStop(_loc7_ + 1);
         }
         else
         {
            _loc1_.clip.bg.gotoAndStop(_loc7_);
         }
         if(_loc3_ == 0)
         {
            _loc1_.useWaitPercent = _loc1_.seal0WaitPercent;
         }
         else if(_loc3_ == 1)
         {
            _loc1_.useWaitPercent = _loc1_.seal1WaitPercent;
         }
         else if(_loc3_ == 2)
         {
            _loc1_.useWaitPercent = _loc1_.seal2WaitPercent;
         }
         else if(_loc3_ == 3)
         {
            _loc1_.useWaitPercent = _loc1_.seal3WaitPercent;
         }
         _loc1_.currentWaitMax = Math.floor(_loc1_.waitLookMax * _loc1_.useWaitPercent);
         _loc1_.determineAccuracy();
         _loc1_.gameObj.var_127.recordCustomerVisit(_loc1_.currentCustomer.customerType);
      }
      
      public function showCustomerReaction() : void
      {
         var _loc1_:GiveOrderScreen = this;
         _loc1_.currentCustomer.playAnimation("look" + _loc1_.customerReaction + "" + _loc1_.customerReactionNumber);
      }
      
      public function showWorkerReaction() : void
      {
         this;
      }
      
      public function updateScreen() : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         var _loc5_:MovieClip = null;
         var _loc6_:Number = NaN;
         var _loc7_:SushiRoll = null;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:int = 0;
         var _loc11_:SpecialItem = null;
         var _loc12_:int = 0;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:SpecialItem = null;
         var _loc17_:String = null;
         var _loc1_:GiveOrderScreen = this;
         if(_loc1_.shouldAnimateTickets)
         {
            _loc2_ = false;
            _loc3_ = 4;
            _loc4_ = 0;
            while(_loc4_ < _loc1_.prizeTickets.length)
            {
               _loc5_ = _loc1_.prizeTickets[_loc4_];
               _loc6_ = 0 - _loc4_ * _loc3_;
               if(_loc5_.y < _loc6_)
               {
                  _loc5_.y += _loc1_.prizeTicketSpeed;
                  if(_loc5_.y >= _loc6_)
                  {
                     _loc5_.y = _loc6_;
                  }
                  else
                  {
                     _loc2_ = true;
                  }
               }
               _loc4_++;
            }
            if(!_loc2_)
            {
               _loc1_.shouldAnimateTickets = false;
            }
         }
         if(_loc1_.shouldAnimateMeter)
         {
            if(_loc1_.clip.ticketmeter.bar.scaleX < _loc1_.targetMeterPercent / 100)
            {
               _loc1_.clip.ticketmeter.bar.scaleX += _loc1_.meterSpeed;
               if(_loc1_.clip.ticketmeter.bar.scaleX > _loc1_.targetMeterPercent / 100)
               {
                  _loc1_.clip.ticketmeter.bar.scaleX = _loc1_.targetMeterPercent / 100;
               }
            }
            if(_loc1_.clip.ticketmeter.bar.scaleX >= 0.3 && _loc1_.gameObj.var_127.todayNaturalTickets < 1)
            {
               ++_loc1_.ticketsEarned;
               _loc1_.addPrizeTickets(1);
               _loc1_.gameObj.var_127.earnExtraDailyTicket(1);
               _loc1_.clip.ticketmeter.ball1.gotoAndPlay("earn");
            }
            else if(_loc1_.clip.ticketmeter.bar.scaleX >= 0.6 && _loc1_.gameObj.var_127.todayNaturalTickets < 2)
            {
               ++_loc1_.ticketsEarned;
               _loc1_.addPrizeTickets(1);
               _loc1_.gameObj.var_127.earnExtraDailyTicket(1);
               _loc1_.clip.ticketmeter.ball2.gotoAndPlay("earn");
            }
            else if(_loc1_.clip.ticketmeter.bar.scaleX >= 0.9 && _loc1_.gameObj.var_127.todayNaturalTickets < 3)
            {
               ++_loc1_.ticketsEarned;
               _loc1_.addPrizeTickets(1);
               _loc1_.gameObj.var_127.earnExtraDailyTicket(1);
               _loc1_.clip.ticketmeter.ball3.gotoAndPlay("earn");
            }
         }
         if(_loc1_.isPresentingOrder && !_loc1_.gameObj.var_169)
         {
            _loc1_.worker.animateModel();
            ++_loc1_.waitTimer;
            if(_loc1_.shouldShowWorkerReaction)
            {
               ++_loc1_.workerReactionTimer;
               if(_loc1_.workerReactionTimer == _loc1_.workerReactionTimerMax)
               {
                  _loc1_.showWorkerReaction();
                  _loc1_.shouldShowWorkerReaction = false;
                  _loc1_.workerReactionTimer = 0;
               }
            }
            if(_loc1_.waitTimer > _loc1_.currentWaitMax)
            {
               if(_loc1_.currentStep == "look")
               {
                  _loc1_.clip.bubbles.gotoAndPlay("reveal");
                  _loc1_.currentStep = "bubbles";
                  _loc1_.waitTimer = 0;
                  _loc1_.currentWaitMax = Math.floor(_loc1_.waitBubblesMax * _loc1_.useWaitPercent);
               }
               else if(_loc1_.currentStep == "bubbles")
               {
                  if(_loc1_.chickenPiece != null)
                  {
                     try
                     {
                        _loc1_.chickenPiece.parent.removeChild(_loc1_.chickenPiece);
                     }
                     catch(err:Error)
                     {
                     }
                     _loc1_.chickenPiece = null;
                  }
                  _loc1_.showCustomerReaction();
                  _loc1_.shouldShowWorkerReaction = true;
                  _loc1_.workerReactionTimer = 0;
                  if(_loc1_.shouldEarnSpecial)
                  {
                     _loc1_.clip.small_envelope.gotoAndPlay(2);
                  }
                  if(_loc1_.earnStarNumber > 0)
                  {
                     _loc1_.gameObj.var_128.playSound("getstar.wav");
                     _loc1_.gameObj.var_127.earnCustomerStar(_loc1_.currentCustomer.customerType,_loc1_.earnStarNumber);
                     if((_loc8_ = _loc1_.gameObj.var_127.getCustomerSeal(_loc1_.currentCustomer.customerType)) == 0)
                     {
                        _loc1_.clip.stars["star" + _loc1_.earnStarNumber].gotoAndStop(5);
                     }
                     else if(_loc8_ == 1)
                     {
                        _loc1_.clip.stars["star" + _loc1_.earnStarNumber].gotoAndStop(6);
                     }
                     else
                     {
                        _loc1_.clip.stars["star" + _loc1_.earnStarNumber].gotoAndStop(7);
                     }
                     if(_loc1_.earnStarNumber == 5 && _loc8_ < 3)
                     {
                        _loc9_ = _loc8_ + 1;
                        _loc1_.gameObj.var_127.earnCustomerSeal(_loc1_.currentCustomer.customerType,_loc9_);
                        _loc1_.gameObj.var_127.earnCustomerStar(_loc1_.currentCustomer.customerType,0);
                        _loc1_.clip.stars.fireworks.gotoAndPlay(2);
                        _loc1_.clip.stars.award.seal.gotoAndStop(_loc9_);
                        _loc1_.clip.stars.award.gotoAndPlay(2);
                     }
                     else if(_loc1_.earnStarNumber == 5 && _loc8_ == 3)
                     {
                        _loc1_.gameObj.var_127.earnCustomerStar(_loc1_.currentCustomer.customerType,0);
                        _loc1_.clip.stars.fireworks.gotoAndPlay(2);
                     }
                  }
                  else if(_loc1_.loseStarNumber > 0)
                  {
                     _loc10_ = 1;
                     while(_loc10_ <= _loc1_.loseStarNumber)
                     {
                        _loc1_.clip.stars["star" + _loc10_].gotoAndStop(8);
                        _loc10_++;
                     }
                     _loc1_.gameObj.var_128.playSound("grabtopping.wav");
                     _loc1_.gameObj.var_127.earnCustomerStar(_loc1_.currentCustomer.customerType,0);
                  }
                  if(_loc1_.didMakeSpecialProgress)
                  {
                     if((_loc11_ = _loc1_.gameObj.var_132.getSpecial(_loc1_.gameObj.var_127.currentSpecial)) != null)
                     {
                        if(_loc11_.bonusType == "tickets")
                        {
                           class_6.method_1(" -- Special Bonus: Earn extra ticket(s)");
                           _loc1_.ticketsEarned += _loc11_.bonusAmount;
                           _loc1_.addPrizeTickets(_loc11_.bonusAmount);
                           _loc1_.gameObj.var_127.earnExtraDailyTicket(_loc11_.bonusAmount,true);
                        }
                        else if(_loc11_.bonusType == "stars")
                        {
                           _loc12_ = 0;
                           while(_loc12_ < _loc11_.bonusAmount)
                           {
                              class_6.method_1(" -- Special Bonus: Earn an extra Customer Star");
                              if((_loc13_ = _loc1_.earnStarNumber + 1 + _loc12_) <= 5)
                              {
                                 _loc1_.gameObj.var_127.earnCustomerStar(_loc1_.currentCustomer.customerType,_loc13_);
                                 if((_loc14_ = _loc1_.gameObj.var_127.getCustomerSeal(_loc1_.currentCustomer.customerType)) == 0)
                                 {
                                    _loc1_.clip.stars["star" + _loc13_].gotoAndStop(5);
                                 }
                                 else if(_loc14_ == 1)
                                 {
                                    _loc1_.clip.stars["star" + _loc13_].gotoAndStop(6);
                                 }
                                 else
                                 {
                                    _loc1_.clip.stars["star" + _loc13_].gotoAndStop(7);
                                 }
                                 if(_loc13_ == 5 && _loc14_ < 3)
                                 {
                                    _loc15_ = _loc14_ + 1;
                                    _loc1_.gameObj.var_127.earnCustomerSeal(_loc1_.currentCustomer.customerType,_loc15_);
                                    _loc1_.gameObj.var_127.earnCustomerStar(_loc1_.currentCustomer.customerType,0);
                                    _loc1_.clip.stars.fireworks.gotoAndPlay(2);
                                    _loc1_.clip.stars.award.seal.gotoAndStop(_loc15_);
                                    _loc1_.clip.stars.award.gotoAndPlay(2);
                                 }
                                 else if(_loc13_ == 5 && _loc14_ == 3)
                                 {
                                    _loc1_.gameObj.var_127.earnCustomerStar(_loc1_.currentCustomer.customerType,0);
                                    _loc1_.clip.stars.fireworks.gotoAndPlay(2);
                                 }
                              }
                              else
                              {
                                 if(_loc13_ > 5)
                                 {
                                    _loc13_ -= 5;
                                 }
                                 _loc1_.gameObj.var_127.earnCustomerStar(_loc1_.currentCustomer.customerType,_loc13_);
                              }
                              _loc12_++;
                           }
                        }
                     }
                  }
                  if(_loc1_.currentCustomer.customerType == 1 && _loc1_.earnStarNumber > 0)
                  {
                     _loc1_.gameObj.var_127.earnBlueRibbon();
                     _loc1_.clip.stars.fireworks.gotoAndPlay(2);
                     _loc1_.clip.stars.ribbon.gotoAndPlay(2);
                  }
                  else if(_loc1_.currentCustomer.customerType == 1)
                  {
                  }
                  if(_loc1_.didMakeSpecialProgress)
                  {
                     _loc1_.gameObj.var_136.showSpecialProgress(_loc1_.gameObj.var_127.currentSpecial);
                     _loc1_.gameObj.var_136.recordSpecialStar();
                  }
                  if(_loc1_.gameObj.var_133.isOrderingSpecial(_loc1_.currentCustomer.customerType) && !_loc1_.wasSecretSpecial)
                  {
                     _loc1_.gameObj.var_127.recordSpecialServed(_loc1_.gameObj.var_127.currentSpecial);
                  }
                  _loc7_ = _loc1_.gameObj.var_137.currentOrder;
                  _loc1_.gameObj.var_136.recordServeOrder(_loc1_.currentCustomer.customerName,_loc1_.waitScore,_loc1_.cookScore,_loc1_.buildScore,_loc1_.teaScore,_loc1_.totalScore,_loc7_.getToppingNames(_loc1_.currentCustomer.order),_loc7_.getToppingNames(_loc1_.currentCustomer.order,true),_loc1_.getWorkerClothingTags());
                  if(_loc1_.wasSecretSpecial || _loc1_.wasSecretAndOrderedSpecial)
                  {
                     class_6.method_1("Record Serve Secret Special for " + _loc1_.currentCustomer.customerName);
                     _loc1_.gameObj.var_136.recordServeSecretSpecial(_loc1_.currentCustomer.customerName);
                  }
                  if(_loc1_.wasQuickQuinn)
                  {
                     _loc1_.gameObj.var_136.recordTagged("readyquinn");
                  }
                  else if(_loc1_.wasQuickWhiff)
                  {
                     _loc1_.gameObj.var_136.recordTagged("readywhiff");
                  }
                  else if(_loc1_.wasFirstLast)
                  {
                     _loc1_.gameObj.var_136.recordTagged("firstlast");
                  }
                  else if(_loc1_.wasFriendlyFillup)
                  {
                     _loc1_.gameObj.var_136.recordTagged("friendlyfillup");
                  }
                  if(_loc1_.wasTeaParty)
                  {
                     _loc1_.gameObj.var_136.recordTagged("teaparty");
                  }
                  _loc1_.gameObj.var_128.playMusicClip("customer_" + _loc1_.customerReaction + ".wav");
                  if(_loc1_.drumrollSound)
                  {
                     _loc1_.drumrollSound.stop();
                  }
                  _loc1_.drumrollSound = null;
                  _loc1_.shouldAnimateMeter = true;
                  _loc1_.currentStep = "react";
                  _loc1_.waitTimer = 0;
                  _loc1_.currentWaitMax = Math.floor(_loc1_.waitReactMax * _loc1_.useWaitPercent);
               }
               else if(_loc1_.currentStep == "react")
               {
                  _loc1_.clip.tips.gotoAndStop(_loc1_.coinFrame);
                  if(_loc1_.coinFrame > 1)
                  {
                     if(_loc1_.coinFrame < 4)
                     {
                        _loc1_.gameObj.var_128.playSound("singlecoin.wav");
                     }
                     else
                     {
                        _loc1_.gameObj.var_128.playSound("multicoin.wav");
                     }
                  }
                  _loc1_.currentStep = "tip";
                  _loc1_.waitTimer = 0;
                  _loc1_.currentWaitMax = Math.floor(_loc1_.waitTipMax * _loc1_.useWaitPercent);
                  if(_loc1_.didMasterSpecial)
                  {
                     if((_loc16_ = _loc1_.gameObj.var_132.getSpecial(_loc1_.gameObj.var_127.currentSpecial)) != null)
                     {
                        _loc17_ = _loc16_.prizeSKU;
                        _loc1_.gameObj.method_266(_loc17_);
                     }
                  }
                  if(_loc1_.shouldEarnSpecial)
                  {
                     class_6.method_1("----- Show earning a special!");
                     if(_loc1_.newSpecialLogo)
                     {
                        _loc1_.newSpecialLogo.dispose();
                        _loc1_.newSpecialLogo = null;
                     }
                     if(_loc1_.newSpecialBitmap)
                     {
                        if(_loc1_.newSpecialBitmap.parent)
                        {
                           _loc1_.newSpecialBitmap.parent.removeChild(_loc1_.newSpecialBitmap);
                        }
                        _loc1_.newSpecialBitmap.bitmapData = null;
                        _loc1_.newSpecialBitmap = null;
                     }
                     _loc1_.newSpecialLogo = _loc1_.gameObj.var_132.getSpecialLogo(_loc1_.gameObj.var_133.whichSpecialToEarn);
                     _loc1_.newSpecialBitmap = new Bitmap(_loc1_.newSpecialLogo,"auto",true);
                     _loc1_.newSpecialBitmap.scaleX = 0.9;
                     _loc1_.newSpecialBitmap.scaleY = 0.9;
                     _loc1_.newSpecialBitmap.x = 60;
                     _loc1_.newSpecialBitmap.y = 17;
                     _loc1_.clip.large_envelope.card.addChild(_loc1_.newSpecialBitmap);
                     _loc1_.clip.large_envelope.gotoAndPlay(2);
                     _loc1_.gameObj.var_127.earnSpecial(_loc1_.gameObj.var_133.whichSpecialToEarn,_loc1_.currentCustomer.customerType);
                     _loc1_.gameObj.var_128.playMusicClip("music_newseason");
                  }
               }
               else if(_loc1_.currentStep == "tip")
               {
                  _loc1_.adjustJarCoins();
                  _loc1_.clip.tipjar.gotoAndPlay(2);
                  _loc1_.clip.starburst.gotoAndPlay(2);
                  _loc1_.gameObj.var_128.playSound("boing.wav");
                  _loc1_.currentStep = "tipTotal";
                  _loc1_.waitTimer = 0;
                  _loc1_.currentWaitMax = _loc1_.waitTipTotalMax;
               }
               else if(_loc1_.currentStep == "tipTotal")
               {
                  if(_loc1_.gameObj.var_133.outOfCustomers())
                  {
                     _loc1_.currentStep = "ending";
                     _loc1_.waitTimer = 0;
                     _loc1_.currentWaitMax = _loc1_.waitEndingMax;
                     _loc1_.currentStep = "returning";
                     _loc1_.waitTimer = 0;
                     _loc1_.currentWaitMax = int.MAX_VALUE;
                     _loc1_.finishGivingOrder(true);
                  }
                  else
                  {
                     _loc1_.currentStep = "returning";
                     _loc1_.waitTimer = 0;
                     _loc1_.currentWaitMax = int.MAX_VALUE;
                     _loc1_.finishGivingOrder();
                  }
               }
               else if(_loc1_.currentStep == "ending")
               {
                  _loc1_.gameObj.var_202 = true;
                  _loc1_.isPresentingOrder = false;
                  _loc1_.currentStep = "closeending";
                  _loc1_.waitTimer = 0;
                  _loc1_.currentWaitMax = int.MAX_VALUE;
                  _loc1_.gameObj.hud.startTransition("ending");
               }
            }
         }
      }
      
      public function adjustJarCoins() : void
      {
         var _loc1_:GiveOrderScreen = this;
         var _loc2_:UserData = _loc1_.gameObj.var_127;
         var _loc3_:Number = _loc2_.getTipsToday();
         3000;
         var _loc5_:Number = Math.min(1,_loc3_ / 3000);
         var _loc6_:Number;
         if((_loc6_ = Math.ceil(_loc5_ * 10)) < 2 && _loc3_ > 0)
         {
            _loc6_ = 2;
         }
         else if(_loc6_ > 10)
         {
            _loc6_ = 10;
         }
         _loc1_.clip.tipjar.clip.coins.gotoAndStop(_loc6_);
      }
      
      public function getCustomerReactionNumber(param1:String) : Number
      {
         var _loc5_:Number = NaN;
         var _loc2_:GiveOrderScreen = this;
         var _loc3_:Array = _loc2_["reactions_" + param1];
         var _loc4_:Number = 1;
         if(Boolean(_loc3_) && _loc3_.length > 0)
         {
            _loc5_ = Math.floor(Math.random() * _loc3_.length);
            _loc4_ = Number(_loc3_[_loc5_]);
            _loc3_.splice(_loc5_,1);
         }
         else if(param1 == "overjoyed" || param1 == "happy")
         {
            _loc4_ = Math.ceil(Math.random() * 5);
         }
         else if(param1 == "decent")
         {
            _loc4_ = Math.ceil(Math.random() * 2);
         }
         else if(param1 == "pissed")
         {
            _loc4_ = Math.ceil(Math.random() * 3);
         }
         else
         {
            _loc4_ = 1;
         }
         return _loc4_;
      }
      
      public function determineAccuracy() : void
      {
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:SpecialItem = null;
         var _loc1_:GiveOrderScreen = this;
         class_6.method_1(">>> ---------------------------------------------------------------------------");
         class_6.method_1("Scoring order for " + _loc1_.currentCustomer.customerName + ":\n");
         _loc1_.wasQuickQuinn = false;
         _loc1_.wasQuickWhiff = false;
         _loc1_.wasFirstLast = false;
         _loc1_.wasTeaParty = false;
         _loc1_.wasFriendlyFillup = false;
         _loc1_.gradeBuilding();
         _loc1_.gradeWaiting();
         _loc1_.gradeCooking();
         _loc1_.gradeTea();
         _loc1_.totalScore = Math.floor((_loc1_.buildScore + _loc1_.cookScore + _loc1_.waitScore + _loc1_.teaScore) / 4);
         _loc1_.wasSecretSpecial = false;
         _loc1_.wasSecretAndOrderedSpecial = false;
         if(_loc1_.totalScore < 90)
         {
            if((_loc16_ = _loc1_.gameObj.var_131.getCustomerSecretSpecialIndex(_loc1_.currentCustomer.customerType)) > -1 && _loc1_.gameObj.var_127.hasSpecial(_loc16_))
            {
               _loc17_ = _loc1_.buildScore;
               _loc18_ = _loc1_.cookScore;
               _loc19_ = _loc1_.waitScore;
               _loc20_ = _loc1_.teaScore;
               _loc21_ = _loc1_.totalScore;
               class_6.error(" --- CUSTOMER HAS A SECRET SPECIAL (" + _loc16_ + "), GRADE AGAINST THAT TOO --- ");
               _loc1_.gradeBuilding(_loc16_);
               _loc1_.gradeWaiting(_loc16_);
               _loc1_.gradeCooking(_loc16_);
               _loc1_.gradeTea(_loc16_);
               _loc1_.totalScore = Math.floor((_loc1_.buildScore + _loc1_.cookScore + _loc1_.waitScore + _loc1_.teaScore) / 4);
               if(_loc1_.totalScore >= 90)
               {
                  _loc1_.wasSecretSpecial = true;
                  class_6.error(" -- SECRET SPECIAL! SCORE = " + _loc1_.totalScore + " -- ");
               }
               else
               {
                  class_6.error(" -- This is NOT the Secret Special.  Use original score (" + _loc21_ + ")");
                  _loc1_.buildScore = _loc17_;
                  _loc1_.cookScore = _loc18_;
                  _loc1_.waitScore = _loc19_;
                  _loc1_.teaScore = _loc20_;
                  _loc1_.totalScore = _loc21_;
               }
            }
         }
         if(_loc1_.currentCustomer.isCloser)
         {
            if(_loc1_.totalScore <= _loc1_.closerCutoff)
            {
               _loc1_.totalScore = 0;
            }
            else
            {
               _loc1_.totalScore = Math.floor((_loc1_.totalScore - _loc1_.closerCutoff) / (100 - _loc1_.closerCutoff) * 100);
            }
         }
         if(_loc1_.gameObj.var_133.isBringingSpecial(_loc1_.currentCustomer.customerType))
         {
            if(_loc1_.totalScore <= _loc1_.closerCutoff)
            {
               _loc1_.totalScore = 0;
            }
            else
            {
               _loc1_.totalScore = Math.floor((_loc1_.totalScore - _loc1_.closerCutoff) / (100 - _loc1_.closerCutoff) * 100);
            }
         }
         if(_loc1_.currentCustomer.customerName == "Jojo" && _loc1_.gameObj.var_127.hasBonusFurniture("customer","jojo"))
         {
            _loc1_.totalScore += 5;
            if(_loc1_.totalScore > 100)
            {
               _loc1_.totalScore = 100;
            }
            class_6.method_1(">> Boost Score +5% for Jojo because you have the Food Critic poster.");
         }
         var _loc2_:Number = _loc1_.totalScore;
         if(this.totalScore >= 90)
         {
            _loc1_.customerReaction = "overjoyed";
            _loc1_.customerReactionNumber = _loc1_.getCustomerReactionNumber(_loc1_.customerReaction);
         }
         else if(this.totalScore >= 80)
         {
            _loc1_.customerReaction = "happy";
            _loc1_.customerReactionNumber = _loc1_.getCustomerReactionNumber(_loc1_.customerReaction);
         }
         else if(this.totalScore >= 70)
         {
            _loc1_.customerReaction = "decent";
            _loc1_.customerReactionNumber = _loc1_.getCustomerReactionNumber(_loc1_.customerReaction);
         }
         else if(this.totalScore >= 60)
         {
            _loc1_.customerReaction = "worried";
            _loc1_.customerReactionNumber = 1;
         }
         else if(this.totalScore >= 50)
         {
            _loc1_.customerReaction = "upset";
            _loc1_.customerReactionNumber = 1;
         }
         else if(this.totalScore < 50)
         {
            _loc1_.customerReaction = "pissed";
            _loc1_.customerReactionNumber = _loc1_.getCustomerReactionNumber(_loc1_.customerReaction);
         }
         else
         {
            _loc1_.customerReaction = "decent";
            _loc1_.customerReactionNumber = _loc1_.getCustomerReactionNumber(_loc1_.customerReaction);
         }
         var _loc3_:String = null;
         var _loc4_:Number = 0;
         if(_loc1_.gameObj.var_133.isOrderingSpecial(_loc1_.currentCustomer.customerType) && _loc1_.gameObj.var_127.currentSpecial > -1 && this.totalScore >= 80 && _loc1_.wasSecretSpecial == false)
         {
            _loc1_.gameObj.var_127.recordSpecialStar(_loc1_.gameObj.var_127.currentSpecial);
            _loc1_.didMakeSpecialProgress = true;
            if((_loc22_ = _loc1_.gameObj.var_132.getSpecial(_loc1_.gameObj.var_127.currentSpecial)) != null)
            {
               _loc3_ = _loc22_.bonusType;
               _loc4_ = _loc22_.bonusAmount;
            }
            if(_loc1_.gameObj.var_127.getSpecialStars(_loc1_.gameObj.var_127.currentSpecial) == _loc1_.gameObj.var_127.starsToMasterSpecial)
            {
               class_6.method_1(" ---- You just mastered this special.  Will earn a prize!");
               _loc1_.didMasterSpecial = true;
            }
            else
            {
               _loc1_.didMasterSpecial = false;
            }
         }
         else
         {
            _loc1_.didMakeSpecialProgress = false;
            _loc1_.didMasterSpecial = false;
         }
         if(_loc1_.gameObj.var_133.isOrderingSpecial(_loc1_.currentCustomer.customerType) && _loc1_.gameObj.var_127.currentSpecial > -1 && _loc1_.gameObj.var_127.currentSpecial == _loc1_.gameObj.var_131.getCustomerSecretSpecialIndex(_loc1_.currentCustomer.customerType))
         {
            class_6.method_1(" ---- ");
            class_6.method_1(" ---- This customer just ORDERED their \'Secret\' Special!!  Oh well, count it for the sticker.");
            class_6.method_1(" ---- ");
            _loc1_.wasSecretAndOrderedSpecial = true;
         }
         _loc1_.clip.small_envelope.gotoAndStop(1);
         _loc1_.clip.large_envelope.gotoAndStop(1);
         if(_loc1_.gameObj.var_133.isBringingSpecial(_loc1_.currentCustomer.customerType) && this.totalScore >= 80)
         {
            _loc1_.shouldEarnSpecial = true;
            _loc1_.clip.small_envelope.visible = true;
            _loc1_.clip.large_envelope.visible = true;
         }
         else
         {
            _loc1_.shouldEarnSpecial = false;
            _loc1_.clip.small_envelope.visible = false;
            _loc1_.clip.large_envelope.visible = false;
         }
         var _loc5_:Number = _loc1_.gameObj.var_127.getCustomerStars(_loc1_.currentCustomer.customerType);
         if(this.totalScore >= 80)
         {
            if(_loc5_ < 5)
            {
               _loc1_.earnStarNumber = _loc5_ + 1;
            }
         }
         else if(this.totalScore < 60)
         {
            if(_loc5_ > 0)
            {
               _loc1_.loseStarNumber = _loc5_;
            }
         }
         var _loc6_:Number = _loc1_.maxTip;
         var _loc7_:Number;
         var _loc8_:Number = (_loc7_ = _loc1_.gameObj.var_127.getCustomerSeal(_loc1_.currentCustomer.customerType)) * _loc1_.extraPercentagePerBadge;
         if(_loc1_.earnStarNumber == 5)
         {
            _loc8_ = 2;
         }
         else if(_loc3_ == "stars" && _loc1_.earnStarNumber + _loc4_ >= 5)
         {
            class_6.info("Got 5+ stars from Special!  Also get the Points bonus.");
            _loc8_ = 2;
         }
         _loc1_.totalScore = Math.round(_loc1_.totalScore * (1 + _loc8_));
         class_6.method_1("Previous Stars: " + _loc5_ + ", Which Seal: " + _loc7_ + ", Point Bonus: " + _loc8_ + ", Total Score: " + this.totalScore);
         if(_loc3_ == "points")
         {
            class_6.method_1(" -- Special Bonus on Points");
            _loc1_.totalScore = Math.round(_loc1_.totalScore * (_loc4_ / 100));
         }
         if(isNaN(_loc1_.totalScore))
         {
            _loc1_.totalScore = 0;
         }
         var _loc9_:Number = _loc7_ * _loc1_.extraTipPerBadge;
         _loc6_ += _loc9_;
         if(_loc1_.gameObj.var_127.hasRibbon())
         {
            _loc6_ += _loc1_.extraTipForRibbon;
         }
         _loc6_ += _loc1_.getClothingBonus();
         if(_loc1_.gameObj.var_127.hasBonusFurniture("customer","romano") && (_loc1_.currentCustomer.customerName == "Bruna Romano" || _loc1_.currentCustomer.customerName == "Carlo Romano" || _loc1_.currentCustomer.customerName == "Gino Romano" || _loc1_.currentCustomer.customerName == "Little Edoardo"))
         {
            class_6.method_1("Bonus tip for Romanos!");
            _loc6_ += 300;
         }
         if(_loc3_ == "tips")
         {
            class_6.method_1(" -- Special Bonus on Tips");
            _loc6_ = Math.round(_loc6_ * _loc4_);
         }
         var _loc10_:Number;
         if((_loc10_ = Math.round(_loc2_ / 100 * _loc6_ - (100 - _loc2_) / 100 * _loc6_)) < 0)
         {
            _loc10_ = 0;
         }
         if(_loc1_.earnStarNumber == 5)
         {
            _loc10_ *= 3;
         }
         else if(_loc3_ == "stars" && _loc1_.earnStarNumber + _loc4_ >= 5)
         {
            class_6.info("Got 5+ stars from Special!  Also get the Tips bonus.");
            _loc10_ *= 3;
         }
         if(isNaN(_loc10_))
         {
            _loc10_ = 0;
         }
         var _loc11_:Number = _loc10_ / 100;
         if(_loc2_ < 50)
         {
            _loc1_.coinFrame = 1;
         }
         else if(_loc2_ < 60)
         {
            _loc1_.coinFrame = 2;
         }
         else if(_loc2_ < 70)
         {
            _loc1_.coinFrame = 3;
         }
         else if(_loc2_ < 80)
         {
            _loc1_.coinFrame = 4;
         }
         else if(_loc2_ < 90)
         {
            _loc1_.coinFrame = 5;
         }
         else if(_loc2_ < 100)
         {
            _loc1_.coinFrame = 6;
         }
         else if(_loc2_ >= 100)
         {
            _loc1_.coinFrame = 6;
         }
         var _loc12_:Number = Math.floor(_loc11_);
         var _loc13_:*;
         var _loc14_:* = (_loc13_ = _loc10_ - _loc12_ * 100) / 100;
         if(_loc13_ < 10)
         {
            _loc13_ = "0" + _loc13_;
         }
         else if(_loc13_ == 0)
         {
            _loc13_ = "00";
         }
         var _loc15_:String = "$" + _loc12_ + "." + _loc13_;
         if(_loc10_ <= 0)
         {
            _loc10_ = 0;
            _loc15_ = " $0.00 ";
         }
         _loc1_.gameObj.var_127.addToDailyScore(_loc1_.waitScore,_loc1_.cookScore,_loc1_.buildScore,_loc1_.teaScore,_loc1_.totalScore,_loc10_,_loc1_.earnTicketAmount);
         _loc1_.targetMeterPercent = _loc1_.gameObj.var_127.getCurrentPercentQuality(_loc1_.gameObj.var_133.customerLineup.length);
         class_6.method_1("Current Meter Percent: " + _loc1_.targetMeterPercent + "% (for " + _loc1_.gameObj.var_133.customerLineup.length + " Customers today)");
         _loc1_.clip.bubbles.order_score.score_txt.text = _loc1_.waitScore + "%";
         _loc1_.clip.bubbles.cook_score.score_txt.text = _loc1_.cookScore + "%";
         _loc1_.clip.bubbles.build_score.score_txt.text = _loc1_.buildScore + "%";
         _loc1_.clip.bubbles.tea_score.score_txt.text = _loc1_.teaScore + "%";
         _loc1_.clip.bubbles.total_score.score_txt.text = _loc1_.totalScore + " POINTS";
         _loc1_.clip.bubbles.order_score.score_txt.setTextFormat(_loc1_.kernFormat);
         _loc1_.clip.bubbles.cook_score.score_txt.setTextFormat(_loc1_.kernFormat);
         _loc1_.clip.bubbles.build_score.score_txt.setTextFormat(_loc1_.kernFormat);
         _loc1_.clip.bubbles.tea_score.score_txt.setTextFormat(_loc1_.kernFormat);
         _loc1_.clip.bubbles.total_score.score_txt.setTextFormat(_loc1_.kernFormat);
         _loc1_.clip.bubbles.gotoAndStop(1);
         if(_loc1_.waitScore == 100 && _loc1_.teaScore == 100 && _loc1_.buildScore == 100 && _loc1_.cookScore == 100)
         {
            _loc1_.clip.bubbles.perfect.visible = true;
         }
         else
         {
            _loc1_.clip.bubbles.perfect.visible = false;
         }
         _loc1_.clip.starburst.burst.money.text = _loc15_;
         _loc1_.clip.starburst.burst.money.setTextFormat(_loc1_.kernFormat);
         class_6.method_1(">>> ---------------------------------------------------------------------------");
      }
      
      public function gradeWaiting(param1:Number = -1) : void
      {
         var _loc2_:GiveOrderScreen = this;
         _loc2_.waitScore = 100;
         var _loc4_:Number = _loc2_.gameObj.var_127.getLobbyPercent();
         var _loc5_:Number = _loc2_.gameObj.var_127.getBonusWaitOffset() * 30;
         var _loc6_:Number = _loc5_ = Math.ceil(_loc5_ * _loc4_);
         if(_loc2_.currentCustomer.customersAlreadyWaiting >= 2)
         {
            _loc5_ += 600;
         }
         else if(_loc2_.currentCustomer.customersAlreadyWaiting == 1)
         {
            _loc5_ += 300;
         }
         var _loc7_:Number = _loc2_.gameObj.controls.gameplayTimer;
         var _loc8_:Number = _loc2_.currentCustomer.timeOrderTaken - _loc2_.currentCustomer.timeEntered;
         var _loc9_:Number = _loc7_ - _loc2_.currentCustomer.timeOrderTaken;
         var _loc10_:Number = _loc8_ - (_loc2_.idealWaitBeforeOrder + _loc5_);
         var _loc11_:Number = 0;
         0.3;
         if(_loc10_ > 0)
         {
            _loc11_ = _loc10_ / 30 * 0.3;
         }
         var _loc13_:Number = _loc2_.currentCustomer.getOkayWaitingTime();
         var _loc14_:Number = (_loc14_ = (_loc14_ = (_loc14_ = 0) + 1200) + 1200) + 1800;
         var _loc15_:Number = _loc13_ + _loc14_ + _loc5_;
         var _loc16_:Number = _loc9_ - _loc15_;
         var _loc17_:Number = 0;
         0.3;
         if(_loc16_ > 0)
         {
            _loc17_ = _loc16_ / 30 * 0.3;
         }
         _loc2_.waitScore = Math.max(0,Math.floor(100 - _loc17_ - _loc11_));
         if(_loc2_.waitScore > 100)
         {
            _loc2_.waitScore = 100;
         }
         class_6.method_1("\nWAITING SCORE -----------------------------------------------");
         class_6.method_1("  >>  Before-Order Time Off = " + _loc10_ + ". " + 0.3 + "% Off for each second.");
         class_6.method_1("  >>  Prep Time Off = " + _loc16_ + ". " + 0.3 + "% Off for each second.");
         class_6.method_1("  >>  (Customer would wait " + _loc13_ + " for cooking)");
         class_6.method_1("  >>  (Customer would wait " + _loc14_ + " for build/popping)");
         class_6.method_1("  >>  (Customer would wait an extra " + _loc6_ + " from lobby decorations)");
         class_6.method_1("  >>  (Customer would wait an extra " + (_loc5_ - _loc6_) + " from " + _loc2_.currentCustomer.customersAlreadyWaiting + " others waiting in line)");
         class_6.method_1("FINAL WAITING SCORE: " + _loc2_.waitScore);
         if(isNaN(_loc2_.waitScore))
         {
            _loc2_.waitScore = 0;
         }
         if(_loc2_.currentCustomer.customerName == "Quinn" && _loc9_ <= 600 && _loc10_ <= 0)
         {
            _loc2_.wasQuickQuinn = true;
         }
         else if(_loc2_.currentCustomer.customerName == "Whiff" && _loc9_ <= 600 && _loc10_ <= 0)
         {
            _loc2_.wasQuickWhiff = true;
         }
      }
      
      public function gradeBuilding(param1:Number = -1) : void
      {
         var _loc5_:int = 0;
         var _loc26_:Array = null;
         var _loc27_:CustomerOrder = null;
         var _loc28_:Array = null;
         var _loc29_:Number = NaN;
         var _loc30_:Number = NaN;
         var _loc2_:GiveOrderScreen = this;
         var _loc3_:UserData = _loc2_.gameObj.var_127;
         var _loc4_:CustomerData = _loc2_.gameObj.var_131;
         var _loc8_:Number = _loc3_.getLobbyPercent();
         _loc2_.buildScore = 100;
         _loc2_.buildHadParticlesOff = false;
         class_6.method_1("Grade Building ---------------------------------------------------------");
         var _loc9_:CustomerOrder = _loc2_.gameObj.var_131.getCustomerOrderData(_loc2_.currentCustomer.customerType,param1);
         var _loc10_:SushiRoll = _loc2_.gameObj.var_137.currentOrder;
         var _loc11_:Array = [];
         var _loc12_:Array = [];
         var _loc13_:Array = [];
         _loc5_ = 0;
         while(_loc5_ < _loc9_.toppings.length)
         {
            if(FoodData.isDrop(_loc9_.toppings[_loc5_]))
            {
               _loc12_.push([_loc9_.toppings[_loc5_]]);
            }
            else
            {
               _loc11_.push([_loc9_.toppings[_loc5_]]);
            }
            _loc5_++;
         }
         _loc5_ = 0;
         while(_loc5_ < _loc9_.fillings.length)
         {
            _loc13_.push([_loc9_.fillings[_loc5_]]);
            _loc5_++;
         }
         var _loc14_:Array = _loc2_.gradePourableToppings(_loc11_,_loc10_.topping);
         class_6.method_1("Pourable Scores Output: " + _loc14_.toString());
         var _loc15_:Array = _loc2_.gradePlaceables(_loc12_,_loc10_.topping,_loc9_);
         class_6.method_1("Placeable Scores Output: " + _loc15_.toString());
         var _loc16_:Array = _loc2_.gradeFillings(_loc13_,_loc10_.filling,_loc9_);
         class_6.method_1("Filling Scores Output: " + _loc16_.toString());
         var _loc17_:Number;
         if((_loc17_ = _loc2_.currentCustomer.diningBuddy) > -1 && _loc2_.getAverageFromArray(_loc16_) <= 80)
         {
            class_6.method_1(" >> ------------------ CHECK BUDDY FILLINGS ------------------------");
            _loc26_ = [];
            _loc27_ = _loc2_.gameObj.var_131.getCustomerOrderData(_loc17_);
            _loc5_ = 0;
            while(_loc5_ < _loc27_.fillings.length)
            {
               _loc26_.push([_loc27_.fillings[_loc5_]]);
               _loc5_++;
            }
            _loc28_ = _loc2_.gradeFillings(_loc26_,_loc10_.filling,_loc27_);
            if((_loc29_ = _loc2_.getAverageFromArray(_loc28_)) >= 90)
            {
               _loc2_.wasFriendlyFillup = true;
            }
         }
         var _loc18_:Number = 0;
         var _loc19_:Number = 0;
         _loc5_ = 0;
         while(_loc5_ < _loc14_.length)
         {
            _loc18_ += _loc14_[_loc5_];
            _loc19_++;
            _loc5_++;
         }
         _loc5_ = 0;
         while(_loc5_ < _loc15_.length)
         {
            _loc18_ += _loc15_[_loc5_];
            _loc19_++;
            _loc5_++;
         }
         _loc5_ = 0;
         while(_loc5_ < _loc16_.length)
         {
            _loc18_ += _loc16_[_loc5_];
            _loc19_++;
            _loc5_++;
         }
         if(_loc19_ == 0)
         {
            _loc2_.buildScore = 0;
         }
         else
         {
            _loc30_ = Math.floor(_loc18_ / _loc19_);
            _loc2_.buildScore = _loc30_;
         }
         if(_loc9_.isFlipped != _loc10_.isFlipped)
         {
            class_6.method_1("Not correct flipping!");
            _loc2_.buildScore -= 15;
         }
         class_6.method_1("Grade Slicing:  Score = " + _loc2_.buildScore);
         var _loc20_:Number = _loc10_.filling.heightMapRange / 8;
         var _loc21_:Number = 0;
         var _loc22_:Number = 0;
         var _loc23_:Number = 0;
         _loc5_ = 0;
         while(_loc5_ < _loc10_.slices.length)
         {
            _loc21_ += _loc10_.slices[_loc5_].getSliceSize();
            _loc22_++;
            _loc23_ += Math.abs(_loc20_ - _loc10_.slices[_loc5_].getSliceSize());
            class_6.method_1("  >>  Slice " + _loc5_ + ": Size = " + _loc10_.slices[_loc5_].getSliceSize() + ". Target = " + _loc20_);
            _loc5_++;
         }
         if(_loc22_ < 8)
         {
            _loc2_.buildScore -= 10 * (8 - _loc22_);
            class_6.method_1("  >>  Only " + _loc22_ + " SLICES... score is now " + _loc2_.buildScore);
         }
         1;
         16;
         if((_loc23_ -= 16) > 0)
         {
            _loc2_.buildScore -= _loc23_ * 1;
            class_6.method_1("  >>  Total Amount Off: " + _loc23_ + ".");
         }
         class_6.method_1("  >>  >>  Done Slicing.  Score is now " + _loc2_.buildScore);
         if(_loc2_.buildScore > 100)
         {
            _loc2_.buildScore = 100;
         }
         if(_loc2_.buildScore < 0 || isNaN(_loc2_.buildScore))
         {
            _loc2_.buildScore = 0;
         }
         _loc2_.buildScore = Math.ceil(_loc2_.buildScore);
         class_6.method_1("Build Score: " + _loc2_.buildScore + "% ----------------------------------------------------\n");
         if(_loc2_.gameObj.var_133.outOfCustomers(false) && _loc10_.attachedTicket.ticketNumber == 1)
         {
            _loc2_.wasFirstLast = true;
         }
      }
      
      public function gradePourableToppings(param1:Array, param2:SushiTopping, param3:String = "") : Array
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc17_:ToppingItem = null;
         null;
         var _loc19_:String = null;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc29_:Number = NaN;
         var _loc30_:Number = NaN;
         var _loc31_:Boolean = false;
         var _loc32_:Number = NaN;
         var _loc33_:Boolean = false;
         var _loc34_:Boolean = false;
         var _loc35_:Number = NaN;
         var _loc36_:int = 0;
         var _loc37_:Number = NaN;
         var _loc38_:String = null;
         var _loc39_:Number = NaN;
         var _loc40_:Number = NaN;
         var _loc41_:* = null;
         var _loc42_:Array = null;
         var _loc43_:Number = NaN;
         var _loc44_:Number = NaN;
         var _loc45_:Number = NaN;
         var _loc46_:Number = NaN;
         var _loc47_:Number = NaN;
         var _loc48_:Number = NaN;
         var _loc49_:Number = NaN;
         var _loc50_:int = 0;
         var _loc51_:Number = NaN;
         var _loc52_:Number = NaN;
         var _loc53_:Number = NaN;
         var _loc54_:Number = NaN;
         var _loc55_:Number = NaN;
         var _loc56_:Number = NaN;
         var _loc57_:Number = NaN;
         var _loc58_:Number = NaN;
         var _loc59_:Number = NaN;
         var _loc60_:Number = NaN;
         var _loc4_:GiveOrderScreen;
         var _loc5_:UserData = (_loc4_ = this).gameObj.var_127;
         var _loc6_:CustomerData = _loc4_.gameObj.var_131;
         this.traceMessage(param3 + " -- >> -- Grade Pourable Toppings -------------------",param3);
         var _loc10_:Array = [];
         var _loc11_:Number = _loc5_.getLobbyPercent();
         var _loc12_:Number = Math.max(param1.length,param2.layerTypes.length);
         _loc7_ = 0;
         while(_loc7_ < _loc12_)
         {
            _loc10_.push(0);
            _loc7_++;
         }
         var _loc13_:Array = [];
         var _loc14_:Array = [];
         var _loc15_:Array = [];
         _loc7_ = 0;
         while(_loc7_ < param1.length)
         {
            _loc15_.push(false);
            _loc13_.push(param1[_loc7_][0]);
            _loc14_.push(param1[_loc7_][2]);
            _loc7_++;
         }
         this.traceMessage(param3 + "  >>  Toppings ordered: " + _loc13_.toString(),param3);
         this.traceMessage(param3 + "  >>  Topping distros:  " + _loc14_.toString(),param3);
         this.traceMessage(param3 + "  >>  Toppings on food: " + param2.layerTypes.toString(),param3);
         _loc7_ = 0;
         while(_loc7_ < param2.layerTypes.length)
         {
            _loc8_ = 0;
            while(_loc8_ < param1.length)
            {
               if(param2.layerTypes[_loc7_] == param1[_loc8_][0] && _loc15_[_loc8_] === false)
               {
                  _loc15_[_loc8_] = true;
                  _loc10_[_loc7_] = 100;
                  break;
               }
               _loc8_++;
            }
            _loc7_++;
         }
         this.traceMessage(param3 + "  >>  Current Pourable Scores: " + _loc10_.toString(),param3);
         0;
         _loc7_ = 0;
         while(_loc7_ < _loc12_)
         {
            _loc29_ = _loc7_;
            _loc30_ = _loc7_;
            _loc31_ = false;
            _loc32_ = 0;
            if(param2.layerTypes.length > _loc30_ && param1.length > _loc29_ && param2.layerTypes[_loc30_] == param1[_loc29_][0])
            {
               this.traceMessage(param3 + "       >>  Layering Order: " + param2.layerTypes[_loc30_] + " is correct (100%)",param3);
               _loc31_ = true;
               _loc32_ = 100;
            }
            else
            {
               this.traceMessage(param3 + "       >>  Layering Order: " + param2.layerTypes[_loc30_] + " is not correct. (0%)",param3);
               _loc32_ = 0;
            }
            if(!_loc31_ && param2.layerTypes.length > _loc30_)
            {
               _loc33_ = false;
               _loc34_ = false;
               _loc35_ = -1;
               _loc36_ = 0;
               while(_loc36_ < param1.length)
               {
                  if(param1[_loc36_][0] == param2.layerTypes[_loc30_])
                  {
                     _loc35_ = _loc36_;
                     break;
                  }
                  _loc36_++;
               }
               if(_loc35_ > -1)
               {
                  if(_loc30_ == 0 || _loc35_ > 0 && param1.length > _loc35_ - 1 && param2.layerTypes[_loc30_ - 1] == param1[_loc35_ - 1][0])
                  {
                     _loc34_ = true;
                     _loc32_ += 50;
                  }
                  if(_loc30_ == param2.layerTypes.length - 1 || param2.layerTypes.length > _loc30_ + 1 && param1.length > _loc35_ + 1 && param2.layerTypes[_loc30_ + 1] == param1[_loc35_ + 1][0])
                  {
                     _loc33_ = true;
                     _loc32_ += 50;
                  }
               }
               this.traceMessage(param3 + "       >>  " + param2.layerTypes[_loc30_] + " is NOT correct (+" + _loc32_ + "%) -- below:" + _loc34_ + ", above:" + _loc33_,param3);
            }
            if(_loc10_[_loc30_] > 0)
            {
               _loc37_ = (100 - _loc32_) / 2;
               _loc10_[_loc30_] -= _loc37_;
            }
            _loc7_++;
         }
         this.traceMessage(param3 + "  >>  Current Pourable Scores: " + _loc10_.toString(),param3);
         var _loc23_:Boolean = false;
         0;
         0;
         0;
         0.5;
         var _loc28_:Number = 0;
         _loc7_ = 0;
         while(_loc7_ < param2.layerTypes.length)
         {
            _loc19_ = String(param2.layerTypes[_loc7_]);
            if(_loc13_.indexOf(_loc19_) > -1)
            {
               _loc38_ = String(_loc14_[_loc13_.indexOf(_loc19_)]);
               _loc39_ = 0;
               _loc40_ = 0;
               _loc41_ = "";
               _loc20_ = (_loc17_ = _loc4_.gameObj.toppingData.getToppingItemData(_loc19_)).capacity;
               _loc21_ = Number(param2.layerNodeTallies[_loc7_]);
               _loc22_ = Math.abs(_loc20_ - _loc21_);
               _loc39_ = Math.max(0,100 - _loc22_ * 0.5);
               _loc42_ = param2.layerNodeDistributions[_loc7_];
               _loc43_ = 0;
               _loc44_ = 0;
               _loc45_ = 0;
               _loc46_ = 100;
               _loc47_ = 0;
               _loc48_ = 8;
               this.traceMessage("        >>  " + _loc19_ + ":   " + _loc42_.toString(),param3);
               _loc41_ += "        >>  " + _loc19_ + " Distribution Off (includes " + _loc48_ + "-node OK adjustment):  ";
               _loc49_ = 0;
               if(_loc42_[_loc42_.length - 1] > 0 || _loc42_[_loc42_.length - 2] > 0 || _loc42_[_loc42_.length - 3] > 0 || _loc42_[_loc42_.length - 4] > 0 || _loc42_[_loc42_.length - 5] > 0 || _loc42_[_loc42_.length - 6] > 0 || _loc42_[_loc42_.length - 7] > 0 || _loc42_[_loc42_.length - 8] > 0)
               {
                  _loc23_ = true;
                  _loc28_ = (_loc28_ = (_loc28_ = (_loc28_ = (_loc28_ = (_loc28_ = (_loc28_ = (_loc28_ += _loc42_[_loc42_.length - 1]) + _loc42_[_loc42_.length - 2]) + _loc42_[_loc42_.length - 3]) + _loc42_[_loc42_.length - 4]) + _loc42_[_loc42_.length - 5]) + _loc42_[_loc42_.length - 6]) + _loc42_[_loc42_.length - 7]) + _loc42_[_loc42_.length - 8];
                  _loc49_ = _loc42_[_loc42_.length - 1] + _loc42_[_loc42_.length - 2] + _loc42_[_loc42_.length - 3] + _loc42_[_loc42_.length - 4] + _loc42_[_loc42_.length - 5] + _loc42_[_loc42_.length - 6] + _loc42_[_loc42_.length - 7] + _loc42_[_loc42_.length - 8];
                  _loc41_ += "(Out-of-bounds: " + _loc42_[_loc42_.length - 1] + "|" + _loc42_[_loc42_.length - 2] + "|" + _loc42_[_loc42_.length - 3] + "|" + _loc42_[_loc42_.length - 4] + "|" + _loc42_[_loc42_.length - 5] + "|" + _loc42_[_loc42_.length - 6] + "|" + _loc42_[_loc42_.length - 7] + "|" + _loc42_[_loc42_.length - 8] + ") ";
                  _loc4_.buildHadParticlesOff = true;
               }
               _loc41_ += ">>> ";
               _loc50_ = 0;
               while(_loc50_ < _loc42_.length - 8)
               {
                  _loc56_ = 0;
                  if(_loc21_ > 0)
                  {
                     _loc56_ = Math.round(_loc42_[_loc50_] / _loc21_ * 100);
                  }
                  _loc57_ = 100 / (_loc42_.length - 8);
                  _loc58_ = 2;
                  if((_loc59_ = Math.abs(_loc57_ - _loc56_)) >= _loc48_)
                  {
                     _loc59_ -= _loc48_;
                  }
                  else
                  {
                     _loc59_ = 0;
                  }
                  _loc41_ += _loc59_ + "(" + _loc56_ + "%) " + "|";
                  _loc46_ -= _loc59_ * _loc58_;
                  if(_loc50_ == 0 || _loc50_ == 1 || _loc50_ == 2 || _loc50_ == 3)
                  {
                     _loc47_ += _loc42_[_loc50_];
                  }
                  _loc50_++;
               }
               _loc51_ = 100;
               _loc52_ = 1;
               _loc53_ = 0;
               if(_loc21_ > 0)
               {
                  _loc53_ = Math.round(_loc47_ / _loc21_ * 100);
               }
               _loc54_ = 12;
               if(_loc53_ >= 50 + _loc54_)
               {
                  _loc53_ -= _loc54_;
               }
               else if(_loc53_ <= 50 - _loc54_)
               {
                  _loc53_ += _loc54_;
               }
               else
               {
                  _loc53_ = 50;
               }
               _loc51_ -= Math.abs(50 - _loc53_) * _loc52_;
               _loc41_ += " (Distro = " + _loc46_ + "%, Balance = " + _loc51_ + "% >>> ";
               _loc40_ = Math.max(0,(_loc51_ + _loc46_) / 2);
               _loc41_ += Math.max(0,(_loc51_ + _loc46_) / 2) + "%) ";
               _loc55_ = 100 - (_loc40_ + _loc39_) / 2;
               _loc41_ += " >>> Overall Deduction: " + _loc55_;
               _loc10_[_loc7_] -= _loc55_;
               _loc41_ += " >>> " + _loc49_ + " OOB ";
               if(_loc10_[_loc7_] < 0)
               {
                  _loc10_[_loc7_] = 0;
               }
               this.traceMessage(_loc41_,param3);
            }
            _loc7_++;
         }
         this.traceMessage("  >>  Current Pourable Scores: " + _loc10_.toString(),param3);
         _loc7_ = 0;
         while(_loc7_ < param2.layerTypes.length)
         {
            if(_loc10_[_loc7_] > 0 && _loc5_.hasBonusFurniture("build",param2.layerTypes[_loc7_]))
            {
               if((_loc60_ = Math.random()) < _loc11_)
               {
                  _loc10_[_loc7_] += 2;
                  if(_loc10_[_loc7_] > 100)
                  {
                     _loc10_[_loc7_] = 100;
                  }
                  this.traceMessage("Add 2% boost to " + param2.layerTypes[_loc7_] + " -- Rand = " + _loc60_ + ", LobbyPercent = " + _loc11_,param3);
               }
               else
               {
                  _loc10_[_loc7_] += 1;
                  if(_loc10_[_loc7_] > 100)
                  {
                     _loc10_[_loc7_] = 100;
                  }
                  this.traceMessage("Add 1% boost to " + param2.layerTypes[_loc7_] + " -- Rand = " + _loc60_ + ", LobbyPercent = " + _loc11_,param3);
               }
            }
            _loc7_++;
         }
         this.traceMessage(param3 + "  >>  Post-Bonus Pourable Scores: " + _loc10_.toString(),param3);
         return _loc10_;
      }
      
      public function gradePlaceables(param1:Array, param2:SushiTopping, param3:CustomerOrder, param4:String = "") : Array
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc22_:Number = NaN;
         var _loc36_:Boolean = false;
         var _loc37_:Boolean = false;
         var _loc38_:Number = NaN;
         var _loc39_:Array = null;
         var _loc40_:Array = null;
         var _loc41_:Number = NaN;
         var _loc42_:Number = NaN;
         var _loc43_:Number = NaN;
         var _loc5_:GiveOrderScreen;
         var _loc6_:UserData = (_loc5_ = this).gameObj.var_127;
         var _loc7_:CustomerData = _loc5_.gameObj.var_131;
         this.traceMessage(param4 + " -- >> -- Grade Placeable Toppings -------------------",param4);
         var _loc11_:Array = [];
         var _loc12_:Number = _loc6_.getLobbyPercent();
         var _loc13_:Number = 100;
         var _loc14_:Array = [];
         var _loc15_:Array = [];
         var _loc16_:Array = [];
         var _loc17_:Array = [];
         var _loc18_:Array = [];
         _loc8_ = 0;
         while(_loc8_ < param1.length)
         {
            _loc15_.push(0);
            _loc14_.push(param1[_loc8_][0]);
            _loc8_++;
         }
         _loc8_ = 0;
         while(_loc8_ < param2.distroArray.length)
         {
            _loc36_ = false;
            _loc9_ = 0;
            while(_loc9_ < param1.length)
            {
               if(param2.distroArray[_loc8_][2] == param1[_loc9_][0])
               {
                  ++_loc15_[_loc9_];
                  _loc36_ = true;
                  break;
               }
               _loc9_++;
            }
            if(!_loc36_)
            {
               _loc37_ = false;
               _loc9_ = 0;
               while(_loc9_ < _loc16_.length)
               {
                  if(_loc16_[_loc9_][0] == param2.distroArray[_loc8_][2])
                  {
                     ++_loc17_[_loc9_];
                     _loc37_ = true;
                     break;
                  }
                  _loc9_++;
               }
               if(!_loc37_)
               {
                  _loc16_.push([param2.distroArray[_loc8_][2]]);
                  _loc17_.push(1);
                  _loc18_.push(false);
               }
            }
            _loc8_++;
         }
         var _loc19_:Boolean = true;
         var _loc20_:Number = 0;
         0;
         _loc8_ = 0;
         while(_loc8_ < param1.length)
         {
            if((_loc22_ = _loc5_.gameObj.toppingData.getToppingItemData(param1[_loc8_][0]).capacity - _loc15_[_loc8_]) != 0)
            {
               _loc19_ = false;
               _loc20_ += Math.abs(_loc22_);
               class_6.method_1("Looking for " + _loc5_.gameObj.toppingData.getToppingItemData(param1[_loc8_][0]).capacity + " of " + param1[_loc8_][0] + ", you have " + _loc15_[_loc8_]);
            }
            _loc8_++;
         }
         10;
         _loc13_ -= _loc20_ * 10;
         var _loc24_:Number = 0;
         var _loc25_:Array = [];
         _loc8_ = 0;
         while(_loc8_ < _loc17_.length)
         {
            _loc24_ += 1;
            if(_loc25_.indexOf(_loc16_[_loc8_][0]) == -1)
            {
               _loc25_.push(_loc16_[_loc8_][0]);
            }
            class_6.method_1("You have extra placeables: " + _loc17_[_loc8_] + " of " + _loc16_[_loc8_][0]);
            _loc8_++;
         }
         50;
         _loc13_ -= _loc24_ * 50;
         if(isNaN(_loc13_) || _loc13_ < 0)
         {
            _loc13_ = 0;
         }
         _loc13_ = Math.round(_loc13_);
         class_6.method_1(" ---- Amount/Type Score: " + _loc13_ + "%");
         var _loc27_:Number = 100;
         var _loc28_:Number = param2.sushi.dropBottomY - param2.sushi.dropTopY;
         var _loc29_:Array = [];
         3;
         1;
         _loc8_ = 0;
         while(_loc8_ < _loc14_.length)
         {
            _loc38_ = 100;
            if((_loc39_ = param2.getDistroItems(_loc14_[_loc8_])).length > 0)
            {
               _loc39_ = _loc39_.sort(_loc5_.sortDistro);
               _loc40_ = [];
               _loc41_ = 0;
               if(_loc39_.length != 1)
               {
                  _loc9_ = 1;
                  while(_loc9_ < _loc39_.length)
                  {
                     if(_loc39_[_loc9_][0] < _loc39_[_loc9_ - 1][1])
                     {
                        _loc42_ = Math.abs(_loc39_[_loc9_ - 1][1] - _loc39_[_loc9_][0]);
                        _loc40_.push(_loc42_);
                        if((_loc42_ -= 1) > 0)
                        {
                           _loc41_ += _loc42_;
                        }
                     }
                     else
                     {
                        _loc40_.push(0);
                     }
                     _loc9_++;
                  }
               }
               class_6.method_1("  >>  " + _loc14_[_loc8_] + "  Overlaps: " + _loc40_.toString() + " | Overall Dist Off: " + _loc41_);
               if(_loc41_ > 0)
               {
                  _loc38_ -= _loc41_ * 3;
                  class_6.method_1("  >>  >>  Reduce subscore to " + _loc38_);
               }
               if(_loc6_.hasBonusFurniture("build",_loc14_[_loc8_]))
               {
                  if((_loc43_ = Math.random()) < _loc12_)
                  {
                     if((_loc38_ += 2) > 100)
                     {
                        _loc38_ = 100;
                     }
                     this.traceMessage("  >> Add 2% boost to " + _loc14_[_loc8_] + " -- Rand = " + _loc43_ + ", LobbyPercent: " + _loc12_);
                  }
                  else
                  {
                     if((_loc38_ += 1) > 100)
                     {
                        _loc38_ = 100;
                     }
                     this.traceMessage("  >> Add 1% boost to " + _loc14_[_loc8_] + " -- Rand = " + _loc43_ + ", LobbyPercent: " + _loc12_);
                  }
               }
            }
            else
            {
               _loc38_ = 0;
            }
            _loc29_.push(_loc38_);
            _loc8_++;
         }
         class_6.method_1("Distro Scores: " + _loc29_.toString());
         var _loc32_:Number = 0;
         var _loc33_:Number = 0;
         _loc8_ = 0;
         while(_loc8_ < _loc29_.length)
         {
            _loc33_ += _loc29_[_loc8_];
            _loc32_++;
            _loc8_++;
         }
         _loc27_ = _loc33_ / _loc32_;
         class_6.method_1(">>>> >>>> >>>> Distro Average: (" + _loc33_ + "/" + _loc32_ + ") --> " + _loc27_ + "%");
         class_6.method_1(">>>> >>>> >>>> Amount Score: " + _loc13_ + "%");
         var _loc34_:Number = Math.round((_loc27_ + _loc13_) / 2);
         if(_loc13_ == 100)
         {
            _loc34_ = Math.round(_loc27_);
            class_6.method_1(">>>> >>>> >>>> Just Use Distro Score: " + _loc34_);
         }
         else
         {
            class_6.method_1(">>>> >>>> >>>> Combined Average: " + _loc34_);
         }
         var _loc35_:Number = Math.max(param1.length,param2.getNumDistroTypes());
         _loc8_ = 0;
         while(_loc8_ < _loc35_)
         {
            _loc11_.push(_loc34_);
            _loc8_++;
         }
         return _loc11_;
      }
      
      public function gradeFillings(param1:Array, param2:SushiFilling, param3:CustomerOrder, param4:String = "") : Array
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc22_:Number = NaN;
         var _loc36_:Boolean = false;
         var _loc37_:Boolean = false;
         var _loc38_:Number = NaN;
         var _loc39_:Array = null;
         var _loc40_:Array = null;
         var _loc41_:Number = NaN;
         var _loc42_:Number = NaN;
         var _loc43_:Number = NaN;
         var _loc5_:GiveOrderScreen;
         var _loc6_:UserData = (_loc5_ = this).gameObj.var_127;
         var _loc7_:CustomerData = _loc5_.gameObj.var_131;
         this.traceMessage(param4 + " -- >> -- Grade Fillings  -------------------",param4);
         var _loc11_:Array = [];
         var _loc12_:Number = _loc6_.getLobbyPercent();
         var _loc13_:Number = 100;
         var _loc14_:Array = [];
         var _loc15_:Array = [];
         var _loc16_:Array = [];
         var _loc17_:Array = [];
         var _loc18_:Array = [];
         _loc8_ = 0;
         while(_loc8_ < param1.length)
         {
            _loc15_.push(0);
            _loc14_.push(param1[_loc8_][0]);
            _loc8_++;
         }
         _loc8_ = 0;
         while(_loc8_ < param2.distroArray.length)
         {
            _loc36_ = false;
            _loc9_ = 0;
            while(_loc9_ < param1.length)
            {
               if(param2.distroArray[_loc8_][2] == param1[_loc9_][0])
               {
                  ++_loc15_[_loc9_];
                  _loc36_ = true;
                  break;
               }
               _loc9_++;
            }
            if(!_loc36_)
            {
               _loc37_ = false;
               _loc9_ = 0;
               while(_loc9_ < _loc16_.length)
               {
                  if(_loc16_[_loc9_][0] == param2.distroArray[_loc8_][2])
                  {
                     ++_loc17_[_loc9_];
                     _loc37_ = true;
                     break;
                  }
                  _loc9_++;
               }
               if(!_loc37_)
               {
                  _loc16_.push([param2.distroArray[_loc8_][2]]);
                  _loc17_.push(1);
                  _loc18_.push(false);
               }
            }
            _loc8_++;
         }
         var _loc19_:Boolean = true;
         var _loc20_:Number = 0;
         0;
         _loc8_ = 0;
         while(_loc8_ < param1.length)
         {
            if((_loc22_ = _loc5_.gameObj.toppingData.getToppingItemData(param1[_loc8_][0]).capacity - _loc15_[_loc8_]) != 0)
            {
               _loc19_ = false;
               _loc20_ += Math.abs(_loc22_);
               class_6.method_1("Looking for " + _loc5_.gameObj.toppingData.getToppingItemData(param1[_loc8_][0]).capacity + " of " + param1[_loc8_][0] + ", you have " + _loc15_[_loc8_]);
            }
            _loc8_++;
         }
         10;
         _loc13_ -= _loc20_ * 10;
         var _loc24_:Number = 0;
         var _loc25_:Array = [];
         _loc8_ = 0;
         while(_loc8_ < _loc17_.length)
         {
            _loc24_ += 1;
            if(_loc25_.indexOf(_loc16_[_loc8_][0]) == -1)
            {
               _loc25_.push(_loc16_[_loc8_][0]);
            }
            class_6.method_1("You have extra placeables: " + _loc17_[_loc8_] + " of " + _loc16_[_loc8_][0]);
            _loc8_++;
         }
         50;
         _loc13_ -= _loc24_ * 50;
         if(isNaN(_loc13_) || _loc13_ < 0)
         {
            _loc13_ = 0;
         }
         _loc13_ = Math.round(_loc13_);
         class_6.method_1(" ---- Amount/Type Score: " + _loc13_ + "%");
         var _loc27_:Number = 100;
         var _loc28_:Number = param2.heightMapRange;
         var _loc29_:Array = [];
         3;
         1;
         _loc8_ = 0;
         while(_loc8_ < _loc14_.length)
         {
            _loc38_ = 100;
            if((_loc39_ = param2.getDistroItems(_loc14_[_loc8_])).length > 0)
            {
               _loc39_ = _loc39_.sort(_loc5_.sortDistro);
               _loc40_ = [];
               _loc41_ = 0;
               if(_loc39_.length != 1)
               {
                  _loc9_ = 1;
                  while(_loc9_ < _loc39_.length)
                  {
                     if(_loc39_[_loc9_][0] < _loc39_[_loc9_ - 1][1])
                     {
                        _loc42_ = Math.abs(_loc39_[_loc9_ - 1][1] - _loc39_[_loc9_][0]);
                        _loc40_.push(_loc42_);
                        if((_loc42_ -= 1) > 0)
                        {
                           _loc41_ += _loc42_;
                        }
                     }
                     else
                     {
                        _loc40_.push(0);
                     }
                     _loc9_++;
                  }
               }
               class_6.method_1("  >>  " + _loc14_[_loc8_] + "  Overlaps: " + _loc40_.toString() + " | Overall Dist Off: " + _loc41_);
               if(_loc41_ > 0)
               {
                  _loc38_ -= _loc41_ * 3;
                  class_6.method_1("  >>  >>  Reduce subscore to " + _loc38_);
               }
               if(_loc6_.hasBonusFurniture("build",_loc14_[_loc8_]))
               {
                  if((_loc43_ = Math.random()) < _loc12_)
                  {
                     if((_loc38_ += 2) > 100)
                     {
                        _loc38_ = 100;
                     }
                     this.traceMessage("  >> Add 2% boost to " + _loc14_[_loc8_] + " -- Rand = " + _loc43_ + ", LobbyPercent: " + _loc12_);
                  }
                  else
                  {
                     if((_loc38_ += 1) > 100)
                     {
                        _loc38_ = 100;
                     }
                     this.traceMessage("  >> Add 1% boost to " + _loc14_[_loc8_] + " -- Rand = " + _loc43_ + ", LobbyPercent: " + _loc12_);
                  }
               }
            }
            else
            {
               _loc38_ = 0;
            }
            _loc29_.push(_loc38_);
            _loc8_++;
         }
         class_6.method_1("Distro Scores: " + _loc29_.toString());
         var _loc32_:Number = 0;
         var _loc33_:Number = 0;
         _loc8_ = 0;
         while(_loc8_ < _loc29_.length)
         {
            _loc33_ += _loc29_[_loc8_];
            _loc32_++;
            _loc8_++;
         }
         _loc27_ = _loc33_ / _loc32_;
         class_6.method_1(">>>> >>>> >>>> Distro Average: (" + _loc33_ + "/" + _loc32_ + ") --> " + _loc27_ + "%");
         class_6.method_1(">>>> >>>> >>>> Amount Score: " + _loc13_ + "%");
         var _loc34_:Number = Math.round((_loc27_ + _loc13_) / 2);
         if(_loc13_ == 100)
         {
            _loc34_ = Math.round(_loc27_);
            class_6.method_1(">>>> >>>> >>>> Just Use Distro Score: " + _loc34_);
         }
         else
         {
            class_6.method_1(">>>> >>>> >>>> Combined Average: " + _loc34_);
         }
         var _loc35_:Number = Math.max(param1.length,param2.getNumDistroTypes());
         _loc8_ = 0;
         while(_loc8_ < _loc35_)
         {
            _loc11_.push(_loc34_);
            _loc8_++;
         }
         return _loc11_;
      }
      
      public function sortDistro(param1:Array, param2:Array) : Number
      {
         if(param1[0] < param2[0])
         {
            return -1;
         }
         if(param1[0] > param2[0])
         {
            return 1;
         }
         return 0;
      }
      
      public function gradeCooking(param1:Number = -1) : void
      {
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc2_:GiveOrderScreen = this;
         var _loc3_:UserData = _loc2_.gameObj.var_127;
         var _loc4_:CustomerData = _loc2_.gameObj.var_131;
         var _loc8_:Number = _loc3_.getLobbyPercent();
         _loc2_.cookScore = 100;
         class_6.method_1("Grade Cooking ---------------------------------------------------------");
         var _loc9_:CustomerOrder = _loc2_.gameObj.var_131.getCustomerOrderData(_loc2_.currentCustomer.customerType,param1);
         var _loc10_:SushiRoll = _loc2_.gameObj.var_137.currentOrder;
         var _loc11_:Number = 0;
         var _loc12_:Number = _loc10_.riceCookAmount;
         var _loc13_:Number;
         var _loc14_:Number = (_loc13_ = FoodData.getTargetCookTime()) + FoodData.getSafeRemoveBuffer();
         1;
         if(_loc12_ >= _loc13_ && _loc12_ <= _loc14_)
         {
            class_6.method_1("  >>  Rice cooked correct time!  Score = " + _loc2_.cookScore);
         }
         else if(_loc12_ < _loc13_)
         {
            _loc11_ = _loc13_ - _loc12_;
            _loc2_.cookScore -= _loc11_ / 30 * 1;
            class_6.method_1("  >>  Rice not cooked long enough (" + _loc11_ / 30 + " secs too early).  Score = " + _loc2_.cookScore);
         }
         else if(_loc12_ > _loc14_)
         {
            _loc11_ = _loc12_ - _loc14_;
            _loc2_.cookScore -= _loc11_ / 30 * 1;
            class_6.method_1("  >>  Rice cooked too long (" + _loc11_ / 30 + " secs too long).  Score = " + _loc2_.cookScore);
         }
         if(_loc10_.riceVinegarAmount > 0)
         {
            _loc16_ = _loc10_.riceVinegarTime;
            _loc18_ = (_loc17_ = FoodData.getVinegarTime()) + FoodData.getSafeRemoveBuffer();
            if(_loc16_ >= _loc17_ && _loc16_ <= _loc18_)
            {
               class_6.method_1("  >>  Vinegar correct time!  Score = " + _loc2_.cookScore);
            }
            else if(_loc16_ < _loc17_)
            {
               _loc11_ = _loc17_ - _loc16_;
               _loc2_.cookScore -= _loc11_ / 30 * 1;
               class_6.method_1("  >>  Vinegar too early (" + _loc11_ / 30 + " secs too early).  Score = " + _loc2_.cookScore);
            }
            else if(_loc16_ > _loc18_)
            {
               _loc11_ = _loc16_ - _loc18_;
               _loc2_.cookScore -= _loc11_ / 30 * 1;
               class_6.method_1("  >>  Vinegar too late (" + _loc11_ / 30 + " secs too late).  Score = " + _loc2_.cookScore);
            }
            if(_loc10_.riceVinegarAmount > 1)
            {
               _loc2_.cookScore -= 10;
               class_6.method_1("  >>  Added too much vinegar!  Score = " + _loc2_.cookScore);
            }
         }
         else
         {
            _loc2_.cookScore -= 30;
            class_6.method_1("  >>  Forgot to add Vinegar!  Score = " + _loc2_.cookScore);
         }
         if(_loc9_.paperType != _loc10_.paperType)
         {
            _loc2_.cookScore -= 35;
            class_6.method_1("  >>  Wrong Paper Type, " + _loc10_.paperType + " instead of " + _loc9_.paperType + ".  Score = " + _loc2_.cookScore);
         }
         else if(_loc2_.cookScore < 100 && _loc2_.gameObj.var_127.hasBonusFurniture("build",_loc9_.paperType))
         {
            _loc19_ = Math.random();
            class_6.method_1("  >>  Paper Bonus");
            if(_loc19_ < _loc8_)
            {
               _loc2_.cookScore += 3;
            }
            else
            {
               _loc2_.cookScore += 1;
            }
            if(_loc2_.cookScore > 100)
            {
               _loc2_.cookScore = 100;
            }
         }
         if(_loc9_.riceType != _loc10_.riceType)
         {
            _loc2_.cookScore -= 35;
            class_6.method_1("  >>  Wrong Rice Type, " + _loc10_.riceType + " instead of " + _loc9_.riceType + ".  Score = " + _loc2_.cookScore);
         }
         else if(_loc2_.cookScore < 100 && _loc2_.gameObj.var_127.hasBonusFurniture("build",_loc9_.riceType))
         {
            _loc20_ = Math.random();
            class_6.method_1("  >>  Rice Bonus");
            if(_loc20_ < _loc8_)
            {
               _loc2_.cookScore += 3;
            }
            else
            {
               _loc2_.cookScore += 1;
            }
            if(_loc2_.cookScore > 100)
            {
               _loc2_.cookScore = 100;
            }
         }
         if(_loc2_.cookScore > 100)
         {
            _loc2_.cookScore = 100;
         }
         if(_loc2_.cookScore < 0 || isNaN(_loc2_.cookScore))
         {
            _loc2_.cookScore = 0;
         }
         _loc2_.cookScore = Math.ceil(_loc2_.cookScore);
         class_6.method_1("Cooking Score: " + _loc2_.cookScore + "% ----------------------------------------------------\n");
      }
      
      public function gradeTea(param1:Number = -1) : void
      {
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:CustomerOrder = null;
         var _loc2_:GiveOrderScreen = this;
         var _loc3_:UserData = _loc2_.gameObj.var_127;
         var _loc4_:CustomerData = _loc2_.gameObj.var_131;
         var _loc8_:Number = _loc3_.getLobbyPercent();
         _loc2_.teaScore = 100;
         class_6.method_1("Grade Tea ---------------------------------------------------------");
         var _loc9_:CustomerOrder = _loc2_.gameObj.var_131.getCustomerOrderData(_loc2_.currentCustomer.customerType,param1);
         var _loc10_:SushiRoll;
         if((_loc10_ = _loc2_.gameObj.var_137.currentOrder).attachedTea)
         {
            if(_loc10_.attachedTea.teaType != _loc9_.teaType)
            {
               _loc2_.teaScore -= 45;
               class_6.method_1("  >>  WRONG TEA: " + _loc10_.attachedTea.teaType + " instead of " + _loc9_.teaType);
            }
            else
            {
               _loc2_.teaScore -= Math.round(45 - _loc10_.attachedTea.teaPercent / 100 * 45);
               class_6.method_1("  >>  Tea Percent: " + _loc10_.attachedTea.teaPercent + ".  Score = " + _loc2_.teaScore);
               if(_loc10_.attachedTea.teaPercent < 100 && _loc2_.gameObj.var_127.hasBonusFurniture("build",_loc9_.teaType))
               {
                  _loc12_ = Math.random();
                  class_6.method_1("  >>  Tea Bonus");
                  if(_loc12_ < _loc8_)
                  {
                     _loc2_.teaScore += 3;
                  }
                  else
                  {
                     _loc2_.teaScore += 1;
                  }
                  if(_loc2_.teaScore > 100)
                  {
                     _loc2_.teaScore = 100;
                  }
               }
            }
            if(_loc10_.attachedTea.bubbleType != _loc9_.bubbleType)
            {
               _loc2_.teaScore -= 45;
               class_6.method_1("  >>  WRONG BUBBLES: " + _loc10_.attachedTea.bubbleType + " instead of " + _loc9_.bubbleType);
            }
            else
            {
               _loc2_.teaScore -= Math.round(45 - _loc10_.attachedTea.bubblePercent / 100 * 45);
               class_6.method_1("  >>  Bubble Percent: " + _loc10_.attachedTea.bubblePercent + ".  Score = " + _loc2_.teaScore);
               if(_loc10_.attachedTea.bubblePercent < 100 && _loc2_.checkBubbleBonus(_loc9_.bubbleType))
               {
                  _loc13_ = Math.random();
                  class_6.method_1("  >>  Bubble Bonus");
                  if(_loc13_ < _loc8_)
                  {
                     _loc2_.teaScore += 3;
                  }
                  else
                  {
                     _loc2_.teaScore += 1;
                  }
                  if(_loc2_.teaScore > 100)
                  {
                     _loc2_.teaScore = 100;
                  }
               }
            }
            _loc2_.teaScore -= Math.round(10 - _loc10_.attachedTea.milkPercent / 100 * 10);
            class_6.method_1("  >>  Milk Percent: " + _loc10_.attachedTea.milkPercent + ".  Score = " + _loc2_.teaScore);
         }
         else
         {
            _loc2_.teaScore = 0;
         }
         var _loc11_:Number;
         if((_loc11_ = _loc2_.currentCustomer.diningBuddy) > -1 && _loc2_.teaScore <= 70)
         {
            class_6.method_1(" >> ------------------ CHECK BUDDY TEA ------------------------");
            _loc14_ = _loc2_.gameObj.var_131.getCustomerOrderData(_loc11_);
            if(_loc10_.attachedTea.teaType == _loc14_.teaType && _loc10_.attachedTea.bubbleType == _loc14_.bubbleType)
            {
               _loc2_.wasTeaParty = true;
            }
         }
         if(isNaN(_loc2_.teaScore) || _loc2_.teaScore < 0)
         {
            _loc2_.teaScore = 0;
         }
         else if(_loc2_.teaScore > 100)
         {
            _loc2_.teaScore = 100;
         }
         class_6.method_1("Tea Score: " + _loc2_.teaScore + "% ----------------------------------------------------\n");
      }
      
      public function checkBubbleBonus(param1:String) : Boolean
      {
         var _loc2_:GiveOrderScreen = this;
         var _loc3_:Boolean = false;
         _loc3_ = _loc2_.gameObj.var_127.hasBonusFurniture("build",param1);
         if(_loc3_ == false)
         {
            if(param1 == FoodData.BUBBLE_KIWI && _loc2_.gameObj.var_127.hasBonusFurniture("build",FoodData.DROP_KIWI))
            {
               _loc3_ = true;
            }
            else if(param1 == FoodData.BUBBLE_CUCUMBER && _loc2_.gameObj.var_127.hasBonusFurniture("build",FoodData.FILLING_CUCUMBER))
            {
               _loc3_ = true;
            }
            else if(param1 == FoodData.BUBBLE_MANGO && _loc2_.gameObj.var_127.hasBonusFurniture("build",FoodData.DROP_MANGO))
            {
               _loc3_ = true;
            }
         }
         return _loc3_;
      }
      
      public function finishGivingOrder(param1:Boolean = false) : void
      {
         var _loc2_:GiveOrderScreen = this;
         _loc2_.isPresentingOrder = false;
         if(param1)
         {
            _loc2_.gameObj.var_202 = true;
            _loc2_.gameObj.hud.disableStationButtons();
            _loc2_.gameObj.hud.startTransition("ending");
         }
         else if(_loc2_.gameObj.var_135.alarmsRunning > 0)
         {
            _loc2_.gameObj.hud.startTransition("cook");
         }
         else if(_loc2_.gameObj.var_137.isSushiWaiting())
         {
            _loc2_.gameObj.hud.startTransition("tea");
         }
         else if(_loc2_.gameObj.var_129.isSushiWaiting())
         {
            _loc2_.gameObj.hud.startTransition("build");
         }
         else if(_loc2_.gameObj.var_135.getTotalRiceCooking() > 0)
         {
            _loc2_.gameObj.hud.startTransition("cook");
         }
         else
         {
            _loc2_.gameObj.hud.startTransition("order");
         }
      }
      
      protected function createLobbyBackdropBitmap() : Bitmap
      {
         var _loc4_:Number = NaN;
         var _loc1_:GiveOrderScreen = this;
         var _loc2_:UserData = _loc1_.gameObj.var_127;
         var _loc3_:Bitmap = null;
         var _loc5_:MovieClip = new orderSushiriaBackdropMC();
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
      
      protected function createColorTransform(param1:Number) : ColorTransform
      {
         var _loc2_:ColorTransform = new ColorTransform();
         _loc2_.redMultiplier = ((param1 & 16711680) >>> 16) / 255;
         _loc2_.greenMultiplier = ((param1 & 65280) >>> 8) / 255;
         _loc2_.blueMultiplier = (param1 & 255) / 255;
         return _loc2_;
      }
      
      public function initStationUpgrades() : void
      {
         var _loc1_:GiveOrderScreen = this;
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
         _loc1_.countertopMC = new giveorder_countertop();
         _loc1_.countertopMC.transform.colorTransform = _loc1_.createColorTransform(_loc1_.gameObj.var_127.lobbyTop);
         _loc1_.clip.countertop.addChild(_loc1_.countertopMC);
      }
      
      public function getClothingBonus() : Number
      {
         var _loc1_:GiveOrderScreen = this;
         return Math.round(_loc1_.extraTipForHolidaySpirit * _loc1_.gameObj.var_127.getClothingHolidaySpirit(false));
      }
      
      public function getWorkerClothingTags() : Array
      {
         var _loc1_:GiveOrderScreen = this;
         return _loc1_.gameObj.workerData.getClothingTags();
      }
      
      public function getTextGlowColor() : uint
      {
         var _loc1_:GiveOrderScreen = this;
         var _loc2_:uint = _loc1_.gameObj.var_127.lobbyTop;
         var _loc3_:uint = uint((_loc2_ & 16711680) >> 16);
         var _loc4_:uint = uint((_loc2_ & 65280) >> 8);
         var _loc5_:uint = uint(_loc2_ & 255);
         0.5;
         _loc3_ *= 0.5;
         _loc4_ *= 0.5;
         _loc5_ *= 0.5;
         return uint(_loc3_ << 16 | _loc4_ << 8 | _loc5_);
      }
      
      public function getAverageFromArray(param1:Array) : Number
      {
         var _loc2_:Number = 0;
         var _loc3_:Number = 0;
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc2_ += param1[_loc4_];
            _loc3_++;
            _loc4_++;
         }
         return Math.round(_loc2_ / _loc3_);
      }
      
      public function traceMessage(param1:String, param2:String = "") : void
      {
         this;
         class_6.method_1(param1);
      }
   }
}
