package sushiGame.models
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   import flash.utils.getTimer;
   import package_4.class_5;
   import sushiGame.screens.MiniGameKart;
   
   public class GoKart
   {
       
      
      public var minigame:MiniGameKart;
      
      public var clip:MovieClip;
      
      public var container:MovieClip;
      
      public var x:Number;
      
      public var y:Number;
      
      public var nextX:Number;
      
      public var nextY:Number;
      
      public var lastX:Number;
      
      public var lastY:Number;
      
      public var nextSpeed:Number;
      
      public var targetY:Number = 0;
      
      public var accel:Number;
      
      public var speed:Number;
      
      public var startingSpeed:Number;
      
      public var maxSpeed:Number;
      
      public var laneSpeedFactor:Number = 0.6;
      
      public var aiLaneSpeedFactor:Number = 0.3;
      
      public var customerName:String;
      
      public var isPlayer:Boolean = false;
      
      public var customerClip:MovieClip = null;
      
      public var worker:Worker = null;
      
      public var isBoosting:Boolean = false;
      
      public var boostHitID:Number = -1;
      
      public var boostDuration:Number = 40;
      
      public var boostTimer:Number = 0;
      
      public var boostAccel:Number = 1;
      
      public var boostDecay:Number = 0.5;
      
      public var boostAmount:Number = 1.7;
      
      public var isCrashed:Boolean = false;
      
      public var kartHeight:Number = 15;
      
      public var kartWidth:Number = 55;
      
      public var didCollide:Boolean = false;
      
      public var isSkidding:Boolean = false;
      
      public var skidHitID:Number = -1;
      
      public var skidTimer:Number = 0;
      
      public var skidTimerMax:Number = 30;
      
      public var skidAnimFrames:Array;
      
      public var skidAnimFrameIndex:Number = 0;
      
      public var skidTargetYOffset:Number = 0;
      
      public var crossedFinish:Boolean = false;
      
      public var crossTime:Number = 2147483647;
      
      public var smartFactor:Number = 1;
      
      public var smartCollectFactor:Number = 1;
      
      public var aiRangeY:Number = 40;
      
      public var aiRangeX:Number = 250;
      
      public var playerControlled:Boolean = true;
      
      public var aheadOfPlayer:Boolean = false;
      
      public var drivingSound:SoundChannel = null;
      
      public var soundTransform:SoundTransform = null;
      
      public var startFadeUp:Number = 0;
      
      public var lastPlayerBoostSound:Number = 0;
      
      public var lastOtherBoostSound:Number = 0;
      
      public function GoKart(param1:MiniGameKart, param2:MovieClip, param3:Number, param4:Number, param5:String, param6:Number, param7:Number, param8:Number, param9:Boolean = false, param10:Number = 1, param11:Number = 1)
      {
         this.skidAnimFrames = [1,2,3,4,5,5,5,5,5,4,3,2,1,10,11,12,13,13,13,13,13,12,11,10];
         super();
         this.minigame = param1;
         this.container = param2;
         this.x = param3;
         this.y = param4;
         this.nextX = param3;
         this.nextY = param4;
         this.lastX = param3;
         this.lastY = param4;
         this.targetY = param4;
         this.startingSpeed = param6;
         this.speed = param6;
         this.nextSpeed = param6;
         this.accel = param7;
         this.maxSpeed = param8;
         this.customerName = param5;
         this.isPlayer = param9;
         this.smartFactor = param10;
         this.smartCollectFactor = param11;
         this.setupKart();
      }
      
      public function setupKart() : void
      {
         var _loc1_:GoKart = this;
         if(_loc1_.customerName == "Hank" || _loc1_.customerName == "Marty" || _loc1_.customerName == "Rico" || _loc1_.customerName == "Foodini" || _loc1_.customerName == "Ember" || _loc1_.customerName == "Johnny" || _loc1_.customerName == "Nick")
         {
            _loc1_.clip = new kartBoxyMC();
         }
         else
         {
            _loc1_.clip = new kartMC();
         }
         _loc1_.container.addChild(_loc1_.clip);
         _loc1_.clip.x = _loc1_.minigame.kartStartX;
         _loc1_.clip.y = _loc1_.y;
         if(!_loc1_.isPlayer || !_loc1_.playerControlled)
         {
            _loc1_.laneSpeedFactor = _loc1_.aiLaneSpeedFactor;
         }
         _loc1_.clip.gotoAndStop(1);
         _loc1_.setupColor();
         _loc1_.setupDriver();
         _loc1_.updateKartGraphic();
      }
      
      public function setupColor() : void
      {
         var _loc1_:GoKart = this;
         var _loc2_:Number = _loc1_.minigame.karts.length;
         var _loc3_:Number = _loc2_ + 2;
         if(_loc1_.isPlayer)
         {
            _loc3_ = 1;
         }
         if(_loc1_.customerName == "Boomer")
         {
            _loc3_ = 2;
         }
         else if(_loc1_.customerName == "Akari")
         {
            _loc3_ = 3;
         }
         else if(_loc1_.customerName == "Wally")
         {
            _loc3_ = 4;
         }
         else if(_loc1_.customerName == "Hank")
         {
            _loc3_ = 5;
         }
         else if(_loc1_.customerName == "Marty")
         {
            _loc3_ = 6;
         }
         else if(_loc1_.customerName == "Radlynn")
         {
            _loc3_ = 7;
         }
         else if(_loc1_.customerName == "Rico")
         {
            _loc3_ = 8;
         }
         else if(_loc1_.customerName == "SargeFan" || _loc1_.customerName == "Sarge Fan")
         {
            _loc3_ = 9;
         }
         else if(_loc1_.customerName == "Willow")
         {
            _loc3_ = 10;
         }
         else if(_loc1_.customerName == "ProfessorFitz" || _loc1_.customerName == "Professor Fitz")
         {
            _loc3_ = 11;
         }
         else if(_loc1_.customerName == "Foodini")
         {
            _loc3_ = 12;
         }
         else if(_loc1_.customerName == "Xandra")
         {
            _loc3_ = 13;
         }
         else if(_loc1_.customerName == "Ember")
         {
            _loc3_ = 14;
         }
         else if(_loc1_.customerName == "Johnny")
         {
            _loc3_ = 15;
         }
         else if(_loc1_.customerName == "Sasha")
         {
            _loc3_ = 16;
         }
         else if(_loc1_.customerName == "Nick")
         {
            _loc3_ = 17;
         }
         _loc1_.clip.farside.gotoAndStop(_loc3_);
         _loc1_.clip.seat.gotoAndStop(_loc3_);
         _loc1_.clip.trunk.gotoAndStop(_loc3_);
         _loc1_.clip.side.gotoAndStop(_loc3_);
         _loc1_.clip.hood.gotoAndStop(_loc3_);
         _loc1_.clip.dash.gotoAndStop(_loc3_);
         try
         {
            _loc1_.clip.spoiler1.gotoAndStop(_loc3_);
            _loc1_.clip.spoiler2.gotoAndStop(_loc3_);
            _loc1_.clip.spoiler3.gotoAndStop(_loc3_);
         }
         catch(err:Error)
         {
         }
      }
      
      public function setupDriver(param1:Boolean = true) : void
      {
         var _loc2_:GoKart = this;
         if(param1)
         {
            if(_loc2_.isPlayer)
            {
               _loc2_.worker = new Worker(_loc2_.minigame.screen.gameObj,_loc2_.clip.customerholder,_loc2_.minigame.screen.gameObj.workerData,0,0,1,false,false);
               _loc2_.worker.playAnimation("drive");
            }
            else
            {
               _loc2_.buildCustomerModel(_loc2_.customerName);
               _loc2_.clip.customerholder.addChild(_loc2_.customerClip);
               _loc2_.customerClip.gotoAndPlay("drive");
            }
         }
         else
         {
            if(_loc2_.customerClip != null)
            {
               _loc2_.destroyCustomerModel(_loc2_.customerClip);
               if(_loc2_.customerClip != null && Boolean(_loc2_.customerClip.parent))
               {
                  _loc2_.customerClip.parent.removeChild(_loc2_.customerClip);
               }
               _loc2_.customerClip = null;
            }
            if(_loc2_.worker != null)
            {
               _loc2_.worker.destroy();
               _loc2_.worker = null;
            }
         }
      }
      
      public function startDrivingSound(param1:Boolean = false) : void
      {
         var _loc2_:GoKart = this;
         var _loc3_:String = "minigame_kart_drive.wav";
         if(param1)
         {
            _loc3_ = "minigame_kart_drive2.wav";
         }
         if(_loc2_.isPlayer)
         {
            _loc3_ = "minigame_kart_maindrive.wav";
         }
         _loc2_.startFadeUp = 0;
         _loc2_.soundTransform = new SoundTransform(0,-0.4);
         _loc2_.drivingSound = _loc2_.minigame.screen.gameObj.var_128.playSound(_loc3_,true,0,-0.4);
         _loc2_.drivingSound.soundTransform = _loc2_.soundTransform;
      }
      
      public function updateDrivingSound() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc1_:GoKart = this;
         if(_loc1_.drivingSound != null)
         {
            _loc2_ = 320 - _loc1_.clip.x;
            _loc3_ = Math.abs(_loc2_);
            _loc4_ = 0.4;
            _loc5_ = 1;
            if(_loc1_.startFadeUp < 1)
            {
               _loc1_.startFadeUp += 0.05;
            }
            _loc4_ *= _loc1_.startFadeUp;
            if(_loc3_ > 640)
            {
               _loc5_ = 0;
            }
            else if(_loc3_ <= 640)
            {
               _loc9_ = _loc3_ / 640;
               _loc5_ = 1 - _loc9_;
            }
            else
            {
               _loc5_ = 1;
            }
            _loc6_ = _loc5_;
            _loc5_ *= _loc4_;
            _loc7_ = 0;
            _loc8_ = _loc3_ / 320;
            if(_loc2_ > 0)
            {
               _loc7_ = 0 - _loc8_;
            }
            else
            {
               _loc7_ = _loc8_;
            }
            if(_loc7_ < -1)
            {
               _loc7_ = -1;
            }
            else if(_loc7_ > 1)
            {
               _loc7_ = 1;
            }
            if(_loc1_.minigame.screen.gameObj.var_128.isMute)
            {
               _loc5_ = 0;
            }
            _loc1_.soundTransform.volume = _loc5_;
            _loc1_.soundTransform.pan = _loc7_;
            _loc1_.drivingSound.soundTransform = _loc1_.soundTransform;
         }
      }
      
      public function destroy() : void
      {
         var _loc1_:GoKart = this;
         _loc1_.setupDriver(false);
         if(_loc1_.drivingSound)
         {
            _loc1_.drivingSound.stop();
            _loc1_.drivingSound = null;
         }
         _loc1_.soundTransform = null;
         if(_loc1_.clip)
         {
            if(_loc1_.clip.parent)
            {
               _loc1_.clip.parent.removeChild(_loc1_.clip);
            }
            _loc1_.clip = null;
         }
         _loc1_.container = null;
      }
      
      public function setNextCoordinates() : void
      {
         var _loc5_:Number = NaN;
         var _loc1_:GoKart = this;
         _loc1_.lastX = _loc1_.x;
         _loc1_.lastY = _loc1_.y;
         if(!_loc1_.isCrashed)
         {
            if(_loc1_.isBoosting)
            {
               if(_loc1_.speed < _loc1_.maxSpeed * _loc1_.boostAmount)
               {
                  _loc1_.nextSpeed += _loc1_.boostAccel;
                  if(_loc1_.nextSpeed > _loc1_.maxSpeed * _loc1_.boostAmount)
                  {
                     _loc1_.nextSpeed = _loc1_.maxSpeed * _loc1_.boostAmount;
                  }
               }
               ++_loc1_.boostTimer;
               if(_loc1_.boostTimer >= _loc1_.boostDuration)
               {
                  _loc1_.isBoosting = false;
               }
            }
            else if(_loc1_.isSkidding)
            {
               _loc5_ = 1;
               if(_loc1_.skidTargetYOffset > 1 || _loc1_.skidTargetYOffset < -1)
               {
                  if((_loc5_ = 1 - Math.abs(_loc1_.skidTargetYOffset / 10)) < 0)
                  {
                     _loc5_ = 0;
                  }
                  else if(_loc5_ > 1)
                  {
                     _loc5_ = 1;
                  }
                  _loc5_ = _loc5_ / 2 + 0.5;
               }
               if(_loc1_.speed > _loc1_.startingSpeed)
               {
                  _loc1_.nextSpeed -= _loc1_.accel * _loc5_;
                  if(_loc1_.speed < _loc1_.startingSpeed)
                  {
                     _loc1_.speed = _loc1_.startingSpeed;
                  }
               }
            }
            else if(_loc1_.speed < _loc1_.maxSpeed)
            {
               _loc1_.nextSpeed += _loc1_.accel;
               if(_loc1_.nextSpeed > _loc1_.maxSpeed)
               {
                  _loc1_.nextSpeed = _loc1_.maxSpeed;
               }
            }
            else if(_loc1_.speed > _loc1_.maxSpeed)
            {
               _loc1_.nextSpeed -= _loc1_.boostDecay;
               if(_loc1_.nextSpeed < _loc1_.maxSpeed)
               {
                  _loc1_.nextSpeed = _loc1_.maxSpeed;
               }
            }
            if(_loc1_.isSkidding)
            {
               ++_loc1_.skidTimer;
               if(_loc1_.skidTimer >= _loc1_.skidTimerMax)
               {
                  _loc1_.isSkidding = false;
               }
            }
         }
         if(_loc1_.isPlayer && _loc1_.playerControlled)
         {
            if(_loc1_.isSkidding)
            {
               _loc1_.targetY = _loc1_.y + _loc1_.skidTargetYOffset;
               _loc1_.skidTargetYOffset *= 0.97;
            }
            else if(_loc1_.minigame.isFinishing || _loc1_.isCrashed)
            {
               _loc1_.targetY = _loc1_.y;
            }
            else
            {
               _loc1_.targetY = _loc1_.minigame.clip.mouseY;
            }
         }
         else if(_loc1_.isSkidding)
         {
            _loc1_.targetY = _loc1_.y + _loc1_.skidTargetYOffset;
            _loc1_.skidTargetYOffset *= 0.97;
         }
         else
         {
            _loc1_.kartAI();
         }
         _loc1_.nextX = _loc1_.x + _loc1_.nextSpeed;
         if(_loc1_.targetY < _loc1_.minigame.kartMinY)
         {
            _loc1_.targetY = _loc1_.minigame.kartMinY;
         }
         else if(_loc1_.targetY > _loc1_.minigame.kartMaxY)
         {
            _loc1_.targetY = _loc1_.minigame.kartMaxY;
         }
         var _loc2_:Number = _loc1_.targetY - _loc1_.y;
         var _loc3_:Number = _loc2_ / 4;
         if(Math.abs(_loc3_) < 0.1)
         {
            _loc3_ = 0;
         }
         var _loc4_:Number = this.nextSpeed * _loc1_.laneSpeedFactor;
         if(_loc3_ > _loc4_)
         {
            _loc3_ = _loc4_;
         }
         else if(_loc3_ < _loc4_ * -1)
         {
            _loc3_ = _loc4_ * -1;
         }
         _loc1_.nextY = _loc1_.y + _loc3_;
      }
      
      public function playObjectSound(param1:String) : void
      {
         var _loc10_:Number = NaN;
         var _loc2_:GoKart = this;
         var _loc3_:Number = 320 - _loc2_.clip.x;
         var _loc4_:Number = Math.abs(_loc3_);
         var _loc5_:Number = 0.5;
         var _loc6_:Number = 1;
         if(_loc2_.isPlayer)
         {
            _loc5_ = 0.7;
         }
         else if(param1 == "grabtopping.wav" || param1 == "singlecoin.wav")
         {
            _loc5_ = 1;
         }
         if(_loc4_ > 640)
         {
            _loc6_ = 0;
         }
         else if(_loc4_ <= 640)
         {
            _loc10_ = _loc4_ / 640;
            _loc6_ = 1 - _loc10_;
         }
         else
         {
            _loc6_ = 1;
         }
         var _loc7_:Number = _loc6_;
         _loc6_ *= _loc5_;
         var _loc8_:Number = 0;
         var _loc9_:Number = _loc4_ / 320;
         if(_loc3_ > 0)
         {
            _loc8_ = 0 - _loc9_;
         }
         else
         {
            _loc8_ = _loc9_;
         }
         if(_loc8_ < -1)
         {
            _loc8_ = -1;
         }
         else if(_loc8_ > 1)
         {
            _loc8_ = 1;
         }
         _loc2_.minigame.screen.gameObj.var_128.playSound(param1,false,_loc6_,_loc8_);
      }
      
      public function checkForHittingObjects() : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc1_:GoKart = this;
         var _loc2_:int = int(_loc1_.minigame.objects.length - 1);
         while(_loc2_ >= 0)
         {
            _loc3_ = _loc1_.minigame.objects[_loc2_].x - _loc1_.nextX;
            _loc4_ = _loc1_.minigame.objects[_loc2_].y - _loc1_.nextY;
            if(_loc1_.minigame.objects[_loc2_].type == KartObject.TYPE_CONE && _loc1_.minigame.objects[_loc2_].isTumbling == false && Math.abs(_loc3_) < _loc1_.kartWidth + _loc1_.minigame.objects[_loc2_].objectWidth && Math.abs(_loc4_) < _loc1_.kartHeight + _loc1_.minigame.objects[_loc2_].objectHeight)
            {
               _loc1_.minigame.objects[_loc2_].hitObject(_loc1_.lastX,_loc1_.lastY,_loc1_.nextX,_loc1_.nextY);
               _loc1_.nextSpeed *= 0.8;
               _loc1_.animateDriver("hit");
               if(_loc1_.minigame.currFrame - _loc1_.minigame.objects[_loc2_].lastSoundPlayed > 30)
               {
                  if(Math.random() < 0.5)
                  {
                     _loc1_.playObjectSound("minigame_kart_cone1.wav");
                  }
                  else
                  {
                     _loc1_.playObjectSound("minigame_kart_cone2.wav");
                  }
                  _loc1_.minigame.objects[_loc2_].lastSoundPlayed = _loc1_.minigame.currFrame;
               }
            }
            else if(_loc1_.minigame.objects[_loc2_].type == KartObject.TYPE_OILSLICK && Math.abs(_loc3_) < _loc1_.kartWidth + _loc1_.minigame.objects[_loc2_].objectWidth && Math.abs(_loc4_) < _loc1_.kartHeight + _loc1_.minigame.objects[_loc2_].objectHeight)
            {
               if(!_loc1_.isSkidding || _loc1_.skidHitID != _loc1_.minigame.objects[_loc2_].id)
               {
                  _loc1_.isSkidding = true;
                  _loc1_.skidTimer = 0;
                  _loc1_.skidHitID = _loc1_.minigame.objects[_loc2_].id;
                  _loc1_.isBoosting = false;
                  _loc1_.skidTargetYOffset = (_loc1_.nextY - _loc1_.y) * 3;
                  if((_loc5_ = _loc1_.skidAnimFrames.indexOf(_loc1_.clip.currentFrame)) > -1)
                  {
                     _loc1_.skidAnimFrameIndex = _loc5_;
                  }
                  _loc1_.clip.rearwheel.oilfx.gotoAndPlay(2);
                  _loc1_.clip.boostfx.gotoAndStop(1);
                  _loc1_.animateDriver("skid");
                  if(_loc1_.isPlayer)
                  {
                     trace(_loc1_.minigame.currFrame + ": " + _loc1_.skidHitID + " oilslick SKID!");
                  }
                  _loc1_.playObjectSound("minigame_kart_oilslick.wav");
               }
            }
            else if(_loc1_.minigame.objects[_loc2_].type == KartObject.TYPE_BOOSTPAD && Math.abs(_loc3_) < _loc1_.kartWidth + _loc1_.minigame.objects[_loc2_].objectWidth && Math.abs(_loc4_) < _loc1_.kartHeight + _loc1_.minigame.objects[_loc2_].objectHeight)
            {
               if(!_loc1_.isBoosting || _loc1_.boostHitID != _loc1_.minigame.objects[_loc2_].id)
               {
                  _loc1_.isBoosting = true;
                  _loc1_.boostHitID = _loc1_.minigame.objects[_loc2_].id;
                  _loc1_.boostTimer = 0;
                  _loc1_.isSkidding = false;
                  _loc1_.clip.boostfx.gotoAndPlay(2);
                  _loc1_.clip.rearwheel.oilfx.gotoAndStop(1);
                  _loc1_.animateDriver("boost");
                  _loc6_ = getTimer();
                  if(_loc1_.isPlayer && _loc6_ - _loc1_.lastPlayerBoostSound > 500 || !_loc1_.isPlayer && _loc6_ - _loc1_.lastOtherBoostSound > 500)
                  {
                     _loc1_.playObjectSound("minigame_kart_boost.wav");
                  }
                  if(_loc1_.isPlayer)
                  {
                     _loc1_.lastPlayerBoostSound = _loc6_;
                  }
                  else
                  {
                     _loc1_.lastOtherBoostSound = _loc6_;
                  }
               }
            }
            else if(_loc1_.minigame.objects[_loc2_].type == KartObject.TYPE_COIN && Math.abs(_loc3_) < _loc1_.kartWidth + _loc1_.minigame.objects[_loc2_].objectWidth && Math.abs(_loc4_) < _loc1_.kartHeight + _loc1_.minigame.objects[_loc2_].objectHeight)
            {
               _loc1_.maxSpeed += 0.2;
               if(_loc1_.isPlayer)
               {
                  ++_loc1_.minigame.coinsCollected;
               }
               _loc1_.clip.coinfx.gotoAndPlay(2);
               _loc1_.minigame.removeObject(_loc1_.minigame.objects[_loc2_].id);
               if(_loc1_.isPlayer)
               {
                  _loc1_.minigame.screen.gameObj.var_136.recordTagged("kartcoin",1);
               }
               if(_loc1_.isPlayer)
               {
                  _loc1_.playObjectSound("minigame_kart_getcoin.wav");
               }
               else
               {
                  _loc1_.playObjectSound("grabtopping.wav");
               }
            }
            else if(_loc1_.minigame.objects[_loc2_].type == KartObject.TYPE_FINISHLINE && _loc1_.x > _loc1_.minigame.objects[_loc2_].x && !_loc1_.crossedFinish)
            {
               _loc1_.crossedFinish = true;
               _loc1_.crossTime = _loc1_.minigame.currFrame;
               _loc1_.minigame.objects[_loc2_].hitObject(_loc1_.lastX,_loc1_.lastY,_loc1_.nextX,_loc1_.nextY);
               if(_loc1_.isPlayer)
               {
                  _loc1_.minigame.isFinishing = true;
                  _loc1_.minigame.finishDecaySpeed = _loc1_.speed;
                  _loc1_.minigame.finishRank = _loc1_.minigame.objects[_loc2_].kartsPassed;
                  if(_loc1_.minigame.objects[_loc2_].kartsPassed == 1)
                  {
                     trace("FIRST PLACE!");
                  }
                  else if(_loc1_.minigame.objects[_loc2_].kartsPassed == 2)
                  {
                     trace("SECOND PLACE");
                  }
                  else
                  {
                     trace("LAST PLACE. BOOOOOOO");
                  }
                  _loc1_.minigame.checkSuccess();
                  _loc1_.minigame.showBanner(_loc1_.minigame.finishRank);
               }
            }
            _loc2_--;
         }
      }
      
      public function updateCoordsForCollisions(param1:Boolean = false) : void
      {
         var _loc4_:GoKart = null;
         var _loc5_:Point = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc2_:GoKart = this;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.minigame.karts.length)
         {
            if((_loc4_ = _loc2_.minigame.karts[_loc3_]) != _loc2_)
            {
               if((_loc5_ = _loc4_.checkForCollisions(_loc2_.nextX,_loc2_.nextY)) != null)
               {
                  if(param1 == true)
                  {
                     trace("HEY, it\'s finding new collision on a second pass.  Not cool!");
                  }
                  _loc6_ = _loc2_.nextX;
                  _loc7_ = _loc2_.nextY;
                  _loc8_ = _loc4_.nextX;
                  _loc9_ = _loc4_.nextY;
                  _loc10_ = _loc2_.nextX - _loc2_.lastX;
                  _loc11_ = _loc2_.nextY - _loc2_.lastY;
                  _loc12_ = _loc4_.nextX - _loc4_.lastX;
                  _loc13_ = _loc4_.nextY - _loc4_.lastY;
                  _loc14_ = _loc4_.kartWidth * 2 - Math.abs(_loc5_.x);
                  _loc15_ = _loc4_.kartHeight * 2 - Math.abs(_loc5_.y);
                  if(_loc14_ > _loc15_)
                  {
                     if(Math.abs(_loc11_) > Math.abs(_loc13_))
                     {
                        if(_loc5_.y > 0)
                        {
                           _loc2_.nextY = _loc4_.nextY - _loc2_.kartHeight * 2 - 1;
                        }
                        else
                        {
                           _loc2_.nextY = _loc4_.nextY + _loc2_.kartHeight * 2 + 1;
                        }
                        if(_loc2_.nextY > _loc2_.minigame.kartMaxY || _loc2_.nextY < _loc2_.minigame.kartMinY || _loc11_ >= 0 && _loc2_.nextY < _loc2_.lastY || _loc11_ <= 0 && _loc2_.nextY > _loc2_.lastY)
                        {
                           if(_loc2_.nextY > _loc2_.minigame.kartMaxY)
                           {
                              _loc2_.nextY = _loc2_.minigame.kartMaxY;
                              _loc4_.nextY = _loc2_.nextY - _loc2_.kartHeight * 2 - 1;
                           }
                           else if(_loc2_.nextY < _loc2_.minigame.kartMinY)
                           {
                              _loc2_.nextY = _loc2_.minigame.kartMinY;
                              _loc4_.nextY = _loc2_.nextY + _loc2_.kartHeight * 2 - 1;
                           }
                           else
                           {
                              _loc2_.nextY = _loc2_.lastY;
                              if(_loc4_.nextY > _loc2_.lastY)
                              {
                                 _loc4_.nextY = _loc2_.nextY + _loc2_.kartHeight * 2 - 1;
                              }
                              else
                              {
                                 _loc4_.nextY = _loc2_.nextY - _loc2_.kartHeight * 2 - 1;
                              }
                           }
                        }
                        if(!_loc2_.isPlayer || !_loc2_.playerControlled)
                        {
                           _loc2_.targetY = _loc2_.nextY;
                        }
                     }
                     else
                     {
                        if(_loc5_.y > 0)
                        {
                           _loc4_.nextY = _loc2_.nextY + _loc2_.kartHeight * 2 + 1;
                        }
                        else
                        {
                           _loc4_.nextY = _loc2_.nextY - _loc2_.kartHeight * 2 - 1;
                        }
                        if(_loc4_.nextY > _loc2_.minigame.kartMaxY || _loc4_.nextY < _loc2_.minigame.kartMinY || _loc13_ >= 0 && _loc4_.nextY < _loc4_.lastY || _loc13_ <= 0 && _loc4_.nextY > _loc4_.lastY)
                        {
                           if(_loc4_.nextY > _loc2_.minigame.kartMaxY)
                           {
                              _loc4_.nextY = _loc2_.minigame.kartMaxY;
                              _loc2_.nextY = _loc4_.nextY - _loc2_.kartHeight * 2 - 1;
                           }
                           else if(_loc4_.nextY < _loc2_.minigame.kartMinY)
                           {
                              _loc4_.nextY = _loc2_.minigame.kartMinY;
                              _loc2_.nextY = _loc4_.nextY + _loc2_.kartHeight * 2 - 1;
                           }
                           else
                           {
                              _loc4_.nextY = _loc4_.lastY;
                              if(_loc2_.nextY > _loc4_.lastY)
                              {
                                 _loc2_.nextY = _loc4_.nextY + _loc2_.kartHeight * 2 - 1;
                              }
                              else
                              {
                                 _loc2_.nextY = _loc4_.nextY - _loc2_.kartHeight * 2 - 1;
                              }
                           }
                        }
                        if(!_loc4_.isPlayer || !_loc4_.playerControlled)
                        {
                           _loc4_.targetY = _loc4_.nextY;
                        }
                     }
                  }
                  else if(Math.abs(_loc10_) > Math.abs(_loc12_))
                  {
                     if(_loc5_.x > 0)
                     {
                        _loc2_.nextX = _loc4_.nextX - _loc2_.kartWidth * 2 - 1;
                        if(_loc14_ < 4)
                        {
                           _loc2_.nextSpeed *= 0.85;
                        }
                     }
                     else
                     {
                        _loc4_.nextX = _loc2_.nextX - _loc2_.kartWidth * 2 - 1;
                        if(_loc14_ < 4)
                        {
                           _loc4_.nextSpeed *= 0.85;
                        }
                     }
                     if(!_loc2_.isPlayer || !_loc2_.playerControlled)
                     {
                        _loc2_.targetY = _loc2_.nextY;
                     }
                  }
                  else
                  {
                     if(_loc5_.x > 0)
                     {
                        _loc2_.nextX = _loc4_.nextX - _loc2_.kartWidth * 2 - 1;
                        if(_loc14_ < 4)
                        {
                           _loc2_.nextSpeed *= 0.85;
                        }
                     }
                     else
                     {
                        _loc4_.nextX = _loc2_.nextX - _loc2_.kartWidth * 2 - 1;
                        if(_loc14_ < 4)
                        {
                           _loc4_.nextSpeed *= 0.85;
                        }
                     }
                     if(!_loc4_.isPlayer || !_loc4_.playerControlled)
                     {
                        _loc4_.targetY = _loc4_.nextY;
                     }
                  }
               }
            }
            _loc3_++;
         }
         _loc2_.checkForHittingObjects();
      }
      
      public function updateKart() : void
      {
         var _loc1_:GoKart = this;
         _loc1_.didCollide = false;
         if(_loc1_.worker)
         {
            _loc1_.worker.animateModel();
         }
         if(!_loc1_.isCrashed)
         {
            _loc1_.speed = _loc1_.nextSpeed;
         }
         _loc1_.x = _loc1_.nextX;
         _loc1_.y = _loc1_.nextY;
         if(!_loc1_.isPlayer)
         {
            if(_loc1_.minigame.isFinishing)
            {
               _loc1_.clip.x = _loc1_.minigame.kart.clip.x + (_loc1_.minigame.kart.nextX - _loc1_.minigame.kart.lastX) + (_loc1_.x - _loc1_.minigame.kart.nextX);
            }
            else
            {
               _loc1_.clip.x = _loc1_.minigame.kartStartX + _loc1_.x - _loc1_.minigame.kart.nextX;
               if(_loc1_.minigame.isIntro)
               {
                  trace("Kart " + _loc1_.customerName + ": Move Clip X to " + _loc1_.clip.x + " (my X is " + _loc1_.x + ", Player X is " + _loc1_.minigame.kart.x + ", Player Next X is " + _loc1_.minigame.kart.nextX);
               }
            }
         }
         else if(_loc1_.isPlayer && _loc1_.minigame.isFinishing)
         {
            _loc1_.clip.x += _loc1_.minigame.kart.nextX - _loc1_.minigame.kart.lastX;
         }
         _loc1_.clip.y = _loc1_.y;
         _loc1_.updateKartGraphic();
         _loc1_.updateDrivingSound();
         if(!_loc1_.isPlayer && _loc1_.x > _loc1_.minigame.kart.nextX && !_loc1_.aheadOfPlayer)
         {
            _loc1_.aheadOfPlayer = true;
            if(Math.random() >= 0.4)
            {
               if(Math.random() < 0.5)
               {
                  _loc1_.animateDriver("wave1");
               }
               else
               {
                  _loc1_.animateDriver("wave2");
               }
            }
         }
         else if(!_loc1_.isPlayer && _loc1_.x < _loc1_.minigame.kart.nextX && _loc1_.aheadOfPlayer)
         {
            _loc1_.aheadOfPlayer = false;
            if(Math.random() < 0.7)
            {
               _loc1_.animateDriver("pass");
            }
         }
      }
      
      public function updateKartGraphic() : void
      {
         var _loc6_:Number = NaN;
         var _loc1_:GoKart = this;
         var _loc2_:Number = _loc1_.nextY - _loc1_.lastY;
         var _loc3_:Number = _loc1_.speed * _loc1_.laneSpeedFactor;
         var _loc4_:Number;
         if((_loc4_ = (_loc1_.y - _loc1_.minigame.kartMinY) / (_loc1_.minigame.kartMaxY - _loc1_.minigame.kartMinY)) < 0)
         {
            _loc4_ = 0;
         }
         else if(_loc4_ > 1)
         {
            _loc4_ = 1;
         }
         _loc1_.clip.scaleX = 0.8 + _loc4_ * 0.2;
         _loc1_.clip.scaleY = _loc1_.clip.scaleX;
         var _loc5_:Number;
         if((_loc5_ = Math.abs(_loc2_ / _loc3_)) > 1)
         {
            _loc5_ = 1;
         }
         else if(_loc5_ < 0)
         {
            _loc5_ = 0;
         }
         if(_loc1_.isSkidding)
         {
            ++_loc1_.skidAnimFrameIndex;
            if(_loc1_.skidAnimFrameIndex >= _loc1_.skidAnimFrames.length)
            {
               _loc1_.skidAnimFrameIndex = 0;
            }
            _loc1_.clip.gotoAndStop(_loc1_.skidAnimFrames[_loc1_.skidAnimFrameIndex]);
         }
         else if(_loc2_ > 0)
         {
            if((_loc6_ = Math.ceil(_loc5_ * 5)) < 1)
            {
               _loc6_ = 1;
            }
            if(_loc1_.clip.currentFrame < _loc6_)
            {
               _loc1_.clip.gotoAndStop(_loc1_.clip.currentFrame + 1);
            }
            else if(_loc1_.clip.currentFrame > 5)
            {
               _loc1_.clip.gotoAndStop(1);
            }
            else if(_loc1_.clip.currentFrame > _loc6_)
            {
               _loc1_.clip.gotoAndStop(_loc1_.clip.currentFrame - 1);
            }
         }
         else if(_loc2_ < 0)
         {
            if((_loc6_ = 8 + Math.ceil(_loc5_ * 5)) < 9)
            {
               _loc6_ = 9;
            }
            if(_loc1_.clip.currentFrame < _loc6_)
            {
               if(_loc1_.clip.currentFrame < 9)
               {
                  _loc1_.clip.gotoAndStop(9);
               }
               else
               {
                  _loc1_.clip.gotoAndStop(_loc1_.clip.currentFrame + 1);
               }
            }
            else if(_loc1_.clip.currentFrame > _loc6_)
            {
               _loc1_.clip.gotoAndStop(_loc1_.clip.currentFrame - 1);
            }
         }
         else
         {
            if(_loc1_.clip.currentFrame > 1 && _loc1_.clip.currentFrame <= 5)
            {
               _loc1_.clip.gotoAndStop(_loc1_.clip.currentFrame - 1);
            }
            else if(_loc1_.clip.currentFrame > 9 && _loc1_.clip.currentFrame <= 13)
            {
               _loc1_.clip.gotoAndStop(_loc1_.clip.currentFrame - 1);
            }
            else
            {
               _loc1_.clip.gotoAndStop(1);
            }
            if(_loc1_.clip.currentFrame == 9)
            {
               _loc1_.clip.gotoAndStop(1);
            }
         }
      }
      
      public function startBoosting() : void
      {
         var _loc1_:GoKart = this;
         _loc1_.isBoosting = true;
         _loc1_.boostTimer = 0;
      }
      
      public function checkForCollisions(param1:Number, param2:Number) : Point
      {
         var _loc3_:GoKart = this;
         var _loc4_:Point = null;
         var _loc5_:Number = _loc3_.nextX - param1;
         var _loc6_:Number = _loc3_.nextY - param2;
         if(Math.abs(_loc5_) < _loc3_.kartWidth * 2 && Math.abs(_loc6_) < _loc3_.kartHeight * 2)
         {
            if(_loc4_ == null)
            {
               _loc4_ = new Point();
            }
            _loc4_.x = _loc5_;
            _loc4_.y = _loc6_;
         }
         return _loc4_;
      }
      
      public function kartAI() : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:String = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc1_:GoKart = this;
         if(!_loc1_.isSkidding)
         {
            _loc3_ = Math.random();
            _loc4_ = -1;
            _loc5_ = "";
            _loc6_ = int.MAX_VALUE;
            _loc2_ = 0;
            while(_loc2_ < _loc1_.minigame.objects.length)
            {
               if(_loc1_.minigame.objects[_loc2_] != null && _loc1_.minigame.objects[_loc2_].x > _loc1_.nextX + 1 && _loc1_.minigame.objects[_loc2_].x < _loc1_.nextX + _loc1_.aiRangeX)
               {
                  if((_loc1_.minigame.objects[_loc2_].type == KartObject.TYPE_CONE || _loc1_.minigame.objects[_loc2_].type == KartObject.TYPE_OILSLICK) && !_loc1_.minigame.objects[_loc2_].isTumbling && Math.abs(_loc1_.minigame.objects[_loc2_].y - _loc1_.nextY) < _loc1_.kartHeight + _loc1_.minigame.objects[_loc2_].objectHeight)
                  {
                     if((_loc1_.minigame.objects[_loc2_].x < _loc6_ || _loc5_ == KartObject.TYPE_COIN || _loc5_ == KartObject.TYPE_BOOSTPAD) && _loc3_ < _loc1_.smartFactor)
                     {
                        _loc7_ = _loc1_.minigame.objects[_loc2_].y - _loc1_.minigame.objects[_loc2_].objectHeight - _loc1_.kartHeight - 6;
                        _loc8_ = _loc1_.minigame.objects[_loc2_].y + _loc1_.minigame.objects[_loc2_].objectHeight + _loc1_.kartHeight + 6;
                        if(_loc7_ > _loc1_.minigame.kartMinY && (_loc1_.targetY < _loc1_.y || _loc1_.nextY < _loc1_.minigame.objects[_loc2_].y))
                        {
                           _loc4_ = _loc7_;
                           if(_loc1_.isPlayer)
                           {
                              trace(_loc1_.minigame.currFrame + ": " + _loc1_.minigame.objects[_loc2_].id + " " + _loc1_.minigame.objects[_loc2_].type + " at " + _loc1_.minigame.objects[_loc2_].x + ", " + _loc1_.minigame.objects[_loc2_].y + ": There\'s room up, already going up or above it, move to " + _loc4_ + " (I\'m at " + _loc1_.nextY + ", was going to " + _loc1_.targetY + ")");
                           }
                        }
                        else if(_loc8_ < _loc1_.minigame.kartMaxY && (_loc1_.targetY > _loc1_.y || _loc1_.nextY > _loc1_.minigame.objects[_loc2_].y))
                        {
                           _loc4_ = _loc8_;
                           if(_loc1_.isPlayer)
                           {
                              trace(_loc1_.minigame.currFrame + ": " + _loc1_.minigame.objects[_loc2_].id + " " + _loc1_.minigame.objects[_loc2_].type + " at " + _loc1_.minigame.objects[_loc2_].x + ", " + _loc1_.minigame.objects[_loc2_].y + ": There\'s room down, already going down or below it, move to " + _loc4_ + " (I\'m at " + _loc1_.nextY + ", was going to " + _loc1_.targetY + ")");
                           }
                        }
                        else if(_loc7_ > _loc1_.minigame.kartMinY && _loc8_ < _loc1_.minigame.kartMaxY && Math.random() < 0.5)
                        {
                           _loc4_ = _loc7_;
                           if(_loc1_.isPlayer)
                           {
                              trace(_loc1_.minigame.currFrame + ": " + _loc1_.minigame.objects[_loc2_].id + " " + _loc1_.minigame.objects[_loc2_].type + " at " + _loc1_.minigame.objects[_loc2_].x + ", " + _loc1_.minigame.objects[_loc2_].y + ": There\'s room both ways, random up, move to " + _loc4_ + " (I\'m at " + _loc1_.nextY + ", was going to " + _loc1_.targetY + ")");
                           }
                        }
                        else if(_loc8_ < _loc1_.minigame.kartMaxY)
                        {
                           _loc4_ = _loc8_;
                           if(_loc1_.isPlayer)
                           {
                              trace(_loc1_.minigame.currFrame + ": " + _loc1_.minigame.objects[_loc2_].id + " " + _loc1_.minigame.objects[_loc2_].type + " at " + _loc1_.minigame.objects[_loc2_].x + ", " + _loc1_.minigame.objects[_loc2_].y + ": There\'s room down, move to " + _loc4_ + " (I\'m at " + _loc1_.nextY + ", was going to " + _loc1_.targetY + ")");
                           }
                        }
                        else
                        {
                           _loc4_ = _loc7_;
                           if(_loc1_.isPlayer)
                           {
                              trace(_loc1_.minigame.currFrame + ": " + _loc1_.minigame.objects[_loc2_].id + " " + _loc1_.minigame.objects[_loc2_].type + " at " + _loc1_.minigame.objects[_loc2_].x + ", " + _loc1_.minigame.objects[_loc2_].y + ": Nothing else, move up, move to " + _loc4_ + " (I\'m at " + _loc1_.nextY + ", was going to " + _loc1_.targetY + ")");
                           }
                        }
                        _loc5_ = _loc1_.minigame.objects[_loc2_].type;
                        _loc6_ = _loc1_.minigame.objects[_loc2_].x;
                     }
                  }
                  else if(_loc1_.minigame.objects[_loc2_].type == KartObject.TYPE_COIN || _loc1_.minigame.objects[_loc2_].type == KartObject.TYPE_BOOSTPAD)
                  {
                     if(_loc5_ != KartObject.TYPE_CONE && _loc5_ != KartObject.TYPE_OILSLICK && _loc5_ != "kart")
                     {
                        if(_loc1_.minigame.objects[_loc2_].x <= _loc6_ && _loc3_ < _loc1_.smartCollectFactor)
                        {
                           if(!(_loc6_ == _loc1_.minigame.objects[_loc2_].x && Math.abs(_loc4_ - _loc1_.nextY) < Math.abs(_loc1_.minigame.objects[_loc2_].y - _loc1_.nextY)))
                           {
                              _loc4_ = _loc1_.minigame.objects[_loc2_].y;
                              _loc5_ = _loc1_.minigame.objects[_loc2_].type;
                              _loc6_ = _loc1_.minigame.objects[_loc2_].x;
                              if(_loc1_.isPlayer)
                              {
                                 trace(_loc1_.minigame.currFrame + ": " + _loc1_.minigame.objects[_loc2_].id + " " + _loc1_.minigame.objects[_loc2_].type + " at " + _loc1_.minigame.objects[_loc2_].x + ", " + _loc1_.minigame.objects[_loc2_].y + ": Drive towards it to " + _loc4_ + " (I\'m at " + _loc1_.nextY + ", was going to " + _loc1_.targetY + ")");
                              }
                           }
                        }
                     }
                  }
               }
               _loc2_++;
            }
            _loc2_ = 0;
            while(_loc2_ < _loc1_.minigame.karts.length)
            {
               if(_loc1_.minigame.karts[_loc2_] != _loc1_ && _loc1_.minigame.karts[_loc2_].nextX > _loc1_.nextX && _loc1_.minigame.karts[_loc2_].nextX < _loc1_.nextX + _loc1_.kartWidth * 2 + 50)
               {
                  if(Math.abs(_loc1_.minigame.karts[_loc2_].nextY - _loc1_.nextY) < _loc1_.kartHeight * 2)
                  {
                     if(_loc1_.minigame.karts[_loc2_].nextX < _loc6_ && _loc3_ < _loc1_.smartFactor)
                     {
                        _loc7_ = _loc1_.nextY - _loc1_.aiRangeY;
                        _loc8_ = _loc1_.nextY + _loc1_.aiRangeY;
                        if(_loc7_ > _loc1_.minigame.kartMinY && _loc1_.targetY < _loc1_.y)
                        {
                           _loc4_ = _loc7_;
                        }
                        else if(_loc8_ < _loc1_.minigame.kartMaxY && _loc1_.targetY > _loc1_.y)
                        {
                           _loc4_ = _loc8_;
                        }
                        else if(_loc7_ > _loc1_.minigame.kartMinY && _loc8_ < _loc1_.minigame.kartMaxY && Math.random() < 0.5)
                        {
                           _loc4_ = _loc7_;
                        }
                        else if(_loc8_ < _loc1_.minigame.kartMaxY)
                        {
                           _loc4_ = _loc8_;
                        }
                        else
                        {
                           _loc4_ = _loc7_;
                        }
                        _loc5_ = "kart";
                        _loc6_ = _loc1_.minigame.karts[_loc2_].nextX;
                     }
                  }
               }
               _loc2_++;
            }
            if(_loc4_ != -1)
            {
               _loc1_.targetY = _loc4_;
            }
         }
      }
      
      public function buildCustomerModel(param1:String) : void
      {
         var _loc2_:GoKart = this;
         var _loc3_:class_5 = _loc2_.minigame.screen.gameObj;
         _loc2_.customerClip = new customerDrivingMC();
         _loc3_.var_131.buildCustomer(param1,_loc2_.customerClip);
      }
      
      public function destroyCustomerModel(param1:MovieClip) : void
      {
         param1.stop();
         try
         {
            param1.body.removeChildAt(0);
            param1.head.removeChildAt(0);
            param1.eyes.removeChildAt(0);
            param1.mouth.removeChildAt(0);
            param1.neck.removeChildAt(0);
            param1.front_shoe.removeChildAt(0);
            param1.back_shoe.removeChildAt(0);
            param1.fronthand.removeChildAt(0);
            param1.backhand.removeChildAt(0);
            param1.front_upperarm.removeChildAt(0);
            param1.back_upperarm.removeChildAt(0);
            param1.front_forearm.removeChildAt(0);
            param1.back_forearm.removeChildAt(0);
         }
         catch(err:Error)
         {
         }
         try
         {
            param1.hair.removeChildAt(0);
         }
         catch(err:Error)
         {
         }
         try
         {
            param1.back_hair.removeChildAt(0);
         }
         catch(err:Error)
         {
         }
         try
         {
            param1.handextra.removeChildAt(0);
         }
         catch(err:Error)
         {
         }
         try
         {
            param1.handextratop.removeChildAt(0);
         }
         catch(err:Error)
         {
         }
      }
      
      public function animateDriver(param1:String) : void
      {
         var _loc2_:GoKart = this;
         if(_loc2_.customerClip)
         {
            if(_loc2_.customerClip.currentLabel == "drive")
            {
               _loc2_.customerClip.gotoAndPlay(param1);
            }
         }
         else if(_loc2_.worker)
         {
            if(_loc2_.worker.clip.currentLabel == "drive")
            {
               _loc2_.worker.playAnimation(param1);
            }
         }
      }
   }
}
