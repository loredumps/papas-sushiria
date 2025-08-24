package sushiGame.screens
{
   import flash.display.*;
   import flash.events.*;
   import package_2.*;
   import package_4.*;
   import sushiGame.data.*;
   
   public class MiniGameHallway extends MiniGame
   {
       
      
      public var lookForWhichCustomer:Number = -1;
      
      public var choseWhichDoor:Number = -1;
      
      public var whichDifficulty:Number = 1;
      
      public var doorX:Array;
      
      public var doorY:Number = 232;
      
      public var doorMaxY:Number = 300;
      
      public var doorBackY:Number = 180;
      
      public var outsideCustomers:Array;
      
      public var outsideCustomerNumbers:Array;
      
      public var insideCustomers:Array;
      
      public var insideCustomerNumbers:Array;
      
      public var eyeballDirections:Array;
      
      public var eyeballDirY:Array;
      
      public var eyeballYspeeds:Array;
      
      public var eyeballSpeeds:Array;
      
      public var eyeballDurations:Array;
      
      public var eyeballReturning:Array;
      
      public var maxDuration:Number = 60;
      
      public var minDuration:Number = 15;
      
      public var extraEyeDirections:Array;
      
      public var extraEyeDirY:Array;
      
      public var extraEyeDurations:Array;
      
      public var extraEyeSpeeds:Array;
      
      public var extraEyeYspeeds:Array;
      
      public var extraEyesToUse:Number = 0;
      
      public var headshot:MovieClip;
      
      public var gameTimer:Number = 0;
      
      public var timeBeforeBlack:Number = 100;
      
      public var timeBlack:Number = 180;
      
      public var delayBeforeMoving:Number = 15;
      
      public var fadeUpSpeed:Number = 0.05;
      
      public var isDoneHiding:Boolean = false;
      
      public var isHiding:Boolean = false;
      
      public var isOpened:Boolean = false;
      
      public var openedTimer:Number = 0;
      
      public var wrongDelayTimerMax:Number = 40;
      
      public var openedTimerMax:Number = 80;
      
      public var amountToUse:Number = 4;
      
      public function MiniGameHallway(param1:MiniGameScreen, param2:MovieClip, param3:String)
      {
         this.doorX = [0,243,397,88,552];
         this.outsideCustomers = [];
         this.outsideCustomerNumbers = [];
         this.insideCustomers = [];
         this.insideCustomerNumbers = [];
         this.eyeballDirections = [1,0,1,-1];
         this.eyeballDirY = [0,0,0,0];
         this.eyeballYspeeds = [2,2,2,2];
         this.eyeballSpeeds = [5,4,5,4];
         this.eyeballDurations = [0,0,0,0];
         this.eyeballReturning = [false,false,false,false];
         this.extraEyeDirections = [1,-1,1,-1];
         this.extraEyeDirY = [1,0,1,-1];
         this.extraEyeDurations = [0,0,0,0];
         this.extraEyeSpeeds = [9,8,9,8];
         this.extraEyeYspeeds = [4,3,4,3];
         super(param1,param2,param3);
      }
      
      override public function setupScreen() : void
      {
         var _loc1_:MiniGameHallway = this;
         _loc1_.clip = new minigameHallwayMC();
         _loc1_.container.addChild(_loc1_.clip);
         _loc1_.screen.setTitle("Hallway Hunt");
         _loc1_.setupPrizes(_loc1_.type);
         _loc1_.screen.updateStars();
         _loc1_.decideDifficulty();
         _loc1_.setupCustomers();
         _loc1_.clip.bg.gotoAndStop(Math.ceil(Math.random() * _loc1_.clip.bg.totalFrames));
         _loc1_.clip.behind.mask = _loc1_.clip.doormask;
         _loc1_.clip.btn_1.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickDoor);
         _loc1_.clip.btn_2.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickDoor);
         _loc1_.clip.btn_3.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickDoor);
         _loc1_.clip.btn_4.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickDoor);
         _loc1_.clip.btn_1.visible = false;
         _loc1_.clip.btn_2.visible = false;
         _loc1_.clip.btn_3.visible = false;
         _loc1_.clip.btn_4.visible = false;
         _loc1_.clip.darkcover.alpha = 0;
         _loc1_.clip.darkcover.mouseEnabled = false;
         _loc1_.clip.eyes_1.visible = false;
         _loc1_.clip.eyes_2.visible = false;
         _loc1_.clip.eyes_3.visible = false;
         _loc1_.clip.eyes_4.visible = false;
      }
      
      public function clickDoor(param1:MouseEvent) : void
      {
         var _loc2_:MiniGameHallway = this;
         var _loc3_:Number = Number(String(param1.currentTarget.name).split("_")[1]);
         _loc2_.choseWhichDoor = _loc3_;
         _loc2_.clip.btn_1.visible = false;
         _loc2_.clip.btn_2.visible = false;
         _loc2_.clip.btn_3.visible = false;
         _loc2_.clip.btn_4.visible = false;
         _loc2_.isOpened = true;
         _loc2_.clip["door_" + _loc2_.choseWhichDoor].gotoAndPlay("open");
         if(_loc2_.insideCustomerNumbers[_loc3_ - 1] == _loc2_.lookForWhichCustomer)
         {
            _loc2_.insideCustomers[_loc3_ - 1].gotoAndPlay("overjoyed1");
            _loc2_.screen.gameObj.var_128.playMusicClip("customer_overjoyed.wav");
         }
         else
         {
            _loc2_.screen.gameObj.var_128.playMusicClip("customer_decent.wav");
         }
         _loc2_.screen.gameObj.var_128.playSound("opendoor.wav");
         _loc2_.checkSuccess();
      }
      
      public function decideDifficulty() : void
      {
         var _loc2_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc1_:MiniGameHallway = this;
         var _loc3_:Number = _loc1_.getStartingLevel();
         if(_loc3_ < _loc1_.screen.maxDifficulty)
         {
            _loc1_.whichDifficulty = _loc3_ + 1;
         }
         else
         {
            _loc1_.whichDifficulty = prizeSKUs.length;
         }
         var _loc4_:Array = _loc1_.screen.gameObj.var_127.getCustomerPool(4,true);
         if(_loc1_.screen.gameObj.var_127.getDay() > 2)
         {
            _loc4_.push(2);
         }
         if(_loc1_.screen.gameObj.var_127.getDay() > 3)
         {
            _loc4_.push(3);
         }
         if(_loc1_.screen.gameObj.var_127.getDay() > 4)
         {
            _loc4_.push(4);
         }
         if(_loc1_.screen.gameObj.var_127.getDay() > 5)
         {
            _loc4_.push(5);
         }
         if(_loc1_.screen.gameObj.var_127.getDay() > 6)
         {
            _loc4_.push(6);
         }
         if(_loc1_.screen.gameObj.var_127.getDay() > 7)
         {
            _loc4_.push(7);
         }
         if(_loc1_.screen.gameObj.var_127.getDay() > 8)
         {
            _loc4_.push(1);
         }
         _loc1_.amountToUse = 4;
         _loc1_.extraEyesToUse = 0;
         if(_loc1_.whichDifficulty == 1)
         {
            _loc1_.amountToUse = 2;
            _loc1_.timeBlack = 120;
            _loc1_.eyeballSpeeds = [4,3,4,3];
            _loc1_.eyeballYspeeds = [2,2,2,2];
         }
         else if(_loc1_.whichDifficulty == 2)
         {
            _loc1_.amountToUse = 4;
            _loc1_.timeBlack = 150;
            _loc1_.eyeballSpeeds = [6,5,6,5];
            _loc1_.eyeballYspeeds = [3,3,3,3];
         }
         else if(_loc1_.whichDifficulty == 3)
         {
            _loc1_.amountToUse = 4;
            _loc1_.timeBlack = 180;
            _loc1_.eyeballSpeeds = [7,6,7,6];
            _loc1_.eyeballYspeeds = [3,3,3,3];
         }
         else
         {
            _loc1_.amountToUse = 4;
            _loc1_.timeBlack = 180;
            _loc1_.eyeballSpeeds = [9,8,9,8];
            _loc1_.eyeballYspeeds = [4,3,4,3];
            if(_loc1_.whichDifficulty == 4)
            {
               _loc1_.extraEyesToUse = 0;
            }
            else if(_loc1_.whichDifficulty == 5)
            {
               _loc1_.extraEyesToUse = 1;
            }
            else if(_loc1_.whichDifficulty == 6)
            {
               _loc1_.extraEyesToUse = 2;
            }
            else if(_loc1_.whichDifficulty == 7)
            {
               _loc1_.extraEyesToUse = 3;
            }
            else
            {
               _loc1_.extraEyesToUse = 4;
            }
         }
         var _loc5_:Array = [];
         _loc2_ = 0;
         while(_loc2_ < 4)
         {
            _loc6_ = Math.floor(Math.random() * _loc4_.length);
            _loc5_.push(_loc4_[_loc6_]);
            _loc4_.splice(_loc6_,1);
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc5_.length)
         {
            if(Math.random() > 0.5)
            {
               _loc1_.outsideCustomerNumbers.push(_loc5_[_loc2_]);
            }
            else
            {
               _loc1_.outsideCustomerNumbers.unshift(_loc5_[_loc2_]);
            }
            if(Math.random() > 0.5)
            {
               _loc1_.insideCustomerNumbers.push(_loc5_[_loc2_]);
            }
            else
            {
               _loc1_.insideCustomerNumbers.unshift(_loc5_[_loc2_]);
            }
            _loc2_++;
         }
         _loc1_.lookForWhichCustomer = _loc1_.outsideCustomerNumbers[Math.floor(Math.random() * _loc1_.amountToUse)];
      }
      
      public function clearCustomers() : void
      {
         var _loc2_:Number = NaN;
         var _loc1_:MiniGameHallway = this;
         class_6.method_1("Clear customers.");
         _loc2_ = 0;
         while(_loc2_ < _loc1_.outsideCustomers.length)
         {
            _loc1_.clearCustomer(_loc1_.outsideCustomers[_loc2_]);
            try
            {
               _loc1_.outsideCustomers[_loc2_].parent.removeChild(_loc1_.outsideCustomers[_loc2_]);
            }
            catch(err:Error)
            {
            }
            _loc1_.outsideCustomers[_loc2_] = null;
            _loc2_++;
         }
         _loc1_.outsideCustomers = null;
         _loc1_.outsideCustomerNumbers = null;
         _loc1_.outsideCustomers = [];
         _loc1_.outsideCustomerNumbers = [];
         _loc2_ = 0;
         while(_loc2_ < _loc1_.insideCustomers.length)
         {
            _loc1_.clearCustomer(_loc1_.insideCustomers[_loc2_]);
            try
            {
               _loc1_.insideCustomers[_loc2_].parent.removeChild(_loc1_.insideCustomers[_loc2_]);
            }
            catch(err:Error)
            {
            }
            _loc1_.insideCustomers[_loc2_] = null;
            _loc2_++;
         }
         _loc1_.insideCustomers = null;
         _loc1_.insideCustomerNumbers = null;
         _loc1_.insideCustomers = [];
         _loc1_.insideCustomerNumbers = [];
         if(_loc1_.headshot != null)
         {
            _loc1_.clearCustomer(_loc1_.headshot);
            _loc1_.clip.headshotholder.removeChild(_loc1_.headshot);
            _loc1_.headshot = null;
         }
      }
      
      public function setupCustomers() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:MovieClip = null;
         var _loc4_:MovieClip = null;
         var _loc1_:MiniGameHallway = this;
         _loc2_ = 0;
         while(_loc2_ < _loc1_.outsideCustomerNumbers.length)
         {
            _loc3_ = _loc1_.buildCustomer(_loc1_.outsideCustomerNumbers[_loc2_]);
            _loc1_.clip["front_" + (_loc2_ + 1)].addChild(_loc3_);
            if(_loc1_.amountToUse > _loc2_)
            {
               _loc1_.clip["front_" + (_loc2_ + 1)].visible = true;
            }
            else
            {
               _loc1_.clip["front_" + (_loc2_ + 1)].visible = false;
            }
            _loc1_.outsideCustomers.push(_loc3_);
            if(_loc2_ == 0 || _loc2_ == 2)
            {
               _loc3_.gotoAndPlay("portrait");
            }
            else
            {
               _loc3_.gotoAndPlay("stand");
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc1_.insideCustomerNumbers.length)
         {
            _loc4_ = _loc1_.buildCustomer(_loc1_.insideCustomerNumbers[_loc2_]);
            _loc1_.insideCustomers.push(_loc4_);
            if(_loc1_.insideCustomerNumbers[_loc2_] != _loc1_.lookForWhichCustomer)
            {
               if(Math.random() > 0.7)
               {
                  _loc4_.gotoAndPlay("readpaper1");
                  _loc4_.book.gotoAndStop("newspaper");
               }
               else if(Math.random() > 0.4)
               {
                  _loc4_.gotoAndPlay("drinkcoffee1");
                  _loc4_.mug.gotoAndStop("coffee");
               }
               else if(Math.random() > 0.2)
               {
                  _loc4_.gotoAndPlay("dance2_1");
               }
               else if(Math.random() > 0.1)
               {
                  _loc4_.gotoAndPlay("dance3_1");
               }
               else
               {
                  _loc4_.gotoAndPlay("dance1_1");
               }
            }
            else
            {
               _loc4_.gotoAndPlay("stand1_1");
            }
            _loc2_++;
         }
         _loc1_.headshot = _loc1_.buildCustomer(_loc1_.lookForWhichCustomer,true);
         _loc1_.clip.headshotholder.addChild(_loc1_.headshot);
         _loc1_.clip.customername_txt.text = _loc1_.screen.gameObj.var_131.getCustomerName(_loc1_.lookForWhichCustomer) + "?";
         _loc1_.clip.arrow.x = _loc1_.doorX[_loc1_.outsideCustomerNumbers.indexOf(_loc1_.lookForWhichCustomer) + 1];
         _loc1_.clip.arrow.visible = true;
      }
      
      public function checkSuccess() : void
      {
         var _loc1_:MiniGameHallway = this;
         if(_loc1_.insideCustomerNumbers[_loc1_.choseWhichDoor - 1] == _loc1_.lookForWhichCustomer)
         {
            _loc1_.decidePrize();
         }
         else
         {
            _loc1_.skuToWin = null;
            _loc1_.amountToWin = 0;
            _loc1_.skuIsClothing = false;
            _loc1_.skuClothingMode = "";
         }
      }
      
      override public function updateScreen() : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Boolean = false;
         var _loc5_:int = 0;
         var _loc6_:Number = NaN;
         var _loc7_:MovieClip = null;
         var _loc8_:MovieClip = null;
         var _loc1_:MiniGameHallway = this;
         ++_loc1_.gameTimer;
         if(_loc1_.gameTimer == _loc1_.timeBeforeBlack)
         {
            _loc1_.startWalking();
         }
         else if(_loc1_.isDoneHiding)
         {
            if(_loc1_.clip.darkcover.alpha == 1)
            {
               _loc1_.clip.eyes_1.visible = false;
               _loc1_.clip.eyes_2.visible = false;
               _loc1_.clip.eyes_3.visible = false;
               _loc1_.clip.eyes_4.visible = false;
               _loc1_.clip.extraeyes_1.visible = false;
               _loc1_.clip.extraeyes_2.visible = false;
               _loc1_.clip.extraeyes_3.visible = false;
               _loc1_.clip.extraeyes_4.visible = false;
               _loc1_.clip.btn_1.visible = true;
               _loc1_.clip.btn_2.visible = true;
               _loc1_.clip.btn_3.visible = true;
               _loc1_.clip.btn_4.visible = true;
               _loc2_ = 0;
               while(_loc2_ < 4)
               {
                  _loc1_.clip.behind["back_" + (_loc2_ + 1)].addChild(_loc1_.insideCustomers[_loc2_]);
                  _loc2_++;
               }
            }
            if(_loc1_.clip.darkcover.alpha > 0)
            {
               _loc1_.clip.darkcover.alpha -= _loc1_.fadeUpSpeed;
            }
         }
         else if(_loc1_.isHiding && _loc1_.gameTimer > _loc1_.timeBeforeBlack + _loc1_.delayBeforeMoving)
         {
            _loc3_ = 0;
            _loc4_ = false;
            if(_loc1_.gameTimer > _loc1_.timeBeforeBlack + _loc1_.timeBlack)
            {
               _loc4_ = true;
            }
            _loc5_ = 0;
            while(_loc5_ < 4)
            {
               _loc6_ = _loc1_.insideCustomerNumbers.indexOf(_loc1_.outsideCustomerNumbers[_loc5_]) + 1;
               _loc7_ = _loc1_.clip["eyes_" + (_loc5_ + 1)];
               _loc7_.x += _loc1_.eyeballDirections[_loc5_] * _loc1_.eyeballSpeeds[_loc5_];
               _loc7_.y += _loc1_.eyeballDirY[_loc5_] * _loc1_.eyeballYspeeds[_loc5_];
               ++_loc1_.eyeballDurations[_loc5_];
               if(_loc7_.x < 10 && _loc1_.eyeballDirections[_loc5_] == -1)
               {
                  _loc7_.x = 10;
                  _loc1_.eyeballDirections[_loc5_] = 1;
               }
               else if(_loc7_.x > 630 && _loc1_.eyeballDirections[_loc5_] == 1)
               {
                  _loc7_.x = 630;
                  _loc1_.eyeballDirections[_loc5_] = -1;
               }
               if(_loc7_.y < _loc1_.doorY && (_loc1_.eyeballReturning[_loc5_] == false || _loc7_.x != _loc1_.doorX[_loc6_]))
               {
                  _loc7_.y = _loc1_.doorY;
                  _loc1_.eyeballDirY[_loc5_] = 0;
                  if(_loc1_.eyeballDirections[_loc5_] == 0)
                  {
                     _loc7_.inside.stop();
                  }
               }
               else if(_loc7_.y > _loc1_.doorMaxY)
               {
                  _loc7_.y = _loc1_.doorMaxY;
                  _loc1_.eyeballDirY[_loc5_] = 0;
                  if(_loc1_.eyeballDirections[_loc5_] == 0)
                  {
                     _loc7_.inside.stop();
                  }
               }
               if(_loc1_.eyeballReturning[_loc5_] == false && _loc1_.eyeballDurations[_loc5_] > _loc1_.maxDuration || _loc1_.eyeballReturning[_loc5_] == false && _loc1_.eyeballDurations[_loc5_] > _loc1_.minDuration && Math.random() > 0.9 || _loc4_ && _loc1_.eyeballReturning[_loc5_] == false)
               {
                  _loc1_.eyeballDirections[_loc5_] = Math.round(Math.random() * 2) - 1;
                  _loc1_.eyeballDirY[_loc5_] = Math.round(Math.random() * 2) - 1;
                  if(_loc1_.whichDifficulty >= 4 && _loc1_.eyeballDirections[_loc5_] == 0)
                  {
                     if(Math.random() > 0.5)
                     {
                        _loc1_.eyeballDirections[_loc5_] = -1;
                     }
                     else
                     {
                        _loc1_.eyeballDirections[_loc5_] = 1;
                     }
                  }
                  _loc1_.eyeballDurations[_loc5_] = 0;
                  if(_loc4_)
                  {
                     _loc1_.eyeballReturning[_loc5_] = true;
                     _loc1_.eyeballDirY[_loc5_] = -1;
                     if(_loc1_.doorX[_loc6_] > _loc7_.x)
                     {
                        _loc1_.eyeballDirections[_loc5_] = 1;
                     }
                     else if(_loc1_.doorX[_loc6_] < _loc7_.x)
                     {
                        _loc1_.eyeballDirections[_loc5_] = -1;
                     }
                     else
                     {
                        _loc1_.eyeballDirections[_loc5_] = 0;
                     }
                     if(_loc5_ >= _loc1_.amountToUse)
                     {
                        _loc7_.x = _loc1_.doorX[_loc6_];
                     }
                  }
               }
               else if(_loc1_.eyeballReturning[_loc5_] == true)
               {
                  if(_loc1_.eyeballDirections[_loc5_] == 1 && _loc7_.x > _loc1_.doorX[_loc6_])
                  {
                     _loc7_.x = _loc1_.doorX[_loc6_];
                     _loc1_.eyeballDirections[_loc5_] = 0;
                  }
                  else if(_loc1_.eyeballDirections[_loc5_] == -1 && _loc7_.x < _loc1_.doorX[_loc6_])
                  {
                     _loc7_.x = _loc1_.doorX[_loc6_];
                     _loc1_.eyeballDirections[_loc5_] = 0;
                  }
                  else if(_loc7_.x == _loc1_.doorX[_loc6_])
                  {
                     _loc1_.eyeballDirections[_loc5_] = 0;
                     if(_loc7_.y > _loc1_.doorBackY)
                     {
                        _loc7_.y -= _loc1_.eyeballSpeeds[_loc5_];
                     }
                     else
                     {
                        if(_loc5_ < _loc1_.amountToUse && _loc7_.visible == true)
                        {
                           _loc1_.screen.gameObj.var_128.playSound("closedoor.wav");
                        }
                        _loc7_.visible = false;
                        _loc7_.inside.stop();
                        _loc3_++;
                     }
                  }
               }
               if(_loc1_.eyeballDirections[_loc5_] == 0 && _loc1_.eyeballDirY[_loc5_] == 0)
               {
                  _loc7_.inside.stop();
               }
               else
               {
                  _loc7_.inside.play();
               }
               _loc8_ = _loc1_.clip["extraeyes_" + (_loc5_ + 1)];
               _loc8_.x += _loc1_.extraEyeDirections[_loc5_] * _loc1_.extraEyeSpeeds[_loc5_];
               _loc8_.y += _loc1_.extraEyeDirY[_loc5_] * _loc1_.extraEyeYspeeds[_loc5_];
               ++_loc1_.extraEyeDurations[_loc5_];
               if(_loc1_.gameTimer < _loc1_.timeBeforeBlack + _loc1_.timeBlack)
               {
                  if(_loc8_.x < 10 && _loc1_.extraEyeDirections[_loc5_] == -1)
                  {
                     _loc8_.x = 10;
                     _loc1_.extraEyeDirections[_loc5_] = 1;
                  }
                  else if(_loc7_.x > 630 && _loc1_.extraEyeDirections[_loc5_] == 1)
                  {
                     _loc8_.x = 630;
                     _loc1_.extraEyeDirections[_loc5_] = -1;
                  }
               }
               if(_loc8_.y < _loc1_.doorY)
               {
                  _loc8_.y = _loc1_.doorY;
                  _loc1_.extraEyeDirY[_loc5_] = 0;
                  if(_loc1_.extraEyeDirections[_loc5_] == 0)
                  {
                     _loc8_.inside.stop();
                  }
               }
               else if(_loc8_.y > _loc1_.doorMaxY)
               {
                  _loc8_.y = _loc1_.doorMaxY;
                  _loc1_.extraEyeDirY[_loc5_] = 0;
                  if(_loc1_.extraEyeDirections[_loc5_] == 0)
                  {
                     _loc8_.inside.stop();
                  }
               }
               if(_loc8_.x > 10 && _loc8_.x < 630 && _loc1_.gameTimer < _loc1_.timeBeforeBlack + _loc1_.timeBlack && (_loc1_.extraEyeDurations[_loc5_] > _loc1_.maxDuration || _loc1_.extraEyeDurations[_loc5_] > _loc1_.minDuration && Math.random() > 0.9))
               {
                  _loc1_.extraEyeDirY[_loc5_] = Math.round(Math.random() * 2) - 1;
                  if(Math.random() > 0.5)
                  {
                     _loc1_.extraEyeDirections[_loc5_] = -1;
                  }
                  else
                  {
                     _loc1_.extraEyeDirections[_loc5_] = 1;
                  }
                  _loc1_.extraEyeDurations[_loc5_] = 0;
               }
               if(_loc4_)
               {
                  if(_loc8_.visible && (_loc8_.x < 0 || _loc8_.x > 640))
                  {
                     _loc3_++;
                  }
               }
               _loc5_++;
            }
            if(_loc3_ == 4 + _loc1_.extraEyesToUse)
            {
               _loc1_.isHiding = false;
               _loc1_.isDoneHiding = true;
            }
         }
         if(_loc1_.isOpened)
         {
            ++_loc1_.openedTimer;
            if(_loc1_.openedTimer == _loc1_.wrongDelayTimerMax && _loc1_.choseWhichDoor != _loc1_.insideCustomerNumbers.indexOf(_loc1_.lookForWhichCustomer) + 1)
            {
               _loc1_.clip["door_" + (_loc1_.insideCustomerNumbers.indexOf(_loc1_.lookForWhichCustomer) + 1)].gotoAndPlay("open");
               _loc1_.insideCustomers[_loc1_.insideCustomerNumbers.indexOf(_loc1_.lookForWhichCustomer)].gotoAndPlay("decent1");
            }
            else if(_loc1_.openedTimer == _loc1_.openedTimerMax)
            {
               _loc1_.screen.finishMiniGame(_loc1_.skuToWin,_loc1_.amountToWin,_loc1_.skuIsClothing,_loc1_.skuClothingMode);
               ++_loc1_.openedTimer;
            }
         }
      }
      
      public function startWalking() : void
      {
         var _loc4_:Number = NaN;
         var _loc1_:MiniGameHallway = this;
         _loc1_.isHiding = true;
         _loc1_.clip.darkcover.alpha = 1;
         _loc1_.clip.arrow.visible = false;
         _loc1_.clip.front_1.visible = false;
         _loc1_.clip.front_2.visible = false;
         _loc1_.clip.front_3.visible = false;
         _loc1_.clip.front_4.visible = false;
         _loc1_.clip.eyes_1.visible = true;
         _loc1_.clip.eyes_1.inside.stop();
         _loc1_.clip.eyes_1.x = _loc1_.doorX[1];
         _loc1_.clip.eyes_1.y = _loc1_.doorY;
         if(_loc1_.amountToUse >= 2)
         {
            _loc1_.clip.eyes_2.visible = true;
         }
         _loc1_.clip.eyes_2.inside.stop();
         _loc1_.clip.eyes_2.x = _loc1_.doorX[2];
         _loc1_.clip.eyes_2.y = _loc1_.doorY;
         if(_loc1_.amountToUse >= 3)
         {
            _loc1_.clip.eyes_3.visible = true;
         }
         _loc1_.clip.eyes_3.inside.stop();
         _loc1_.clip.eyes_3.x = _loc1_.doorX[3];
         _loc1_.clip.eyes_3.y = _loc1_.doorY;
         if(_loc1_.amountToUse >= 4)
         {
            _loc1_.clip.eyes_4.visible = true;
         }
         _loc1_.clip.eyes_4.inside.stop();
         _loc1_.clip.eyes_4.x = _loc1_.doorX[4];
         _loc1_.clip.eyes_4.y = _loc1_.doorY;
         var _loc2_:int = 0;
         while(_loc2_ < 4)
         {
            _loc4_ = Math.round(Math.random() * 2) - 1;
            _loc1_.eyeballDirections[_loc2_] = _loc4_;
            _loc1_.eyeballReturning[_loc2_] = false;
            _loc1_.eyeballDirY[_loc2_] = Math.round(Math.random() * 1);
            _loc1_.clip["eyes_" + (_loc2_ + 1)].inside.stop();
            _loc2_++;
         }
         if(_loc1_.whichDifficulty > 3 && _loc1_.whichDifficulty % 2 == 0)
         {
            _loc1_.eyeballDirections = [-1,1,1,-1];
         }
         else if(_loc1_.whichDifficulty > 3)
         {
            _loc1_.eyeballDirections = [1,-1,1,-1];
         }
         var _loc3_:int = 1;
         while(_loc3_ <= 4)
         {
            if(_loc1_.extraEyesToUse >= _loc3_)
            {
               _loc1_.clip["extraeyes_" + _loc3_].visible = true;
            }
            else
            {
               _loc1_.clip["extraeyes_" + _loc3_].visible = false;
            }
            _loc3_++;
         }
         _loc1_.screen.gameObj.var_128.playSound("minigame_noammo.wav");
      }
      
      public function buildCustomer(param1:Number, param2:Boolean = false) : MovieClip
      {
         var _loc3_:MiniGameHallway = this;
         var _loc4_:MovieClip = new customerMC();
         var _loc5_:String = _loc3_.screen.gameObj.var_131.getCustomerClipName(param1);
         _loc3_.screen.gameObj.var_131.buildCustomer(_loc5_,_loc4_,false,param2);
         if(param2)
         {
            _loc4_.gotoAndStop("stand");
         }
         else
         {
            _loc4_.gotoAndPlay("stand");
         }
         return _loc4_;
      }
      
      public function clearCustomer(param1:MovieClip) : void
      {
         this;
         try
         {
            param1.stop();
            param1.head.removeChildAt(0);
            param1.eyes.removeChildAt(0);
            param1.mouth.removeChildAt(0);
         }
         catch(err:Error)
         {
         }
         try
         {
            param1.body.removeChildAt(0);
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
      }
      
      override public function destroy() : void
      {
         var _loc1_:MiniGameHallway = this;
         _loc1_.clearCustomers();
         _loc1_.clip.btn_1.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickDoor);
         _loc1_.clip.btn_2.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickDoor);
         _loc1_.clip.btn_3.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickDoor);
         _loc1_.clip.btn_4.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickDoor);
         _loc1_.container.removeChild(_loc1_.clip);
         _loc1_.clip = null;
      }
   }
}
