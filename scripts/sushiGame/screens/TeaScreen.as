package sushiGame.screens
{
   import flash.display.MovieClip;
   import flash.events.*;
   import package_2.class_6;
   import package_4.*;
   import sushiGame.data.FoodData;
   import sushiGame.data.UserData;
   import sushiGame.models.SushiRoll;
   import sushiGame.models.Tea;
   
   public class TeaScreen
   {
       
      
      public var clip:MovieClip;
      
      public var isActive:Boolean = false;
      
      public var gameObj:class_5;
      
      public var currentOrder:SushiRoll = null;
      
      public var waitingOrders:Vector.<SushiRoll> = null;
      
      public var teaTypes:Array;
      
      public var bubbleTypes:Array;
      
      public var teaTypesAvailable:Array;
      
      public var bubbleTypesAvailable:Array;
      
      public var mode:String = "milk";
      
      public const MODE_MILK:String = "milk";
      
      public const MODE_TEA:String = "tea";
      
      public const MODE_BUBBLES:String = "bubbles";
      
      public const MODE_DONE:String = "done";
      
      public var isSwitchingModes:Boolean = false;
      
      public var currentTea:Tea = null;
      
      public var selectedTea:String = null;
      
      public var selectedBubbles:String = null;
      
      public var numButtons:Number = 12;
      
      public var trashTargetX:Number = -2;
      
      public var trashOffscreenX:Number = -172;
      
      public var rollsThrownAway:Number = 0;
      
      public var meterIsRunning:Boolean = false;
      
      public var moveDir:Number = 1;
      
      public var meterMinX:Number = -5;
      
      public var meterMaxX:Number = 124;
      
      public var meterStarX:Number = 61.5;
      
      public var maxSpeed:Number = 9;
      
      public var minSpeed:Number = 3;
      
      public var speed:Number = 9;
      
      public var lightCoords:Array;
      
      public var times:Number = 0;
      
      public function TeaScreen(param1:class_5)
      {
         this.teaTypesAvailable = [];
         this.bubbleTypesAvailable = [];
         this.lightCoords = [0,8.5,17,25.5,34,42.5,51,61.5,72,80.5,89,97,105.5,114,122];
         super();
         var _loc2_:TeaScreen = this;
         _loc2_.gameObj = param1;
         _loc2_.setupScreen();
      }
      
      public function setupScreen() : void
      {
         var _loc1_:TeaScreen = this;
         var _loc2_:UserData = _loc1_.gameObj.var_127;
         _loc1_.clip = new teaScreenMC();
         _loc1_.clip.mouseEnabled = false;
         _loc1_.clip.bg.cacheAsBitmap = true;
         _loc1_.waitingOrders = new Vector.<SushiRoll>();
         _loc1_.setupMachine(true);
         _loc1_.gameObj.var_128.addEventListener("soundIsMuted",_loc1_.onSoundIsMuted);
         _loc1_.gameObj.var_128.addEventListener("soundIsNotMuted",_loc1_.onSoundIsNotMuted);
         _loc1_.hideDottedLine();
      }
      
      public function addToWaitingOrders(param1:SushiRoll) : void
      {
         var _loc2_:TeaScreen = this;
         _loc2_.waitingOrders.push(param1);
      }
      
      public function removeOrder(param1:Boolean = false) : void
      {
         var _loc2_:TeaScreen = this;
         if(_loc2_.currentOrder)
         {
            if(param1)
            {
               _loc2_.currentOrder.destroy();
            }
            _loc2_.currentOrder = null;
            _loc2_.checkForFoodOrder();
         }
      }
      
      public function setupMachine(param1:Boolean = true, param2:Number = -1) : void
      {
         var _loc5_:int = 0;
         var _loc6_:Number = NaN;
         var _loc7_:Boolean = false;
         var _loc8_:MovieClip = null;
         var _loc3_:TeaScreen = this;
         var _loc4_:UserData = _loc3_.gameObj.var_127;
         if(param1)
         {
            _loc6_ = _loc4_.getMonth();
            _loc7_ = _loc4_.isNewYear();
            if(param2 > -1)
            {
               _loc6_ = param2;
               _loc7_ = true;
            }
            _loc3_.teaTypes = FoodData.getTeas(_loc6_,_loc7_);
            _loc3_.bubbleTypes = FoodData.getBubbles(_loc6_,_loc7_);
            _loc3_.teaTypesAvailable = [];
            _loc3_.bubbleTypesAvailable = [];
            _loc5_ = 0;
            while(_loc5_ < Math.max(_loc3_.bubbleTypes.length,_loc3_.teaTypes.length))
            {
               _loc8_ = _loc3_.clip["tea" + _loc5_ + "_btn"];
               _loc8_.gotoAndStop(_loc8_.totalFrames);
               _loc8_.cover.visible = false;
               if(_loc3_.teaTypes.length > _loc5_)
               {
                  _loc8_.tea_icon.gotoAndStop(_loc3_.teaTypes[_loc5_]);
                  if(_loc4_.hasTopping(_loc3_.teaTypes[_loc5_]))
                  {
                     _loc3_.teaTypesAvailable.push(true);
                  }
                  else
                  {
                     _loc3_.teaTypesAvailable.push(false);
                  }
               }
               else
               {
                  _loc8_.tea_icon.stop();
               }
               if(_loc3_.bubbleTypes.length > _loc5_)
               {
                  _loc8_.bubble_icon.gotoAndStop(_loc3_.bubbleTypes[_loc5_]);
                  if(_loc4_.hasTopping(_loc3_.bubbleTypes[_loc5_]))
                  {
                     _loc3_.bubbleTypesAvailable.push(true);
                  }
                  else
                  {
                     _loc3_.bubbleTypesAvailable.push(false);
                  }
               }
               else
               {
                  _loc8_.bubble_icon.stop();
               }
               _loc8_.tea_icon.cacheAsBitmap = true;
               _loc8_.bubble_icon.cacheAsBitmap = true;
               _loc8_.tea_icon.visible = false;
               _loc8_.bubble_icon.visible = false;
               _loc8_.buttonMode = true;
               _loc8_.addEventListener(MouseEvent.MOUSE_DOWN,_loc3_.clickMachineButton);
               _loc8_.mouseEnabled = false;
               _loc5_++;
            }
            _loc3_.resetMeter(false);
            _loc3_.clip.pour_btn.gotoAndStop(2);
            _loc3_.clip.pour_btn.buttonMode = true;
            _loc3_.clip.pour_btn.mouseEnabled = false;
            _loc3_.clip.pour_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc3_.clickPour);
         }
         else
         {
            _loc5_ = 0;
            while(_loc5_ < 12)
            {
               _loc3_.clip["tea" + _loc5_ + "_btn"].removeEventListener(MouseEvent.MOUSE_DOWN,_loc3_.clickMachineButton);
               _loc5_++;
            }
            _loc3_.clip.pour_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc3_.clickPour);
         }
      }
      
      public function raiseSpout() : void
      {
         var _loc1_:TeaScreen = this;
         _loc1_.clip.spout.gotoAndPlay("rise");
      }
      
      public function stopSpout() : void
      {
         var _loc1_:TeaScreen = this;
         _loc1_.clip.spout.stop();
      }
      
      public function clickPour(param1:MouseEvent) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         var _loc2_:TeaScreen = this;
         if(_loc2_.currentTea && _loc2_.currentTea.isDragging == false && _loc2_.currentTea.isReturning == false && _loc2_.currentTea.isTrashing == false && _loc2_.currentTea.isOnPlate == false)
         {
            _loc2_.gameObj.method_104(25,28,31);
            _loc2_.gameObj.var_128.playSound("press_pour_button.wav");
            _loc2_.clip.spout.gotoAndPlay("run");
            _loc2_.stopMeter();
            _loc3_ = Math.abs(_loc2_.meterStarX - _loc2_.clip.meter.slider.x);
            _loc4_ = Math.round(Math.max(0,100 - _loc3_));
            if(_loc2_.currentTea)
            {
               if(_loc2_.mode == _loc2_.MODE_MILK)
               {
                  _loc2_.currentTea.pourMilk(_loc4_);
               }
               else if(_loc2_.mode == _loc2_.MODE_TEA && _loc2_.selectedTea != null)
               {
                  _loc2_.currentTea.addTea(_loc2_.selectedTea,_loc4_);
               }
               else if(_loc2_.mode == _loc2_.MODE_BUBBLES && _loc2_.selectedBubbles != null)
               {
                  _loc2_.currentTea.addBubbles(_loc2_.selectedBubbles,_loc4_);
               }
               _loc5_ = 0;
               while(_loc5_ < _loc2_.numButtons)
               {
                  _loc2_.clip["tea" + _loc5_ + "_btn"].mouseEnabled = false;
                  _loc2_.clip["tea" + _loc5_ + "_btn"].mouseChildren = false;
                  _loc2_.clip["tea" + _loc5_ + "_btn"].buttonMode = false;
                  _loc5_++;
               }
            }
            _loc2_.clip.pour_btn.mouseEnabled = false;
            _loc2_.clip.pour_btn.buttonMode = false;
            _loc2_.clip.pour_btn.gotoAndStop(2);
         }
         else
         {
            _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         }
      }
      
      public function clickMachineButton(param1:MouseEvent) : void
      {
         var _loc3_:int = 0;
         var _loc5_:Number = NaN;
         var _loc2_:TeaScreen = this;
         _loc2_.gameObj.var_128.playSound("press_machine_button.wav");
         var _loc4_:Boolean = false;
         if(_loc2_.currentTea != null && _loc2_.currentTea.isDragging == false && _loc2_.currentTea.isOnPlate == false && _loc2_.currentTea.isTrashing == false)
         {
            _loc5_ = Number(String(String(param1.currentTarget.name).split("_btn")[0]).split("tea")[1]);
            class_6.method_1("Click Button " + _loc5_);
            if(_loc2_.gameObj.training == false || _loc2_.mode == _loc2_.MODE_TEA && _loc2_.teaTypes[_loc5_] == FoodData.TEA_STRAWBERRY || _loc2_.mode == _loc2_.MODE_BUBBLES && _loc2_.bubbleTypes[_loc5_] == FoodData.BUBBLE_MANGO)
            {
               if(_loc2_.mode == _loc2_.MODE_TEA && _loc2_.teaTypes.length > _loc5_ && _loc2_.currentTea.teaType == null)
               {
                  _loc2_.selectedTea = _loc2_.teaTypes[_loc5_];
                  _loc4_ = true;
                  _loc3_ = 0;
                  while(_loc3_ < _loc2_.teaTypes.length)
                  {
                     if(_loc3_ == _loc5_)
                     {
                        _loc2_.clip["tea" + _loc3_ + "_btn"].cover.visible = false;
                     }
                     else
                     {
                        _loc2_.clip["tea" + _loc3_ + "_btn"].cover.visible = true;
                     }
                     _loc3_++;
                  }
                  if(_loc2_.selectedTea == FoodData.TEA_STRAWBERRY)
                  {
                     _loc2_.gameObj.method_104(27);
                  }
               }
               else if(_loc2_.mode == _loc2_.MODE_BUBBLES && _loc2_.bubbleTypes.length > _loc5_ && _loc2_.currentTea.bubbleType == null)
               {
                  _loc2_.selectedBubbles = _loc2_.bubbleTypes[_loc5_];
                  _loc4_ = true;
                  _loc3_ = 0;
                  while(_loc3_ < _loc2_.teaTypes.length)
                  {
                     if(_loc3_ == _loc5_)
                     {
                        _loc2_.clip["tea" + _loc3_ + "_btn"].cover.visible = false;
                     }
                     else
                     {
                        _loc2_.clip["tea" + _loc3_ + "_btn"].cover.visible = true;
                     }
                     _loc3_++;
                  }
                  if(_loc2_.selectedBubbles == FoodData.BUBBLE_MANGO)
                  {
                     _loc2_.gameObj.method_104(30);
                  }
               }
            }
         }
         if(_loc4_)
         {
            _loc2_.resetMeter(true);
            if(_loc2_.clip.spout.currentFrame == 1 || _loc2_.clip.spout.currentFrame >= 19)
            {
               _loc2_.clip.spout.gotoAndPlay("drop");
            }
            _loc2_.clip.pour_btn.gotoAndStop(1);
            _loc2_.clip.pour_btn.mouseEnabled = true;
            _loc2_.clip.pour_btn.buttonMode = true;
         }
      }
      
      public function onSoundIsMuted(param1:Event) : void
      {
         this;
      }
      
      public function onSoundIsNotMuted(param1:Event) : void
      {
         this;
      }
      
      public function destroy() : void
      {
         var _loc2_:int = 0;
         var _loc1_:TeaScreen = this;
         if(_loc1_.waitingOrders)
         {
            _loc2_ = int(_loc1_.waitingOrders.length - 1);
            while(_loc2_ >= 0)
            {
               if(_loc1_.waitingOrders[_loc2_])
               {
                  _loc1_.waitingOrders[_loc2_].destroy();
                  _loc1_.waitingOrders[_loc2_] = null;
               }
               _loc1_.waitingOrders.splice(_loc2_,1);
               _loc2_--;
            }
         }
         _loc1_.waitingOrders = null;
         if(_loc1_.currentOrder)
         {
            _loc1_.currentOrder.destroy();
            _loc1_.currentOrder = null;
         }
         _loc1_.setupMachine(false);
         _loc1_.gameObj.var_128.removeEventListener("soundIsMuted",_loc1_.onSoundIsMuted);
         _loc1_.gameObj.var_128.removeEventListener("soundIsNotMuted",_loc1_.onSoundIsNotMuted);
         if(_loc1_.gameObj.var_139.contains(_loc1_.clip))
         {
            _loc1_.gameObj.var_139.removeChild(_loc1_.clip);
         }
         _loc1_.clip = null;
      }
      
      public function restoreSoundAfterAd() : void
      {
         this;
      }
      
      public function activateScreen() : void
      {
         var _loc1_:TeaScreen = this;
         if(!_loc1_.gameObj.var_139.contains(_loc1_.clip))
         {
            _loc1_.gameObj.var_139.addChild(_loc1_.clip);
         }
         _loc1_.gameObj.var_128.switchMusic("other");
         _loc1_.isActive = true;
         _loc1_.checkForFoodOrder();
         _loc1_.checkForTea();
         _loc1_.gameObj.method_121();
         _loc1_.putAwayEverything();
      }
      
      public function deactivateScreen() : void
      {
         var _loc1_:TeaScreen = this;
         if(_loc1_.gameObj.var_139.contains(_loc1_.clip))
         {
            _loc1_.gameObj.var_139.removeChild(_loc1_.clip);
         }
         _loc1_.isActive = false;
      }
      
      public function cupIsReady() : void
      {
         var _loc1_:TeaScreen = this;
         if(_loc1_.clip.spout.currentFrame == 1 || _loc1_.clip.spout.currentFrame >= 19)
         {
            _loc1_.clip.spout.gotoAndPlay("drop");
         }
         _loc1_.resetMeter(true);
         _loc1_.clip.pour_btn.mouseEnabled = true;
         _loc1_.clip.pour_btn.buttonMode = true;
         _loc1_.clip.pour_btn.gotoAndStop(1);
         if(_loc1_.gameObj.var_127.hasBonus("automilk"))
         {
            _loc1_.resetMeter(false,true);
            _loc1_.clickPour(null);
         }
      }
      
      public function updateScreen() : void
      {
         var _loc2_:int = 0;
         var _loc4_:Number = NaN;
         var _loc1_:TeaScreen = this;
         _loc1_.updateMeter();
         if(_loc1_.clip && _loc1_.clip.dottedline.alpha > 0 && _loc1_.clip.dottedline.alpha < 1)
         {
            _loc1_.clip.dottedline.alpha += 0.05;
         }
         if(_loc1_.isSwitchingModes)
         {
            _loc4_ = 0;
            _loc2_ = 0;
            while(_loc2_ < _loc1_.numButtons)
            {
               if(_loc1_.clip["tea" + _loc2_ + "_btn"].currentFrame < _loc1_.clip["tea" + _loc2_ + "_btn"].totalFrames)
               {
                  _loc1_.clip["tea" + _loc2_ + "_btn"].nextFrame();
               }
               else
               {
                  _loc1_.clip["tea" + _loc2_ + "_btn"].stop();
                  _loc4_++;
               }
               _loc2_++;
            }
            if(_loc4_ == _loc1_.numButtons)
            {
               _loc1_.finishSwitchingMode();
            }
         }
         else
         {
            _loc2_ = 0;
            while(_loc2_ < _loc1_.numButtons)
            {
               if(_loc1_.clip["tea" + _loc2_ + "_btn"].currentFrame > 1 && (_loc1_.mode == _loc1_.MODE_TEA && _loc1_.teaTypesAvailable.length > _loc2_ && _loc1_.teaTypesAvailable[_loc2_] == true || _loc1_.mode == _loc1_.MODE_BUBBLES && _loc1_.bubbleTypesAvailable.length > _loc2_ && _loc1_.bubbleTypesAvailable[_loc2_] == true))
               {
                  _loc1_.clip["tea" + _loc2_ + "_btn"].prevFrame();
               }
               _loc2_++;
            }
         }
         var _loc3_:Number = _loc1_.trashOffscreenX;
         if(Boolean(_loc1_.currentTea) && _loc1_.currentTea.isDragging)
         {
            _loc3_ = _loc1_.trashTargetX;
         }
         else if(Boolean(_loc1_.currentOrder) && _loc1_.currentOrder.isDraggingOnTea)
         {
            _loc3_ = _loc1_.trashTargetX;
         }
         if(_loc1_.clip.trash_tray.x != _loc3_)
         {
            _loc1_.clip.trash_tray.x += (_loc3_ - _loc1_.clip.trash_tray.x) / 2;
         }
         if(_loc1_.currentTea)
         {
            _loc1_.currentTea.updateTea();
         }
         if(_loc1_.currentOrder)
         {
            _loc1_.currentOrder.updateSushiOnTea();
         }
      }
      
      public function initStationUpgrades() : void
      {
         this;
      }
      
      public function cheatChangeMonth(param1:Number) : void
      {
         var _loc2_:TeaScreen = this;
         _loc2_.setupMachine(false);
         _loc2_.setupMachine(true,param1);
         _loc2_.removeTea(true);
      }
      
      public function restoreAfterServing() : void
      {
         var _loc1_:TeaScreen = this;
         _loc1_.removeTea(true);
         _loc1_.removeOrder(true);
         _loc1_.checkForFoodOrder();
      }
      
      public function isSushiWaiting() : Boolean
      {
         var _loc1_:TeaScreen = this;
         if(Boolean(_loc1_.waitingOrders) && _loc1_.waitingOrders.length > 0)
         {
            return true;
         }
         return false;
      }
      
      public function checkForFoodOrder() : void
      {
         var _loc2_:SushiRoll = null;
         var _loc1_:TeaScreen = this;
         if(_loc1_.currentOrder == null)
         {
            if(Boolean(_loc1_.waitingOrders) && _loc1_.waitingOrders.length > 0)
            {
               _loc2_ = _loc1_.waitingOrders.shift();
               _loc1_.currentOrder = _loc2_;
               _loc1_.currentOrder.moveToTeaStation(_loc1_.clip.topholder);
            }
         }
      }
      
      public function quietSoundWhenPaused() : void
      {
         this;
      }
      
      public function resumeSoundAfterPaused() : void
      {
         this;
      }
      
      public function clickScreen(param1:MouseEvent = null) : void
      {
         var _loc2_:TeaScreen = this;
         if(_loc2_.isActive && !_loc2_.gameObj.var_169)
         {
         }
      }
      
      public function releaseScreen(param1:MouseEvent = null) : void
      {
         var _loc2_:TeaScreen = this;
         if(_loc2_.isActive && !_loc2_.gameObj.var_169)
         {
         }
      }
      
      public function stopSounds() : void
      {
         this;
      }
      
      public function isPlayingPouringSound() : Boolean
      {
         this;
         return false;
      }
      
      public function canLeaveStation(param1:Boolean = false) : Boolean
      {
         return true;
      }
      
      public function switchMode(param1:String) : void
      {
         var _loc2_:TeaScreen = this;
         if(_loc2_.mode != param1)
         {
            class_6.method_1("SWITCH TO MODE: " + param1);
            _loc2_.mode = param1;
            _loc2_.isSwitchingModes = true;
         }
      }
      
      public function finishSwitchingMode() : void
      {
         var _loc2_:int = 0;
         var _loc1_:TeaScreen = this;
         class_6.method_1("FINISH SWITCHING MODE");
         _loc1_.isSwitchingModes = false;
         if(_loc1_.mode == _loc1_.MODE_MILK || _loc1_.mode == _loc1_.MODE_DONE)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc1_.numButtons)
            {
               _loc1_.clip["tea" + _loc2_ + "_btn"].mouseEnabled = false;
               _loc1_.clip["tea" + _loc2_ + "_btn"].mouseChildren = false;
               _loc1_.clip["tea" + _loc2_ + "_btn"].buttonMode = false;
               _loc1_.clip["tea" + _loc2_ + "_btn"].bubble_icon.visible = false;
               _loc1_.clip["tea" + _loc2_ + "_btn"].tea_icon.visible = false;
               _loc1_.clip["tea" + _loc2_ + "_btn"].cover.visible = false;
               _loc2_++;
            }
         }
         else if(_loc1_.mode == _loc1_.MODE_TEA)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc1_.numButtons)
            {
               if(_loc1_.teaTypesAvailable.length > _loc2_ && _loc1_.teaTypesAvailable[_loc2_] == true)
               {
                  _loc1_.clip["tea" + _loc2_ + "_btn"].mouseEnabled = true;
                  _loc1_.clip["tea" + _loc2_ + "_btn"].mouseChildren = true;
                  _loc1_.clip["tea" + _loc2_ + "_btn"].buttonMode = true;
                  _loc1_.clip["tea" + _loc2_ + "_btn"].bubble_icon.visible = false;
                  _loc1_.clip["tea" + _loc2_ + "_btn"].tea_icon.visible = true;
               }
               else
               {
                  _loc1_.clip["tea" + _loc2_ + "_btn"].mouseEnabled = false;
                  _loc1_.clip["tea" + _loc2_ + "_btn"].mouseChildren = false;
                  _loc1_.clip["tea" + _loc2_ + "_btn"].buttonMode = false;
                  _loc1_.clip["tea" + _loc2_ + "_btn"].bubble_icon.visible = false;
                  _loc1_.clip["tea" + _loc2_ + "_btn"].tea_icon.visible = false;
               }
               _loc1_.clip["tea" + _loc2_ + "_btn"].cover.visible = false;
               _loc2_++;
            }
            _loc1_.resetMeter(false);
            _loc1_.clip.pour_btn.mouseEnabled = false;
            _loc1_.clip.pour_btn.buttonMode = false;
            _loc1_.clip.pour_btn.gotoAndStop(2);
         }
         else if(_loc1_.mode == _loc1_.MODE_BUBBLES)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc1_.numButtons)
            {
               if(_loc1_.bubbleTypesAvailable.length > _loc2_ && _loc1_.bubbleTypesAvailable[_loc2_] == true)
               {
                  _loc1_.clip["tea" + _loc2_ + "_btn"].mouseEnabled = true;
                  _loc1_.clip["tea" + _loc2_ + "_btn"].mouseChildren = true;
                  _loc1_.clip["tea" + _loc2_ + "_btn"].buttonMode = true;
                  _loc1_.clip["tea" + _loc2_ + "_btn"].bubble_icon.visible = true;
                  _loc1_.clip["tea" + _loc2_ + "_btn"].tea_icon.visible = false;
               }
               else
               {
                  _loc1_.clip["tea" + _loc2_ + "_btn"].mouseEnabled = false;
                  _loc1_.clip["tea" + _loc2_ + "_btn"].mouseChildren = false;
                  _loc1_.clip["tea" + _loc2_ + "_btn"].buttonMode = false;
                  _loc1_.clip["tea" + _loc2_ + "_btn"].bubble_icon.visible = false;
                  _loc1_.clip["tea" + _loc2_ + "_btn"].tea_icon.visible = false;
               }
               _loc1_.clip["tea" + _loc2_ + "_btn"].cover.visible = false;
               _loc2_++;
            }
            _loc1_.resetMeter(false);
            _loc1_.clip.pour_btn.mouseEnabled = false;
            _loc1_.clip.pour_btn.buttonMode = false;
            _loc1_.clip.pour_btn.gotoAndStop(2);
         }
      }
      
      public function resetMachine() : void
      {
         this;
      }
      
      public function removeTea(param1:Boolean = false) : void
      {
         var _loc2_:TeaScreen = this;
         if(_loc2_.currentTea)
         {
            if(param1)
            {
               _loc2_.currentTea.destroy();
            }
            _loc2_.currentTea = null;
         }
         _loc2_.checkForTea();
      }
      
      public function checkForTea() : void
      {
         var _loc1_:TeaScreen = this;
         if(_loc1_.currentTea == null && _loc1_.isActive)
         {
            _loc1_.currentTea = new Tea(_loc1_.gameObj,_loc1_);
            _loc1_.switchMode(_loc1_.MODE_MILK);
         }
      }
      
      public function showDottedLine() : void
      {
         var _loc1_:TeaScreen = this;
         class_6.method_1("-----------------------------------SHOW DOTTED LINE");
         if(_loc1_.clip.dottedline.alpha == 0)
         {
            _loc1_.clip.dottedline.alpha = 0.05;
         }
      }
      
      public function hideDottedLine() : void
      {
         var _loc1_:TeaScreen = this;
         class_6.method_1("-----------------------------------HIDE DOTTED LINE");
         _loc1_.clip.dottedline.alpha = 0;
      }
      
      public function recordThrowAway() : void
      {
         var _loc1_:TeaScreen = this;
         ++_loc1_.rollsThrownAway;
         class_6.method_1("How many sliced sushi thrown away today: " + _loc1_.rollsThrownAway);
         if(_loc1_.rollsThrownAway >= 5)
         {
            _loc1_.gameObj.var_136.recordTagged("wasteful");
         }
      }
      
      public function putAwayEverything() : void
      {
         var _loc1_:TeaScreen = this;
         if(Boolean(_loc1_.currentTea) && _loc1_.currentTea.isDragging)
         {
            _loc1_.currentTea.releaseTea(null);
         }
         if(Boolean(_loc1_.currentOrder) && _loc1_.currentOrder.isDraggingOnTea)
         {
            _loc1_.currentOrder.releaseOnTea(null);
         }
      }
      
      public function resetMeter(param1:Boolean = false, param2:Boolean = false) : void
      {
         var _loc3_:TeaScreen = this;
         _loc3_.times = 0;
         _loc3_.clip.meter.slider.x = _loc3_.meterMinX;
         if(param2)
         {
            _loc3_.clip.meter.slider.x = _loc3_.meterStarX;
            _loc3_.stopMeter(true);
         }
         if(param1)
         {
            _loc3_.clip.meter.slider.visible = true;
         }
         else
         {
            _loc3_.clip.meter.slider.visible = false;
         }
         _loc3_.speed = _loc3_.maxSpeed;
         _loc3_.moveDir = 1;
         _loc3_.meterIsRunning = param1;
         _loc3_.clip.meter.slider.gotoAndStop(1);
      }
      
      public function updateMeter() : void
      {
         var _loc1_:TeaScreen = this;
         if(_loc1_.meterIsRunning)
         {
            _loc1_.clip.meter.slider.x += _loc1_.moveDir * _loc1_.speed;
            if(_loc1_.clip.meter.slider.x > _loc1_.meterMaxX)
            {
               _loc1_.clip.meter.slider.x = _loc1_.meterMaxX;
               _loc1_.clip.meter.slider.gotoAndStop(2);
               _loc1_.moveDir = -1;
            }
            else if(_loc1_.clip.meter.slider.x < _loc1_.meterMinX)
            {
               _loc1_.clip.meter.slider.x = _loc1_.meterMinX;
               _loc1_.clip.meter.slider.gotoAndStop(1);
               _loc1_.moveDir = 1;
               ++_loc1_.times;
            }
         }
         var _loc2_:Number = Math.abs(_loc1_.meterStarX - _loc1_.clip.meter.slider.x);
         if(_loc2_ <= 5)
         {
            _loc1_.clip.meter.star.gotoAndStop(3);
         }
         else if(_loc2_ < 16)
         {
            if(_loc1_.clip.meter.slider.x > _loc1_.meterStarX && _loc1_.moveDir == 1 || _loc1_.clip.meter.slider.x < _loc1_.meterStarX && _loc1_.moveDir == -1)
            {
               _loc1_.clip.meter.star.gotoAndStop(2);
            }
            else
            {
               _loc1_.clip.meter.star.gotoAndStop(1);
            }
         }
         else
         {
            _loc1_.clip.meter.star.gotoAndStop(1);
         }
      }
      
      public function stopMeter(param1:Boolean = false) : void
      {
         var _loc6_:int = 0;
         var _loc7_:Number = NaN;
         var _loc2_:TeaScreen = this;
         _loc2_.meterIsRunning = false;
         var _loc3_:Number = 999;
         var _loc4_:Number = -1;
         var _loc5_:Number;
         if((_loc5_ = Math.abs(_loc2_.meterStarX - _loc2_.clip.meter.slider.x)) <= 5)
         {
            _loc4_ = 7;
         }
         else if(_loc5_ < 8)
         {
            if(_loc2_.clip.meter.slider.x > _loc2_.meterStarX && _loc2_.moveDir == 1 || _loc2_.clip.meter.slider.x < _loc2_.meterStarX && _loc2_.moveDir == -1)
            {
               _loc4_ = 7;
            }
         }
         if(_loc4_ == -1)
         {
            _loc6_ = 0;
            while(_loc6_ < _loc2_.lightCoords.length)
            {
               if(_loc2_.moveDir == 1)
               {
                  _loc7_ = _loc2_.lightCoords[_loc6_] - _loc2_.clip.meter.slider.x;
               }
               else
               {
                  _loc7_ = _loc2_.clip.meter.slider.x - _loc2_.lightCoords[_loc6_];
               }
               if(Math.abs(_loc7_) >= 5)
               {
                  if(_loc7_ < _loc3_ && _loc7_ >= 0)
                  {
                     _loc3_ = Math.abs(_loc7_);
                     _loc4_ = _loc6_;
                  }
               }
               else if(Math.abs(_loc7_) < _loc3_)
               {
                  _loc3_ = Math.abs(_loc7_);
                  _loc4_ = _loc6_;
               }
               _loc6_++;
            }
         }
         if(_loc4_ > -1)
         {
            _loc2_.clip.meter.slider.gotoAndStop(3);
            _loc2_.clip.meter.slider.x = _loc2_.lightCoords[_loc4_];
         }
      }
   }
}
