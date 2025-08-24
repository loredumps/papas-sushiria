package sushiGame.screens
{
   import flash.display.*;
   import flash.events.*;
   import flash.geom.*;
   import flash.utils.getDefinitionByName;
   import package_2.*;
   import package_4.*;
   import sushiGame.data.*;
   import sushiGame.models.Ramp;
   
   public class MiniGamePutt extends MiniGame
   {
       
      
      public var currentPar:Number = 0;
      
      public var strokes:Number = 0;
      
      public var maxStrokes:Number = 8;
      
      public var aimMode:Number = 2;
      
      public var whichDifficulty:Number = 1;
      
      public var fence1Length:Number = 140;
      
      public var fence2Length:Number = 86;
      
      public var fence3Length:Number = 50;
      
      public var isSwinging:Boolean = false;
      
      public var swingTimer:Number = 0;
      
      public var swingTimerMax:Number = 14;
      
      public var swingMouseX:Number = 0;
      
      public var swingMouseY:Number = 0;
      
      public var isInHole:Boolean = false;
      
      public var isDone:Boolean = false;
      
      public var doneTimer:Number = 0;
      
      public var doneTimerMax:Number = 60;
      
      public var isMoving:Boolean = false;
      
      public var friction:Number = 0.98;
      
      public var normalFriction:Number = 0.98;
      
      public var ballSpeed:Number = 16;
      
      public var ballRadius:Number = 10;
      
      public var ballStartY:Number = 80;
      
      public var defaultRampDecay:Number = 0.5;
      
      public var ball:MovieClip;
      
      public var gravity:Number = 1;
      
      public var terminalVelocity:Number = 20;
      
      public var ballSpeedX:Number = 0;
      
      public var ballSpeedY:Number = 0;
      
      public var gameTimer:Number = 0;
      
      public var timeToLaunch:Number = 11;
      
      public var bumperTypes:Array;
      
      public var bumperRadii:Array;
      
      public var bumperBounce:Array;
      
      public var bottomBounds:Number = 430;
      
      public var didDropBelow:Boolean = false;
      
      public var dropBelowTimer:Number = 0;
      
      public var dropBelowTimerMax:Number = 30;
      
      public var holeX:Number = 400;
      
      public var holeY:Number = 240;
      
      public var startX:Number = 200;
      
      public var startY:Number = 240;
      
      public var gridWidth:Number = 10;
      
      public var gridHeight:Number = 7;
      
      public var tileWidth:Number = 64;
      
      public var tileHeight:Number = 64;
      
      public var tileGrid:Array;
      
      public var numTileRamps:Number = 0;
      
      public var rampCoords:Array;
      
      public var barCoords:Array;
      
      public var bumperCoords:Array;
      
      public var startEndCoords:Array;
      
      public var tileCoords:Array;
      
      public var pars:Array;
      
      public var ramps:Array;
      
      public var bumpers:Array;
      
      public var banks:Array;
      
      public var tiles:Array;
      
      public function MiniGamePutt(param1:MiniGameScreen, param2:MovieClip, param3:String)
      {
         this.bumperTypes = ["blueberry","cookie","banana","cherry"];
         this.bumperRadii = [5,12,32,20];
         this.bumperBounce = [2,2,3,3];
         this.tileGrid = [];
         this.rampCoords = [[0,0],[2,329],[87,480],[135,480],[189,385],[240,471],[289,385],[291,480],[348,480],[350,385],[399,471],[450,385],[506,480],[553,480],[638,330],[640,0],[0,0]];
         this.barCoords = [[],[[308,167,394,167,"fence2"]],[[463.5,241.25,543.5,272.25,"fence2"],[242,188,274,226,"fence3"],[84,228,115,267,"fence3"]],[[190,191.5,330,191.5,"fence1"],[298.5,191.5,384.5,191.5,"fence2"]],[],[[148,204,206,268,"fence2"],[295,401,350,335,"fence2"],[235,144,267,183,"fence3"]],[[316.5,121.5,322.5,207.5,"fence2"],[378.5,255.5,461.5,234.5,"fence2"]],[[357,128,360,268,"fence1"],[148,294,257,206,"fence1"],[114.75,258.5,117.75,172.5,"fence2"],[114.5,258.25,148.5,294.25,"fence3"]],[],[[381,130,521,130,"fence1"],[124,146,214,253,"fence1"],[61,238,171,151,"fence1"]],[],[[461,191,512,321,"fence1"],[461.1,190.9,541.1,159.9,"fence2"],[319,68,368,199,"fence1"],[425.05,155.95,461.05,190.95,"fence3"],[304,268,401,369,"fence1"],[233,345,140,240,"fence1"],[21,361,88,307,"fence2"]],[[318.5,193.5,378.5,132.5,"fence2"]],[],[[407,277,491,297,"fence2"]]];
         this.bumperCoords = [[],[[132,169,"blueberry"],[515,147,"cherry"],[117,243,"blueberry"],[176,121,"blueberry"],[187,194,"cherry"]],[[598,209,"cookie"],[147,187,"cookie"],[204,301,"cookie"],[439,199,"cherry"]],[[293,254,"banana"],[221,319,"banana"],[102,189,"banana"],[509,168,"cherry"],[445,395,"cherry"],[371,245,"blueberry"],[209,250,"blueberry"],[61,110,"banana"]],[[490,253,"cherry"],[169,289,"banana"],[119,206,"banana"],[168,285,"blueberry"]],[[129,180,"cherry"],[226,138,"blueberry"],[437,306,"blueberry"],[413,363,"cherry"],[36,270,"blueberry"],[516,305,"blueberry"],[476,299,"blueberry"],[553,331,"blueberry"],[531,91,"cherry"]],[[130,120.5,"cherry"],[58,183,"blueberry"],[138,307,"blueberry"],[68,240,"blueberry"],[123,261,"blueberry"],[566,287,"banana"]],[[291,255,"cookie"],[522,190,"cookie"],[450,249,"cherry"],[285,369,"cherry"],[255,119,"cherry"],[405,181,"blueberry"]],[[424,234,"banana"],[513,122,"cherry"],[257,125,"blueberry"],[126,59,"cherry"],[577,252,"blueberry"],[318,315,"cherry"]],[[150,316,"banana"],[486,208,"banana"],[146,151,"cookie"],[322,191,"blueberry"],[321,254,"blueberry"],[320,221,"blueberry"]],[[174,328,"cookie"],[463,170,"cookie"],[410,86,"cookie"],[439,65,"cookie"],[452,90,"cookie"],[192,205,"cherry"],[269,273,"cookie"],[582,121,"cherry"]],[[241,202,"cherry"],[379,113,"blueberry"],[122,414,"blueberry"],[303,346,"blueberry"],[468,381,"cherry"]],[[208,311,"banana"],[257,90,"cherry"],[131,189,"banana"],[590,244,"banana"]],[[314,387,"cookie"],[165,118,"cookie"],[162,364,"cookie"],[189,254,"cherry"],[322,193,"blueberry"],[355,225,"blueberry"],[383,258,"blueberry"],[514,252,"blueberry"],[548,223,"blueberry"],[580,190,"blueberry"]],[[158,258,"cherry"],[354,206,"banana"],[308,12,"cookie"],[493,249,"cookie"],[253,314,"cherry"],[544,364,"cherry"],[601,298,"cherry"]]];
         this.startEndCoords = [[],[158,329,479,263],[406,330,100,355],[287,375,292,134],[539,149,295,135],[132,336,482,143],[363,165,267,187],[212,207,482,124],[67,187,395,390],[440,373,138,233],[76,305,108,133],[509,217,87,369],[504,336,471,227],[442,341,485,164],[173,104,571,143]];
         this.tileCoords = [[],[[1,1,1,1,1,1,1,1,1,1],[1,3,0,0,0,0,0,0,2,1],[1,0,0,0,0,0,0,0,0,1],[1,0,0,0,0,0,0,0,0,1],[1,0,0,0,5,1,4,0,5,1],[1,4,0,5,1,1,1,1,1,1],[1,1,1,1,1,1,1,1,1,1]],[[1,1,1,1,1,1,1,1,1,1],[1,1,1,1,3,0,0,0,0,2],[3,0,0,0,0,0,5,4,0,0],[0,0,0,0,0,5,1,3,0,0],[0,0,0,0,5,3,0,0,0,0],[0,0,0,5,1,4,0,0,0,5],[4,0,5,1,1,1,1,1,1,1]],[[1,1,1,1,1,1,1,1,1,1],[1,1,3,0,0,0,2,3,2,1],[1,1,4,0,0,0,4,0,0,1],[1,1,3,0,0,0,2,4,0,1],[1,1,0,0,0,0,0,0,0,1],[1,1,4,0,0,0,5,4,0,1],[1,1,1,4,0,5,1,1,1,1]],[[1,1,1,1,1,1,1,1,1,1],[1,1,1,3,0,0,1,3,0,2],[1,0,0,0,0,5,3,0,0,0],[1,0,0,0,2,1,4,0,0,0],[1,0,0,0,0,0,0,0,0,5],[1,4,0,0,5,1,1,4,0,1],[1,1,1,1,1,1,1,1,1,1]],[[1,1,1,1,3,0,0,0,2,1],[1,1,3,0,0,0,0,0,0,2],[1,3,0,0,5,4,0,0,0,0],[0,0,0,0,2,1,4,0,0,0],[0,0,0,0,0,2,3,0,0,0],[4,0,0,0,0,0,0,0,0,5],[1,4,0,0,0,0,0,5,1,1]],[[1,1,1,1,1,1,1,1,1,1],[3,0,0,2,1,3,0,0,2,1],[0,0,0,0,0,0,0,0,0,1],[0,0,2,4,0,4,0,0,0,2],[4,0,0,2,1,3,0,0,0,0],[1,4,0,0,0,0,0,0,0,5],[1,1,1,1,4,0,5,1,1,1]],[[1,1,1,1,1,1,1,1,1,1],[1,3,2,1,1,1,3,0,2,1],[1,0,0,2,3,0,0,0,0,1],[1,0,0,0,0,0,5,4,0,1],[1,0,0,0,0,0,2,3,0,1],[1,4,0,5,1,4,0,0,5,1],[1,1,1,1,1,1,1,1,1,1]],[[0,5,4,0,0,2,3,0,0,0],[0,2,3,5,4,0,0,5,4,0],[0,0,0,2,3,0,0,2,3,0],[0,0,5,4,0,0,0,0,5,4],[4,0,2,3,5,4,0,0,2,3],[3,0,0,0,2,3,0,5,4,0],[0,0,5,4,0,0,0,2,3,0]],[[1,1,1,1,1,1,1,1,1,1],[3,0,0,0,0,0,0,0,2,1],[0,0,0,0,5,1,0,0,0,1],[0,0,0,0,1,1,0,0,0,1],[0,0,0,0,1,1,0,0,0,2],[1,4,0,5,1,3,0,0,0,5],[1,1,1,1,1,4,0,0,5,1]],[[1,1,1,1,1,1,1,1,1,1],[3,0,0,0,2,1,1,1,1,1],[4,0,5,4,0,0,0,0,2,1],[3,2,1,1,1,1,4,0,0,2],[0,0,0,0,0,0,2,0,0,5],[4,0,0,0,0,0,0,0,0,1],[1,1,1,1,1,1,1,1,1,1]],[[1,1,1,1,1,1,1,1,1,1],[1,1,1,1,3,0,0,0,2,1],[1,1,3,0,0,0,0,0,0,1],[3,0,0,0,0,0,0,0,0,1],[0,0,0,0,0,0,0,0,5,1],[0,0,0,0,0,0,5,1,1,1],[0,0,0,0,0,5,1,1,1,1]],[[1,1,1,1,1,1,1,1,1,1],[3,0,2,1,1,3,0,0,0,1],[0,5,4,0,0,0,5,3,0,1],[4,2,1,4,5,4,0,0,5,1],[1,0,0,0,0,2,1,3,2,1],[1,0,0,0,0,0,0,0,5,1],[1,1,1,1,1,1,4,5,1,1]],[[1,1,3,2,1,1,3,2,1,1],[1,3,0,0,0,0,0,0,2,3],[1,0,0,0,5,4,0,0,5,4],[1,4,5,4,2,1,4,5,1,3],[1,3,2,3,0,2,3,2,3,0],[1,4,0,0,0,0,0,5,4,0],[1,1,0,0,0,0,0,2,1,4]],[[1,1,3,2,1,1,1,1,1,1],[1,3,0,0,1,0,0,2,3,2],[3,0,0,5,3,0,2,4,0,5],[0,5,1,1,0,0,0,0,2,1],[0,2,1,1,4,0,0,0,5,1],[4,0,0,2,3,0,0,5,1,1],[1,1,4,0,0,5,1,1,1,1]]];
         this.pars = [0,2,5,4,4,4,4,5,4,4,5,6,5,5,5];
         this.ramps = [];
         this.bumpers = [];
         this.banks = [];
         this.tiles = [];
         super(param1,param2,param3);
      }
      
      override public function setupScreen() : void
      {
         var _loc1_:MiniGamePutt = this;
         _loc1_.clip = new minigamePuttMC();
         _loc1_.container.addChild(_loc1_.clip);
         _loc1_.screen.setTitle("Freeze-Putt");
         _loc1_.setupPrizes(_loc1_.type);
         _loc1_.screen.updateStars();
         _loc1_.decideDifficulty();
         _loc1_.ball = _loc1_.clip.ball;
         _loc1_.ball.mouseEnabled = false;
         _loc1_.ball.mouseChildren = false;
         _loc1_.resetBall();
         _loc1_.setupTiles();
         _loc1_.setupWalls();
         _loc1_.setupBumpers();
         _loc1_.setupPositions();
         _loc1_.screen.gameObj.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickScreen);
      }
      
      public function decideDifficulty() : void
      {
         var _loc1_:MiniGamePutt = this;
         var _loc2_:Number = _loc1_.getStartingLevel();
         if(_loc2_ < _loc1_.screen.maxDifficulty)
         {
            _loc1_.whichDifficulty = _loc2_ + 1;
         }
         else
         {
            _loc1_.whichDifficulty = Math.ceil(Math.random() * 14);
         }
      }
      
      public function setupTiles() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc1_:MiniGamePutt = this;
         _loc2_ = 0;
         while(_loc2_ < _loc1_.tiles.length)
         {
            _loc1_.clip.holder.removeChild(_loc1_.tiles[_loc2_]);
            _loc1_.tiles[_loc2_] = null;
            _loc2_++;
         }
         _loc1_.tiles = null;
         _loc1_.tiles = [];
         _loc1_.tileGrid = null;
         _loc1_.tileGrid = [];
         _loc3_ = 0;
         while(_loc3_ < _loc1_.gridHeight)
         {
            _loc1_.tileGrid.push([]);
            _loc2_ = 0;
            while(_loc2_ < _loc1_.gridWidth)
            {
               _loc1_.tileGrid[_loc3_][_loc2_] = _loc1_.tileCoords[_loc1_.whichDifficulty][_loc3_][_loc2_];
               _loc2_++;
            }
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < _loc1_.gridHeight)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc1_.gridWidth)
            {
               if(_loc1_.tileGrid[_loc3_][_loc2_] != 0)
               {
                  _loc1_.addTile(_loc2_,_loc3_,_loc1_.tileGrid[_loc3_][_loc2_]);
               }
               _loc2_++;
            }
            _loc3_++;
         }
      }
      
      public function addTile(param1:Number, param2:Number, param3:Number) : void
      {
         var _loc4_:MiniGamePutt = this;
         var _loc5_:MovieClip;
         (_loc5_ = new minigame_putt_tile()).x = param1 * _loc4_.tileWidth;
         _loc5_.y = param2 * _loc4_.tileHeight;
         _loc5_.gotoAndStop(param3);
         _loc5_.mouseEnabled = false;
         _loc5_.mouseChildren = false;
         _loc4_.clip.holder.addChild(_loc5_);
         _loc4_.tileGrid[param2][param1] = param3;
         _loc4_.tileCoords[_loc4_.whichDifficulty][param2][param1] = param3;
         _loc4_.tiles.push(_loc5_);
      }
      
      public function createOrUpdateRamp(param1:Number, param2:Number, param3:Number, param4:Number) : void
      {
         var _loc11_:Ramp = null;
         var _loc5_:MiniGamePutt = this;
         var _loc6_:Boolean = false;
         var _loc7_:Number = param4 - param2;
         var _loc8_:Number = param3 - param1;
         var _loc9_:Number;
         if((_loc9_ = _loc7_ / _loc8_) == Number.POSITIVE_INFINITY)
         {
            _loc9_ = 1000000;
         }
         else if(_loc9_ == Number.NEGATIVE_INFINITY)
         {
            _loc9_ = -1000000;
         }
         var _loc10_:int = 0;
         while(_loc10_ < _loc5_.ramps.length)
         {
            _loc11_ = _loc5_.ramps[_loc10_];
            if(param2 == param4 && _loc11_.y1 == param2 && _loc11_.y2 == param2)
            {
               if(_loc11_.x2 == param1)
               {
                  _loc11_.x2 = param3;
                  _loc6_ = true;
                  break;
               }
               if(_loc11_.x1 == param3)
               {
                  _loc11_.x1 = param1;
                  _loc6_ = true;
                  break;
               }
            }
            else if(param1 == param3 && _loc11_.x1 == param1 && _loc11_.x2 == param1)
            {
               if(_loc11_.y2 == param2)
               {
                  _loc11_.y2 = param4;
                  _loc6_ = true;
                  break;
               }
               if(_loc11_.y1 == param4)
               {
                  _loc11_.y1 = param2;
                  _loc6_ = true;
                  break;
               }
            }
            else if(_loc11_.getSlope() == _loc9_ && (_loc11_.x2 == param1 && _loc11_.y2 == param2 || _loc11_.x1 == param3 && _loc11_.y1 == param4))
            {
               if(_loc11_.x2 == param1 && _loc11_.y2 == param2)
               {
                  _loc11_.x2 = param3;
                  _loc11_.y2 = param4;
                  _loc6_ = true;
                  break;
               }
               if(_loc11_.x1 == param3 && _loc11_.x1 == param4)
               {
                  _loc11_.x1 = param1;
                  _loc11_.y1 = param2;
                  _loc6_ = true;
                  break;
               }
            }
            _loc10_++;
         }
         if(!_loc6_)
         {
            _loc5_.ramps.push(new Ramp(param1,param2,param3,param4,_loc5_.defaultRampDecay));
            ++_loc5_.numTileRamps;
         }
      }
      
      public function setupWalls() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Ramp = null;
         var _loc10_:MovieClip = null;
         var _loc1_:MiniGamePutt = this;
         _loc1_.ramps = null;
         _loc1_.ramps = [];
         _loc2_ = 0;
         while(_loc2_ < _loc1_.banks.length)
         {
            _loc1_.clip.holder.removeChild(_loc1_.banks[_loc2_]);
            _loc1_.banks[_loc2_] = null;
            _loc2_++;
         }
         _loc1_.banks = null;
         _loc1_.banks = [];
         _loc1_.numTileRamps = 0;
         _loc3_ = 0;
         while(_loc3_ < _loc1_.gridHeight)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc1_.gridWidth)
            {
               if(_loc1_.tileGrid[_loc3_][_loc2_] > 0)
               {
                  _loc4_ = Number(_loc1_.tileGrid[_loc3_][_loc2_]);
                  _loc6_ = (_loc5_ = _loc1_.tileHeight * _loc3_) + _loc1_.tileHeight;
                  _loc8_ = (_loc7_ = _loc1_.tileWidth * _loc2_) + _loc1_.tileWidth;
                  if(_loc4_ == 1)
                  {
                     if(_loc3_ > 0 && (_loc1_.tileGrid[_loc3_ - 1][_loc2_] == 0 || _loc1_.tileGrid[_loc3_ - 1][_loc2_] == 2 || _loc1_.tileGrid[_loc3_ - 1][_loc2_] == 3))
                     {
                        _loc1_.createOrUpdateRamp(_loc7_,_loc5_,_loc8_,_loc5_);
                     }
                     if(_loc3_ < _loc1_.gridHeight - 1 && (_loc1_.tileGrid[_loc3_ + 1][_loc2_] == 0 || _loc1_.tileGrid[_loc3_ + 1][_loc2_] == 4 || _loc1_.tileGrid[_loc3_ + 1][_loc2_] == 5))
                     {
                        _loc1_.createOrUpdateRamp(_loc7_,_loc6_,_loc8_,_loc6_);
                     }
                     if(_loc2_ > 0 && (_loc1_.tileGrid[_loc3_][_loc2_ - 1] == 0 || _loc1_.tileGrid[_loc3_][_loc2_ - 1] == 3 || _loc1_.tileGrid[_loc3_][_loc2_ - 1] == 4))
                     {
                        _loc1_.createOrUpdateRamp(_loc7_,_loc5_,_loc7_,_loc6_);
                     }
                     if(_loc2_ < _loc1_.gridWidth - 1 && (_loc1_.tileGrid[_loc3_][_loc2_ + 1] == 0 || _loc1_.tileGrid[_loc3_][_loc2_ + 1] == 2 || _loc1_.tileGrid[_loc3_][_loc2_ + 1] == 5))
                     {
                        _loc1_.createOrUpdateRamp(_loc8_,_loc5_,_loc8_,_loc6_);
                     }
                  }
                  else if(_loc4_ == 2)
                  {
                     if(_loc3_ > 0 && (_loc1_.tileGrid[_loc3_ - 1][_loc2_] == 0 || _loc1_.tileGrid[_loc3_ - 1][_loc2_] == 2 || _loc1_.tileGrid[_loc3_ - 1][_loc2_] == 3))
                     {
                        _loc1_.createOrUpdateRamp(_loc7_,_loc5_,_loc8_,_loc5_);
                     }
                     _loc1_.createOrUpdateRamp(_loc7_,_loc5_,_loc8_,_loc6_);
                     if(_loc2_ < _loc1_.gridWidth - 1 && (_loc1_.tileGrid[_loc3_][_loc2_ + 1] == 0 || _loc1_.tileGrid[_loc3_][_loc2_ + 1] == 2 || _loc1_.tileGrid[_loc3_][_loc2_ + 1] == 5))
                     {
                        _loc1_.createOrUpdateRamp(_loc8_,_loc5_,_loc8_,_loc6_);
                     }
                  }
                  else if(_loc4_ == 3)
                  {
                     if(_loc3_ > 0 && (_loc1_.tileGrid[_loc3_ - 1][_loc2_] == 0 || _loc1_.tileGrid[_loc3_ - 1][_loc2_] == 2 || _loc1_.tileGrid[_loc3_ - 1][_loc2_] == 3))
                     {
                        _loc1_.createOrUpdateRamp(_loc7_,_loc5_,_loc8_,_loc5_);
                     }
                     _loc1_.createOrUpdateRamp(_loc8_,_loc5_,_loc7_,_loc6_);
                     if(_loc2_ > 0 && (_loc1_.tileGrid[_loc3_][_loc2_ - 1] == 0 || _loc1_.tileGrid[_loc3_][_loc2_ - 1] == 3 || _loc1_.tileGrid[_loc3_][_loc2_ - 1] == 4))
                     {
                        _loc1_.createOrUpdateRamp(_loc7_,_loc5_,_loc7_,_loc6_);
                     }
                  }
                  else if(_loc4_ == 4)
                  {
                     if(_loc3_ < _loc1_.gridHeight - 1 && (_loc1_.tileGrid[_loc3_ + 1][_loc2_] == 0 || _loc1_.tileGrid[_loc3_ + 1][_loc2_] == 4 || _loc1_.tileGrid[_loc3_ + 1][_loc2_] == 5))
                     {
                        _loc1_.createOrUpdateRamp(_loc7_,_loc6_,_loc8_,_loc6_);
                     }
                     _loc1_.createOrUpdateRamp(_loc7_,_loc5_,_loc8_,_loc6_);
                     if(_loc2_ > 0 && (_loc1_.tileGrid[_loc3_][_loc2_ - 1] == 0 || _loc1_.tileGrid[_loc3_][_loc2_ - 1] == 3 || _loc1_.tileGrid[_loc3_][_loc2_ - 1] == 4))
                     {
                        _loc1_.createOrUpdateRamp(_loc7_,_loc5_,_loc7_,_loc6_);
                     }
                  }
                  else if(_loc4_ == 5)
                  {
                     if(_loc3_ < _loc1_.gridHeight - 1 && (_loc1_.tileGrid[_loc3_ + 1][_loc2_] == 0 || _loc1_.tileGrid[_loc3_ + 1][_loc2_] == 4 || _loc1_.tileGrid[_loc3_ + 1][_loc2_] == 5))
                     {
                        _loc1_.createOrUpdateRamp(_loc7_,_loc6_,_loc8_,_loc6_);
                     }
                     _loc1_.createOrUpdateRamp(_loc8_,_loc5_,_loc7_,_loc6_);
                     if(_loc2_ < _loc1_.gridWidth - 1 && (_loc1_.tileGrid[_loc3_][_loc2_ + 1] == 0 || _loc1_.tileGrid[_loc3_][_loc2_ + 1] == 2 || _loc1_.tileGrid[_loc3_][_loc2_ + 1] == 5))
                     {
                        _loc1_.createOrUpdateRamp(_loc8_,_loc5_,_loc8_,_loc6_);
                     }
                  }
               }
               _loc2_++;
            }
            _loc3_++;
         }
         _loc1_.createOrUpdateRamp(0,46,640,46);
         _loc1_.createOrUpdateRamp(0,46,0,448);
         _loc1_.createOrUpdateRamp(0,448,640,448);
         _loc1_.createOrUpdateRamp(640,46,640,448);
         _loc2_ = 0;
         while(_loc2_ < _loc1_.barCoords[_loc1_.whichDifficulty].length)
         {
            _loc9_ = new Ramp(_loc1_.barCoords[_loc1_.whichDifficulty][_loc2_][0],_loc1_.barCoords[_loc1_.whichDifficulty][_loc2_][1],_loc1_.barCoords[_loc1_.whichDifficulty][_loc2_][2],_loc1_.barCoords[_loc1_.whichDifficulty][_loc2_][3],_loc1_.defaultRampDecay,true);
            _loc1_.ramps.push(_loc9_);
            if(_loc1_.barCoords[_loc1_.whichDifficulty][_loc2_][4] == "fence1")
            {
               _loc10_ = new putt_fence1();
            }
            else if(_loc1_.barCoords[_loc1_.whichDifficulty][_loc2_][4] == "fence2")
            {
               _loc10_ = new putt_fence2();
            }
            else if(_loc1_.barCoords[_loc1_.whichDifficulty][_loc2_][4] == "fence3")
            {
               _loc10_ = new putt_fence3();
            }
            _loc10_.x = _loc9_.x1;
            _loc10_.y = _loc9_.y1;
            _loc10_.rotation = this.radsToDegrees(_loc9_.getAngle());
            _loc1_.clip.holder.addChild(_loc10_);
            _loc1_.banks.push(_loc10_);
            _loc2_++;
         }
      }
      
      public function setupPositions() : void
      {
         var _loc1_:MiniGamePutt = this;
         _loc1_.clip.starter.x = _loc1_.startEndCoords[_loc1_.whichDifficulty][0];
         _loc1_.clip.starter.y = _loc1_.startEndCoords[_loc1_.whichDifficulty][1];
         _loc1_.clip.hole.x = _loc1_.startEndCoords[_loc1_.whichDifficulty][2];
         _loc1_.clip.hole.y = _loc1_.startEndCoords[_loc1_.whichDifficulty][3];
         _loc1_.clip.ball.x = _loc1_.clip.starter.x;
         _loc1_.clip.ball.y = _loc1_.clip.starter.y;
      }
      
      public function setupBumpers() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Class = null;
         var _loc4_:MovieClip = null;
         var _loc1_:MiniGamePutt = this;
         _loc2_ = 0;
         while(_loc2_ < _loc1_.bumpers.length)
         {
            _loc1_.clip.holder.removeChild(_loc1_.bumpers[_loc2_]);
            _loc1_.bumpers[_loc2_] = null;
            _loc2_++;
         }
         _loc1_.bumpers = null;
         _loc1_.bumpers = [];
         _loc2_ = 0;
         while(_loc2_ < _loc1_.bumperCoords[_loc1_.whichDifficulty].length)
         {
            _loc3_ = getDefinitionByName("putt_" + _loc1_.bumperCoords[_loc1_.whichDifficulty][_loc2_][2]) as Class;
            (_loc4_ = new _loc3_() as MovieClip).x = _loc1_.bumperCoords[_loc1_.whichDifficulty][_loc2_][0];
            _loc4_.y = _loc1_.bumperCoords[_loc1_.whichDifficulty][_loc2_][1];
            _loc1_.clip.holder.addChild(_loc4_);
            _loc1_.bumpers.push(_loc4_);
            _loc2_++;
         }
      }
      
      public function clickScreen(param1:MouseEvent = null) : void
      {
         var _loc2_:MiniGamePutt = this;
         if(!_loc2_.isMoving && !_loc2_.isSwinging && !_loc2_.isInHole)
         {
            _loc2_.swingMouseX = _loc2_.clip.mouseX;
            _loc2_.swingMouseY = _loc2_.clip.mouseY;
            _loc2_.swingTimer = 2;
            _loc2_.isSwinging = true;
            _loc2_.clip.club.gotoAndPlay("swing");
            _loc2_.clip.club.arrow.gotoAndPlay("swing");
            _loc2_.clip.club.shortarrow.gotoAndPlay("swing");
         }
      }
      
      public function resetBall() : void
      {
         var _loc1_:MiniGamePutt = this;
         _loc1_.ball.visible = true;
         _loc1_.clip.club.visible = true;
         _loc1_.clip.hole.gotoAndStop(1);
         _loc1_.ball.x = _loc1_.clip.starter.x;
         _loc1_.ball.y = _loc1_.clip.starter.y;
         _loc1_.ballSpeedY = 0;
         _loc1_.ballSpeedX = 0;
         _loc1_.gravity = 1;
         _loc1_.isMoving = false;
         _loc1_.gameTimer = 0;
         _loc1_.strokes = 0;
         _loc1_.clip.stroke_txt.text = "0";
         _loc1_.currentPar = _loc1_.pars[_loc1_.whichDifficulty];
         _loc1_.clip.par_txt.text = String(_loc1_.currentPar);
         _loc1_.clip.club.gotoAndStop(1);
         _loc1_.clip.club.arrow.gotoAndStop(1);
         _loc1_.clip.club.shortarrow.gotoAndStop(1);
         if(_loc1_.whichDifficulty >= 8)
         {
            _loc1_.clip.club.arrow.visible = false;
            _loc1_.clip.club.shortarrow.visible = true;
         }
         else
         {
            _loc1_.clip.club.arrow.visible = true;
            _loc1_.clip.club.shortarrow.visible = false;
         }
      }
      
      public function updateClub() : void
      {
         var _loc1_:MiniGamePutt = this;
         var _loc2_:Number = _loc1_.clip.mouseX - _loc1_.ball.x;
         var _loc3_:Number = _loc1_.clip.mouseY - _loc1_.ball.y;
         if(_loc1_.aimMode == 2)
         {
            _loc2_ = _loc1_.ball.x - _loc1_.clip.mouseX;
            _loc3_ = _loc1_.ball.y - _loc1_.clip.mouseY;
         }
         var _loc4_:Number = Math.atan2(_loc3_,_loc2_);
         _loc1_.clip.club.rotation = this.radsToDegrees(_loc4_);
         _loc1_.clip.club.x = _loc1_.ball.x;
         _loc1_.clip.club.y = _loc1_.ball.y;
      }
      
      public function getBallSlope() : Number
      {
         var _loc1_:MiniGamePutt = this;
         var _loc2_:Number = _loc1_.ballSpeedY / _loc1_.ballSpeedX;
         if(_loc2_ == Number.POSITIVE_INFINITY)
         {
            _loc2_ = 1000000;
         }
         else if(_loc2_ == Number.NEGATIVE_INFINITY)
         {
            _loc2_ = -1000000;
         }
         return _loc2_;
      }
      
      public function checkSuccess() : void
      {
         var _loc1_:MiniGamePutt = this;
         if(_loc1_.isInHole)
         {
            if(_loc1_.strokes <= _loc1_.currentPar)
            {
               _loc1_.decidePrize();
               _loc1_.screen.gameObj.var_128.playMusicClip("customer_happy.wav");
               _loc1_.screen.gameObj.var_136.recordTagged("putt");
            }
            else if(_loc1_.strokes - _loc1_.currentPar == 1)
            {
               _loc1_.skuToWin = "tips";
               _loc1_.amountToWin = 200;
               _loc1_.skuIsClothing = false;
               _loc1_.skuClothingMode = "";
               _loc1_.screen.gameObj.var_128.playMusicClip("customer_decent.wav");
            }
            else if(_loc1_.strokes - _loc1_.currentPar == 2)
            {
               _loc1_.skuToWin = "tips";
               _loc1_.amountToWin = 100;
               _loc1_.skuIsClothing = false;
               _loc1_.skuClothingMode = "";
               _loc1_.screen.gameObj.var_128.playMusicClip("customer_decent.wav");
            }
            else
            {
               _loc1_.skuToWin = "tips";
               _loc1_.amountToWin = 50;
               _loc1_.skuIsClothing = false;
               _loc1_.skuClothingMode = "";
               _loc1_.screen.gameObj.var_128.playMusicClip("customer_decent.wav");
            }
         }
         else
         {
            _loc1_.skuToWin = null;
            _loc1_.amountToWin = 0;
            _loc1_.skuIsClothing = false;
            _loc1_.skuClothingMode = "";
            _loc1_.screen.gameObj.var_128.playMusicClip("customer_worried.wav");
         }
         if(_loc1_.strokes == _loc1_.maxStrokes && !_loc1_.isInHole)
         {
            _loc1_.clip.score.inside.gotoAndStop(8);
         }
         else if(_loc1_.strokes == 1)
         {
            _loc1_.clip.score.inside.gotoAndStop(4);
         }
         else if(_loc1_.strokes == _loc1_.currentPar)
         {
            _loc1_.clip.score.inside.gotoAndStop(1);
         }
         else if(_loc1_.strokes == _loc1_.currentPar - 1)
         {
            _loc1_.clip.score.inside.gotoAndStop(2);
         }
         else if(_loc1_.strokes < _loc1_.currentPar - 1)
         {
            _loc1_.clip.score.inside.gotoAndStop(3);
         }
         else if(_loc1_.strokes == _loc1_.currentPar + 1)
         {
            _loc1_.clip.score.inside.gotoAndStop(5);
         }
         else if(_loc1_.strokes == _loc1_.currentPar + 2)
         {
            _loc1_.clip.score.inside.gotoAndStop(6);
         }
         else if(_loc1_.strokes == _loc1_.currentPar + 3)
         {
            _loc1_.clip.score.inside.gotoAndStop(7);
         }
         else
         {
            _loc1_.clip.score.inside.gotoAndStop(8);
         }
         _loc1_.clip.score.gotoAndPlay(2);
      }
      
      override public function updateScreen() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc1_:MiniGamePutt = this;
         if(_loc1_.isDone)
         {
            ++_loc1_.doneTimer;
            if(_loc1_.doneTimer == _loc1_.doneTimerMax)
            {
               _loc1_.screen.finishMiniGame(_loc1_.skuToWin,_loc1_.amountToWin,_loc1_.skuIsClothing,_loc1_.skuClothingMode);
            }
         }
         else if(_loc1_.isSwinging)
         {
            ++_loc1_.swingTimer;
            if(_loc1_.swingTimer == _loc1_.swingTimerMax)
            {
               _loc1_.friction = _loc1_.normalFriction;
               _loc2_ = _loc1_.swingMouseX - _loc1_.ball.x;
               _loc3_ = _loc1_.swingMouseY - _loc1_.ball.y;
               if(_loc1_.aimMode == 2)
               {
                  _loc2_ = _loc1_.ball.x - _loc1_.swingMouseX;
                  _loc3_ = _loc1_.ball.y - _loc1_.swingMouseY;
               }
               _loc4_ = Math.atan2(_loc3_,_loc2_);
               _loc1_.ballSpeedX = Math.cos(_loc4_) * _loc1_.ballSpeed;
               _loc1_.ballSpeedY = Math.sin(_loc4_) * _loc1_.ballSpeed;
               ++_loc1_.strokes;
               _loc1_.clip.stroke_txt.text = String(_loc1_.strokes);
               _loc1_.isMoving = true;
               _loc1_.isSwinging = false;
               _loc1_.screen.gameObj.var_128.playSound("minigame_putt_swing.wav");
            }
         }
         else if(!_loc1_.isMoving)
         {
            ++_loc1_.gameTimer;
            _loc1_.updateClub();
         }
         else
         {
            _loc1_.ballSpeedY *= _loc1_.friction;
            _loc1_.ballSpeedX *= _loc1_.friction;
            _loc1_.checkForCollisions();
            _loc5_ = _loc1_.clip.hole.x - _loc1_.clip.ball.x;
            _loc6_ = _loc1_.clip.hole.y - _loc1_.clip.ball.y;
            if((_loc7_ = Math.sqrt(_loc5_ * _loc5_ + _loc6_ * _loc6_)) <= _loc1_.ballRadius)
            {
               _loc1_.ball.visible = false;
               _loc1_.clip.club.visible = false;
               _loc1_.clip.hole.gotoAndPlay("hole");
               _loc1_.screen.gameObj.var_128.playSound("minigame_putt_cup.wav");
               _loc1_.isMoving = false;
               _loc1_.isInHole = true;
               _loc1_.checkSuccess();
               _loc1_.isDone = true;
            }
            if(Math.abs(_loc1_.ballSpeedY) < 2 && Math.abs(_loc1_.ballSpeedX) < 2)
            {
               _loc1_.friction -= 0.005;
               if(Math.abs(_loc1_.ballSpeedY) < 0.2 && Math.abs(_loc1_.ballSpeedX) < 0.2)
               {
                  _loc1_.isMoving = false;
                  _loc1_.clip.club.gotoAndStop(1);
                  _loc1_.clip.club.arrow.gotoAndStop(1);
                  _loc1_.clip.club.shortarrow.gotoAndStop(1);
                  _loc1_.updateClub();
                  if(_loc1_.strokes == _loc1_.maxStrokes && !_loc1_.isInHole)
                  {
                     _loc1_.checkSuccess();
                     _loc1_.isDone = true;
                     _loc1_.clip.club.visible = false;
                  }
               }
            }
         }
      }
      
      public function checkForCollisions() : void
      {
         var _loc4_:Number = NaN;
         var _loc1_:MiniGamePutt = this;
         var _loc2_:Boolean = _loc1_.checkIntersectingRamps();
         var _loc3_:Boolean = _loc1_.checkIntersectingBumpers();
         if(!_loc2_ && !_loc3_)
         {
            _loc1_.ball.x += _loc1_.ballSpeedX;
            _loc1_.ball.y += _loc1_.ballSpeedY;
         }
         else
         {
            _loc4_ = Math.ceil(Math.random() * 3);
            _loc1_.screen.gameObj.var_128.playSound("minigame_putt_hit" + _loc4_ + ".wav");
         }
      }
      
      public function checkIntersectingBumpers() : Boolean
      {
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
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc25_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc27_:Number = NaN;
         var _loc28_:Number = NaN;
         var _loc29_:Number = NaN;
         var _loc30_:Number = NaN;
         var _loc31_:* = undefined;
         var _loc32_:Boolean = false;
         var _loc33_:Number = NaN;
         var _loc34_:Number = NaN;
         var _loc35_:Number = NaN;
         var _loc36_:Number = NaN;
         var _loc37_:Number = NaN;
         var _loc38_:Number = NaN;
         var _loc39_:Number = NaN;
         var _loc40_:Number = NaN;
         var _loc41_:Number = NaN;
         var _loc42_:Number = NaN;
         var _loc43_:Number = NaN;
         var _loc44_:Number = NaN;
         var _loc45_:Number = NaN;
         var _loc46_:Number = NaN;
         var _loc47_:Number = NaN;
         var _loc48_:Number = NaN;
         var _loc49_:Number = NaN;
         var _loc50_:Number = NaN;
         var _loc51_:Number = NaN;
         var _loc52_:Number = NaN;
         var _loc1_:MiniGamePutt = this;
         var _loc2_:Boolean = false;
         var _loc3_:Number = this.ball.x;
         var _loc4_:Number = this.ball.y;
         var _loc5_:int = 0;
         while(_loc5_ < _loc1_.bumperCoords[_loc1_.whichDifficulty].length)
         {
            _loc6_ = Number(_loc1_.bumperCoords[_loc1_.whichDifficulty][_loc5_][0]);
            _loc7_ = Number(_loc1_.bumperCoords[_loc1_.whichDifficulty][_loc5_][1]);
            _loc8_ = 0;
            _loc9_ = 0;
            if(_loc1_.bumperCoords[_loc1_.whichDifficulty][_loc5_].length == 5)
            {
               _loc8_ = Number(_loc1_.bumperCoords[_loc1_.whichDifficulty][_loc5_][3]);
               _loc9_ = Number(_loc1_.bumperCoords[_loc1_.whichDifficulty][_loc5_][4]);
            }
            else
            {
               _loc8_ = Number(_loc1_.bumperRadii[_loc1_.bumperTypes.indexOf(_loc1_.bumperCoords[_loc1_.whichDifficulty][_loc5_][2])]);
               _loc9_ = Number(_loc1_.bumperBounce[_loc1_.bumperTypes.indexOf(_loc1_.bumperCoords[_loc1_.whichDifficulty][_loc5_][2])]);
            }
            _loc10_ = _loc1_.ballSpeedX;
            _loc11_ = _loc1_.ballSpeedY;
            _loc12_ = 0;
            _loc13_ = 0;
            _loc14_ = _loc3_;
            _loc15_ = _loc4_;
            _loc16_ = _loc6_;
            _loc17_ = _loc7_;
            _loc18_ = this.ballRadius + _loc8_;
            _loc19_ = -2 * _loc10_ * _loc12_ + _loc10_ * _loc10_ + _loc12_ * _loc12_;
            _loc20_ = -2 * _loc14_ * _loc12_ - 2 * _loc16_ * _loc10_ + 2 * _loc14_ * _loc10_ + 2 * _loc16_ * _loc12_;
            _loc21_ = -2 * _loc14_ * _loc16_ + _loc14_ * _loc14_ + _loc16_ * _loc16_;
            _loc22_ = -2 * _loc11_ * _loc13_ + _loc11_ * _loc11_ + _loc13_ * _loc13_;
            _loc23_ = -2 * _loc15_ * _loc13_ - 2 * _loc17_ * _loc11_ + 2 * _loc15_ * _loc11_ + 2 * _loc17_ * _loc13_;
            _loc24_ = -2 * _loc15_ * _loc17_ + _loc15_ * _loc15_ + _loc17_ * _loc17_;
            _loc25_ = _loc19_ + _loc22_;
            _loc26_ = _loc20_ + _loc23_;
            _loc27_ = _loc21_ + _loc24_ - _loc18_ * _loc18_;
            _loc28_ = Math.sqrt(_loc26_ * _loc26_ - 4 * _loc25_ * _loc27_);
            _loc29_ = (-_loc26_ + _loc28_) / (2 * _loc25_);
            _loc30_ = (-_loc26_ - _loc28_) / (2 * _loc25_);
            _loc31_ = null;
            _loc32_ = false;
            if(_loc29_ > 0 && _loc29_ <= 1)
            {
               _loc31_ = _loc29_;
               _loc32_ = true;
            }
            if(_loc30_ > 0 && _loc30_ <= 1)
            {
               if(_loc31_ == null || _loc30_ < _loc29_)
               {
                  _loc31_ = _loc30_;
                  _loc32_ = true;
               }
            }
            if(_loc32_)
            {
               _loc33_ = _loc3_ - _loc6_;
               _loc34_ = _loc4_ - _loc7_;
               _loc35_ = Math.atan2(_loc34_,_loc33_);
               _loc36_ = (this.ballRadius + _loc8_ + 2) * Math.cos(_loc35_);
               _loc37_ = (this.ballRadius + _loc8_ + 2) * Math.sin(_loc35_);
               this.ball.x = _loc6_ + _loc36_;
               this.ball.y = _loc7_ + _loc37_;
               _loc3_ = this.ball.x;
               _loc4_ = this.ball.y;
               _loc38_ = 1;
               _loc39_ = _loc9_;
               _loc40_ = _loc3_ - _loc6_;
               _loc41_ = _loc4_ - _loc7_;
               _loc42_ = Math.atan2(_loc41_,_loc40_);
               _loc43_ = Math.cos(_loc42_);
               _loc44_ = Math.sin(_loc42_);
               _loc45_ = _loc10_ * _loc43_ + _loc11_ * _loc44_;
               _loc46_ = _loc12_ * _loc43_ + _loc13_ * _loc44_;
               _loc47_ = _loc11_ * _loc43_ - _loc10_ * _loc44_;
               _loc48_ = _loc13_ * _loc43_ - _loc12_ * _loc44_;
               _loc49_ = _loc38_ * _loc45_ + _loc39_ * _loc46_;
               _loc50_ = _loc45_ - _loc46_;
               _loc45_ = _loc52_ = (_loc51_ = (_loc49_ + _loc38_ * _loc50_) / (_loc38_ + _loc39_)) - _loc45_ + _loc46_;
               _loc46_ = _loc51_;
               _loc10_ = _loc45_ * _loc43_ - _loc47_ * _loc44_;
               _loc11_ = _loc47_ * _loc43_ + _loc45_ * _loc44_;
               _loc1_.ballSpeedX = _loc10_;
               _loc1_.ballSpeedY = _loc11_;
               if(_loc1_.ballSpeedX > -0.1 && _loc1_.ballSpeedX < 0.1)
               {
                  if(_loc1_.ballSpeedX >= 0)
                  {
                     _loc1_.ballSpeedX = 0.1;
                  }
                  else
                  {
                     _loc1_.ballSpeedX = -0.1;
                  }
               }
               _loc2_ = true;
            }
            _loc5_++;
         }
         return _loc2_;
      }
      
      public function getSingleRampIntersectionArray(param1:Number, param2:Number, param3:Number, param4:Number, param5:Ramp) : Array
      {
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Boolean = false;
         var _loc16_:Boolean = false;
         var _loc17_:Point = null;
         var _loc18_:Point = null;
         this;
         var _loc7_:Array = [];
         var _loc8_:Number = (param5.x2 - param5.x1) * (param5.x2 - param5.x1) + (param5.y2 - param5.y1) * (param5.y2 - param5.y1);
         var _loc9_:Number = 2 * ((param5.x2 - param5.x1) * (param5.x1 - param1) + (param5.y2 - param5.y1) * (param5.y1 - param2));
         var _loc10_:Number = param1 * param1 + param2 * param2 + param5.x1 * param5.x1 + param5.y1 * param5.y1 - 2 * (param1 * param5.x1 + param2 * param5.y1) - this.ballRadius * this.ballRadius;
         var _loc11_:Number;
         if((_loc11_ = _loc9_ * _loc9_ - 4 * _loc8_ * _loc10_) > 0)
         {
            _loc12_ = Math.sqrt(_loc11_);
            _loc13_ = (-_loc9_ + _loc12_) / (2 * _loc8_);
            _loc14_ = (-_loc9_ - _loc12_) / (2 * _loc8_);
            _loc15_ = false;
            _loc16_ = false;
            if((_loc13_ < 0 || _loc13_ > 1) && (_loc14_ < 0 || _loc14_ > 1))
            {
               if(_loc13_ < 0 && _loc14_ < 0 || _loc13_ > 1 && _loc14_ > 1)
               {
                  _loc15_ = true;
               }
               else
               {
                  _loc16_ = true;
                  _loc7_.push(new Point(param5.x1,param5.y1));
                  _loc7_.push(new Point(param5.x2,param5.y2));
               }
            }
            if(!_loc15_)
            {
               if(0 < _loc14_ && _loc14_ <= 1 && !_loc16_)
               {
                  _loc17_ = Point.interpolate(new Point(param5.x1,param5.y1),new Point(param5.x2,param5.y2),1 - _loc14_);
                  _loc7_.push(_loc17_);
               }
               if(0 < _loc13_ && _loc13_ <= 1 && !_loc16_)
               {
                  _loc18_ = Point.interpolate(new Point(param5.x1,param5.y1),new Point(param5.x2,param5.y2),1 - _loc13_);
                  _loc7_.push(_loc18_);
               }
            }
         }
         return _loc7_;
      }
      
      public function checkIntersectingRamps() : Boolean
      {
         var _loc9_:Number = NaN;
         var _loc10_:Ramp = null;
         var _loc11_:Array = null;
         var _loc12_:Point = null;
         var _loc13_:Boolean = false;
         var _loc14_:Boolean = false;
         var _loc15_:Point = null;
         var _loc16_:Point = null;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:Ramp = null;
         var _loc24_:Array = null;
         var _loc25_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc27_:Number = NaN;
         var _loc28_:Number = NaN;
         var _loc29_:Number = NaN;
         var _loc30_:Number = NaN;
         var _loc31_:Number = NaN;
         var _loc32_:Number = NaN;
         var _loc33_:Number = NaN;
         var _loc34_:Number = NaN;
         var _loc35_:Number = NaN;
         var _loc36_:Number = NaN;
         var _loc37_:Number = NaN;
         var _loc38_:Number = NaN;
         var _loc39_:Number = NaN;
         var _loc40_:Number = NaN;
         var _loc41_:Number = NaN;
         var _loc42_:Number = NaN;
         var _loc43_:Number = NaN;
         var _loc44_:Number = NaN;
         var _loc45_:Number = NaN;
         var _loc46_:Number = NaN;
         var _loc47_:Number = NaN;
         var _loc48_:Number = NaN;
         var _loc49_:Number = NaN;
         var _loc50_:Number = NaN;
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
         var _loc61_:Number = NaN;
         var _loc62_:Number = NaN;
         var _loc63_:Number = NaN;
         var _loc64_:Number = NaN;
         var _loc65_:Number = NaN;
         var _loc66_:Number = NaN;
         var _loc67_:Number = NaN;
         var _loc68_:Number = NaN;
         var _loc69_:Number = NaN;
         var _loc70_:Number = NaN;
         var _loc71_:Number = NaN;
         var _loc72_:Number = NaN;
         var _loc73_:Number = NaN;
         var _loc74_:Number = NaN;
         var _loc75_:Number = NaN;
         var _loc1_:MiniGamePutt = this;
         var _loc2_:Boolean = false;
         var _loc3_:Number = _loc1_.ballSpeedX;
         var _loc4_:Number = this.ball.x + _loc1_.ballSpeedX;
         var _loc5_:Number = this.ball.y + _loc1_.ballSpeedY;
         var _loc6_:Number = _loc1_.getBallSlope();
         var _loc7_:Number = _loc5_ - _loc6_ * _loc4_;
         var _loc8_:int = 0;
         while(_loc8_ < _loc1_.ramps.length)
         {
            _loc9_ = _loc8_;
            if(_loc3_ < 0)
            {
               _loc9_ = _loc1_.ramps.length - 1 - _loc8_;
            }
            _loc10_ = _loc1_.ramps[_loc8_];
            _loc11_ = _loc1_.getSingleRampIntersectionArray(_loc4_,_loc5_,_loc6_,_loc7_,_loc10_);
            _loc12_ = null;
            _loc13_ = false;
            _loc14_ = false;
            if(_loc11_.length == 1)
            {
               _loc17_ = Math.sqrt((_loc4_ - _loc10_.x1) * (_loc4_ - _loc10_.x1) + (_loc5_ - _loc10_.y1) * (_loc5_ - _loc10_.y1));
               _loc18_ = Math.sqrt((_loc4_ - _loc10_.x2) * (_loc4_ - _loc10_.x2) + (_loc5_ - _loc10_.y2) * (_loc5_ - _loc10_.y2));
               if(_loc17_ <= this.ballRadius)
               {
                  _loc15_ = new Point(_loc10_.x1,_loc10_.y1);
                  _loc16_ = new Point(_loc10_.x2,_loc10_.y2);
               }
               else
               {
                  _loc15_ = new Point(_loc10_.x2,_loc10_.y2);
                  _loc16_ = new Point(_loc10_.x1,_loc10_.y1);
               }
               _loc19_ = Math.atan2(_loc1_.ballSpeedY,_loc1_.ballSpeedX);
               _loc20_ = 1000;
               _loc21_ = _loc15_.x + _loc20_ * Math.cos(_loc19_);
               _loc22_ = _loc15_.y + _loc20_ * Math.sin(_loc19_);
               _loc23_ = new Ramp(_loc15_.x,_loc15_.y,_loc21_,_loc22_,_loc1_.defaultRampDecay);
               if((_loc24_ = _loc1_.getSingleRampIntersectionArray(_loc4_,_loc5_,_loc6_,_loc7_,_loc23_)).length == 1)
               {
                  _loc25_ = _loc4_;
                  _loc26_ = _loc5_;
                  _loc27_ = Number(_loc24_[0].x);
                  _loc28_ = Number(_loc24_[0].y);
                  _loc29_ = _loc27_ - _loc15_.x;
                  _loc30_ = _loc28_ - _loc15_.y;
                  _loc31_ = (_loc31_ = Math.sqrt(_loc29_ * _loc29_ + _loc30_ * _loc30_)) + 1;
                  _loc32_ = _loc19_ + Math.PI;
                  _loc33_ = _loc4_ + _loc31_ * Math.cos(_loc32_);
                  _loc34_ = _loc5_ + _loc31_ * Math.sin(_loc32_);
                  this.ball.x = _loc33_;
                  this.ball.y = _loc34_;
                  _loc2_ = true;
                  _loc4_ = this.ball.x;
                  _loc7_ = (_loc5_ = this.ball.y) - _loc6_ * _loc4_;
                  _loc35_ = _loc1_.ballSpeedX;
                  _loc36_ = _loc1_.ballSpeedY;
                  _loc37_ = 0;
                  _loc38_ = 0;
                  _loc39_ = 1;
                  _loc40_ = 2;
                  _loc41_ = _loc27_ - _loc4_;
                  _loc42_ = _loc28_ - _loc5_;
                  _loc43_ = Math.atan2(_loc42_,_loc41_);
                  _loc44_ = Math.cos(_loc43_);
                  _loc45_ = Math.sin(_loc43_);
                  _loc46_ = _loc35_ * _loc44_ + _loc36_ * _loc45_;
                  _loc47_ = _loc37_ * _loc44_ + _loc38_ * _loc45_;
                  _loc48_ = _loc36_ * _loc44_ - _loc35_ * _loc45_;
                  _loc49_ = _loc38_ * _loc44_ - _loc37_ * _loc45_;
                  _loc50_ = _loc39_ * _loc46_ + _loc40_ * _loc47_;
                  _loc51_ = _loc46_ - _loc47_;
                  _loc46_ = _loc53_ = (_loc52_ = (_loc50_ + _loc39_ * _loc51_) / (_loc39_ + _loc40_)) - _loc46_ + _loc47_;
                  _loc47_ = _loc52_;
                  _loc35_ = _loc46_ * _loc44_ - _loc48_ * _loc45_;
                  _loc36_ = _loc48_ * _loc44_ + _loc46_ * _loc45_;
                  _loc1_.ballSpeedX = _loc35_;
                  _loc1_.ballSpeedY = _loc36_;
               }
            }
            if(_loc11_.length == 2)
            {
               _loc12_ = Point.interpolate(_loc11_[0],_loc11_[1],0.5);
            }
            if(_loc12_ != null)
            {
               _loc54_ = -1 / _loc10_.getSlope();
               _loc55_ = _loc12_.y - _loc54_ * _loc12_.x;
               if(_loc54_ == Number.POSITIVE_INFINITY)
               {
                  _loc54_ = 1000;
               }
               else if(_loc54_ == Number.NEGATIVE_INFINITY)
               {
                  _loc54_ = -1000;
               }
               _loc56_ = 400;
               _loc57_ = _loc54_ * _loc56_ + _loc55_;
               _loc58_ = _loc12_.x - _loc56_;
               _loc59_ = _loc12_.y - _loc57_;
               if(_loc57_ < _loc12_.y)
               {
                  _loc58_ = _loc56_ - _loc12_.x;
                  _loc59_ = _loc57_ - _loc12_.y;
               }
               if((_loc60_ = (_loc10_.getRightX() - _loc10_.getLeftX()) * (this.ball.y - _loc10_.getLeftY()) - (_loc10_.getRightY() - _loc10_.getLeftY()) * (this.ball.x - _loc10_.getLeftX())) == 0)
               {
                  if(this.ball.x < _loc10_.getLeftX())
                  {
                     _loc60_ = 1;
                  }
               }
               if(_loc60_ > 0)
               {
                  _loc58_ = _loc56_ - _loc12_.x;
                  _loc59_ = _loc57_ - _loc12_.y;
                  if(_loc57_ < _loc12_.y)
                  {
                     _loc58_ = _loc12_.x - _loc56_;
                     _loc59_ = _loc12_.y - _loc57_;
                  }
               }
               _loc61_ = Math.atan2(_loc59_,_loc58_);
               _loc62_ = this.ballRadius * Math.cos(_loc61_);
               _loc63_ = this.ballRadius * Math.sin(_loc61_);
               this.ball.x = _loc12_.x + _loc62_;
               this.ball.y = _loc12_.y + _loc63_;
               _loc2_ = true;
               _loc4_ = this.ball.x;
               _loc7_ = (_loc5_ = this.ball.y) - _loc6_ * _loc4_;
               _loc13_ = true;
            }
            if(_loc13_)
            {
               _loc64_ = _loc10_.getAngle();
               _loc65_ = Math.cos(_loc64_);
               _loc66_ = Math.sin(_loc64_);
               _loc67_ = _loc1_.ballSpeedY;
               _loc68_ = _loc1_.ballSpeedX;
               _loc69_ = _loc67_ * _loc65_ - _loc68_ * _loc66_;
               _loc70_ = _loc68_ * _loc65_ + _loc67_ * _loc66_;
               _loc71_ = _loc10_.decay;
               _loc72_ = -_loc69_ * _loc71_;
               _loc73_ = _loc70_;
               _loc74_ = _loc72_ * _loc65_ + _loc73_ * _loc66_;
               _loc75_ = _loc73_ * _loc65_ - _loc72_ * _loc66_;
               _loc1_.ballSpeedX = _loc75_;
               _loc1_.ballSpeedY = _loc74_;
            }
            _loc8_++;
         }
         return _loc2_;
      }
      
      public function radsToDegrees(param1:Number) : Number
      {
         return param1 * 180 / Math.PI;
      }
      
      public function degreesToRads(param1:Number) : Number
      {
         return param1 * Math.PI / 180;
      }
      
      override public function destroy() : void
      {
         var _loc2_:int = 0;
         var _loc1_:MiniGamePutt = this;
         _loc1_.ramps = null;
         _loc1_.ramps = [];
         _loc2_ = 0;
         while(_loc2_ < _loc1_.banks.length)
         {
            _loc1_.clip.holder.removeChild(_loc1_.banks[_loc2_]);
            _loc1_.banks[_loc2_] = null;
            _loc2_++;
         }
         _loc1_.banks = null;
         _loc1_.banks = [];
         _loc2_ = 0;
         while(_loc2_ < _loc1_.tiles.length)
         {
            _loc1_.clip.holder.removeChild(_loc1_.tiles[_loc2_]);
            _loc1_.tiles[_loc2_] = null;
            _loc2_++;
         }
         _loc1_.tiles = null;
         _loc1_.tiles = [];
         _loc1_.tileGrid = null;
         _loc1_.tileGrid = [];
         _loc2_ = 0;
         while(_loc2_ < _loc1_.bumpers.length)
         {
            _loc1_.clip.holder.removeChild(_loc1_.bumpers[_loc2_]);
            _loc1_.bumpers[_loc2_] = null;
            _loc2_++;
         }
         _loc1_.bumpers = null;
         _loc1_.bumpers = [];
         _loc1_.screen.gameObj.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickScreen);
         _loc1_.container.removeChild(_loc1_.clip);
         _loc1_.clip = null;
      }
   }
}
