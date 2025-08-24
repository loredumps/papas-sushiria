package sushiGame.screens
{
   import flash.display.*;
   import flash.events.*;
   import package_2.*;
   import package_4.*;
   import sushiGame.data.*;
   import sushiGame.models.Worker;
   
   public class MiniGameHomeRun extends MiniGame
   {
       
      
      public var didSetDifficulty:Boolean = false;
      
      public var whichDifficulty:Number = 1;
      
      public var worker:Worker;
      
      public var pitcher:Worker;
      
      public var allowedMisses:Number = 3;
      
      public var currentMisses:Number = 0;
      
      public var isIntro:Boolean = true;
      
      public var introTimer:Number = 0;
      
      public var introTimerMax:Number = 30;
      
      public var isWindingUp:Boolean = false;
      
      public var windupTimer:Number = 0;
      
      public var windupTimerMax:Number = 20;
      
      public var isShowingMessage:Boolean = false;
      
      public var messageTimer:Number = 0;
      
      public var messageTimerMax:Number = 60;
      
      public var baseMessageTimerMax:Number = 60;
      
      public var maxMessageTimerMax:Number = 90;
      
      public var ballX:Number = 0;
      
      public var ballY:Number = 0;
      
      public var ballZ:Number = 0;
      
      public var ballStartingX:Number = 0;
      
      public var ballStartingY:Number = -100;
      
      public var ballStartingZ:Number = 150;
      
      public var isBallThrown:Boolean = false;
      
      public var ballSpeedX:Number = 0;
      
      public var ballSpeedY:Number = 0;
      
      public var ballSpeedZ:Number = 0;
      
      public var ballGravity:Number = 0.05;
      
      public var ballCurve:Number = 0;
      
      public var cameraX:Number = 0;
      
      public var cameraY:Number = 0;
      
      public var cameraZ:Number = 0;
      
      public var viewerX:Number = 3;
      
      public var viewerY:Number = -142;
      
      public var viewerZ:Number = 50;
      
      public var ball:MovieClip;
      
      public var shadow:MovieClip;
      
      public var ballEarlyZ:Number = 60;
      
      public var ballStartPlateZ:Number = 50;
      
      public var ballEndPlateZ:Number = 30;
      
      public var ballLateZ:Number = 20;
      
      public var gotHomeRun:Boolean = false;
      
      public function MiniGameHomeRun(param1:MiniGameScreen, param2:MovieClip, param3:String)
      {
         super(param1,param2,param3);
      }
      
      override public function setupScreen() : void
      {
         var _loc1_:MiniGameHomeRun = this;
         _loc1_.clip = new minigameHomeRunMC();
         _loc1_.container.addChild(_loc1_.clip);
         _loc1_.screen.setTitle("Home Run Derby");
         _loc1_.setupPrizes(_loc1_.type);
         _loc1_.screen.updateStars();
         _loc1_.worker = new Worker(_loc1_.screen.gameObj,_loc1_.clip.batter,_loc1_.screen.gameObj.workerData,0,0,1,true);
         _loc1_.clip.batter.standin.visible = false;
         _loc1_.worker.playAnimation("batterup");
         _loc1_.setupPitcher();
         _loc1_.ball = _loc1_.clip.ballholder.ball;
         _loc1_.shadow = _loc1_.clip.shadowholder.shadow;
         _loc1_.clip.scoreboard.stop();
         _loc1_.clip.scoreboard.visible = false;
         _loc1_.reset();
         _loc1_.clip.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickScreen);
      }
      
      public function reset(param1:MouseEvent = null) : void
      {
         var _loc3_:int = 0;
         var _loc2_:MiniGameHomeRun = this;
         _loc2_.decideDifficulty();
         _loc3_ = 1;
         while(_loc3_ <= 3)
         {
            if(_loc3_ <= _loc2_.allowedMisses)
            {
               _loc2_.clip["strike_" + _loc3_].visible = true;
               _loc2_.clip["strike_" + _loc3_].gotoAndStop(1);
            }
            else
            {
               _loc2_.clip["strike_" + _loc3_].visible = false;
            }
            _loc3_++;
         }
         _loc2_.currentMisses = 0;
         _loc2_.isBallThrown = false;
         _loc2_.isShowingMessage = false;
         _loc2_.clip.message.gotoAndStop(1);
         _loc2_.ball.x = -1000;
         _loc2_.shadow.x = -1000;
         _loc2_.isIntro = true;
         _loc2_.introTimer = 0;
      }
      
      public function decideDifficulty() : void
      {
         var _loc2_:Number = NaN;
         var _loc1_:MiniGameHomeRun = this;
         if(!_loc1_.didSetDifficulty)
         {
            _loc2_ = _loc1_.getStartingLevel();
            if(_loc2_ < _loc1_.screen.maxDifficulty)
            {
               _loc1_.whichDifficulty = _loc2_ + 1;
            }
            else
            {
               _loc1_.whichDifficulty = Math.ceil(Math.random() * 14);
            }
            _loc1_.didSetDifficulty = true;
         }
      }
      
      public function setupBallSpeed() : void
      {
         var _loc1_:MiniGameHomeRun = this;
         var _loc2_:Array = ["normal","sinker","splitter","fastball","curveball","screwball"];
         var _loc3_:Number = Math.floor(Math.random() * _loc2_.length);
         _loc1_.usePitch(_loc2_[_loc3_]);
         var _loc4_:Number = 1;
         if(_loc1_.whichDifficulty == 1)
         {
            _loc4_ = 1;
         }
         else if(_loc1_.whichDifficulty == 2)
         {
            _loc4_ = 1.1;
         }
         else if(_loc1_.whichDifficulty == 3)
         {
            _loc4_ = 1.2;
         }
         else if(_loc1_.whichDifficulty == 4)
         {
            _loc4_ = 1.3;
         }
         else if(_loc1_.whichDifficulty == 5)
         {
            _loc4_ = 1.4;
         }
         else if(_loc1_.whichDifficulty == 6)
         {
            _loc4_ = 1.5;
         }
         else if(_loc1_.whichDifficulty == 7)
         {
            _loc4_ = 1.6;
         }
         else if(_loc1_.whichDifficulty == 8)
         {
            _loc4_ = 1.7;
         }
         else if(_loc1_.whichDifficulty == 9)
         {
            _loc4_ = 1.8;
         }
         else if(_loc1_.whichDifficulty == 10)
         {
            _loc4_ = 1.9;
         }
         else
         {
            _loc4_ = 2;
         }
         if(_loc2_[_loc3_] == "fastball")
         {
            if(_loc4_ > 1.65)
            {
               _loc4_ = 1.65;
            }
         }
         _loc1_.ballSpeedZ *= _loc4_;
         _loc1_.ballGravity *= _loc4_;
         _loc1_.ballCurve *= _loc4_;
      }
      
      public function usePitch(param1:String) : void
      {
         var _loc2_:MiniGameHomeRun = this;
         if(param1 == "normal")
         {
            _loc2_.ballSpeedX = 0;
            _loc2_.ballSpeedY = -1;
            _loc2_.ballSpeedZ = -3;
            _loc2_.ballGravity = 0.05;
            _loc2_.ballCurve = 0;
         }
         else if(param1 == "sinker")
         {
            _loc2_.ballSpeedX = 0;
            _loc2_.ballSpeedY = -4;
            _loc2_.ballSpeedZ = -2.5;
            _loc2_.ballGravity = 0.2;
            _loc2_.ballCurve = 0;
         }
         else if(param1 == "splitter")
         {
            _loc2_.ballSpeedX = 0;
            _loc2_.ballSpeedY = -6;
            _loc2_.ballSpeedZ = -2;
            _loc2_.ballGravity = 0.2;
            _loc2_.ballCurve = 0;
         }
         else if(param1 == "fastball")
         {
            _loc2_.ballSpeedX = 0;
            _loc2_.ballSpeedY = -1;
            _loc2_.ballSpeedZ = -5;
            _loc2_.ballGravity = 0.07;
            _loc2_.ballCurve = 0;
         }
         else if(param1 == "curveball")
         {
            _loc2_.ballSpeedX = -2.5;
            _loc2_.ballSpeedY = -1;
            _loc2_.ballSpeedZ = -2.8;
            _loc2_.ballGravity = 0.05;
            _loc2_.ballCurve = 0.12;
         }
         else if(param1 == "screwball")
         {
            _loc2_.ballSpeedX = 4.5;
            _loc2_.ballSpeedY = -3;
            _loc2_.ballSpeedZ = -2.9;
            _loc2_.ballGravity = 0.2;
            _loc2_.ballCurve = -0.22;
         }
         else
         {
            _loc2_.ballSpeedX = 0;
            _loc2_.ballSpeedY = -1;
            _loc2_.ballSpeedZ = -3;
            _loc2_.ballGravity = 0.05;
            _loc2_.ballCurve = 0;
         }
      }
      
      public function checkSuccess() : void
      {
         var _loc1_:MiniGameHomeRun = this;
         if(_loc1_.gotHomeRun)
         {
            _loc1_.decidePrize();
            _loc1_.screen.gameObj.var_128.playMusicClip("customer_happy.wav");
            if(_loc1_.currentMisses == 0)
            {
               _loc1_.screen.gameObj.var_136.recordTagged("homerun");
            }
         }
         else
         {
            _loc1_.skuToWin = null;
            _loc1_.amountToWin = 0;
            _loc1_.skuIsClothing = false;
            _loc1_.skuClothingMode = "";
            ++_loc1_.currentMisses;
            if(_loc1_.currentMisses == _loc1_.allowedMisses)
            {
               _loc1_.screen.gameObj.var_128.playMusicClip("customer_decent.wav");
            }
            _loc1_.updateMisses();
         }
      }
      
      public function updateMisses() : void
      {
         var _loc1_:MiniGameHomeRun = this;
         trace("UPDATE MISSES: " + _loc1_.currentMisses + " /" + _loc1_.allowedMisses);
         var _loc2_:int = 1;
         while(_loc2_ <= 3)
         {
            if(_loc2_ <= _loc1_.currentMisses)
            {
               _loc1_.clip["strike_" + _loc2_].gotoAndStop(2);
            }
            else
            {
               _loc1_.clip["strike_" + _loc2_].gotoAndStop(1);
            }
            _loc2_++;
         }
      }
      
      override public function updateScreen() : void
      {
         var _loc1_:MiniGameHomeRun = this;
         if(_loc1_.worker)
         {
            _loc1_.worker.animateModel();
         }
         if(_loc1_.pitcher)
         {
            _loc1_.pitcher.animateModel();
         }
         if(_loc1_.isIntro)
         {
            ++_loc1_.introTimer;
            if(_loc1_.introTimer >= _loc1_.introTimerMax)
            {
               _loc1_.isIntro = false;
               _loc1_.windup();
            }
         }
         if(_loc1_.isWindingUp)
         {
            ++_loc1_.windupTimer;
            if(_loc1_.windupTimer >= _loc1_.windupTimerMax)
            {
               _loc1_.throwBall();
            }
         }
         if(_loc1_.isBallThrown)
         {
            _loc1_.updateBall();
         }
         if(_loc1_.isShowingMessage)
         {
            ++_loc1_.messageTimer;
            if(_loc1_.messageTimer >= _loc1_.messageTimerMax)
            {
               _loc1_.isShowingMessage = false;
               if(_loc1_.gotHomeRun || _loc1_.currentMisses >= _loc1_.allowedMisses)
               {
                  _loc1_.screen.finishMiniGame(_loc1_.skuToWin,_loc1_.amountToWin,_loc1_.skuIsClothing,_loc1_.skuClothingMode);
               }
               else
               {
                  _loc1_.windup();
               }
            }
         }
      }
      
      override public function destroy() : void
      {
         var _loc1_:MiniGameHomeRun = this;
         _loc1_.worker.destroy();
         _loc1_.worker = null;
         if(_loc1_.pitcher)
         {
            _loc1_.pitcher.destroy();
            _loc1_.pitcher = null;
         }
         _loc1_.clip.removeEventListener(Event.ENTER_FRAME,_loc1_.updateScreen);
         _loc1_.clip.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickScreen);
         _loc1_.container.removeChild(_loc1_.clip);
         _loc1_.clip = null;
      }
      
      public function updateBall() : void
      {
         var _loc1_:MiniGameHomeRun = this;
         _loc1_.ballSpeedY += _loc1_.ballGravity;
         _loc1_.ballSpeedX += _loc1_.ballCurve;
         _loc1_.ballX += _loc1_.ballSpeedX;
         _loc1_.ballY += _loc1_.ballSpeedY;
         _loc1_.ballZ += _loc1_.ballSpeedZ;
         if(_loc1_.ballY >= 0)
         {
            _loc1_.ballY = 0;
            _loc1_.ballSpeedY *= -1;
         }
         if(_loc1_.ballZ <= _loc1_.cameraZ)
         {
            _loc1_.isBallThrown = false;
            _loc1_.ball.x = -1000;
            _loc1_.shadow.x = -1000;
            if(!_loc1_.isShowingMessage)
            {
               _loc1_.checkSuccess();
               _loc1_.showMessage("strike");
            }
         }
         var _loc2_:Number = _loc1_.viewerZ / (_loc1_.viewerZ + _loc1_.ballZ);
         var _loc3_:Number = _loc1_.ballX - _loc1_.cameraX;
         var _loc4_:Number = _loc1_.ballY - _loc1_.cameraY;
         var _loc5_:Number = _loc1_.ballZ - _loc1_.cameraZ;
         _loc1_.ball.x = (_loc3_ - _loc1_.viewerX) * (_loc1_.viewerZ / _loc5_);
         _loc1_.ball.y = (_loc4_ - _loc1_.viewerY) * (_loc1_.viewerZ / _loc5_);
         _loc1_.ball.scaleX = _loc2_;
         _loc1_.ball.scaleY = _loc2_;
         _loc1_.shadow.scaleX = _loc2_;
         _loc1_.shadow.scaleY = _loc2_;
         var _loc6_:Number = _loc1_.ballX - _loc1_.cameraX;
         var _loc7_:Number = 1 - _loc1_.cameraY;
         var _loc8_:Number = _loc1_.ballZ - _loc1_.cameraZ;
         _loc1_.shadow.x = (_loc6_ - _loc1_.viewerX) * (_loc1_.viewerZ / _loc8_);
         _loc1_.shadow.y = (_loc7_ - _loc1_.viewerY) * (_loc1_.viewerZ / _loc8_);
      }
      
      public function throwBall() : void
      {
         var _loc1_:MiniGameHomeRun = this;
         trace("THROW!");
         _loc1_.ballX = _loc1_.ballStartingX;
         _loc1_.ballY = _loc1_.ballStartingY;
         _loc1_.ballZ = _loc1_.ballStartingZ;
         _loc1_.isWindingUp = false;
         _loc1_.isBallThrown = true;
         _loc1_.screen.gameObj.var_128.playSound("throwpitch.wav",false,0.5);
      }
      
      public function windup() : void
      {
         var _loc1_:MiniGameHomeRun = this;
         _loc1_.setupBallSpeed();
         _loc1_.ball.x = -1000;
         _loc1_.shadow.x = -1000;
         _loc1_.isShowingMessage = false;
         _loc1_.isBallThrown = false;
         _loc1_.isIntro = false;
         _loc1_.isWindingUp = true;
         _loc1_.windupTimer = 0;
         _loc1_.pitcher.playAnimation("pitchthrow");
      }
      
      public function clickScreen(param1:MouseEvent) : void
      {
         var _loc2_:MiniGameHomeRun = this;
         if(!_loc2_.isShowingMessage && !_loc2_.isWindingUp && !_loc2_.isIntro)
         {
            _loc2_.screen.gameObj.var_128.playSound("swingbat.wav",false,0.5);
            _loc2_.worker.playAnimation("batterswing");
            if(_loc2_.ballZ > _loc2_.ballEarlyZ)
            {
               _loc2_.showMessage("strike");
            }
            else if(_loc2_.ballZ <= _loc2_.ballEarlyZ && _loc2_.ballZ > _loc2_.ballStartPlateZ)
            {
               _loc2_.ballSpeedX = -55;
               _loc2_.ballSpeedY = -45;
               _loc2_.ballSpeedZ = 4;
               _loc2_.ballCurve = -0.05;
               _loc2_.ballGravity = 0.06;
               _loc2_.screen.gameObj.var_128.playSound("boing.wav");
               _loc2_.showMessage("foul");
            }
            else if(_loc2_.ballZ <= _loc2_.ballStartPlateZ && _loc2_.ballZ >= _loc2_.ballEndPlateZ)
            {
               _loc2_.ballSpeedX = 0;
               _loc2_.ballSpeedY = -55;
               _loc2_.ballSpeedZ = 15;
               _loc2_.ballGravity = 0.03;
               _loc2_.screen.gameObj.var_128.playSound("hitball.wav",false,0.5);
               _loc2_.showMessage("homerun");
               _loc2_.gotHomeRun = true;
               _loc2_.clip.scoreboard.visible = true;
               _loc2_.clip.scoreboard.play();
            }
            else if(_loc2_.ballZ >= _loc2_.ballLateZ)
            {
               _loc2_.ballSpeedX = 55;
               _loc2_.ballSpeedY = -45;
               _loc2_.ballSpeedZ = 4;
               _loc2_.ballCurve = 0.05;
               _loc2_.ballGravity = 0.06;
               _loc2_.screen.gameObj.var_128.playSound("boing.wav");
               _loc2_.showMessage("foul");
            }
            else
            {
               _loc2_.showMessage("strike");
            }
            _loc2_.checkSuccess();
         }
      }
      
      public function showMessage(param1:String) : void
      {
         var _loc2_:MiniGameHomeRun = this;
         _loc2_.isShowingMessage = true;
         _loc2_.messageTimer = 0;
         if(_loc2_.currentMisses == 2 && param1 == "strike")
         {
            param1 = "out";
         }
         if(param1 == "homerun")
         {
            _loc2_.messageTimerMax = _loc2_.baseMessageTimerMax;
         }
         else
         {
            _loc2_.messageTimerMax = _loc2_.baseMessageTimerMax + Math.round(Math.random() * (_loc2_.maxMessageTimerMax - _loc2_.baseMessageTimerMax));
         }
         _loc2_.clip.message.inside.gotoAndStop(param1);
         _loc2_.clip.message.gotoAndPlay("show");
      }
      
      public function setupPitcher() : void
      {
         var _loc9_:WorkerData = null;
         var _loc10_:String = null;
         var _loc11_:Array = null;
         var _loc12_:Array = null;
         var _loc13_:Array = null;
         var _loc1_:MiniGameHomeRun = this;
         var _loc2_:UserData = _loc1_.screen.gameObj.var_127;
         [1];
         var _loc4_:Array = ["R-LO-LO","S-V-V","A-A-KH","Y-K-K","O-BR-O","LG-R-R","B-C-C","C-BR-BR","W-DL-DL","N-R-W","LP-W-W","K-MG-MG"];
         var _loc5_:Array = ["1:R-LO-R","1:S-V-S","1:W-V-W","1:Y-K-Y","1:O-BR-O","1:LG-R-LG","2:B-W-W","1:C-BR-C","2:DL-W-W","1:N-R-W","2:LP-W-W","2:MG-K-K"];
         var _loc6_:Array = ["2:R-LO","2:S-V","1:V","1:K","1:BR","2:LG-R","2:W-B","2:C-BR","1:W","1:W","1:W","2:W-MG"];
         var _loc7_:Array = ["LO-W","V-W","W-W","Y-W","O-W","R-W","B-W","BR-W","DL-W","R-W","LP-W","K-W"];
         var _loc8_:Number;
         if((_loc8_ = _loc1_.screen.gameObj.var_127.getTicketsTotal() % _loc4_.length) != -1)
         {
            _loc9_ = new WorkerData();
            _loc10_ = WorkerData.GENDER_MALE;
            if(Math.random() < 0.5)
            {
               _loc10_ = WorkerData.GENDER_FEMALE;
            }
            _loc9_.gender = _loc10_;
            _loc9_.randomizeFace();
            _loc9_.shirt = "tint_jersey_" + _loc5_[_loc8_];
            _loc9_.jacket = "";
            _loc9_.pants = "tint_pants_" + _loc6_[_loc8_];
            _loc9_.hat = "tint_logocap:" + _loc4_[_loc8_];
            _loc9_.shoes = "tint_shoes1:BR-MO-KH";
            _loc9_.acca = "";
            _loc9_.accb = "tint_belt_1:" + _loc7_[_loc8_];
            _loc9_.accc = "";
            _loc9_.accd = "";
            _loc11_ = screen.gameObj.var_134.getAvailableClothingTags(ClothingItem.TYPE_HAIR,_loc9_.gender,false,true);
            _loc9_.hair = _loc11_[Math.floor(Math.random() * _loc11_.length)];
            if(_loc9_.gender == WorkerData.GENDER_MALE && Math.random() > 0.5)
            {
               _loc12_ = screen.gameObj.var_134.getAvailableClothingTags(ClothingItem.TYPE_FACIALHAIR,_loc9_.gender,false,true);
               _loc9_.facialhair = _loc12_[Math.floor(Math.random() * _loc12_.length)];
            }
            else if(_loc9_.gender == WorkerData.GENDER_FEMALE && Math.random() > 0.2)
            {
               _loc13_ = screen.gameObj.var_134.getAvailableClothingTags(ClothingItem.TYPE_BANGS,_loc9_.gender,false,true);
               _loc9_.bangs = _loc13_[Math.floor(Math.random() * _loc13_.length)];
            }
            _loc1_.pitcher = new Worker(_loc1_.screen.gameObj,_loc1_.clip.pitcher,_loc9_,0,0,0.7);
            _loc1_.pitcher.playAnimation("pitchstand");
         }
      }
   }
}
