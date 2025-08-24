package sushiGame.models
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import package_2.class_6;
   import sushiGame.screens.MiniGameChiliWorks;
   
   public class ChiliWorksPipe
   {
       
      
      public const TYPE_STRAIGHT:String = "straight";
      
      public const TYPE_CURVE:String = "curve";
      
      public const TYPE_ALL:String = "all";
      
      public const TYPE_TEE:String = "tee";
      
      public const TYPE_CAP:String = "cap";
      
      public const FLOW_LEFT:String = "left";
      
      public const FLOW_RIGHT:String = "right";
      
      public const FLOW_UP:String = "up";
      
      public const FLOW_DOWN:String = "down";
      
      public var minigame:MiniGameChiliWorks;
      
      public var clip:MovieClip;
      
      public var type:String;
      
      public var flowDirections:Array;
      
      public var rotation:Number = 0;
      
      public var clipRotation:Number = 0;
      
      public var clipTargetRotation:Number = 0;
      
      public var isLocked:Boolean = false;
      
      public var gridX:Number = 0;
      
      public var gridY:Number = 0;
      
      public var didFlowThrough:Boolean = false;
      
      public var flowChainNumber:Number = -1;
      
      public var didClickLockedPipe:Boolean = false;
      
      public var lockedClickTimer:Number = 0;
      
      public var lockedClickTimerMax:Number = 20;
      
      public var lockedClickRotAmount:Number = 0;
      
      public var lockedClickRotAmountMax:Number = 3;
      
      public var hasClickedThisPipe:Boolean = false;
      
      public function ChiliWorksPipe(param1:MiniGameChiliWorks, param2:String, param3:Number, param4:Boolean, param5:Number, param6:Number)
      {
         this.flowDirections = [];
         super();
         this.minigame = param1;
         this.type = param2;
         this.rotation = param3;
         this.clipRotation = param3;
         this.clipTargetRotation = param3;
         this.isLocked = param4;
         this.gridX = param5;
         this.gridY = param6;
         this.setupPipe();
      }
      
      public function setupPipe() : void
      {
         var _loc1_:ChiliWorksPipe = this;
         _loc1_.clip = new chiliPipeMC();
         if(_loc1_.type == _loc1_.TYPE_STRAIGHT)
         {
            _loc1_.clip.gotoAndStop(1);
         }
         else if(_loc1_.type == _loc1_.TYPE_CURVE)
         {
            _loc1_.clip.gotoAndStop(2);
         }
         else if(_loc1_.type == _loc1_.TYPE_ALL)
         {
            _loc1_.clip.gotoAndStop(3);
         }
         else if(_loc1_.type == _loc1_.TYPE_TEE)
         {
            _loc1_.clip.gotoAndStop(4);
         }
         else if(_loc1_.type == _loc1_.TYPE_CAP)
         {
            _loc1_.clip.gotoAndStop(5);
         }
         if(_loc1_.isLocked)
         {
            _loc1_.clip.gotoAndStop(_loc1_.clip.currentFrame + 5);
         }
         _loc1_.clip.mouseEnabled = true;
         _loc1_.clip.mouseChildren = false;
         _loc1_.clip.buttonMode = true;
         _loc1_.clip.useHandCursor = true;
         _loc1_.clip.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickPipe);
         _loc1_.clip.x = _loc1_.minigame.gridStartX + _loc1_.gridX * _loc1_.minigame.tileWidth;
         _loc1_.clip.y = _loc1_.minigame.gridStartY + _loc1_.gridY * _loc1_.minigame.tileWidth;
         _loc1_.clip.rotation = _loc1_.clipTargetRotation;
         _loc1_.minigame.clip.holder.addChild(_loc1_.clip);
         _loc1_.updateFlow();
         _loc1_.setupCaps();
      }
      
      public function setupCaps() : void
      {
         var _loc1_:ChiliWorksPipe = this;
         if(_loc1_.type == _loc1_.TYPE_STRAIGHT)
         {
            _loc1_.clip.cap2.visible = false;
            _loc1_.clip.cap4.visible = false;
         }
         else if(_loc1_.type == _loc1_.TYPE_CURVE)
         {
            _loc1_.clip.cap3.visible = false;
            _loc1_.clip.cap4.visible = false;
         }
         else if(_loc1_.type == _loc1_.TYPE_TEE)
         {
            _loc1_.clip.cap4.visible = false;
         }
         else if(_loc1_.type == _loc1_.TYPE_CAP)
         {
            _loc1_.clip.cap1.visible = false;
            _loc1_.clip.cap3.visible = false;
            _loc1_.clip.cap4.visible = false;
         }
         _loc1_.updateCaps();
      }
      
      public function updateCaps() : void
      {
         var _loc1_:ChiliWorksPipe = this;
         var _loc2_:Number = 1;
         var _loc3_:Number = 2;
         if(_loc1_.gridY % 2 == _loc1_.gridX % 2 && _loc1_.type != _loc1_.TYPE_CAP)
         {
            _loc2_ = 3;
            _loc3_ = 4;
            if(_loc1_.isLocked)
            {
               _loc2_ = 5;
               _loc3_ = 6;
            }
         }
         if(_loc1_.rotation == 0)
         {
            _loc1_.clip.cap1.gotoAndStop(_loc2_);
            _loc1_.clip.cap2.gotoAndStop(_loc2_);
            _loc1_.clip.cap3.gotoAndStop(_loc3_);
            _loc1_.clip.cap4.gotoAndStop(_loc3_);
         }
         else if(_loc1_.rotation == 90)
         {
            _loc1_.clip.cap4.gotoAndStop(_loc2_);
            _loc1_.clip.cap1.gotoAndStop(_loc2_);
            _loc1_.clip.cap2.gotoAndStop(_loc3_);
            _loc1_.clip.cap3.gotoAndStop(_loc3_);
         }
         else if(_loc1_.rotation == 180)
         {
            _loc1_.clip.cap3.gotoAndStop(_loc2_);
            _loc1_.clip.cap4.gotoAndStop(_loc2_);
            _loc1_.clip.cap1.gotoAndStop(_loc3_);
            _loc1_.clip.cap2.gotoAndStop(_loc3_);
         }
         else if(_loc1_.rotation == 270)
         {
            _loc1_.clip.cap2.gotoAndStop(_loc2_);
            _loc1_.clip.cap3.gotoAndStop(_loc2_);
            _loc1_.clip.cap4.gotoAndStop(_loc3_);
            _loc1_.clip.cap1.gotoAndStop(_loc3_);
         }
      }
      
      public function destroy() : void
      {
         var _loc1_:ChiliWorksPipe = this;
         if(_loc1_.clip)
         {
            _loc1_.clip.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickPipe);
            if(_loc1_.clip.parent)
            {
               _loc1_.clip.parent.removeChild(_loc1_.clip);
            }
            _loc1_.clip = null;
         }
      }
      
      public function clickPipe(param1:MouseEvent) : void
      {
         var _loc3_:Number = NaN;
         var _loc2_:ChiliWorksPipe = this;
         if(Boolean(_loc2_.minigame) && _loc2_.minigame.didCheckPipes == false)
         {
            if(_loc2_.isLocked)
            {
               _loc2_.didClickLockedPipe = true;
               _loc2_.lockedClickRotAmount = _loc2_.lockedClickRotAmountMax;
               _loc2_.lockedClickTimer = 0;
               _loc2_.minigame.screen.gameObj.var_128.playSound("chiliworks_lockedpipe.wav");
               if(!_loc2_.hasClickedThisPipe)
               {
                  _loc2_.minigame.screen.gameObj.var_136.recordTagged("redpipes");
               }
               _loc2_.hasClickedThisPipe = true;
            }
            else
            {
               _loc2_.clipTargetRotation += 90;
               _loc2_.rotation += 90;
               if(_loc2_.rotation >= 360)
               {
                  _loc2_.rotation -= 360;
               }
               if(_loc2_.rotation < 0)
               {
                  _loc2_.rotation += 360;
               }
               _loc2_.updateFlow();
               _loc2_.updateCaps();
               _loc3_ = Math.ceil(Math.random() * 4);
               _loc2_.minigame.screen.gameObj.var_128.playSound("chiliworks_pipe" + _loc3_ + ".wav");
            }
         }
      }
      
      public function updatePipe() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc1_:ChiliWorksPipe = this;
         if(_loc1_.flowChainNumber > -1 && _loc1_.minigame.didCheckPipes && _loc1_.minigame.postCheckTimer > _loc1_.flowChainNumber * 2)
         {
            _loc2_ = _loc1_.minigame.postCheckTimer + _loc1_.flowChainNumber * 2;
            _loc3_ = Math.sin(_loc2_) * 2 + _loc1_.clipRotation;
            _loc1_.clip.rotation = _loc3_;
         }
         else if(_loc1_.minigame.didCheckPipes && _loc1_.clipRotation != _loc1_.clipTargetRotation)
         {
            _loc1_.clipRotation = _loc1_.clipTargetRotation;
            _loc1_.clip.rotation = _loc1_.clipRotation;
         }
         else if(_loc1_.clipRotation != _loc1_.clipTargetRotation)
         {
            _loc4_ = _loc1_.clipTargetRotation - _loc1_.clipRotation;
            _loc1_.clipRotation += _loc4_ / 2;
            if(Math.abs(_loc1_.clipTargetRotation - _loc1_.clipRotation) <= 1)
            {
               _loc1_.clipRotation = _loc1_.clipTargetRotation;
            }
            _loc1_.clip.rotation = _loc1_.clipRotation;
         }
         if(_loc1_.didClickLockedPipe)
         {
            _loc5_ = Math.sin(_loc1_.lockedClickTimer) * _loc1_.lockedClickRotAmount + _loc1_.clipRotation;
            _loc1_.clip.rotation = _loc5_;
            ++_loc1_.lockedClickTimer;
            _loc1_.lockedClickRotAmount -= 0.2;
            if(_loc1_.lockedClickRotAmount <= 0)
            {
               _loc1_.lockedClickRotAmount = 0;
               _loc1_.clip.rotation = _loc1_.clipRotation;
               _loc1_.didClickLockedPipe = false;
               _loc1_.lockedClickTimer = 0;
            }
         }
      }
      
      public function updateFlow() : void
      {
         var _loc2_:int = 0;
         var _loc1_:ChiliWorksPipe = this;
         if(_loc1_.flowDirections.length > 0)
         {
            _loc2_ = int(_loc1_.flowDirections.length - 1);
            while(_loc2_ >= 0)
            {
               _loc1_.flowDirections.splice(_loc2_,1);
               _loc2_--;
            }
         }
         if(_loc1_.type == _loc1_.TYPE_STRAIGHT)
         {
            if(_loc1_.rotation == 0 || _loc1_.rotation == 180)
            {
               _loc1_.flowDirections.push(_loc1_.FLOW_LEFT,_loc1_.FLOW_RIGHT);
            }
            else
            {
               _loc1_.flowDirections.push(_loc1_.FLOW_UP,_loc1_.FLOW_DOWN);
            }
         }
         else if(_loc1_.type == _loc1_.TYPE_CURVE)
         {
            if(_loc1_.rotation == 0)
            {
               _loc1_.flowDirections.push(_loc1_.FLOW_DOWN,_loc1_.FLOW_RIGHT);
            }
            else if(_loc1_.rotation == 90)
            {
               _loc1_.flowDirections.push(_loc1_.FLOW_DOWN,_loc1_.FLOW_LEFT);
            }
            else if(_loc1_.rotation == 180)
            {
               _loc1_.flowDirections.push(_loc1_.FLOW_UP,_loc1_.FLOW_LEFT);
            }
            else
            {
               _loc1_.flowDirections.push(_loc1_.FLOW_UP,_loc1_.FLOW_RIGHT);
            }
         }
         else if(_loc1_.type == _loc1_.TYPE_ALL)
         {
            _loc1_.flowDirections.push(_loc1_.FLOW_UP,_loc1_.FLOW_DOWN,_loc1_.FLOW_LEFT,_loc1_.FLOW_RIGHT);
         }
         else if(_loc1_.type == _loc1_.TYPE_TEE)
         {
            if(_loc1_.rotation == 0)
            {
               _loc1_.flowDirections.push(_loc1_.FLOW_LEFT,_loc1_.FLOW_RIGHT,_loc1_.FLOW_DOWN);
            }
            else if(_loc1_.rotation == 90)
            {
               _loc1_.flowDirections.push(_loc1_.FLOW_UP,_loc1_.FLOW_DOWN,_loc1_.FLOW_LEFT);
            }
            else if(_loc1_.rotation == 180)
            {
               _loc1_.flowDirections.push(_loc1_.FLOW_LEFT,_loc1_.FLOW_RIGHT,_loc1_.FLOW_UP);
            }
            else
            {
               _loc1_.flowDirections.push(_loc1_.FLOW_UP,_loc1_.FLOW_DOWN,_loc1_.FLOW_RIGHT);
            }
         }
         else if(_loc1_.type == _loc1_.TYPE_CAP)
         {
            if(_loc1_.rotation == 0)
            {
               _loc1_.flowDirections.push(_loc1_.FLOW_DOWN);
            }
            else if(_loc1_.rotation == 90)
            {
               _loc1_.flowDirections.push(_loc1_.FLOW_LEFT);
            }
            else if(_loc1_.rotation == 180)
            {
               _loc1_.flowDirections.push(_loc1_.FLOW_UP);
            }
            else
            {
               _loc1_.flowDirections.push(_loc1_.FLOW_RIGHT);
            }
         }
      }
      
      public function flagForEmitter(param1:String, param2:Number, param3:Number, param4:Number) : void
      {
         var _loc5_:ChiliWorksPipe;
         (_loc5_ = this).minigame.emittersX.push(param2);
         _loc5_.minigame.emittersY.push(param3);
         _loc5_.minigame.emittersDir.push(param1);
         _loc5_.minigame.emittersDelay.push(param4);
      }
      
      public function checkPipe(param1:String, param2:String = "", param3:Number = 0) : Boolean
      {
         var _loc6_:int = 0;
         var _loc9_:Array = null;
         var _loc10_:String = null;
         var _loc11_:ChiliWorksPipe = null;
         var _loc12_:Boolean = false;
         var _loc4_:ChiliWorksPipe = this;
         var _loc5_:Boolean = true;
         2;
         var _loc8_:Number;
         if((_loc8_ = _loc4_.flowDirections.indexOf(param1)) == -1)
         {
            _loc5_ = false;
            class_6.method_1(param2 + "Problem with the flow in piece " + this.gridX + ", " + this.gridY + " -- " + _loc4_.type + " -- Coming into pipe from side = " + param1 + ". Can\'t receive flow in this direction!  (Only " + _loc4_.flowDirections.toString() + ")");
            _loc4_.flagForEmitter(param1,this.gridX,this.gridY,param3 * 2);
         }
         else
         {
            class_6.method_1(param2 + "OK, " + this.gridX + ", " + this.gridY + " -- " + _loc4_.type + " -- Can receive flow from side " + param1 + ".... see where it goes:");
            if(_loc4_.didFlowThrough)
            {
               class_6.method_1(param2 + " -- " + this.gridX + ", " + this.gridY + " -- already flowed through, stop checking here.");
            }
            else
            {
               _loc4_.didFlowThrough = true;
               _loc4_.flowChainNumber = param3;
               _loc9_ = [];
               _loc6_ = 0;
               while(_loc6_ < _loc4_.flowDirections.length)
               {
                  if(_loc4_.flowDirections[_loc6_] != param1)
                  {
                     _loc9_.push(_loc4_.flowDirections[_loc6_]);
                  }
                  _loc6_++;
               }
               if(_loc9_.length > 0)
               {
                  _loc6_ = 0;
                  while(_loc6_ < _loc9_.length)
                  {
                     _loc10_ = String(_loc9_[_loc6_]);
                     _loc12_ = true;
                     if(_loc10_ == _loc4_.FLOW_UP)
                     {
                        if((_loc11_ = _loc4_.minigame.getPipe(_loc4_.gridX,_loc4_.gridY - 1)) == null)
                        {
                           _loc12_ = false;
                           class_6.method_1(param2 + " OUT OF BOUNDS, " + this.gridX + ", " + this.gridY + " -- " + _loc4_.type + " -- Nothing is up.");
                           _loc4_.flagForEmitter(_loc4_.FLOW_DOWN,_loc4_.gridX,_loc4_.gridY - 1,param3 * 2);
                        }
                        else
                        {
                           _loc12_ = _loc11_.checkPipe(_loc4_.FLOW_DOWN,param2 + "--> " + this.gridX + "," + this.gridY + " ",param3 + 1);
                        }
                     }
                     else if(_loc10_ == _loc4_.FLOW_RIGHT)
                     {
                        if((_loc11_ = _loc4_.minigame.getPipe(_loc4_.gridX + 1,_loc4_.gridY)) == null)
                        {
                           _loc12_ = false;
                           class_6.method_1(param2 + " OUT OF BOUNDS, " + this.gridX + ", " + this.gridY + " -- " + _loc4_.type + " -- Nothing is right.");
                           _loc4_.flagForEmitter(_loc4_.FLOW_LEFT,_loc4_.gridX + 1,_loc4_.gridY,param3 * 2);
                        }
                        else
                        {
                           _loc12_ = _loc11_.checkPipe(_loc4_.FLOW_LEFT,param2 + "--> " + this.gridX + "," + this.gridY + " ",param3 + 1);
                        }
                     }
                     else if(_loc10_ == _loc4_.FLOW_DOWN)
                     {
                        if((_loc11_ = _loc4_.minigame.getPipe(_loc4_.gridX,_loc4_.gridY + 1)) == null)
                        {
                           _loc12_ = false;
                           class_6.method_1(param2 + " OUT OF BOUNDS, " + this.gridX + ", " + this.gridY + " -- " + _loc4_.type + " -- Nothing is below.");
                           _loc4_.flagForEmitter(_loc4_.FLOW_UP,_loc4_.gridX,_loc4_.gridY + 1,param3 * 2);
                        }
                        else
                        {
                           _loc12_ = _loc11_.checkPipe(_loc4_.FLOW_UP,param2 + "--> " + this.gridX + "," + this.gridY + " ",param3 + 1);
                        }
                     }
                     else if(_loc10_ == _loc4_.FLOW_LEFT)
                     {
                        if(_loc4_.gridX == 0)
                        {
                           if(_loc4_.minigame.endY == _loc4_.gridY)
                           {
                              _loc12_ = true;
                              _loc4_.minigame.didReachEnd = true;
                           }
                           else
                           {
                              _loc12_ = false;
                              class_6.method_1(param2 + " OUT OF BOUNDS, " + this.gridX + ", " + this.gridY + " -- " + _loc4_.type + " -- At the left, but the pipe isn\'t next to me.");
                              _loc4_.flagForEmitter("oobright",_loc4_.gridX - 1,_loc4_.gridY,param3 * 2);
                           }
                        }
                        else if((_loc11_ = _loc4_.minigame.getPipe(_loc4_.gridX - 1,_loc4_.gridY)) == null)
                        {
                           _loc12_ = false;
                           class_6.method_1(param2 + " OUT OF BOUNDS, " + this.gridX + ", " + this.gridY + " -- " + _loc4_.type + " -- Nothing is left.");
                           _loc4_.flagForEmitter(_loc4_.FLOW_RIGHT,_loc4_.gridX - 1,_loc4_.gridY,param3 * 2);
                        }
                        else
                        {
                           _loc12_ = _loc11_.checkPipe(_loc4_.FLOW_RIGHT,param2 + "--> " + this.gridX + "," + this.gridY + " ",param3 + 1);
                        }
                     }
                     if(_loc12_ == false)
                     {
                        _loc5_ = false;
                     }
                     _loc6_++;
                  }
               }
            }
         }
         return _loc5_;
      }
   }
}
