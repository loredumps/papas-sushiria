package sushiGame.screens
{
   import flash.display.*;
   import flash.events.*;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import package_2.*;
   import package_4.*;
   import sushiGame.data.*;
   
   public class MiniGameMess extends MiniGame
   {
       
      
      public var whichDifficulty:Number = 1;
      
      public var allowedMisses:Number = 3;
      
      public var currentMisses:Number = 0;
      
      public var isIntro:Boolean = true;
      
      public var introTimer:Number = 0;
      
      public var introTimerMax:Number = 30;
      
      public var isOutro:Boolean = false;
      
      public var outroTimer:Number = 0;
      
      public var outroTimerMax:Number = 40;
      
      public var tileWidth:Number = 45;
      
      public var sheetWidth:Number = 37;
      
      public var sheetHeight:Number = 2;
      
      public var totalPossibleObjects:Number = 74;
      
      public var numObjects:Number = 6;
      
      public var maxObjects:Number = 6;
      
      public var whichObjects:Array;
      
      public var foundObjects:Array;
      
      public var maxTime:Number = 600;
      
      public var currTime:Number = 600;
      
      public var isRunning:Boolean = false;
      
      public var tileSheet:BitmapData;
      
      public var tileColors:BitmapData;
      
      public var imageColors:BitmapData;
      
      public var colorthumbs:Vector.<BitmapData>;
      
      public var thumbs:Vector.<BitmapData>;
      
      public var thumbBitmaps:Vector.<Bitmap>;
      
      public var foundAllObjects:Boolean = false;
      
      public var missedColors:Array;
      
      public var cookiesClicked:Number = 0;
      
      public function MiniGameMess(param1:MiniGameScreen, param2:MovieClip, param3:String)
      {
         this.whichObjects = [];
         this.foundObjects = [];
         this.missedColors = [];
         super(param1,param2,param3);
      }
      
      override public function setupScreen() : void
      {
         var _loc1_:MiniGameMess = this;
         _loc1_.clip = new minigameMessMC();
         _loc1_.container.addChild(_loc1_.clip);
         _loc1_.screen.setTitle("Mitch\'s Mess");
         _loc1_.setupPrizes(_loc1_.type);
         _loc1_.screen.updateStars();
         _loc1_.thumbs = new Vector.<BitmapData>();
         _loc1_.thumbBitmaps = new Vector.<Bitmap>();
         _loc1_.colorthumbs = new Vector.<BitmapData>();
         _loc1_.tileSheet = new mess_thumbimage(0,0);
         _loc1_.tileColors = new mess_thumbcolor(0,0);
         _loc1_.imageColors = new mess_maincolor(0,0);
         _loc1_.reset();
         _loc1_.clip.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickScreen);
         if(_loc1_.whichDifficulty == 1)
         {
            _loc1_.clip.trainer.visible = true;
         }
         else
         {
            _loc1_.clip.trainer.visible = false;
         }
      }
      
      public function reset(param1:MouseEvent = null) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:BitmapData = null;
         var _loc9_:Bitmap = null;
         var _loc10_:BitmapData = null;
         var _loc2_:MiniGameMess = this;
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
         _loc2_.currTime = _loc2_.maxTime;
         _loc2_.whichObjects = [];
         _loc2_.foundObjects = [];
         _loc3_ = 0;
         while(_loc3_ < _loc2_.numObjects)
         {
            _loc4_ = Math.floor(Math.random() * _loc2_.totalPossibleObjects);
            while(_loc2_.whichObjects.indexOf(_loc4_) > -1)
            {
               _loc4_ = Math.floor(Math.random() * _loc2_.totalPossibleObjects);
            }
            _loc2_.whichObjects.push(_loc4_);
            _loc2_.foundObjects.push(false);
            _loc3_++;
         }
         if(_loc2_.whichDifficulty == 1)
         {
            _loc2_.whichObjects = [40,64,42];
         }
         trace("Objects: " + _loc2_.whichObjects.toString());
         _loc2_.clearThumbs();
         _loc3_ = 1;
         while(_loc3_ <= _loc2_.maxObjects)
         {
            _loc2_.clip["thumb" + _loc3_].visible = false;
            _loc2_.clip["check" + _loc3_].visible = false;
            _loc2_.clip["check" + _loc3_].gotoAndStop(1);
            if(_loc3_ <= _loc2_.numObjects)
            {
               _loc2_.clip["thumb" + _loc3_].visible = true;
               _loc5_ = Number(_loc2_.whichObjects[_loc3_ - 1]);
               _loc6_ = Math.floor(_loc5_ / _loc2_.sheetWidth);
               _loc7_ = _loc5_ - _loc6_ * _loc2_.sheetWidth;
               trace("Obj = " + _loc5_ + ". Y = " + _loc6_ + ", X = " + _loc7_);
               (_loc8_ = new BitmapData(_loc2_.tileWidth,_loc2_.tileWidth,false,0)).copyPixels(_loc2_.tileSheet,new Rectangle(_loc7_ * _loc2_.tileWidth,_loc6_ * _loc2_.tileWidth,_loc2_.tileWidth,_loc2_.tileWidth),new Point(0,0));
               _loc9_ = new Bitmap(_loc8_);
               _loc2_.clip["thumb" + _loc3_].addChild(_loc9_);
               (_loc10_ = new BitmapData(_loc2_.tileWidth,_loc2_.tileWidth,false,0)).copyPixels(_loc2_.tileColors,new Rectangle(_loc7_ * _loc2_.tileWidth,_loc6_ * _loc2_.tileWidth,_loc2_.tileWidth,_loc2_.tileWidth),new Point(0,0));
               _loc2_.thumbBitmaps.push(_loc9_);
               _loc2_.thumbs.push(_loc8_);
               _loc2_.colorthumbs.push(_loc10_);
            }
            _loc3_++;
         }
         _loc2_.formatTime(this.maxTime);
         _loc2_.isIntro = true;
         _loc2_.introTimer = 0;
      }
      
      public function clearThumbs() : void
      {
         var _loc2_:int = 0;
         var _loc1_:MiniGameMess = this;
         _loc2_ = 0;
         while(_loc2_ < _loc1_.colorthumbs.length)
         {
            _loc1_.colorthumbs[_loc2_].dispose();
            _loc1_.thumbs[_loc2_].dispose();
            _loc1_.thumbBitmaps[_loc2_].parent.removeChild(_loc1_.thumbBitmaps[_loc2_]);
            _loc1_.colorthumbs[_loc2_] = null;
            _loc1_.thumbs[_loc2_] = null;
            _loc1_.thumbBitmaps[_loc2_] = null;
            _loc2_++;
         }
         _loc1_.colorthumbs = null;
         _loc1_.thumbs = null;
         _loc1_.thumbBitmaps = null;
         _loc1_.colorthumbs = new Vector.<BitmapData>();
         _loc1_.thumbs = new Vector.<BitmapData>();
         _loc1_.thumbBitmaps = new Vector.<Bitmap>();
      }
      
      public function decideDifficulty() : void
      {
         var _loc1_:MiniGameMess = this;
         var _loc2_:Number = _loc1_.getStartingLevel();
         if(_loc2_ < _loc1_.screen.maxDifficulty)
         {
            _loc1_.whichDifficulty = _loc2_ + 1;
         }
         else
         {
            _loc1_.whichDifficulty = 14;
         }
         if(_loc1_.whichDifficulty == 1)
         {
            _loc1_.numObjects = 3;
            _loc1_.maxTime = 600;
         }
         else if(_loc1_.whichDifficulty == 2)
         {
            _loc1_.numObjects = 3;
            _loc1_.maxTime = 540;
         }
         else if(_loc1_.whichDifficulty == 3)
         {
            _loc1_.numObjects = 4;
            _loc1_.maxTime = 540;
         }
         else if(_loc1_.whichDifficulty == 4)
         {
            _loc1_.numObjects = 4;
            _loc1_.maxTime = 480;
         }
         else if(_loc1_.whichDifficulty == 6)
         {
            _loc1_.numObjects = 5;
            _loc1_.maxTime = 540;
         }
         else if(_loc1_.whichDifficulty == 7)
         {
            _loc1_.numObjects = 5;
            _loc1_.maxTime = 480;
         }
         else
         {
            _loc1_.numObjects = 6;
            _loc1_.maxTime = 600;
         }
      }
      
      public function checkSuccess() : void
      {
         var _loc1_:MiniGameMess = this;
         if(_loc1_.foundAllObjects)
         {
            _loc1_.decidePrize();
            _loc1_.screen.gameObj.var_128.playMusicClip("customer_happy.wav");
         }
         else
         {
            _loc1_.skuToWin = null;
            _loc1_.amountToWin = 0;
            _loc1_.skuIsClothing = false;
            _loc1_.skuClothingMode = "";
            _loc1_.screen.gameObj.var_128.playMusicClip("customer_decent.wav");
         }
      }
      
      override public function updateScreen() : void
      {
         var _loc1_:MiniGameMess = this;
         if(_loc1_.isIntro)
         {
            ++_loc1_.introTimer;
            if(_loc1_.introTimer >= _loc1_.introTimerMax)
            {
               _loc1_.isIntro = false;
               _loc1_.startSearch();
            }
         }
         if(_loc1_.isRunning)
         {
            --_loc1_.currTime;
            _loc1_.formatTime(_loc1_.currTime);
            if(_loc1_.currTime == 0)
            {
               _loc1_.endGame();
            }
         }
         if(_loc1_.isOutro)
         {
            ++_loc1_.outroTimer;
            if(_loc1_.outroTimer >= _loc1_.outroTimerMax)
            {
               _loc1_.isOutro = false;
               _loc1_.screen.finishMiniGame(_loc1_.skuToWin,_loc1_.amountToWin,_loc1_.skuIsClothing,_loc1_.skuClothingMode);
            }
         }
      }
      
      public function endGame() : void
      {
         var _loc1_:MiniGameMess = this;
         _loc1_.isRunning = false;
         _loc1_.isIntro = false;
         _loc1_.isOutro = true;
         _loc1_.checkSuccess();
         _loc1_.outroTimer = 0;
      }
      
      public function startSearch() : void
      {
         var _loc1_:MiniGameMess = this;
         _loc1_.isRunning = true;
      }
      
      public function formatTime(param1:Number) : void
      {
         var _loc2_:MiniGameMess = this;
         var _loc3_:Number = Math.floor(param1 / 30);
         var _loc4_:Number = Math.floor((param1 - _loc3_ * 30) / 30 * 100);
         if(_loc3_ < 10)
         {
            _loc2_.clip.time_txt.text = "0" + _loc3_;
         }
         else
         {
            _loc2_.clip.time_txt.text = _loc3_;
         }
         if(_loc4_ < 10)
         {
            _loc2_.clip.cents_txt.text = ":0" + _loc4_;
         }
         else
         {
            _loc2_.clip.cents_txt.text = ":" + _loc4_;
         }
      }
      
      override public function destroy() : void
      {
         var _loc1_:MiniGameMess = this;
         _loc1_.clearThumbs();
         _loc1_.missedColors = null;
         if(_loc1_.tileSheet)
         {
            _loc1_.tileSheet.dispose();
            _loc1_.tileSheet = null;
         }
         if(_loc1_.tileColors)
         {
            _loc1_.tileColors.dispose();
            _loc1_.tileColors = null;
         }
         if(_loc1_.imageColors)
         {
            _loc1_.imageColors.dispose();
            _loc1_.imageColors = null;
         }
         _loc1_.clip.removeEventListener(Event.ENTER_FRAME,_loc1_.updateScreen);
         _loc1_.clip.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickScreen);
         _loc1_.container.removeChild(_loc1_.clip);
         _loc1_.clip = null;
      }
      
      public function clickScreen(param1:MouseEvent) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:uint = 0;
         var _loc6_:Boolean = false;
         var _loc7_:int = 0;
         var _loc8_:Boolean = false;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc2_:MiniGameMess = this;
         if(_loc2_.isRunning)
         {
            _loc3_ = _loc2_.clip.mouseX;
            _loc4_ = _loc2_.clip.mouseY;
            _loc5_ = _loc2_.imageColors.getPixel(_loc3_,_loc4_);
            _loc6_ = false;
            _loc7_ = 0;
            while(_loc7_ < _loc2_.colorthumbs.length)
            {
               if(_loc2_.foundObjects[_loc7_] == false)
               {
                  if(_loc5_ == _loc2_.colorthumbs[_loc7_].getPixel(2,2))
                  {
                     trace("MATCH!");
                     _loc2_.foundObjects[_loc7_] = true;
                     _loc2_.clip["check" + (_loc7_ + 1)].visible = true;
                     _loc2_.clip["check" + (_loc7_ + 1)].gotoAndPlay(2);
                     _loc6_ = true;
                     _loc2_.screen.gameObj.var_128.playSound("getstar.wav");
                     break;
                  }
               }
               _loc7_++;
            }
            if(!_loc6_)
            {
               ++_loc2_.currentMisses;
               if(_loc2_.missedColors.indexOf(_loc5_) == -1)
               {
                  _loc2_.missedColors.push(_loc5_);
                  if(_loc5_ == 39168 || _loc5_ == 6684672 || _loc5_ == 3355494 || _loc5_ == 6723993)
                  {
                     ++_loc2_.cookiesClicked;
                     if(_loc2_.cookiesClicked == 3)
                     {
                        _loc2_.screen.gameObj.var_136.recordTagged("cookieclicker");
                     }
                  }
               }
               _loc2_.screen.gameObj.var_128.playSound("boing.wav");
               _loc10_ = 1;
               while(_loc10_ <= 3)
               {
                  if(_loc10_ <= _loc2_.currentMisses)
                  {
                     _loc2_.clip["strike_" + _loc10_].gotoAndStop(2);
                  }
                  else
                  {
                     _loc2_.clip["strike_" + _loc10_].gotoAndStop(1);
                  }
                  _loc10_++;
               }
               if(_loc2_.currentMisses >= 3)
               {
                  _loc2_.endGame();
               }
            }
            _loc8_ = true;
            _loc9_ = 0;
            while(_loc9_ < _loc2_.foundObjects.length)
            {
               if(_loc2_.foundObjects[_loc9_] === false)
               {
                  _loc8_ = false;
                  break;
               }
               _loc9_++;
            }
            if(_loc8_)
            {
               _loc2_.foundAllObjects = true;
               _loc2_.endGame();
            }
         }
      }
   }
}
