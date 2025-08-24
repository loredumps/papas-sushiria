package sushiGame.screens
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.*;
   import flash.media.SoundChannel;
   import package_2.class_14;
   import package_2.class_6;
   import package_4.*;
   import sushiGame.data.FoodData;
   import sushiGame.data.UserData;
   import sushiGame.models.*;
   
   public class CookScreen
   {
       
      
      public var clip:MovieClip;
      
      public var isActive:Boolean = false;
      
      public var gameObj:class_5;
      
      public var isBoosting:Boolean = false;
      
      public var boostingWhich:Number = -1;
      
      public var boostSound:SoundChannel;
      
      public var currentOrder:SushiRoll = null;
      
      public var trashOrder:SushiRoll = null;
      
      public var alarmsRunning:Number = 0;
      
      public var alarmSound:SoundChannel = null;
      
      public var alarmBaseVolume:Number = 0.5;
      
      public var alarmExtraVolume:Number = 0.2;
      
      public var timerAlarmsAvailable:Array;
      
      public var timerAlarmsRunning:Array;
      
      public var numCookers:Number = 3;
      
      public var cookers:Vector.<Cooker> = null;
      
      public var binNames:Vector.<String> = null;
      
      public var bins:Vector.<MovieClip> = null;
      
      public var binRiceBGParts:Vector.<MovieClip> = null;
      
      public var binRiceFGParts:Vector.<MovieClip> = null;
      
      public var binsTargetX:Array;
      
      public var binsTargetY:Array;
      
      public var binsDragging:Array;
      
      public var binsPouring:Array;
      
      public var binsLeaving:Array;
      
      public var binsInShelf:Array;
      
      public var binsRollingOver:Array;
      
      public var binsSpeed:Array;
      
      public var binsPourX:Array;
      
      public var binsPourY:Array;
      
      public var binOffscreenX:Number = -183;
      
      public var paperRollNames:Vector.<String> = null;
      
      public var paperRolls:Vector.<MovieClip> = null;
      
      public var paperTargetX:Array;
      
      public var paperTargetY:Array;
      
      public var paperOffscreenX:Array;
      
      public var paperOffscreenY:Array;
      
      public var paperDragging:Array;
      
      public var paperUnrolling:Array;
      
      public var paperRollingOver:Array;
      
      public var unrollTargetX:Number = 488;
      
      public var unrollTargetY:Number = 414;
      
      public var trashRice:MovieClip = null;
      
      public var trashOffscreenX:Number = -175;
      
      public var trashOnscreenX:Number = -35;
      
      public var isDraggingBottle:Boolean = false;
      
      public var isPouringBottle:Boolean = false;
      
      public var isReadyPouringBottle:Boolean = false;
      
      public var isFinishingPouringBottle:Boolean = false;
      
      public var isRollingOverBottle:Boolean = false;
      
      public var bottlePouringWhich:Number = -1;
      
      public var bottleNormalTargetX:Number = 459;
      
      public var bottleNormalTargetY:Number = 249;
      
      public var bottleRotation:Number = 0;
      
      public var bottlePourX:Array;
      
      public var bottlePourY:Array;
      
      public function CookScreen(param1:class_5)
      {
         this.timerAlarmsAvailable = [false,false,false];
         this.timerAlarmsRunning = [false,false,false];
         this.binsTargetX = [324,361,397,434];
         this.binsTargetY = [324,287,251,214];
         this.binsDragging = [false,false,false,false];
         this.binsPouring = [-1,-1,-1,-1];
         this.binsLeaving = [false,false,false,false];
         this.binsInShelf = [true,true,true,true];
         this.binsRollingOver = [false,false,false,false];
         this.binsSpeed = [0,0,0,0];
         this.binsPourX = [47,143,240];
         this.binsPourY = [332,235,139];
         this.paperTargetX = [299,348,397,446];
         this.paperTargetY = [416,416,416,416];
         this.paperOffscreenX = [167,216,265,314];
         this.paperOffscreenY = [548,548,548,548];
         this.paperDragging = [false,false,false,false];
         this.paperUnrolling = [false,false,false,false];
         this.paperRollingOver = [false,false,false,false];
         this.bottlePourX = [45,143,239];
         this.bottlePourY = [262,163,67];
         super();
         var _loc2_:CookScreen = this;
         _loc2_.gameObj = param1;
         _loc2_.setupScreen();
      }
      
      public function restoreSoundAfterAd() : void
      {
         this;
      }
      
      public function setupScreen() : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Cooker = null;
         var _loc6_:MovieClip = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc1_:CookScreen = this;
         var _loc2_:UserData = _loc1_.gameObj.var_127;
         _loc1_.clip = new cookScreenMC();
         _loc1_.clip.bg.cacheAsBitmap = true;
         _loc1_.clip.cover.cacheAsBitmap = true;
         _loc1_.gameObj.var_128.addEventListener("soundIsMuted",_loc1_.onSoundIsMuted);
         _loc1_.gameObj.var_128.addEventListener("soundIsNotMuted",_loc1_.onSoundIsNotMuted);
         _loc1_.cookers = new Vector.<Cooker>();
         _loc3_ = 0;
         while(_loc3_ < _loc1_.numCookers)
         {
            _loc5_ = new Cooker(_loc1_.gameObj,_loc1_.clip["cookerholder" + _loc3_],_loc3_);
            _loc1_.cookers.push(_loc5_);
            (_loc6_ = _loc1_.clip["timer_" + _loc3_]).timer.inside.bar.scaleX = 0;
            _loc6_.alarm.gotoAndStop(1);
            _loc6_.timer.inside.boostbg.visible = false;
            _loc6_.timer.inside.boostfg.visible = false;
            _loc6_.boost_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.pressCookBoost);
            _loc7_ = FoodData.getTargetCookTime() / FoodData.getMaxCookTime();
            _loc6_.timer.inside.arrow.x = 2 + _loc7_ * 59;
            _loc8_ = FoodData.getVinegarTime() / FoodData.getMaxCookTime();
            _loc6_.timer.inside.middlearrow.x = 2 + _loc8_ * 59;
            _loc3_++;
         }
         _loc1_.setupRice();
         _loc1_.setupPaper();
         _loc1_.clip.bottle.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickBottle);
         _loc1_.clip.bottle.addEventListener(MouseEvent.ROLL_OVER,_loc1_.rolloverBottle);
         _loc1_.clip.bottle.addEventListener(MouseEvent.ROLL_OUT,_loc1_.rolloutBottle);
         _loc1_.clip.bottle.buttonMode = true;
         _loc1_.clip.bottle.useHandCursor = true;
      }
      
      public function setupPaper(param1:Boolean = true, param2:Number = -1) : void
      {
         var _loc4_:int = 0;
         var _loc5_:Number = NaN;
         var _loc6_:Boolean = false;
         var _loc7_:Array = null;
         var _loc8_:MovieClip = null;
         var _loc3_:CookScreen = this;
         if(param1)
         {
            _loc5_ = _loc3_.gameObj.var_127.getMonth();
            _loc6_ = _loc3_.gameObj.var_127.isNewYear();
            if(param2 > -1)
            {
               _loc5_ = param2;
               _loc6_ = true;
            }
            _loc7_ = FoodData.getPaper(_loc5_,_loc6_);
            _loc3_.paperRollNames = new Vector.<String>();
            _loc3_.paperRolls = new Vector.<MovieClip>();
            _loc4_ = 0;
            while(_loc4_ < _loc7_.length)
            {
               if(_loc3_.gameObj.var_127.hasTopping(_loc7_[_loc4_]))
               {
                  (_loc8_ = class_14.method_103(_loc7_[_loc4_] + "_rollout",true,false)).gotoAndStop(1);
                  _loc8_.buttonMode = true;
                  _loc8_.useHandCursor = true;
                  _loc8_.x = _loc3_.paperTargetX[_loc4_];
                  _loc8_.y = _loc3_.paperTargetY[_loc4_];
                  _loc3_.clip.tableholder.addChild(_loc8_);
                  _loc3_.paperRolls.push(_loc8_);
                  _loc3_.paperRollNames.push(_loc7_[_loc4_]);
                  _loc8_.addEventListener(MouseEvent.MOUSE_DOWN,_loc3_.clickPaper);
                  _loc8_.addEventListener(MouseEvent.ROLL_OVER,_loc3_.rolloverPaper);
                  _loc8_.addEventListener(MouseEvent.ROLL_OUT,_loc3_.rolloutPaper);
               }
               _loc4_++;
            }
         }
         else
         {
            if(_loc3_.paperRolls)
            {
               _loc4_ = int(_loc3_.paperRolls.length - 1);
               while(_loc4_ >= 0)
               {
                  if(_loc3_.paperRolls[_loc4_])
                  {
                     _loc3_.paperRolls[_loc4_].removeEventListener(MouseEvent.MOUSE_DOWN,_loc3_.clickPaper);
                     _loc3_.paperRolls[_loc4_].removeEventListener(MouseEvent.ROLL_OVER,_loc3_.rolloverPaper);
                     _loc3_.paperRolls[_loc4_].removeEventListener(MouseEvent.ROLL_OUT,_loc3_.rolloutPaper);
                     if(_loc3_.paperRolls[_loc4_].parent)
                     {
                        _loc3_.paperRolls[_loc4_].parent.removeChild(_loc3_.paperRolls[_loc4_]);
                     }
                     _loc3_.paperRolls[_loc4_] = null;
                     _loc3_.paperRolls.splice(_loc4_,1);
                  }
                  _loc4_--;
               }
               _loc3_.paperRolls = null;
            }
            _loc3_.paperRollNames = null;
         }
      }
      
      public function setupRice(param1:Boolean = true) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Array = null;
         var _loc5_:MovieClip = null;
         var _loc6_:MovieClip = null;
         var _loc7_:MovieClip = null;
         var _loc2_:CookScreen = this;
         if(param1)
         {
            _loc4_ = FoodData.getRice(_loc2_.gameObj.var_127.getMonth(),_loc2_.gameObj.var_127.isNewYear());
            _loc2_.binNames = new Vector.<String>();
            _loc2_.bins = new Vector.<MovieClip>();
            _loc2_.binRiceBGParts = new Vector.<MovieClip>();
            _loc2_.binRiceFGParts = new Vector.<MovieClip>();
            _loc3_ = 0;
            while(_loc3_ < _loc4_.length)
            {
               if(_loc2_.gameObj.var_127.hasTopping(_loc4_[_loc3_]))
               {
                  (_loc5_ = new cook_rice_container()).stop();
                  _loc5_.buttonMode = true;
                  _loc5_.useHandCursor = true;
                  _loc5_.mouseEnabled = true;
                  _loc5_.mouseChildren = false;
                  _loc6_ = class_14.method_103(_loc4_[_loc3_] + "_dry_fg",false,false);
                  _loc7_ = class_14.method_103(_loc4_[_loc3_] + "_dry_bg",false,false);
                  _loc6_.y = -41;
                  _loc7_.y = -41;
                  _loc6_.cacheAsBitmap = true;
                  _loc7_.cacheAsBitmap = true;
                  _loc5_.addChildAt(_loc7_,0);
                  _loc5_.addChild(_loc6_);
                  _loc2_.bins.push(_loc5_);
                  _loc2_.binRiceBGParts.push(_loc7_);
                  _loc2_.binRiceFGParts.push(_loc6_);
                  _loc2_.binNames.push(_loc4_[_loc3_]);
                  _loc5_.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickRiceBin);
                  _loc5_.addEventListener(MouseEvent.ROLL_OVER,_loc2_.rolloverRiceBin);
                  _loc5_.addEventListener(MouseEvent.ROLL_OUT,_loc2_.rolloutRiceBin);
                  _loc5_.x = _loc2_.binsTargetX[_loc3_];
                  _loc5_.y = _loc2_.binsTargetY[_loc3_];
                  _loc2_.clip.binholder.addChildAt(_loc5_,0);
               }
               _loc3_++;
            }
         }
         else
         {
            _loc2_.gameObj.removeEventListener(MouseEvent.MOUSE_UP,_loc2_.releaseRiceBin);
            if(_loc2_.binRiceFGParts)
            {
               _loc3_ = int(_loc2_.binRiceFGParts.length - 1);
               while(_loc3_ >= 0)
               {
                  if(_loc2_.binRiceFGParts[_loc3_])
                  {
                     if(_loc2_.binRiceFGParts[_loc3_].parent)
                     {
                        _loc2_.binRiceFGParts[_loc3_].parent.removeChild(_loc2_.binRiceFGParts[_loc3_]);
                     }
                     _loc2_.binRiceFGParts[_loc3_] = null;
                     _loc2_.binRiceFGParts.splice(_loc3_,1);
                  }
                  _loc3_--;
               }
               _loc2_.binRiceFGParts = null;
            }
            if(_loc2_.binRiceBGParts)
            {
               _loc3_ = int(_loc2_.binRiceBGParts.length - 1);
               while(_loc3_ >= 0)
               {
                  if(_loc2_.binRiceBGParts[_loc3_])
                  {
                     if(_loc2_.binRiceBGParts[_loc3_].parent)
                     {
                        _loc2_.binRiceBGParts[_loc3_].parent.removeChild(_loc2_.binRiceBGParts[_loc3_]);
                     }
                     _loc2_.binRiceBGParts[_loc3_] = null;
                     _loc2_.binRiceBGParts.splice(_loc3_,1);
                  }
                  _loc3_--;
               }
               _loc2_.binRiceBGParts = null;
            }
            if(_loc2_.bins)
            {
               _loc3_ = int(_loc2_.bins.length - 1);
               while(_loc3_ >= 0)
               {
                  if(_loc2_.bins[_loc3_])
                  {
                     _loc2_.bins[_loc3_].removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickRiceBin);
                     _loc2_.bins[_loc3_].removeEventListener(MouseEvent.ROLL_OVER,_loc2_.rolloverRiceBin);
                     _loc2_.bins[_loc3_].removeEventListener(MouseEvent.ROLL_OUT,_loc2_.rolloutRiceBin);
                     if(_loc2_.bins[_loc3_].parent)
                     {
                        _loc2_.bins[_loc3_].parent.removeChild(_loc2_.bins[_loc3_]);
                     }
                     _loc2_.bins[_loc3_] = null;
                     _loc2_.bins.splice(_loc3_,1);
                  }
                  _loc3_--;
               }
               _loc2_.bins = null;
            }
            _loc2_.binNames = null;
         }
      }
      
      public function rolloverPaper(param1:MouseEvent) : void
      {
         var _loc2_:CookScreen = this;
         var _loc3_:Number = -1;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.paperRolls.length)
         {
            if(param1.currentTarget == _loc2_.paperRolls[_loc4_])
            {
               _loc3_ = _loc4_;
               break;
            }
            _loc4_++;
         }
         if(_loc3_ > -1 && _loc2_.paperDragging[_loc3_] == false && _loc2_.paperUnrolling[_loc3_] == false && _loc2_.isDraggingAnything() == false)
         {
            _loc2_.paperRollingOver[_loc3_] = true;
         }
      }
      
      public function rolloutPaper(param1:MouseEvent) : void
      {
         var _loc2_:CookScreen = this;
         var _loc3_:Number = -1;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.paperRolls.length)
         {
            if(param1.currentTarget == _loc2_.paperRolls[_loc4_])
            {
               _loc3_ = _loc4_;
               break;
            }
            _loc4_++;
         }
         if(_loc3_ > -1 && _loc2_.paperDragging[_loc3_] == false && _loc2_.paperUnrolling[_loc3_] == false)
         {
            _loc2_.paperRollingOver[_loc3_] = false;
         }
      }
      
      public function clickPaper(param1:MouseEvent) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         var _loc2_:CookScreen = this;
         if(!_loc2_.gameObj.training || _loc2_.gameObj.method_105(8))
         {
            _loc3_ = -1;
            _loc4_ = 0;
            while(_loc4_ < _loc2_.paperRolls.length)
            {
               if(param1.currentTarget == _loc2_.paperRolls[_loc4_])
               {
                  _loc3_ = _loc4_;
                  break;
               }
               _loc4_++;
            }
            if(_loc3_ > -1 && _loc2_.paperDragging[_loc3_] == false && _loc2_.paperUnrolling.indexOf(true) == -1)
            {
               if(_loc2_.currentOrder)
               {
                  _loc2_.currentOrder.hidePaperWarning();
               }
               _loc2_.gameObj.var_128.playSound("grabticket.wav");
               _loc2_.paperDragging[_loc3_] = true;
               _loc2_.paperRollingOver[_loc3_] = false;
               if(!_loc2_.clip.holder.contains(_loc2_.paperRolls[_loc4_]))
               {
                  _loc2_.clip.holder.addChild(_loc2_.paperRolls[_loc4_]);
               }
               _loc2_.gameObj.addEventListener(MouseEvent.MOUSE_UP,_loc2_.releasePaper);
            }
         }
      }
      
      public function releasePaper(param1:MouseEvent) : void
      {
         var _loc2_:CookScreen = this;
         _loc2_.gameObj.var_128.playSound("dropticket.wav");
         _loc2_.gameObj.removeEventListener(MouseEvent.MOUSE_UP,_loc2_.releasePaper);
         var _loc3_:Number = -1;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.paperDragging.length)
         {
            if(_loc2_.paperDragging[_loc4_] == true)
            {
               _loc3_ = _loc4_;
               break;
            }
            _loc4_++;
         }
         if(_loc3_ > -1 && _loc2_.paperRolls && _loc3_ < _loc2_.paperRolls.length)
         {
            _loc2_.paperDragging[_loc3_] = false;
            if(_loc2_.withinMatRange(_loc2_.clip.mouseX,_loc2_.clip.mouseY) && _loc2_.currentOrder && _loc2_.currentOrder.paperType == null && _loc2_.currentOrder.isTrashingOnCook == false && _loc2_.currentOrder.isLeavingCook == false && _loc2_.currentOrder.isDraggingOnCook == false)
            {
               _loc2_.paperUnrolling[_loc3_] = true;
               _loc2_.paperRolls[_loc3_].gotoAndPlay(2);
               _loc2_.currentOrder.hidePaperWarning();
               _loc2_.gameObj.method_104(8);
            }
         }
      }
      
      public function rolloverRiceBin(param1:MouseEvent) : void
      {
         var _loc2_:CookScreen = this;
         var _loc3_:Number = -1;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.bins.length)
         {
            if(param1.currentTarget == _loc2_.bins[_loc4_])
            {
               _loc3_ = _loc4_;
               break;
            }
            _loc4_++;
         }
         if(_loc3_ > -1 && _loc2_.binsDragging[_loc3_] == false && _loc2_.binsPouring[_loc3_] == -1 && _loc2_.binsLeaving[_loc3_] == false && _loc2_.binsInShelf[_loc3_] == true && _loc2_.isDraggingAnything() == false)
         {
            _loc2_.binsRollingOver[_loc3_] = true;
         }
      }
      
      public function rolloutRiceBin(param1:MouseEvent) : void
      {
         var _loc2_:CookScreen = this;
         var _loc3_:Number = -1;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.bins.length)
         {
            if(param1.currentTarget == _loc2_.bins[_loc4_])
            {
               _loc3_ = _loc4_;
               break;
            }
            _loc4_++;
         }
         if(_loc3_ > -1 && _loc2_.binsDragging[_loc3_] == false && _loc2_.binsPouring[_loc3_] == -1 && _loc2_.binsLeaving[_loc3_] == false && _loc2_.binsInShelf[_loc3_] == true)
         {
            _loc2_.binsRollingOver[_loc3_] = false;
         }
      }
      
      public function clickRiceBin(param1:MouseEvent) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         var _loc2_:CookScreen = this;
         if(!_loc2_.gameObj.training || _loc2_.gameObj.method_105(5))
         {
            _loc3_ = -1;
            _loc4_ = 0;
            while(_loc4_ < _loc2_.bins.length)
            {
               if(param1.currentTarget == _loc2_.bins[_loc4_])
               {
                  _loc3_ = _loc4_;
                  break;
               }
               _loc4_++;
            }
            if(_loc3_ > -1 && _loc2_.binsDragging[_loc3_] == false && _loc2_.binsPouring[_loc3_] == -1 && _loc2_.binsLeaving[_loc3_] == false)
            {
               _loc2_.gameObj.var_128.playSound("pan_pickup.wav");
               _loc2_.binsDragging[_loc3_] = true;
               _loc2_.binsInShelf[_loc3_] = false;
               _loc2_.binsRollingOver[_loc3_] = false;
               if(!_loc2_.clip.holder.contains(_loc2_.bins[_loc4_]))
               {
                  _loc2_.clip.holder.addChild(_loc2_.bins[_loc4_]);
               }
               _loc2_.gameObj.addEventListener(MouseEvent.MOUSE_UP,_loc2_.releaseRiceBin);
            }
         }
      }
      
      public function releaseRiceBin(param1:MouseEvent) : void
      {
         var _loc5_:MovieClip = null;
         var _loc6_:Number = NaN;
         var _loc2_:CookScreen = this;
         _loc2_.gameObj.removeEventListener(MouseEvent.MOUSE_UP,_loc2_.releaseRiceBin);
         var _loc3_:Number = -1;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.binsDragging.length)
         {
            if(_loc2_.binsDragging[_loc4_] == true)
            {
               _loc3_ = _loc4_;
               break;
            }
            _loc4_++;
         }
         if(_loc3_ > -1 && _loc2_.bins && _loc3_ < _loc2_.bins.length)
         {
            _loc2_.binsDragging[_loc3_] = false;
            _loc5_ = _loc2_.bins[_loc3_];
            _loc6_ = _loc2_.getNearestCooker(_loc5_.x,_loc5_.y);
            if(_loc2_.gameObj.method_105(5))
            {
               if(_loc2_.binNames[_loc3_] != FoodData.RICE_WHITE)
               {
                  _loc6_ = -1;
               }
               else if(_loc6_ != 1)
               {
                  _loc6_ = -1;
               }
            }
            if(_loc6_ > -1 && _loc2_.canAddRiceToCooker(_loc6_))
            {
               _loc2_.cookers[_loc6_].setRiceType(_loc2_.binNames[_loc3_]);
               _loc2_.binsPouring[_loc3_] = _loc6_;
               _loc5_.gotoAndPlay(2);
               _loc2_.gameObj.var_128.playSound("pour_rice.wav");
               _loc2_.binRiceBGParts[_loc3_].visible = false;
               _loc2_.binRiceFGParts[_loc3_].visible = false;
            }
         }
      }
      
      public function clickBottle(param1:MouseEvent) : void
      {
         var _loc2_:CookScreen = this;
         if(!_loc2_.gameObj.training || _loc2_.gameObj.method_105(7))
         {
            if(!_loc2_.isDraggingBottle && !_loc2_.isPouringBottle && !_loc2_.isFinishingPouringBottle)
            {
               _loc2_.gameObj.var_128.playSound("grabtopping.wav");
               _loc2_.isDraggingBottle = true;
               _loc2_.isPouringBottle = false;
               _loc2_.isFinishingPouringBottle = false;
               _loc2_.isRollingOverBottle = false;
               _loc2_.bottlePouringWhich = -1;
               _loc2_.gameObj.addEventListener(MouseEvent.MOUSE_UP,_loc2_.releaseBottle);
            }
         }
      }
      
      public function rolloverBottle(param1:MouseEvent) : void
      {
         var _loc2_:CookScreen = this;
         if(!_loc2_.isDraggingBottle && !_loc2_.isPouringBottle && !_loc2_.isFinishingPouringBottle && _loc2_.isDraggingAnything() == false)
         {
            _loc2_.isRollingOverBottle = true;
         }
      }
      
      public function rolloutBottle(param1:MouseEvent) : void
      {
         var _loc2_:CookScreen = this;
         _loc2_.isRollingOverBottle = false;
      }
      
      public function isDraggingAnything() : Boolean
      {
         var _loc1_:CookScreen = this;
         if(_loc1_.isDraggingBottle || _loc1_.binsDragging.indexOf(true) > -1 || _loc1_.paperDragging.indexOf(true) > -1 || _loc1_.isDraggingAnyCooker() == true || _loc1_.currentOrder && _loc1_.currentOrder.isDraggingOnCook)
         {
            return true;
         }
         return false;
      }
      
      public function releaseBottle(param1:MouseEvent) : void
      {
         var _loc2_:CookScreen = this;
         _loc2_.gameObj.removeEventListener(MouseEvent.MOUSE_UP,_loc2_.releaseBottle);
         _loc2_.isDraggingBottle = false;
         _loc2_.gameObj.var_128.playSound("droptopping.wav");
         var _loc3_:Number = _loc2_.getNearestCooker(_loc2_.clip.mouseX,_loc2_.clip.mouseY);
         class_6.method_1("Release Bottle.  Over Which Cooker?: " + _loc3_);
         if(_loc3_ > -1 && _loc2_.canAddVinegarToCooker(_loc3_))
         {
            class_6.method_1("ADD VINEGAR");
            _loc2_.cookers[_loc3_].addVinegar();
            _loc2_.isPouringBottle = true;
            _loc2_.bottlePouringWhich = _loc3_;
            _loc2_.isFinishingPouringBottle = false;
            _loc2_.stopAlarm(_loc3_);
         }
      }
      
      public function stopSounds() : void
      {
         var _loc1_:CookScreen = this;
         if(_loc1_.alarmSound)
         {
            _loc1_.alarmSound.stop();
            _loc1_.alarmSound = null;
         }
         if(_loc1_.boostSound)
         {
            _loc1_.boostSound.stop();
            _loc1_.boostSound = null;
         }
      }
      
      public function destroy() : void
      {
         var _loc2_:int = 0;
         var _loc1_:CookScreen = this;
         _loc1_.clip.bottle.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickBottle);
         _loc1_.clip.bottle.removeEventListener(MouseEvent.ROLL_OVER,_loc1_.rolloverBottle);
         _loc1_.clip.bottle.removeEventListener(MouseEvent.ROLL_OUT,_loc1_.rolloutBottle);
         _loc1_.setupRice(false);
         _loc1_.setupPaper(false);
         _loc2_ = int(_loc1_.cookers.length - 1);
         while(_loc2_ >= 0)
         {
            if(_loc1_.cookers[_loc2_])
            {
               _loc1_.cookers[_loc2_].destroy();
               _loc1_.cookers[_loc2_] = null;
            }
            _loc1_.cookers.splice(_loc2_,1);
            _loc2_--;
         }
         _loc1_.cookers = null;
         _loc1_.stopSounds();
         _loc1_.gameObj.var_128.removeEventListener("soundIsMuted",_loc1_.onSoundIsMuted);
         _loc1_.gameObj.var_128.removeEventListener("soundIsNotMuted",_loc1_.onSoundIsNotMuted);
         if(_loc1_.gameObj.var_139.contains(_loc1_.clip))
         {
            _loc1_.gameObj.var_139.removeChild(_loc1_.clip);
         }
         _loc1_.clip = null;
      }
      
      public function activateScreen() : void
      {
         var _loc1_:CookScreen = this;
         if(!_loc1_.gameObj.var_139.contains(_loc1_.clip))
         {
            _loc1_.gameObj.var_139.addChild(_loc1_.clip);
         }
         _loc1_.gameObj.hud.hideTimerAlerts();
         _loc1_.gameObj.var_128.switchMusic("bake");
         _loc1_.isActive = true;
         _loc1_.checkForFoodOrder();
         _loc1_.putAwayEverything();
         _loc1_.gameObj.method_121();
      }
      
      public function checkForFoodOrder() : void
      {
         var _loc1_:CookScreen = this;
         if(_loc1_.currentOrder == null)
         {
            _loc1_.currentOrder = new SushiRoll(_loc1_.gameObj,_loc1_.clip.tableholder);
         }
      }
      
      public function deactivateScreen() : void
      {
         var _loc1_:CookScreen = this;
         if(_loc1_.gameObj.var_139.contains(_loc1_.clip))
         {
            _loc1_.gameObj.var_139.removeChild(_loc1_.clip);
         }
         _loc1_.isActive = false;
         if(_loc1_.isBoosting)
         {
            _loc1_.isBoosting = false;
            _loc1_.boostingWhich = -1;
            _loc1_.gameObj.removeEventListener(MouseEvent.MOUSE_UP,_loc1_.releaseCookBoost);
            _loc1_.gameObj.var_128.playSound("release_button.wav");
            if(_loc1_.boostSound)
            {
               _loc1_.boostSound.stop();
               _loc1_.boostSound = null;
            }
         }
      }
      
      public function putAwayEverything() : void
      {
         var _loc2_:int = 0;
         var _loc1_:CookScreen = this;
         _loc2_ = 0;
         while(_loc2_ < _loc1_.binsDragging.length)
         {
            _loc1_.binsDragging[_loc2_] = false;
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc1_.paperDragging.length)
         {
            _loc1_.paperDragging[_loc2_] = false;
            _loc2_++;
         }
         _loc1_.gameObj.removeEventListener(MouseEvent.MOUSE_UP,_loc1_.releasePaper);
         _loc1_.gameObj.removeEventListener(MouseEvent.MOUSE_UP,_loc1_.releaseBottle);
         _loc1_.isDraggingBottle = false;
         _loc1_.gameObj.removeEventListener(MouseEvent.MOUSE_UP,_loc1_.releaseRiceBin);
         _loc2_ = 0;
         while(_loc2_ < _loc1_.cookers.length)
         {
            if(_loc1_.cookers[_loc2_].isDragging)
            {
               _loc1_.cookers[_loc2_].releaseCooker(null);
            }
            _loc2_++;
         }
         if(Boolean(_loc1_.currentOrder) && _loc1_.currentOrder.isDraggingOnCook)
         {
            _loc1_.currentOrder.releaseOnCook(null);
         }
      }
      
      public function updateScreen() : void
      {
         var _loc2_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc1_:CookScreen = this;
         var _loc3_:Number = 1;
         if(_loc1_.cookers)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc1_.cookers.length)
            {
               if(_loc1_.isBoosting && _loc1_.boostingWhich == _loc2_)
               {
                  _loc3_ = 2;
               }
               else
               {
                  _loc3_ = 1;
               }
               _loc1_.cookers[_loc2_].updateCooker(_loc3_);
               _loc2_++;
            }
         }
         if(_loc1_.isBoosting && (_loc1_.clip.mouseX < 0 || _loc1_.clip.mouseX > 640 || _loc1_.clip.mouseY < 0 || _loc1_.clip.mouseY > 480))
         {
            _loc1_.releaseCookBoost(null);
         }
         if(_loc1_.bins)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc1_.bins.length)
            {
               if(_loc1_.binsDragging[_loc2_] == true)
               {
                  _loc4_ = _loc1_.clip.mouseX;
                  _loc5_ = _loc1_.clip.mouseY;
                  _loc1_.bins[_loc2_].x += (_loc4_ - _loc1_.bins[_loc2_].x) / 2;
                  _loc1_.bins[_loc2_].y += (_loc5_ - _loc1_.bins[_loc2_].y) / 2;
                  _loc1_.bins[_loc2_].x = Math.round(_loc1_.bins[_loc2_].x);
                  _loc1_.bins[_loc2_].y = Math.round(_loc1_.bins[_loc2_].y);
                  if(_loc4_ < 0 || _loc5_ < 0 || _loc4_ > 640 || _loc5_ > 480)
                  {
                     _loc1_.gameObj.removeEventListener(MouseEvent.MOUSE_UP,_loc1_.releaseRiceBin);
                     _loc1_.binsDragging[_loc2_] = false;
                  }
               }
               else if(_loc1_.binsPouring[_loc2_] > -1)
               {
                  _loc4_ = Number(_loc1_.binsPourX[_loc1_.binsPouring[_loc2_]]);
                  _loc5_ = Number(_loc1_.binsPourY[_loc1_.binsPouring[_loc2_]]);
                  _loc1_.bins[_loc2_].x += (_loc4_ - _loc1_.bins[_loc2_].x) / 2;
                  _loc1_.bins[_loc2_].y += (_loc5_ - _loc1_.bins[_loc2_].y) / 2;
                  if(_loc1_.bins[_loc2_].currentFrame == _loc1_.bins[_loc2_].totalFrames)
                  {
                     _loc1_.bins[_loc2_].stop();
                  }
                  if(Math.abs(_loc4_ - _loc1_.bins[_loc2_].x) <= 1 && Math.abs(_loc5_ - _loc1_.bins[_loc2_].y) <= 1 && _loc1_.bins[_loc2_].currentFrame == _loc1_.bins[_loc2_].totalFrames)
                  {
                     _loc1_.cookers[_loc1_.binsPouring[_loc2_]].addRiceClip();
                     _loc1_.binsPouring[_loc2_] = -1;
                     _loc1_.binsSpeed[_loc2_] = 5;
                     _loc1_.binsLeaving[_loc2_] = true;
                  }
               }
               else if(_loc1_.binsLeaving[_loc2_] == true)
               {
                  _loc1_.binsSpeed[_loc2_] += 10;
                  _loc1_.bins[_loc2_].x -= _loc1_.binsSpeed[_loc2_];
                  if(_loc1_.bins[_loc2_].x <= _loc1_.binOffscreenX)
                  {
                     if(_loc1_.clip.binholder.contains(_loc1_.bins[_loc2_]) == false)
                     {
                        _loc1_.clip.binholder.addChild(_loc1_.bins[_loc2_]);
                     }
                     _loc1_.bins[_loc2_].x = _loc1_.binsTargetX[_loc2_];
                     _loc1_.bins[_loc2_].y = _loc1_.binsTargetY[_loc2_] + 90;
                     _loc1_.bins[_loc2_].gotoAndStop(1);
                     _loc1_.binsLeaving[_loc2_] = false;
                     _loc1_.binsInShelf[_loc2_] = true;
                     _loc1_.binsRollingOver[_loc2_] = false;
                     _loc1_.binRiceFGParts[_loc2_].visible = true;
                     _loc1_.binRiceBGParts[_loc2_].visible = true;
                     _loc1_.depthSortBins();
                     _loc1_.gameObj.var_128.playSound("bin_slideup.wav");
                  }
               }
               else
               {
                  _loc4_ = Number(_loc1_.binsTargetX[_loc2_]);
                  if(_loc1_.binsInShelf[_loc2_] == true)
                  {
                     if(_loc1_.binsRollingOver[_loc2_] == true)
                     {
                        _loc5_ = _loc1_.binsTargetY[_loc2_] - 3;
                     }
                     else
                     {
                        _loc5_ = Number(_loc1_.binsTargetY[_loc2_]);
                     }
                  }
                  else
                  {
                     _loc5_ = _loc1_.binsTargetY[_loc2_] - 20;
                  }
                  _loc1_.bins[_loc2_].x += (_loc4_ - _loc1_.bins[_loc2_].x) / 2;
                  _loc1_.bins[_loc2_].y += (_loc5_ - _loc1_.bins[_loc2_].y) / 2;
                  if(Math.abs(_loc4_ - _loc1_.bins[_loc2_].x) <= 1 && Math.abs(_loc5_ - _loc1_.bins[_loc2_].y) <= 1)
                  {
                     if(_loc1_.binsInShelf[_loc2_] == false)
                     {
                        if(!_loc1_.clip.binholder.contains(_loc1_.bins[_loc2_]))
                        {
                           _loc1_.clip.binholder.addChild(_loc1_.bins[_loc2_]);
                        }
                        _loc1_.binsInShelf[_loc2_] = true;
                        _loc1_.depthSortBins();
                        _loc1_.gameObj.var_128.playSound("pan_return.wav");
                     }
                  }
               }
               _loc2_++;
            }
         }
         if(_loc1_.paperRolls)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc1_.paperRolls.length)
            {
               if(_loc1_.paperRolls[_loc2_])
               {
                  if(_loc1_.paperDragging[_loc2_] == true)
                  {
                     _loc4_ = _loc1_.clip.mouseX + 75;
                     _loc5_ = _loc1_.clip.mouseY + 57;
                     _loc1_.paperRolls[_loc2_].x += (_loc4_ - _loc1_.paperRolls[_loc2_].x) / 2;
                     _loc1_.paperRolls[_loc2_].y += (_loc5_ - _loc1_.paperRolls[_loc2_].y) / 2;
                     if(_loc1_.clip.mouseX < 0 || _loc1_.clip.mouseY < 0 || _loc1_.clip.mouseX > 640 || _loc1_.clip.mouseY > 480)
                     {
                        _loc1_.gameObj.removeEventListener(MouseEvent.MOUSE_UP,_loc1_.releasePaper);
                        _loc1_.paperDragging[_loc2_] = false;
                     }
                  }
                  else if(_loc1_.paperUnrolling[_loc2_] == true)
                  {
                     _loc4_ = _loc1_.unrollTargetX;
                     _loc5_ = _loc1_.unrollTargetY;
                     _loc1_.paperRolls[_loc2_].x += (_loc4_ - _loc1_.paperRolls[_loc2_].x) / 2;
                     _loc1_.paperRolls[_loc2_].y += (_loc5_ - _loc1_.paperRolls[_loc2_].y) / 2;
                     if(_loc1_.paperRolls[_loc2_].currentFrame == _loc1_.paperRolls[_loc2_].totalFrames)
                     {
                        if(_loc1_.currentOrder)
                        {
                           _loc1_.currentOrder.addPaper(_loc1_.paperRollNames[_loc2_]);
                        }
                        _loc1_.paperRolls[_loc2_].x = _loc1_.paperOffscreenX[_loc2_];
                        _loc1_.paperRolls[_loc2_].y = _loc1_.paperOffscreenY[_loc2_];
                        _loc1_.paperRolls[_loc2_].gotoAndStop(1);
                        _loc1_.paperUnrolling[_loc2_] = false;
                     }
                  }
                  else
                  {
                     _loc4_ = Number(_loc1_.paperTargetX[_loc2_]);
                     if(_loc1_.paperRollingOver[_loc2_])
                     {
                        _loc5_ = _loc1_.paperTargetY[_loc2_] - 3;
                     }
                     else
                     {
                        _loc5_ = Number(_loc1_.paperTargetY[_loc2_]);
                     }
                     if(_loc1_.paperRolls[_loc2_].x != _loc4_ || _loc1_.paperRolls[_loc2_].y != _loc5_)
                     {
                        _loc1_.paperRolls[_loc2_].x += (_loc4_ - _loc1_.paperRolls[_loc2_].x) / 2;
                        _loc1_.paperRolls[_loc2_].y += (_loc5_ - _loc1_.paperRolls[_loc2_].y) / 2;
                        if(Math.abs(_loc4_ - _loc1_.paperRolls[_loc2_].x) < 1 && Math.abs(_loc5_ - _loc1_.paperRolls[_loc2_].y) < 1)
                        {
                           if(!_loc1_.clip.tableholder.contains(_loc1_.paperRolls[_loc2_]))
                           {
                              _loc1_.clip.tableholder.addChild(_loc1_.paperRolls[_loc2_]);
                           }
                        }
                     }
                  }
               }
               _loc2_++;
            }
         }
         if(_loc1_.isDraggingAnyCooker() || _loc1_.isTrashingAnyCooker() || _loc1_.currentOrder != null && _loc1_.currentOrder.isDraggingOnCook)
         {
            _loc4_ = _loc1_.trashOnscreenX;
         }
         else
         {
            _loc4_ = _loc1_.trashOffscreenX;
         }
         if(_loc1_.clip.trash_tray.x != _loc4_)
         {
            if(_loc4_ == _loc1_.trashOnscreenX)
            {
               _loc1_.clip.trash_tray.x += (_loc4_ - _loc1_.clip.trash_tray.x) / 2;
            }
            else
            {
               _loc1_.clip.trash_tray.x += (_loc4_ - _loc1_.clip.trash_tray.x) / 4;
            }
            if(Math.abs(_loc1_.clip.trash_tray.x - _loc4_) <= 1)
            {
               if(_loc4_ == _loc1_.trashOffscreenX)
               {
                  if(_loc1_.trashRice)
                  {
                     _loc1_.trashRice.stop();
                     if(_loc1_.trashRice.parent)
                     {
                        _loc1_.trashRice.parent.removeChild(_loc1_.trashRice);
                     }
                     _loc1_.trashRice = null;
                  }
                  if(_loc1_.trashOrder)
                  {
                     _loc1_.trashOrder.destroy();
                     _loc1_.trashOrder = null;
                  }
               }
            }
         }
         _loc4_ = _loc1_.bottleNormalTargetX;
         _loc5_ = _loc1_.bottleNormalTargetY;
         if(_loc1_.isPouringBottle)
         {
            _loc4_ = Number(_loc1_.bottlePourX[_loc1_.bottlePouringWhich]);
            if(_loc1_.isFinishingPouringBottle || !_loc1_.isReadyPouringBottle)
            {
               _loc5_ = Number(_loc1_.bottlePourY[_loc1_.bottlePouringWhich]);
            }
            else
            {
               _loc5_ = _loc1_.bottlePourY[_loc1_.bottlePouringWhich] + 12;
            }
         }
         else if(_loc1_.isDraggingBottle)
         {
            _loc4_ = _loc1_.clip.mouseX;
            _loc5_ = _loc1_.clip.mouseY;
         }
         else if(_loc1_.isRollingOverBottle)
         {
            _loc5_ -= 2;
         }
         var _loc6_:Number = 0;
         if(_loc1_.isPouringBottle || _loc1_.isReadyPouringBottle || _loc1_.isFinishingPouringBottle)
         {
            _loc6_ = 180;
         }
         else if(_loc1_.isDraggingBottle)
         {
            if(_loc1_.getNearestCooker(_loc1_.clip.mouseX,_loc1_.clip.mouseY) > -1 && _loc1_.canAddVinegarToCooker(_loc1_.getNearestCooker(_loc1_.clip.mouseX,_loc1_.clip.mouseY)))
            {
               _loc6_ = 180;
            }
         }
         if(_loc1_.bottleRotation != _loc6_)
         {
            _loc1_.bottleRotation += (_loc6_ - _loc1_.bottleRotation) / 3;
            if(Math.abs(_loc6_ - _loc1_.bottleRotation) <= 1)
            {
               _loc1_.bottleRotation = _loc6_;
            }
            _loc1_.clip.bottle.rotation = _loc1_.bottleRotation;
         }
         if(_loc6_ == 180 && _loc1_.isDraggingBottle)
         {
            _loc5_ -= 40;
         }
         if(_loc1_.clip.bottle.x != _loc4_ || _loc1_.clip.bottle.y != _loc5_)
         {
            if(_loc1_.isReadyPouringBottle || _loc1_.isFinishingPouringBottle)
            {
               _loc1_.clip.bottle.x += (_loc4_ - _loc1_.clip.bottle.x) / 4;
               _loc1_.clip.bottle.y += (_loc5_ - _loc1_.clip.bottle.y) / 4;
            }
            else
            {
               _loc1_.clip.bottle.x += (_loc4_ - _loc1_.clip.bottle.x) / 2;
               _loc1_.clip.bottle.y += (_loc5_ - _loc1_.clip.bottle.y) / 2;
            }
            if(Math.abs(_loc4_ - _loc1_.clip.bottle.x) <= 1 && Math.abs(_loc5_ - _loc1_.clip.bottle.y) <= 1)
            {
               if(_loc1_.isPouringBottle && _loc1_.isReadyPouringBottle == false)
               {
                  _loc1_.isReadyPouringBottle = true;
                  _loc1_.clip.bottle.gotoAndStop(2);
                  _loc1_.gameObj.var_128.playSound("squirt_vinegar.wav");
               }
               else if(_loc1_.isPouringBottle && _loc1_.isFinishingPouringBottle == false)
               {
                  _loc1_.isFinishingPouringBottle = true;
               }
               else if(_loc1_.isPouringBottle && _loc1_.isFinishingPouringBottle)
               {
                  _loc1_.isPouringBottle = false;
                  _loc1_.isFinishingPouringBottle = false;
                  _loc1_.isReadyPouringBottle = false;
                  _loc1_.bottlePouringWhich = -1;
                  _loc1_.clip.bottle.gotoAndStop(1);
               }
               _loc1_.clip.bottle.x = _loc4_;
               _loc1_.clip.bottle.y = _loc5_;
            }
         }
         if(_loc1_.isDraggingBottle && (_loc1_.clip.mouseX < 0 || _loc1_.clip.mouseY < 0 || _loc1_.clip.mouseX > 640 || _loc1_.clip.mouseY > 480))
         {
            _loc1_.releaseBottle(null);
         }
         if(_loc1_.currentOrder)
         {
            _loc1_.currentOrder.updateSushiOnCook();
         }
      }
      
      public function addRiceToTrash(param1:String) : void
      {
         var _loc2_:CookScreen = this;
         if(_loc2_.trashRice)
         {
            _loc2_.trashRice.stop();
            if(_loc2_.trashRice.parent)
            {
               _loc2_.trashRice.parent.removeChild(_loc2_.trashRice);
            }
            _loc2_.trashRice = null;
         }
         _loc2_.trashRice = class_14.method_103(param1 + "_flat",false,false);
         _loc2_.trashRice.stop();
         _loc2_.trashRice.scaleX = 0.7;
         _loc2_.trashRice.scaleY = 0.7;
         _loc2_.trashRice.x = 37;
         _loc2_.trashRice.y = -16;
         _loc2_.clip.trash_tray.addChild(_loc2_.trashRice);
      }
      
      public function depthSortBins() : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc1_:CookScreen = this;
         try
         {
            if(_loc1_.bins)
            {
               _loc2_ = 0;
               while(_loc2_ < _loc1_.bins.length)
               {
                  _loc3_ = _loc1_.bins.length - 1 - _loc2_;
                  if(_loc1_.clip.binholder.contains(_loc1_.bins[_loc3_]))
                  {
                     _loc1_.clip.binholder.setChildIndex(_loc1_.bins[_loc3_],_loc2_);
                  }
                  _loc2_++;
               }
            }
         }
         catch(err:Error)
         {
         }
      }
      
      public function getNearestCooker(param1:Number, param2:Number) : Number
      {
         var _loc6_:int = 0;
         var _loc3_:CookScreen = this;
         var _loc4_:Number = -1;
         var _loc5_:Number = int.MAX_VALUE;
         if(_loc3_.cookers)
         {
            _loc6_ = 0;
            while(_loc6_ < _loc3_.cookers.length)
            {
               if(_loc3_.cookers[_loc6_])
               {
                  if(_loc3_.cookers[_loc6_].isWithinRange(param1,param2))
                  {
                     _loc4_ = _loc6_;
                     break;
                  }
               }
               _loc6_++;
            }
         }
         return _loc4_;
      }
      
      public function canAddRiceToCooker(param1:Number) : Boolean
      {
         var _loc2_:CookScreen = this;
         var _loc3_:Boolean = false;
         if(_loc2_.cookers && param1 >= 0 && param1 < _loc2_.cookers.length)
         {
            if(Boolean(_loc2_.cookers[param1]) && _loc2_.cookers[param1].canAddRice())
            {
               _loc3_ = true;
            }
         }
         return _loc3_;
      }
      
      public function canAddVinegarToCooker(param1:Number) : Boolean
      {
         var _loc2_:CookScreen = this;
         var _loc3_:Boolean = false;
         if(_loc2_.cookers && param1 >= 0 && param1 < _loc2_.cookers.length)
         {
            if(Boolean(_loc2_.cookers[param1]) && _loc2_.cookers[param1].canAddVinegar())
            {
               _loc3_ = true;
            }
         }
         return _loc3_;
      }
      
      public function getTotalRiceCooking() : Number
      {
         var _loc3_:int = 0;
         var _loc1_:CookScreen = this;
         var _loc2_:Number = 0;
         if(_loc1_.cookers)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc1_.cookers.length)
            {
               if(_loc1_.cookers[_loc3_].riceType != null && _loc1_.cookers[_loc3_].isAddingToSushi == false && _loc1_.cookers[_loc3_].isAddingMoving == false && _loc1_.cookers[_loc3_].isTrashing == false)
               {
                  _loc2_++;
               }
               _loc3_++;
            }
         }
         return _loc2_;
      }
      
      public function isDraggingAnyCooker() : Boolean
      {
         var _loc3_:int = 0;
         var _loc1_:CookScreen = this;
         var _loc2_:Boolean = false;
         if(_loc1_.cookers)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc1_.cookers.length)
            {
               if(_loc1_.cookers[_loc3_].isDragging)
               {
                  _loc2_ = true;
                  break;
               }
               _loc3_++;
            }
         }
         return _loc2_;
      }
      
      public function isTrashingAnyCooker() : Boolean
      {
         var _loc3_:int = 0;
         var _loc1_:CookScreen = this;
         var _loc2_:Boolean = false;
         if(_loc1_.cookers)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc1_.cookers.length)
            {
               if(_loc1_.cookers[_loc3_].isTrashing)
               {
                  _loc2_ = true;
                  break;
               }
               _loc3_++;
            }
         }
         return _loc2_;
      }
      
      public function quietSoundWhenPaused() : void
      {
         var _loc1_:CookScreen = this;
         _loc1_.updateAlarmSound();
      }
      
      public function resumeSoundAfterPaused() : void
      {
         var _loc1_:CookScreen = this;
         _loc1_.updateAlarmSound();
      }
      
      public function initStationUpgrades() : void
      {
         var _loc3_:int = 0;
         var _loc4_:MovieClip = null;
         var _loc1_:CookScreen = this;
         var _loc2_:UserData = _loc1_.gameObj.var_127;
         _loc3_ = 0;
         while(_loc3_ < _loc1_.numCookers)
         {
            _loc4_ = _loc1_.clip["timer_" + _loc3_];
            if(_loc2_.hasBonus("booster" + _loc3_))
            {
               _loc4_.boost_btn.visible = true;
            }
            else
            {
               _loc4_.boost_btn.visible = false;
            }
            if(_loc2_.hasBonus("alarm" + _loc3_))
            {
               _loc4_.alarm.visible = true;
               _loc1_.timerAlarmsAvailable[_loc3_] = true;
            }
            else
            {
               _loc4_.alarm.visible = false;
               _loc1_.timerAlarmsAvailable[_loc3_] = false;
            }
            _loc4_.alarm.gotoAndStop(1);
            _loc3_++;
         }
      }
      
      public function soundAlarm(param1:Number) : void
      {
         var _loc2_:CookScreen = this;
         if(_loc2_.timerAlarmsRunning[param1] == false)
         {
            _loc2_.clip["timer_" + param1].alarm.gotoAndPlay(2);
            _loc2_.gameObj.hud.showTimerAlert();
            ++_loc2_.alarmsRunning;
            _loc2_.timerAlarmsRunning[param1] = true;
            _loc2_.updateAlarmSound();
         }
      }
      
      public function stopAlarm(param1:Number) : void
      {
         var _loc2_:CookScreen = this;
         if(param1 > -1 && param1 < _loc2_.timerAlarmsAvailable.length)
         {
            if(_loc2_.timerAlarmsRunning[param1] == true)
            {
               _loc2_.clip["timer_" + param1].alarm.gotoAndStop(1);
               --_loc2_.alarmsRunning;
               if(_loc2_.alarmsRunning < 0)
               {
                  _loc2_.alarmsRunning = 0;
               }
               _loc2_.timerAlarmsRunning[param1] = false;
               _loc2_.updateAlarmSound();
            }
         }
      }
      
      public function updateAlarmSound() : void
      {
         var _loc1_:CookScreen = this;
         if(_loc1_.alarmSound != null)
         {
            _loc1_.alarmSound.stop();
            _loc1_.alarmSound = null;
         }
         var _loc2_:Number = _loc1_.alarmBaseVolume + (_loc1_.alarmsRunning - 1) * _loc1_.alarmExtraVolume;
         if(_loc2_ > 1)
         {
            _loc2_ = 1;
         }
         if(_loc1_.gameObj.var_169)
         {
            _loc2_ = 0;
         }
         else if(_loc1_.gameObj.var_128.isMute)
         {
            _loc2_ = 0;
         }
         if(_loc1_.alarmsRunning > 0)
         {
            _loc1_.alarmSound = _loc1_.gameObj.var_128.playSound("timeralarm.wav",true,_loc2_);
         }
      }
      
      public function onSoundIsMuted(param1:Event) : void
      {
         var _loc2_:CookScreen = this;
         _loc2_.updateAlarmSound();
      }
      
      public function onSoundIsNotMuted(param1:Event) : void
      {
         var _loc2_:CookScreen = this;
         _loc2_.updateAlarmSound();
      }
      
      public function pressCookBoost(param1:MouseEvent) : void
      {
         var _loc2_:CookScreen = this;
         if(!_loc2_.gameObj.training)
         {
            _loc2_.isBoosting = true;
            if(param1.currentTarget == _loc2_.clip.timer_0.boost_btn)
            {
               _loc2_.boostingWhich = 0;
            }
            else if(param1.currentTarget == _loc2_.clip.timer_1.boost_btn)
            {
               _loc2_.boostingWhich = 1;
            }
            else if(param1.currentTarget == _loc2_.clip.timer_2.boost_btn)
            {
               _loc2_.boostingWhich = 2;
            }
            _loc2_.gameObj.var_128.playSound("press_machine_button.wav");
            if(_loc2_.boostSound)
            {
               _loc2_.boostSound.stop();
               _loc2_.boostSound = null;
            }
            _loc2_.boostSound = _loc2_.gameObj.var_128.playSound("boosting.wav",true);
            if(_loc2_.gameObj.hud.whichContextTraining == "boost")
            {
               _loc2_.gameObj.var_127.setTrained("boost");
               _loc2_.gameObj.hud.removeContextTraining();
            }
            _loc2_.gameObj.addEventListener(MouseEvent.MOUSE_UP,_loc2_.releaseCookBoost);
         }
      }
      
      public function releaseCookBoost(param1:MouseEvent) : void
      {
         var _loc2_:CookScreen = this;
         _loc2_.isBoosting = false;
         _loc2_.boostingWhich = -1;
         _loc2_.gameObj.removeEventListener(MouseEvent.MOUSE_UP,_loc2_.releaseCookBoost);
         _loc2_.gameObj.var_128.playSound("release_button.wav");
         if(_loc2_.boostSound)
         {
            _loc2_.boostSound.stop();
            _loc2_.boostSound = null;
         }
      }
      
      public function cheatChangeMonth(param1:Number) : void
      {
         var _loc2_:CookScreen = this;
         _loc2_.setupPaper(false);
         _loc2_.setupPaper(true,param1);
      }
      
      public function removeOrder() : void
      {
         var _loc1_:CookScreen = this;
         if(_loc1_.currentOrder)
         {
            _loc1_.currentOrder = null;
         }
      }
      
      public function updateMeter(param1:Number, param2:Number, param3:Number = 0, param4:Boolean = false) : void
      {
         var _loc6_:MovieClip = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc5_:CookScreen = this;
         if(param1 > -1 && param1 < _loc5_.numCookers)
         {
            _loc6_ = _loc5_.clip["timer_" + param1].timer.inside;
            _loc7_ = FoodData.getMaxCookTime();
            _loc8_ = Math.min(1,param2 / _loc7_);
            _loc6_.bar.scaleX = _loc8_;
            if(param2 == 0)
            {
               _loc6_.bar.gotoAndStop(1);
            }
            else if(param2 < FoodData.getVinegarTime() && param3 == 0 && _loc6_.bar.currentFrame != 1)
            {
               _loc6_.bar.gotoAndStop(1);
            }
            else if(param2 < FoodData.getVinegarTime() && param3 > 0 && _loc6_.bar.currentFrame != 3)
            {
               _loc6_.bar.gotoAndStop(3);
            }
            else if(param2 > FoodData.getVinegarTime() && param2 < FoodData.getTargetCookTime())
            {
               if(param3 == 0 && _loc6_.bar.currentFrame < 2)
               {
                  _loc6_.bar.gotoAndStop(2);
               }
               else if(param3 > 0 && _loc6_.bar.currentFrame < 3)
               {
                  _loc6_.bar.gotoAndStop(3);
               }
            }
            else if(param2 >= FoodData.getTargetCookTime() && _loc6_.bar.currentFrame < 4)
            {
               _loc6_.bar.gotoAndStop(4);
            }
            else if(param2 > _loc7_ && _loc6_.bar.currentFrame < 5)
            {
               _loc6_.bar.gotoAndStop(5);
            }
            if(_loc5_.boostingWhich == param1)
            {
               _loc6_.boostbg.visible = true;
               _loc6_.boostfg.visible = true;
            }
            else
            {
               _loc6_.boostbg.visible = false;
               _loc6_.boostfg.visible = false;
            }
            if(_loc5_.timerAlarmsRunning[param1] == true && (param2 == 0 || param4))
            {
               _loc5_.stopAlarm(param1);
            }
            else if(_loc5_.timerAlarmsAvailable[param1] == true && _loc5_.timerAlarmsRunning[param1] == false)
            {
               if(param2 > FoodData.getTargetCookTime())
               {
                  _loc5_.soundAlarm(param1);
               }
               else if(param2 > FoodData.getVinegarTime() && param3 == 0)
               {
                  _loc5_.soundAlarm(param1);
               }
            }
         }
      }
      
      public function moveSushiToTrash() : void
      {
         var _loc1_:CookScreen = this;
         class_6.method_1("TRASH SUSHI ON COOK");
         if(_loc1_.currentOrder)
         {
            if(_loc1_.trashOrder)
            {
               _loc1_.trashOrder.destroy();
               _loc1_.trashOrder = null;
            }
            _loc1_.trashOrder = _loc1_.currentOrder;
            _loc1_.trashOrder.addToCookTrash(_loc1_.clip.trash_tray);
            _loc1_.currentOrder = null;
            _loc1_.checkForFoodOrder();
         }
      }
      
      public function withinMatRange(param1:Number, param2:Number, param3:Boolean = false) : Boolean
      {
         this;
         var _loc5_:Boolean = false;
         var _loc6_:Number = param2 - 325;
         var _loc7_:Number = 0;
         var _loc8_:Number = 0;
         if(param3)
         {
            _loc7_ = 80;
            _loc8_ = 80;
         }
         if(!(param2 < 325 || param2 > 425))
         {
            if(param1 > 445 - _loc6_ - _loc7_ && param1 < 445 - _loc6_ + 186 + _loc8_)
            {
               _loc5_ = true;
            }
         }
         return _loc5_;
      }
      
      public function canLeaveStation(param1:Boolean = false) : Boolean
      {
         return true;
      }
   }
}
