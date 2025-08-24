package sushiGame.screens
{
   import flash.display.MovieClip;
   import flash.events.*;
   import flash.geom.*;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   import package_2.class_6;
   import package_4.*;
   import sushiGame.data.*;
   import sushiGame.models.ChiliWorksPipe;
   
   public class MiniGameChiliWorks extends MiniGame
   {
       
      
      public var whichDifficulty:Number = 1;
      
      public var isIntro:Boolean = true;
      
      public var introTimer:Number = 0;
      
      public var introTimerMax:Number = 15;
      
      public var isOutro:Boolean = false;
      
      public var outroTimer:Number = 0;
      
      public var outroTimerMax:Number = 55;
      
      public var gridStartX:Number = 192;
      
      public var gridStartY:Number = 96;
      
      public var tileWidth:Number = 64;
      
      public var numRows:Number = 5;
      
      public var numColumns:Number = 5;
      
      public var gridArray:Array = null;
      
      public var particles:Vector.<MovieClip> = null;
      
      public var emittersX:Array;
      
      public var emittersY:Array;
      
      public var emittersDir:Array;
      
      public var emittersDelay:Array;
      
      public var particleTimer:Number = 0;
      
      public var spigotY:Number = 0;
      
      public var endY:Number = 0;
      
      public var bowlX:Number = 0;
      
      public var timerStart:Number = 450;
      
      public var currentTimer:Number = 0;
      
      public var postCheckTimer:Number = 0;
      
      public var barMinX:Number = 159;
      
      public var barRange:Number = 321;
      
      public var didCheckPipes:Boolean = false;
      
      public var didReachEnd:Boolean = false;
      
      public var didFillBowl:Boolean = false;
      
      public var finishedFillingBowl:Boolean = false;
      
      public var wheelSpeed:Number = 0;
      
      public var didPlaySound:Boolean = false;
      
      public var loopSound:SoundChannel = null;
      
      public var loopVolume:Number = 0;
      
      public const TYPE_STRAIGHT:String = "straight";
      
      public const TYPE_CURVE:String = "curve";
      
      public const TYPE_ALL:String = "all";
      
      public const TYPE_TEE:String = "tee";
      
      public const TYPE_CAP:String = "cap";
      
      public var leveldata:Array;
      
      public function MiniGameChiliWorks(param1:MiniGameScreen, param2:MovieClip, param3:String)
      {
         this.emittersX = [];
         this.emittersY = [];
         this.emittersDir = [];
         this.emittersDelay = [];
         this.leveldata = [[[null,null,null,null,null],[null,null,null,{
            "type":"curve",
            "rot":270
         },{
            "type":"curve",
            "rot":90,
            "locked":true
         }],[{
            "type":"straight",
            "rot":0,
            "locked":true
         },{
            "type":"curve",
            "rot":0
         },null,{
            "type":"straight",
            "rot":90,
            "locked":true
         },{
            "type":"straight",
            "rot":90
         }],[null,{
            "type":"curve",
            "rot":270,
            "locked":true
         },{
            "type":"straight",
            "rot":0
         },{
            "type":"curve",
            "rot":90
         },{
            "type":"curve",
            "rot":270,
            "locked":true
         }],[null,null,null,null,null],[3],[2],[15]],[[{
            "type":"curve",
            "rot":0
         },null,null,null,null],[{
            "type":"straight",
            "rot":90
         },{
            "type":"curve",
            "rot":0,
            "locked":true
         },{
            "type":"curve",
            "rot":0
         },null,{
            "type":"curve",
            "rot":0,
            "locked":true
         }],[{
            "type":"straight",
            "rot":0
         },{
            "type":"straight",
            "rot":0
         },{
            "type":"curve",
            "rot":90
         },{
            "type":"straight",
            "rot":90
         },{
            "type":"curve",
            "rot":90
         }],[{
            "type":"curve",
            "rot":90
         },{
            "type":"curve",
            "rot":0
         },null,null,null],[null,null,null,null,null],[1],[0],[10]],[[{
            "type":"straight",
            "rot":0
         },{
            "type":"tee",
            "rot":270
         },{
            "type":"straight",
            "rot":90
         },{
            "type":"curve",
            "rot":90
         },null],[null,{
            "type":"curve",
            "rot":270
         },{
            "type":"curve",
            "rot":180
         },{
            "type":"curve",
            "rot":0
         },{
            "type":"curve",
            "rot":180
         }],[null,null,{
            "type":"straight",
            "rot":0
         },null,{
            "type":"tee",
            "rot":270,
            "locked":true
         }],[null,null,{
            "type":"curve",
            "rot":0
         },{
            "type":"straight",
            "rot":0,
            "locked":true
         },{
            "type":"curve",
            "rot":270
         }],[null,null,null,null,null],[2],[0],[14]],[[{
            "type":"curve",
            "rot":90,
            "locked":true
         },null,null,null,null],[{
            "type":"curve",
            "rot":0
         },{
            "type":"tee",
            "rot":90
         },{
            "type":"straight",
            "rot":90
         },{
            "type":"straight",
            "rot":0,
            "locked":true
         },{
            "type":"curve",
            "rot":0
         }],[null,{
            "type":"curve",
            "rot":90
         },{
            "type":"curve",
            "rot":0
         },{
            "type":"curve",
            "rot":90
         },{
            "type":"curve",
            "rot":270
         }],[null,{
            "type":"curve",
            "rot":180
         },{
            "type":"tee",
            "rot":90,
            "locked":true
         },{
            "type":"curve",
            "rot":270
         },{
            "type":"straight",
            "rot":0,
            "locked":true
         }],[null,{
            "type":"curve",
            "rot":0
         },{
            "type":"curve",
            "rot":180
         },null,null],[3],[0],[15]],[[null,{
            "type":"curve",
            "rot":0
         },{
            "type":"curve",
            "rot":0
         },{
            "type":"cap",
            "rot":90
         },null],[null,{
            "type":"tee",
            "rot":180
         },{
            "type":"all",
            "rot":0,
            "locked":true
         },{
            "type":"tee",
            "rot":0
         },{
            "type":"curve",
            "rot":90,
            "locked":true
         }],[null,{
            "type":"cap",
            "rot":270
         },{
            "type":"straight",
            "rot":0
         },null,{
            "type":"curve",
            "rot":0
         }],[{
            "type":"straight",
            "rot":0,
            "locked":true
         },{
            "type":"curve",
            "rot":0
         },{
            "type":"curve",
            "rot":180
         },{
            "type":"tee",
            "rot":270
         },{
            "type":"curve",
            "rot":180
         }],[null,{
            "type":"curve",
            "rot":270,
            "locked":true
         },{
            "type":"straight",
            "rot":0
         },{
            "type":"tee",
            "rot":90
         },{
            "type":"curve",
            "rot":180
         }],[2],[3],[22]],[[null,{
            "type":"curve",
            "rot":0,
            "locked":true
         },{
            "type":"curve",
            "rot":180
         },null,null],[null,{
            "type":"straight",
            "rot":90
         },{
            "type":"curve",
            "rot":0
         },{
            "type":"straight",
            "rot":90
         },{
            "type":"curve",
            "rot":90,
            "locked":true
         }],[null,{
            "type":"tee",
            "rot":90
         },{
            "type":"tee",
            "rot":270
         },{
            "type":"straight",
            "rot":0
         },{
            "type":"tee",
            "rot":0
         }],[null,{
            "type":"curve",
            "rot":270
         },{
            "type":"all",
            "rot":0
         },{
            "type":"curve",
            "rot":0
         },{
            "type":"curve",
            "rot":270
         }],[{
            "type":"straight",
            "rot":0
         },{
            "type":"straight",
            "rot":90
         },{
            "type":"tee",
            "rot":0
         },{
            "type":"curve",
            "rot":180
         }],[3],[4],[15]],[[null,null,null,{
            "type":"curve",
            "rot":0
         },{
            "type":"curve",
            "rot":180
         }],[{
            "type":"curve",
            "rot":90,
            "locked":true
         },null,null,{
            "type":"straight",
            "rot":90
         },{
            "type":"curve",
            "rot":0
         }],[{
            "type":"tee",
            "rot":0
         },{
            "type":"curve",
            "rot":0
         },null,{
            "type":"curve",
            "rot":0
         },{
            "type":"curve",
            "rot":180
         }],[{
            "type":"straight",
            "rot":0
         },{
            "type":"curve",
            "rot":270,
            "locked":true
         },{
            "type":"curve",
            "rot":0
         },null,{
            "type":"straight",
            "rot":0
         }],[{
            "type":"curve",
            "rot":270
         },{
            "type":"straight",
            "rot":90
         },{
            "type":"tee",
            "rot":270
         },{
            "type":"straight",
            "rot":0
         },{
            "type":"curve",
            "rot":90
         }],[1],[1],[15]],[[{
            "type":"curve",
            "rot":0,
            "locked":true
         },{
            "type":"tee",
            "rot":90
         },{
            "type":"cap",
            "rot":0
         },{
            "type":"curve",
            "rot":0,
            "locked":true
         },{
            "type":"tee",
            "rot":180
         }],[{
            "type":"tee",
            "rot":270
         },{
            "type":"straight",
            "rot":0
         },{
            "type":"curve",
            "rot":270
         },{
            "type":"tee",
            "rot":270
         },{
            "type":"straight",
            "rot":0
         }],[{
            "type":"curve",
            "rot":270,
            "locked":true
         },{
            "type":"tee",
            "rot":180
         },{
            "type":"tee",
            "rot":0
         },{
            "type":"curve",
            "rot":90
         },{
            "type":"tee",
            "rot":0
         }],[null,null,{
            "type":"curve",
            "rot":270,
            "locked":true
         },{
            "type":"straight",
            "rot":90
         },{
            "type":"curve",
            "rot":180,
            "locked":true
         }],[null,null,null,null,null],[0],[1],[20]],[[{
            "type":"curve",
            "rot":90
         },{
            "type":"curve",
            "rot":90,
            "locked":true
         },{
            "type":"curve",
            "rot":270
         },{
            "type":"tee",
            "rot":270
         },{
            "type":"straight",
            "rot":0
         }],[{
            "type":"all",
            "rot":0
         },{
            "type":"tee",
            "rot":270
         },{
            "type":"cap",
            "rot":90
         },{
            "type":"straight",
            "rot":0
         },null],[{
            "type":"tee",
            "rot":270,
            "locked":true
         },{
            "type":"curve",
            "rot":90
         },{
            "type":"curve",
            "rot":0,
            "locked":true
         },{
            "type":"all",
            "rot":0
         },{
            "type":"curve",
            "rot":180
         }],[{
            "type":"straight",
            "rot":90
         },{
            "type":"cap",
            "rot":180
         },{
            "type":"curve",
            "rot":0
         },{
            "type":"all",
            "rot":0
         },{
            "type":"tee",
            "rot":180
         }],[{
            "type":"curve",
            "rot":270,
            "locked":true
         },{
            "type":"tee",
            "rot":270
         },{
            "type":"straight",
            "rot":90
         },{
            "type":"tee",
            "rot":0
         },{
            "type":"curve",
            "rot":180
         }],[0],[1],[20]],[[null,null,{
            "type":"curve",
            "rot":0,
            "locked":true
         },{
            "type":"curve",
            "rot":180
         },{
            "type":"curve",
            "rot":0,
            "locked":true
         }],[null,{
            "type":"curve",
            "rot":0
         },{
            "type":"tee",
            "rot":270
         },{
            "type":"curve",
            "rot":0
         },{
            "type":"tee",
            "rot":180
         }],[null,{
            "type":"straight",
            "rot":90,
            "locked":true
         },{
            "type":"curve",
            "rot":270
         },{
            "type":"tee",
            "rot":180
         },{
            "type":"curve",
            "rot":90
         }],[{
            "type":"cap",
            "rot":270
         },{
            "type":"all",
            "rot":0
         },{
            "type":"cap",
            "rot":270
         },{
            "type":"curve",
            "rot":0
         },{
            "type":"curve",
            "rot":180
         }],[{
            "type":"straight",
            "rot":0,
            "locked":true
         },{
            "type":"curve",
            "rot":180
         },null,{
            "type":"cap",
            "rot":180
         },{
            "type":"curve",
            "rot":180
         }],[0],[4],[22]],[[null,null,null,{
            "type":"cap",
            "rot":0
         },{
            "type":"curve",
            "rot":0
         }],[null,{
            "type":"cap",
            "rot":270
         },{
            "type":"curve",
            "rot":90
         },{
            "type":"straight",
            "rot":90
         },{
            "type":"curve",
            "rot":270
         }],[{
            "type":"tee",
            "rot":180
         },{
            "type":"all",
            "rot":0,
            "locked":true
         },{
            "type":"tee",
            "rot":270
         },{
            "type":"curve",
            "rot":270
         },{
            "type":"curve",
            "rot":90,
            "locked":true
         }],[{
            "type":"cap",
            "rot":270
         },{
            "type":"tee",
            "rot":90
         },{
            "type":"all",
            "rot":0
         },{
            "type":"curve",
            "rot":90
         },{
            "type":"curve",
            "rot":270
         }],[null,{
            "type":"curve",
            "rot":270,
            "locked":true
         },{
            "type":"tee",
            "rot":90
         },{
            "type":"cap",
            "rot":180
         },null],[3],[2],[20]],[[{
            "type":"straight",
            "rot":0
         },{
            "type":"straight",
            "rot":90
         },{
            "type":"tee",
            "rot":270
         },{
            "type":"curve",
            "rot":0
         },{
            "type":"cap",
            "rot":90
         }],[{
            "type":"curve",
            "rot":0,
            "locked":true
         },{
            "type":"straight",
            "rot":90
         },{
            "type":"all",
            "rot":0
         },{
            "type":"tee",
            "rot":0
         },{
            "type":"curve",
            "rot":180,
            "locked":true
         }],[{
            "type":"tee",
            "rot":90
         },{
            "type":"cap",
            "rot":0
         },{
            "type":"cap",
            "rot":0
         },{
            "type":"cap",
            "rot":180
         },null],[{
            "type":"straight",
            "rot":90,
            "locked":true
         },{
            "type":"curve",
            "rot":180
         },{
            "type":"tee",
            "rot":180
         },{
            "type":"tee",
            "rot":0
         },{
            "type":"curve",
            "rot":90
         }],[{
            "type":"curve",
            "rot":270
         },{
            "type":"curve",
            "rot":90
         },{
            "type":"curve",
            "rot":0
         },{
            "type":"straight",
            "rot":90
         },{
            "type":"tee",
            "rot":180,
            "locked":true
         }],[4],[0],[25]],[[{
            "type":"tee",
            "rot":270
         },{
            "type":"straight",
            "rot":0
         },{
            "type":"tee",
            "rot":180
         },{
            "type":"curve",
            "rot":90
         },null],[{
            "type":"curve",
            "rot":0
         },{
            "type":"curve",
            "rot":90
         },{
            "type":"cap",
            "rot":270
         },{
            "type":"tee",
            "rot":0
         },{
            "type":"cap",
            "rot":90,
            "locked":true
         }],[{
            "type":"cap",
            "rot":270
         },{
            "type":"tee",
            "rot":0
         },{
            "type":"straight",
            "rot":0,
            "locked":true
         },{
            "type":"curve",
            "rot":90
         },null],[{
            "type":"tee",
            "rot":0
         },{
            "type":"curve",
            "rot":0
         },{
            "type":"curve",
            "rot":90
         },{
            "type":"tee",
            "rot":270
         },{
            "type":"curve",
            "rot":180
         }],[{
            "type":"curve",
            "rot":270,
            "locked":true
         },{
            "type":"straight",
            "rot":0
         },{
            "type":"curve",
            "rot":180,
            "locked":true
         },{
            "type":"curve",
            "rot":270
         },{
            "type":"tee",
            "rot":0
         }],[4],[0],[24]],[[{
            "type":"curve",
            "rot":90
         },{
            "type":"tee",
            "rot":180
         },{
            "type":"tee",
            "rot":270
         },{
            "type":"cap",
            "rot":0
         },null],[{
            "type":"all",
            "rot":0
         },{
            "type":"curve",
            "rot":90
         },{
            "type":"curve",
            "rot":0
         },{
            "type":"tee",
            "rot":90
         },{
            "type":"curve",
            "rot":0
         }],[{
            "type":"curve",
            "rot":0
         },{
            "type":"tee",
            "rot":90
         },{
            "type":"tee",
            "rot":270
         },{
            "type":"all",
            "rot":0
         },{
            "type":"all",
            "rot":0,
            "locked":true
         }],[{
            "type":"cap",
            "rot":180
         },{
            "type":"tee",
            "rot":270
         },{
            "type":"cap",
            "rot":90
         },{
            "type":"tee",
            "rot":180
         },{
            "type":"curve",
            "rot":270
         }],[null,{
            "type":"curve",
            "rot":270,
            "locked":true
         },{
            "type":"straight",
            "rot":0
         },{
            "type":"tee",
            "rot":270
         },{
            "type":"cap",
            "rot":180
         }],[2],[1],[25]]];
         super(param1,param2,param3);
      }
      
      override public function setupScreen() : void
      {
         var _loc1_:MiniGameChiliWorks = this;
         _loc1_.clip = new minigameChiliworksMC();
         _loc1_.container.addChild(_loc1_.clip);
         _loc1_.screen.setTitle("Rico\'s Chiliworks");
         _loc1_.setupPrizes(_loc1_.type);
         _loc1_.screen.updateStars();
         _loc1_.reset();
         _loc1_.clip.spigot.wheel.addEventListener(MouseEvent.MOUSE_DOWN,this.clickWheel);
         _loc1_.clip.spigot.wheel.buttonMode = true;
         _loc1_.clip.spigot.wheel.useHandCursor = true;
         _loc1_.clip.bar.mask = _loc1_.clip.masker;
         if(_loc1_.whichDifficulty == 1)
         {
            _loc1_.clip.training.visible = true;
         }
         else
         {
            _loc1_.clip.training.visible = false;
         }
      }
      
      public function reset(param1:MouseEvent = null) : void
      {
         var _loc2_:MiniGameChiliWorks = this;
         _loc2_.decideDifficulty();
         _loc2_.setupPipes();
         _loc2_.setupParticles();
         _loc2_.isIntro = true;
         _loc2_.introTimer = 0;
         _loc2_.currentTimer = _loc2_.timerStart;
         _loc2_.didCheckPipes = false;
         _loc2_.particleTimer = 0;
         _loc2_.wheelSpeed = 0;
         _loc2_.didFillBowl = false;
         _loc2_.finishedFillingBowl = false;
         _loc2_.postCheckTimer = 0;
         _loc2_.didReachEnd = false;
         _loc2_.didPlaySound = false;
         _loc2_.clip.bar.x = _loc2_.barMinX + _loc2_.barRange;
      }
      
      public function decideDifficulty() : void
      {
         var _loc1_:MiniGameChiliWorks = this;
         var _loc2_:Number = _loc1_.getStartingLevel();
         if(_loc2_ < 14)
         {
            _loc1_.whichDifficulty = _loc2_ + 1;
         }
         else
         {
            _loc1_.whichDifficulty = 5 + Math.ceil(Math.random() * 9);
         }
      }
      
      override public function updateScreen() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:SoundTransform = null;
         var _loc1_:MiniGameChiliWorks = this;
         if(_loc1_.isIntro)
         {
            ++_loc1_.introTimer;
            if(_loc1_.introTimer >= _loc1_.introTimerMax)
            {
               _loc1_.isIntro = false;
            }
         }
         else if(!_loc1_.didCheckPipes)
         {
            --_loc1_.currentTimer;
            if(_loc1_.currentTimer == 0 && !_loc1_.didCheckPipes)
            {
               _loc1_.checkPipes();
            }
         }
         if(_loc1_.gridArray != null)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc1_.numRows)
            {
               _loc2_ = 0;
               while(_loc2_ < _loc1_.numColumns)
               {
                  if(_loc1_.gridArray[_loc3_][_loc2_] is ChiliWorksPipe)
                  {
                     _loc1_.gridArray[_loc3_][_loc2_].updatePipe();
                  }
                  _loc2_++;
               }
               _loc3_++;
            }
         }
         _loc1_.clip.timer_txt.text = this.getFormattedTimer();
         _loc1_.clip.bar.x = _loc1_.barMinX + _loc1_.currentTimer / _loc1_.timerStart * _loc1_.barRange;
         if(_loc1_.didCheckPipes)
         {
            _loc1_.updateParticles();
            ++_loc1_.postCheckTimer;
         }
         if(_loc1_.loopSound != null)
         {
            if(_loc1_.loopVolume < 0.5)
            {
               _loc1_.loopVolume += 0.02;
               if(_loc1_.loopVolume > 0.5)
               {
                  _loc1_.loopVolume = 0.5;
               }
            }
            if(_loc1_.screen.gameObj.var_128.isMute)
            {
               _loc1_.loopVolume = 0;
            }
            _loc4_ = new SoundTransform(_loc1_.loopVolume,0);
            _loc1_.loopSound.soundTransform = _loc4_;
         }
         if(_loc1_.isOutro)
         {
            ++_loc1_.outroTimer;
            if(_loc1_.outroTimer >= _loc1_.outroTimerMax)
            {
               _loc1_.isOutro = false;
               _loc1_.screen.finishMiniGame(_loc1_.skuToWin,_loc1_.amountToWin,_loc1_.skuIsClothing,_loc1_.skuClothingMode);
               if(_loc1_.loopSound)
               {
                  _loc1_.loopSound.stop();
                  _loc1_.loopSound = null;
                  _loc1_.screen.gameObj.var_128.playSound("chiliworks_finishpouring.wav",false,0.5);
               }
            }
         }
      }
      
      public function getFormattedTimer() : String
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc1_:MiniGameChiliWorks = this;
         var _loc2_:* = "";
         if(_loc1_.currentTimer <= 0)
         {
            _loc2_ = "00:00";
         }
         else
         {
            _loc3_ = Math.floor(_loc1_.currentTimer / 30);
            _loc5_ = (_loc4_ = _loc1_.currentTimer - _loc3_ * 30) / 30;
            _loc6_ = Math.floor(_loc5_ * 100);
            if(_loc3_ < 10)
            {
               _loc2_ = "0" + _loc3_;
            }
            else
            {
               _loc2_ = "" + _loc3_;
            }
            _loc2_ += ":";
            if(_loc6_ < 10)
            {
               _loc2_ += "0" + _loc6_;
            }
            else
            {
               _loc2_ += "" + _loc6_;
            }
         }
         return _loc2_;
      }
      
      public function clickWheel(param1:MouseEvent) : void
      {
         var _loc2_:MiniGameChiliWorks = this;
         if(!_loc2_.didCheckPipes)
         {
            _loc2_.checkPipes();
         }
      }
      
      public function checkPipes() : void
      {
         var _loc1_:MiniGameChiliWorks = this;
         class_6.method_1("CHECK PIPES");
         var _loc2_:Number = _loc1_.spigotY;
         var _loc3_:Number = _loc1_.numColumns - 1;
         var _loc4_:ChiliWorksPipe = _loc1_.gridArray[_loc2_][_loc3_];
         var _loc5_:Boolean = false;
         if(_loc4_ != null)
         {
            _loc5_ = _loc4_.checkPipe("right","",0);
         }
         if(_loc5_ == true && _loc1_.didReachEnd == true)
         {
            _loc1_.didFillBowl = true;
            _loc1_.emittersX.push(70);
            _loc1_.emittersY.push(70 + _loc1_.gridStartY + _loc1_.endY * _loc1_.tileWidth);
            _loc1_.emittersDir.push("up");
            _loc1_.emittersDelay.push(40);
            _loc1_.decidePrize();
         }
         else
         {
            _loc1_.didFillBowl = false;
            _loc1_.skuToWin = null;
            _loc1_.amountToWin = 0;
            _loc1_.skuIsClothing = false;
            _loc1_.skuClothingMode = "";
         }
         class_6.method_1("Success?: " + _loc5_ + ".  Did reach end?: " + this.didReachEnd);
         class_6.method_1("Number of emitters: " + _loc1_.emittersX.length);
         if(_loc1_.emittersX.length == 0)
         {
            class_6.method_1("(Closed system, immediately fail)");
            _loc1_.screen.gameObj.var_128.playMusicClip("customer_decent.wav");
            _loc1_.didPlaySound = true;
            _loc1_.isOutro = true;
            _loc1_.outroTimer = 0;
         }
         _loc1_.wheelSpeed = 40;
         _loc1_.didCheckPipes = true;
         _loc1_.outroTimer = 0;
         _loc1_.screen.gameObj.var_128.playSound("chiliworks_startpouring.wav",false,0.5);
         _loc1_.loopSound = _loc1_.screen.gameObj.var_128.playSound("chiliworks_pourloop.wav",true,0);
      }
      
      public function getPipe(param1:Number, param2:Number) : ChiliWorksPipe
      {
         var _loc3_:MiniGameChiliWorks = this;
         var _loc4_:ChiliWorksPipe = null;
         if(param2 < _loc3_.gridArray.length && param2 >= 0 && param1 < _loc3_.gridArray[param2].length && param1 >= 0)
         {
            _loc4_ = _loc3_.gridArray[param2][param1];
         }
         return _loc4_;
      }
      
      override public function destroy() : void
      {
         var _loc1_:MiniGameChiliWorks = this;
         if(_loc1_.loopSound)
         {
            _loc1_.loopSound.stop();
            _loc1_.loopSound = null;
         }
         _loc1_.cleanupPipes();
         _loc1_.cleanupParticles();
         _loc1_.clip.spigot.wheel.removeEventListener(MouseEvent.MOUSE_DOWN,this.clickWheel);
         _loc1_.container.removeChild(_loc1_.clip);
         _loc1_.clip = null;
      }
      
      public function setupParticles() : void
      {
         var _loc1_:MiniGameChiliWorks = this;
         _loc1_.cleanupParticles();
         if(_loc1_.particles == null)
         {
            _loc1_.particles = new Vector.<MovieClip>();
         }
         _loc1_.emittersX = [];
         _loc1_.emittersY = [];
         _loc1_.emittersDir = [];
         _loc1_.emittersDelay = [];
      }
      
      public function cleanupParticles() : void
      {
         var _loc2_:int = 0;
         var _loc1_:MiniGameChiliWorks = this;
         if(_loc1_.particles != null && _loc1_.particles.length > 0)
         {
            _loc2_ = int(_loc1_.particles.length - 1);
            while(_loc2_ >= 0)
            {
               if(_loc1_.particles[_loc2_] != null)
               {
                  if(_loc1_.particles[_loc2_].parent)
                  {
                     _loc1_.particles[_loc2_].parent.removeChild(_loc1_.particles[_loc2_]);
                  }
                  _loc1_.particles[_loc2_] = null;
                  _loc1_.particles.splice(_loc2_,1);
               }
               _loc2_--;
            }
         }
         _loc1_.particles = null;
      }
      
      public function updateParticles() : void
      {
         var _loc2_:int = 0;
         var _loc3_:MovieClip = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Boolean = false;
         var _loc9_:Number = NaN;
         var _loc10_:MovieClip = null;
         var _loc1_:MiniGameChiliWorks = this;
         if(_loc1_.wheelSpeed > 0)
         {
            _loc1_.wheelSpeed -= 2;
            _loc1_.clip.spigot.wheel.rotation += _loc1_.wheelSpeed;
            if(_loc1_.wheelSpeed <= 0)
            {
               _loc1_.wheelSpeed = 0;
            }
         }
         else if(_loc1_.wheelSpeed == 0)
         {
            ++_loc1_.particleTimer;
            if(_loc1_.finishedFillingBowl == false)
            {
               _loc2_ = 0;
               while(_loc2_ < _loc1_.emittersX.length)
               {
                  if((_loc1_.emittersX.length == 1 && _loc1_.postCheckTimer % 3 == 0 || _loc1_.postCheckTimer % _loc1_.emittersX.length == _loc2_) && _loc1_.postCheckTimer >= _loc1_.emittersDelay[_loc2_])
                  {
                     _loc3_ = new chiliworks_chilibit();
                     _loc3_.gotoAndStop(Math.ceil(Math.random() * _loc3_.totalFrames));
                     _loc4_ = _loc1_.gridStartX + _loc1_.emittersX[_loc2_] * _loc1_.tileWidth;
                     _loc5_ = _loc1_.gridStartY + _loc1_.emittersY[_loc2_] * _loc1_.tileWidth;
                     _loc6_ = 0;
                     _loc7_ = 0;
                     _loc8_ = false;
                     if(!_loc1_.didPlaySound)
                     {
                        if(_loc1_.didFillBowl)
                        {
                           _loc1_.screen.gameObj.var_128.playMusicClip("customer_happy.wav");
                        }
                        else
                        {
                           _loc1_.screen.gameObj.var_128.playMusicClip("customer_decent.wav");
                        }
                        _loc1_.didPlaySound = true;
                        _loc1_.isOutro = true;
                        _loc1_.outroTimer = 0;
                     }
                     if(_loc1_.emittersX[_loc2_] > _loc1_.numColumns)
                     {
                        _loc4_ = Number(_loc1_.emittersX[_loc2_]);
                        _loc5_ = Number(_loc1_.emittersY[_loc2_]);
                        _loc8_ = true;
                     }
                     _loc9_ = 0.5 + Math.random() * 0.5;
                     if(_loc1_.emittersDir[_loc2_] == "down")
                     {
                        _loc5_ += _loc1_.tileWidth / 2;
                        _loc6_ = Math.random() * 2 - 1;
                        _loc7_ = 0 - Math.random() * 5;
                     }
                     else if(_loc1_.emittersDir[_loc2_] == "up")
                     {
                        _loc5_ -= _loc1_.tileWidth / 2;
                        _loc6_ = Math.random() * 2 - 1;
                        _loc7_ = 0 + Math.random() * 2;
                     }
                     else if(_loc1_.emittersDir[_loc2_] == "left")
                     {
                        _loc4_ -= _loc1_.tileWidth / 2;
                        _loc6_ = 3 + Math.random() * 3;
                        _loc7_ = 0 + Math.random() * 2;
                     }
                     else if(_loc1_.emittersDir[_loc2_] == "right")
                     {
                        _loc4_ += _loc1_.tileWidth / 2;
                        _loc6_ = 0 - 3 - Math.random() * 3;
                        _loc7_ = 0 + Math.random() * 2;
                     }
                     else if(_loc1_.emittersDir[_loc2_] == "oobright")
                     {
                        _loc4_ += _loc1_.tileWidth / 2;
                        _loc6_ = 0 - 7 - Math.random() * 4;
                        _loc7_ = 0;
                     }
                     if(_loc8_)
                     {
                        _loc6_ = 0;
                     }
                     _loc3_.x = _loc4_;
                     _loc3_.y = _loc5_;
                     _loc3_.speedX = _loc6_;
                     _loc3_.speedY = _loc7_;
                     _loc3_.scaleX = _loc9_;
                     _loc3_.scaleY = _loc9_;
                     _loc3_.isFinal = _loc8_;
                     if(_loc1_.emittersDir[_loc2_] == "right" || _loc1_.emittersDir[_loc2_] == "down")
                     {
                        _loc1_.clip.holder.addChildAt(_loc3_,0);
                     }
                     else
                     {
                        _loc1_.clip.holder.addChild(_loc3_);
                     }
                     _loc1_.particles.push(_loc3_);
                  }
                  _loc2_++;
               }
            }
            _loc2_ = int(_loc1_.particles.length - 1);
            while(_loc2_ >= 0)
            {
               _loc10_ = _loc1_.particles[_loc2_];
               _loc10_.speedY += 0.4;
               if(_loc10_.speedX > 0)
               {
                  _loc10_.speedX -= 0.08;
                  if(_loc10_.speedX < 0)
                  {
                     _loc10_.speedX = 0;
                  }
               }
               else if(_loc10_.speedX < 0)
               {
                  _loc10_.speedX += 0.08;
                  if(_loc10_.speedX > 0)
                  {
                     _loc10_.speedX = 0;
                  }
               }
               _loc10_.x += _loc10_.speedX;
               _loc10_.y += _loc10_.speedY;
               if(_loc1_.didFillBowl && _loc10_.isFinal === true && _loc10_.y > 417 && _loc1_.clip.bowl.fillup.currentFrame == 1)
               {
                  _loc1_.clip.bowl.fillup.gotoAndPlay(2);
               }
               if(_loc10_.y > 480)
               {
                  if(_loc10_.parent)
                  {
                     _loc10_.parent.removeChild(_loc10_);
                  }
                  _loc1_.particles.splice(_loc2_,1);
               }
               _loc2_--;
            }
            if(_loc1_.didFillBowl == true && _loc1_.finishedFillingBowl == false && _loc1_.clip.bowl.fillup.currentFrame == _loc1_.clip.bowl.fillup.totalFrames)
            {
               _loc1_.finishedFillingBowl = true;
               if(_loc1_.loopSound)
               {
                  _loc1_.loopSound.stop();
                  _loc1_.loopSound = null;
               }
               _loc1_.screen.gameObj.var_128.playSound("chiliworks_finishpouring.wav",false,0.5);
            }
         }
      }
      
      public function setupPipes() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc6_:Array = null;
         var _loc7_:String = null;
         var _loc8_:Number = NaN;
         var _loc9_:Boolean = false;
         var _loc10_:ChiliWorksPipe = null;
         var _loc1_:MiniGameChiliWorks = this;
         if(_loc1_.gridArray == null)
         {
            _loc1_.gridArray = [];
            _loc2_ = 0;
            while(_loc2_ < _loc1_.numRows)
            {
               _loc6_ = [];
               _loc3_ = 0;
               while(_loc3_ < _loc1_.numColumns)
               {
                  _loc6_.push(null);
                  _loc3_++;
               }
               _loc1_.gridArray.push(_loc6_);
               _loc2_++;
            }
         }
         _loc1_.cleanupPipes();
         var _loc4_:Number;
         if((_loc4_ = _loc1_.whichDifficulty) > _loc1_.leveldata.length)
         {
            _loc4_ = _loc1_.leveldata.length;
         }
         var _loc5_:Array = _loc1_.leveldata[_loc4_ - 1];
         _loc3_ = 0;
         while(_loc3_ < _loc1_.numRows)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc1_.numColumns)
            {
               if(_loc5_[_loc3_][_loc2_] != null)
               {
                  _loc7_ = String(_loc5_[_loc3_][_loc2_].type);
                  _loc8_ = Number(_loc5_[_loc3_][_loc2_].rot);
                  _loc9_ = false;
                  if(_loc5_[_loc3_][_loc2_].locked === true)
                  {
                     _loc9_ = true;
                  }
                  _loc10_ = new ChiliWorksPipe(_loc1_,_loc7_,_loc8_,_loc9_,_loc2_,_loc3_);
                  _loc1_.gridArray[_loc3_][_loc2_] = _loc10_;
               }
               _loc2_++;
            }
            _loc3_++;
         }
         _loc1_.spigotY = _loc5_[_loc1_.numRows][0];
         _loc1_.clip.spigot.y = _loc1_.gridStartY + _loc1_.spigotY * _loc1_.tileWidth;
         _loc1_.endY = _loc5_[_loc1_.numRows + 1][0];
         _loc1_.clip.endpiece.y = _loc1_.gridStartY + _loc1_.endY * _loc1_.tileWidth;
         _loc1_.clip.bowl.fillup.gotoAndStop(1);
         _loc1_.timerStart = _loc5_[_loc1_.numRows + 2][0] * 30;
      }
      
      public function cleanupPipes() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:MiniGameChiliWorks = this;
         if(_loc1_.gridArray != null)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc1_.gridArray.length)
            {
               _loc2_ = 0;
               while(_loc2_ < _loc1_.gridArray[_loc3_].length)
               {
                  if(_loc1_.gridArray[_loc3_][_loc2_] is ChiliWorksPipe && _loc1_.gridArray[_loc3_][_loc2_] != null)
                  {
                     _loc1_.gridArray[_loc3_][_loc2_].destroy();
                     _loc1_.gridArray[_loc3_][_loc2_] = null;
                  }
                  _loc2_++;
               }
               _loc3_++;
            }
         }
      }
   }
}
