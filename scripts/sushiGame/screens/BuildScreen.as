package sushiGame.screens
{
   import flash.display.MovieClip;
   import flash.events.*;
   import flash.geom.ColorTransform;
   import flash.media.SoundChannel;
   import package_2.class_14;
   import package_2.class_6;
   import package_4.*;
   import sushiGame.data.*;
   import sushiGame.models.*;
   
   public class BuildScreen
   {
       
      
      public var clip:MovieClip;
      
      public var isActive:Boolean = false;
      
      public var gameObj:class_5;
      
      public var currentOrder:SushiRoll = null;
      
      public var waitingOrders:Vector.<SushiRoll> = null;
      
      public var mode:String = "filling";
      
      public const MODE_FILLING:String = "filling";
      
      public const MODE_TOPPING:String = "topping";
      
      public const MODE_CUTTING:String = "cutting";
      
      public var fillingNames:Vector.<String> = null;
      
      public var fillings:Vector.<MovieClip> = null;
      
      public var numBins:Number = 24;
      
      public var toppingNames:Vector.<String> = null;
      
      public var toppings:Vector.<MovieClip> = null;
      
      public var modeSwitchTimer:Number = 0;
      
      public var modeSwitchTimerMax:Number = 9;
      
      public var isSwitchingModes:Boolean = false;
      
      public var selectedTopping:String = "none";
      
      public var toppingData:ToppingItem;
      
      public var toppingCapacity:Number = 5;
      
      public var toppingRemaining:Number = 5;
      
      public var toppingStack:ToppingStack = null;
      
      public var returningStacks:Vector.<ToppingStack> = null;
      
      public var colorTransformDarker:ColorTransform;
      
      public var colorTransformNormal:ColorTransform;
      
      public var isDraggingFilling:Boolean = false;
      
      public var bottleCoordsX:Array;
      
      public var bottleCoordsY:Array;
      
      public var shakerCoordsX:Array;
      
      public var shakerCoordsY:Array;
      
      public var shakerIsBackRow:Array;
      
      public var bottles:Vector.<ToppingShaker> = null;
      
      public var bottleTypes:Vector.<String> = null;
      
      public var isSelectingBin:Boolean = false;
      
      public var clickingWhichBin:String = "none";
      
      public var isSelectingBottle:Boolean = false;
      
      public var clickingWhichBottle:String = "none";
      
      public var shouldDeselect:Boolean = false;
      
      public var shouldStartPouring:Boolean = false;
      
      public var pouringSound:SoundChannel;
      
      public var knifeTargetX:Number = 482;
      
      public var knifeTargetY:Number = 392;
      
      public var knifeOffscreenX:Number = 772;
      
      public var trainingGuide:MovieClip = null;
      
      public var knife:SushiKnife = null;
      
      public var isShowingWarning:Boolean = false;
      
      public var warningTimer:Number = 0;
      
      public var warningTimerMax:Number = 90;
      
      public function BuildScreen(param1:class_5)
      {
         this.bottleCoordsX = [28,67,106,145,184,223,262,301,340,379,418,457];
         this.bottleCoordsY = [131,131,131,131,131,131,131,131,131,131,131,131];
         this.shakerCoordsX = [59,118,176,30,89,147];
         this.shakerCoordsY = [359,359,359,402,402,402];
         this.shakerIsBackRow = [true,true,true,false,false,false];
         super();
         var _loc2_:BuildScreen = this;
         _loc2_.gameObj = param1;
         _loc2_.setupScreen();
      }
      
      public function setupScreen() : void
      {
         var _loc1_:BuildScreen = this;
         var _loc2_:UserData = _loc1_.gameObj.var_127;
         _loc1_.clip = new buildScreenMC();
         _loc1_.clip.mouseEnabled = false;
         _loc1_.clip.holder.mouseEnabled = false;
         _loc1_.clip.bg.cacheAsBitmap = true;
         _loc1_.gameObj.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickScreen);
         _loc1_.gameObj.addEventListener(MouseEvent.MOUSE_UP,_loc1_.releaseScreen);
         _loc1_.clip.right_trash_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickTrash);
         _loc1_.clip.left_trash_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickTrash);
         _loc1_.clip.flip_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickFlip);
         _loc1_.clip.roll_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickRoll);
         _loc1_.clip.knife_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickKnife);
         _loc1_.clip.knife_btn.addEventListener(MouseEvent.ROLL_OVER,_loc1_.rolloverKnife);
         _loc1_.clip.knife_btn.addEventListener(MouseEvent.ROLL_OUT,_loc1_.rolloutKnife);
         _loc1_.waitingOrders = new Vector.<SushiRoll>();
         _loc1_.returningStacks = new Vector.<ToppingStack>();
         _loc1_.setupFillings();
         _loc1_.setupToppings();
         _loc1_.hideGuide();
         _loc1_.hideWarningBubble();
         _loc1_.switchMode(_loc1_.MODE_FILLING);
         _loc1_.colorTransformNormal = new ColorTransform();
         _loc1_.colorTransformDarker = new ColorTransform(0.7,0.7,0.7);
      }
      
      public function cheatChangeMonth(param1:Number) : void
      {
         var _loc2_:BuildScreen = this;
         _loc2_.setupToppings(false);
         _loc2_.setupToppings(true,param1);
         _loc2_.setupFillings(false);
         _loc2_.setupFillings(true,param1);
         _loc2_.switchMode(_loc2_.mode);
      }
      
      public function addToWaitingOrders(param1:SushiRoll) : void
      {
         var _loc2_:BuildScreen = this;
         _loc2_.waitingOrders.push(param1);
      }
      
      public function destroy() : void
      {
         var _loc2_:Number = NaN;
         null;
         var _loc1_:BuildScreen = this;
         _loc1_.removeTrainingGuide();
         _loc1_.clip.right_trash_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickTrash);
         _loc1_.clip.left_trash_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickTrash);
         _loc1_.clip.flip_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickFlip);
         _loc1_.clip.roll_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickRoll);
         _loc1_.clip.knife_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickKnife);
         _loc1_.clip.knife_btn.removeEventListener(MouseEvent.ROLL_OVER,_loc1_.rolloverKnife);
         _loc1_.clip.knife_btn.removeEventListener(MouseEvent.ROLL_OUT,_loc1_.rolloutKnife);
         _loc1_.setupFillings(false);
         _loc1_.setupToppings(false);
         if(_loc1_.knife)
         {
            _loc1_.knife.destroy();
            _loc1_.knife = null;
         }
         if(_loc1_.returningStacks)
         {
            _loc2_ = _loc1_.returningStacks.length - 1;
            while(_loc2_ >= 0)
            {
               if(_loc1_.returningStacks[_loc2_])
               {
                  _loc1_.returningStacks[_loc2_].destroy();
                  _loc1_.returningStacks[_loc2_] = null;
               }
               _loc1_.returningStacks.splice(_loc2_,1);
               _loc2_--;
            }
         }
         _loc1_.returningStacks = null;
         if(_loc1_.waitingOrders)
         {
            _loc2_ = _loc1_.waitingOrders.length - 1;
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
         _loc1_.gameObj.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickScreen);
         _loc1_.gameObj.removeEventListener(MouseEvent.MOUSE_UP,_loc1_.releaseScreen);
         if(_loc1_.gameObj.var_139.contains(_loc1_.clip))
         {
            _loc1_.gameObj.var_139.removeChild(_loc1_.clip);
         }
         _loc1_.colorTransformDarker = null;
         _loc1_.colorTransformNormal = null;
         _loc1_.clip = null;
      }
      
      public function activateScreen() : void
      {
         var _loc1_:BuildScreen = this;
         if(!_loc1_.gameObj.var_139.contains(_loc1_.clip))
         {
            _loc1_.gameObj.var_139.addChild(_loc1_.clip);
         }
         _loc1_.gameObj.var_128.switchMusic("build");
         _loc1_.isActive = true;
         if(_loc1_.gameObj.var_152.hangerTicket && _loc1_.gameObj.var_152.hangerTicket.orderData.isSpecial && !_loc1_.gameObj.var_127.hasTrained("cheatsheet"))
         {
            _loc1_.gameObj.hud.showContextTraining("cheatsheet");
         }
         _loc1_.putAwayEverything();
         _loc1_.checkForFoodOrder();
         _loc1_.gameObj.method_121();
      }
      
      public function deactivateScreen() : void
      {
         var _loc1_:BuildScreen = this;
         if(_loc1_.gameObj.var_139.contains(_loc1_.clip))
         {
            _loc1_.gameObj.var_139.removeChild(_loc1_.clip);
         }
         _loc1_.isActive = false;
      }
      
      public function isSushiWaiting() : Boolean
      {
         var _loc1_:BuildScreen = this;
         if(_loc1_.currentOrder != null)
         {
            return true;
         }
         if(Boolean(_loc1_.waitingOrders) && _loc1_.waitingOrders.length > 0)
         {
            return true;
         }
         return false;
      }
      
      public function checkForFoodOrder() : void
      {
         var _loc2_:SushiRoll = null;
         var _loc1_:BuildScreen = this;
         if(_loc1_.currentOrder == null)
         {
            _loc1_.removeTrainingGuide();
            if(Boolean(_loc1_.waitingOrders) && _loc1_.waitingOrders.length > 0)
            {
               _loc2_ = _loc1_.waitingOrders.shift();
               _loc1_.currentOrder = _loc2_;
               _loc1_.currentOrder.moveToBuildStation(_loc1_.clip.holder);
               _loc1_.gameObj.method_121();
               _loc1_.hideGuide();
            }
            if(_loc1_.mode != _loc1_.MODE_FILLING)
            {
               _loc1_.switchMode(_loc1_.MODE_FILLING);
            }
         }
      }
      
      public function updateScreen() : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc1_:BuildScreen = this;
         if(_loc1_.clip)
         {
            if(_loc1_.isSwitchingModes)
            {
               _loc4_ = 0;
               _loc2_ = 0;
               while(_loc2_ < _loc1_.numBins)
               {
                  if(_loc1_.clip["bin" + _loc2_].currentFrame < _loc1_.clip["bin" + _loc2_].totalFrames)
                  {
                     _loc1_.clip["bin" + _loc2_].nextFrame();
                  }
                  else if(_loc1_.clip["bin" + _loc2_].currentFrame == _loc1_.clip["bin" + _loc2_].totalFrames)
                  {
                     _loc1_.clip["bin" + _loc2_].stop();
                     _loc4_++;
                  }
                  _loc2_++;
               }
               if(_loc4_ == this.numBins)
               {
                  _loc1_.readyModeSwitch();
               }
            }
            else
            {
               _loc2_ = 0;
               while(_loc2_ < _loc1_.numBins)
               {
                  if(_loc1_.mode == _loc1_.MODE_FILLING)
                  {
                     if(_loc1_.fillings && _loc1_.fillings.length > _loc2_ && _loc1_.fillings[_loc2_] != null)
                     {
                        if(_loc1_.clip["bin" + _loc2_].currentFrame > 1)
                        {
                           _loc1_.clip["bin" + _loc2_].prevFrame();
                        }
                        else
                        {
                           _loc1_.clip["bin" + _loc2_].stop();
                        }
                     }
                  }
                  else if(_loc1_.mode == _loc1_.MODE_TOPPING)
                  {
                     if(_loc1_.toppings && _loc1_.toppings.length > _loc2_ && _loc1_.toppings[_loc2_] != null)
                     {
                        if(_loc1_.clip["bin" + _loc2_].currentFrame > 1)
                        {
                           _loc1_.clip["bin" + _loc2_].prevFrame();
                        }
                        else
                        {
                           _loc1_.clip["bin" + _loc2_].stop();
                        }
                     }
                  }
                  _loc2_++;
               }
            }
         }
         if(Boolean(_loc1_.clip) && _loc1_.isShowingWarning)
         {
            ++_loc1_.warningTimer;
            if(_loc1_.warningTimer >= _loc1_.warningTimerMax)
            {
               _loc1_.hideWarningBubble();
            }
         }
         if(_loc1_.currentOrder != null && _loc1_.currentOrder.isLeavingBuild == false && (_loc1_.mode == _loc1_.MODE_FILLING || _loc1_.mode == _loc1_.MODE_TOPPING) && (_loc1_.knife == null || _loc1_.knife.isReturning))
         {
            _loc3_ = 619;
         }
         else
         {
            _loc3_ = 682;
         }
         if(_loc1_.clip.right_trash_btn.x != _loc3_)
         {
            _loc1_.clip.right_trash_btn.x += (_loc3_ - _loc1_.clip.right_trash_btn.x) / 3;
            if(Math.abs(_loc3_ - _loc1_.clip.right_trash_btn.x) <= 1)
            {
               _loc1_.clip.right_trash_btn.x = _loc3_;
            }
         }
         if(_loc1_.currentOrder != null && _loc1_.currentOrder.isLeavingBuild == false && _loc1_.mode == _loc1_.MODE_CUTTING)
         {
            _loc3_ = 19;
         }
         else
         {
            _loc3_ = -43;
         }
         if(_loc1_.clip.left_trash_btn.x != _loc3_)
         {
            _loc1_.clip.left_trash_btn.x += (_loc3_ - _loc1_.clip.left_trash_btn.x) / 3;
            if(Math.abs(_loc3_ - _loc1_.clip.left_trash_btn.x) <= 1)
            {
               _loc1_.clip.left_trash_btn.x = _loc3_;
            }
         }
         if(_loc1_.mode == _loc1_.MODE_FILLING && _loc1_.currentOrder != null && _loc1_.currentOrder.isLeavingBuild == false && _loc1_.currentOrder.filling && _loc1_.currentOrder.filling.layoutFillings && _loc1_.currentOrder.filling.layoutFillings.length == 0 && _loc1_.currentOrder.filling.distroArray.length == 0)
         {
            _loc3_ = 576;
         }
         else
         {
            _loc3_ = 686;
         }
         if(_loc1_.clip.flip_btn.x != _loc3_)
         {
            _loc1_.clip.flip_btn.x += (_loc3_ - _loc1_.clip.flip_btn.x) / 3;
            if(Math.abs(_loc3_ - _loc1_.clip.flip_btn.x) <= 1)
            {
               _loc1_.clip.flip_btn.x = _loc3_;
            }
         }
         if(_loc1_.mode == _loc1_.MODE_FILLING && _loc1_.currentOrder != null && _loc1_.currentOrder.isLeavingBuild == false && _loc1_.currentOrder.filling && _loc1_.clip.flip_btn.x == 686 && _loc1_.currentOrder.filling.layoutFillings && _loc1_.currentOrder.filling.layoutFillings.length > 0 && _loc1_.currentOrder.isRolling == false)
         {
            _loc3_ = 484;
         }
         else
         {
            _loc3_ = 686;
         }
         if(_loc1_.clip.roll_btn.x != _loc3_)
         {
            _loc1_.clip.roll_btn.x += (_loc3_ - _loc1_.clip.roll_btn.x) / 3;
            if(Math.abs(_loc3_ - _loc1_.clip.roll_btn.x) <= 1)
            {
               _loc1_.clip.roll_btn.x = _loc3_;
            }
         }
         if((_loc1_.mode == _loc1_.MODE_TOPPING || _loc1_.mode == _loc1_.MODE_CUTTING) && _loc1_.currentOrder != null && _loc1_.currentOrder.isLeavingBuild == false && _loc1_.currentOrder.isRolling == false && (_loc1_.currentOrder.slices == null || _loc1_.currentOrder.slices.length == 0))
         {
            _loc3_ = _loc1_.knifeTargetX;
         }
         else
         {
            _loc3_ = _loc1_.knifeOffscreenX;
         }
         if(_loc1_.clip.knife_btn.x != _loc3_)
         {
            _loc1_.clip.knife_btn.x += (_loc3_ - _loc1_.clip.knife_btn.x) / 3;
            if(Math.abs(_loc3_ - _loc1_.clip.knife_btn.x) <= 1)
            {
               _loc1_.clip.knife_btn.x = _loc3_;
            }
         }
         if(_loc1_.toppingStack)
         {
            _loc1_.toppingStack.updateStack();
         }
         if(_loc1_.returningStacks)
         {
            _loc2_ = int(_loc1_.returningStacks.length - 1);
            while(_loc2_ >= 0)
            {
               _loc1_.returningStacks[_loc2_].updateStack();
               _loc2_--;
            }
         }
         if(_loc1_.knife)
         {
            _loc1_.knife.updateKnife();
         }
         if(_loc1_.currentOrder)
         {
            _loc1_.currentOrder.updateSushiOnBuild();
         }
         if(_loc1_.shouldDeselect)
         {
            _loc1_.deselectToppings();
            _loc1_.shouldDeselect = false;
         }
      }
      
      public function deselectToppings(param1:String = "all") : void
      {
         var _loc2_:BuildScreen = this;
         if(param1 == "all" || _loc2_.selectedTopping == param1)
         {
            _loc2_.handlePreviousTopping("none");
            _loc2_.selectedTopping = "none";
         }
         _loc2_.shouldStartPouring = false;
         if(_loc2_.currentOrder)
         {
            if(_loc2_.currentOrder.isPouring())
            {
               _loc2_.currentOrder.stopPouring();
            }
         }
      }
      
      public function setupToppings(param1:Boolean = true, param2:Number = -1) : void
      {
         var _loc5_:int = 0;
         var _loc6_:Number = NaN;
         var _loc7_:Boolean = false;
         var _loc8_:Array = null;
         var _loc9_:Array = null;
         var _loc10_:Array = null;
         var _loc11_:MovieClip = null;
         var _loc12_:ToppingShaker = null;
         var _loc13_:MovieClip = null;
         var _loc14_:ToppingShaker = null;
         var _loc3_:BuildScreen = this;
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
            _loc3_.toppings = new Vector.<MovieClip>();
            _loc3_.toppingNames = new Vector.<String>();
            _loc8_ = FoodData.getDrops(_loc6_,_loc7_);
            _loc5_ = 0;
            while(_loc5_ < Math.max(_loc8_.length,_loc3_.numBins))
            {
               if(_loc5_ < _loc8_.length && _loc8_[_loc5_] != null && _loc3_.gameObj.var_127.hasTopping(_loc8_[_loc5_]))
               {
                  (_loc11_ = class_14.method_103(_loc8_[_loc5_] + "_bin",true,false)).x = _loc3_.clip["bin" + _loc5_].x + 54;
                  _loc11_.y = _loc3_.clip["bin" + _loc5_].y - 3;
                  _loc11_.buttonMode = true;
                  _loc11_.useHandCursor = true;
                  _loc11_.cacheAsBitmap = true;
                  _loc11_.topperNormalY = _loc11_.topper.y;
                  _loc11_.topper.gotoAndStop(1);
                  _loc3_.toppings.push(_loc11_);
                  _loc3_.toppingNames.push(_loc8_[_loc5_]);
                  _loc11_.addEventListener(MouseEvent.MOUSE_DOWN,_loc3_.clickToppingBin);
                  _loc11_.addEventListener(MouseEvent.ROLL_OVER,_loc3_.rolloverToppingBin);
                  _loc11_.addEventListener(MouseEvent.ROLL_OUT,_loc3_.rolloutToppingBin);
               }
               else
               {
                  _loc3_.toppings.push(null);
                  _loc3_.toppingNames.push(null);
               }
               _loc5_++;
            }
            _loc9_ = FoodData.getSauces(_loc6_,_loc7_);
            _loc3_.bottles = new Vector.<ToppingShaker>();
            _loc3_.bottleTypes = new Vector.<String>();
            _loc5_ = 0;
            while(_loc5_ < _loc9_.length)
            {
               if(_loc4_.hasTopping(_loc9_[_loc5_]))
               {
                  _loc12_ = new ToppingShaker(_loc3_.gameObj,_loc9_[_loc5_],_loc3_.clip.bottleholder,_loc3_.clip.dragholder,_loc3_.bottleCoordsX[_loc5_],_loc3_.bottleCoordsY[_loc5_],false);
                  _loc3_.bottles.push(_loc12_);
                  _loc3_.bottleTypes.push(_loc9_[_loc5_]);
               }
               _loc5_++;
            }
            _loc10_ = FoodData.getShakers(_loc6_,_loc7_);
            _loc5_ = 0;
            while(_loc5_ < _loc10_.length)
            {
               if(_loc4_.hasTopping(_loc10_[_loc5_]))
               {
                  _loc13_ = _loc3_.clip.bottleholder;
                  if(_loc3_.shakerIsBackRow[_loc5_] == false)
                  {
                     _loc13_ = _loc3_.clip.shakerholder;
                  }
                  _loc14_ = new ToppingShaker(_loc3_.gameObj,_loc10_[_loc5_],_loc13_,_loc3_.clip.dragholder,_loc3_.shakerCoordsX[_loc5_],_loc3_.shakerCoordsY[_loc5_],true);
                  _loc3_.bottles.push(_loc14_);
                  _loc3_.bottleTypes.push(_loc10_[_loc5_]);
                  _loc13_ = null;
               }
               _loc5_++;
            }
         }
         else
         {
            if(_loc3_.toppings)
            {
               _loc5_ = int(_loc3_.toppings.length - 1);
               while(_loc5_ >= 0)
               {
                  if(_loc3_.toppings[_loc5_])
                  {
                     _loc3_.toppings[_loc5_].removeEventListener(MouseEvent.MOUSE_DOWN,_loc3_.clickToppingBin);
                     _loc3_.toppings[_loc5_].removeEventListener(MouseEvent.ROLL_OVER,_loc3_.rolloverToppingBin);
                     _loc3_.toppings[_loc5_].removeEventListener(MouseEvent.ROLL_OUT,_loc3_.rolloutToppingBin);
                     if(_loc3_.toppings[_loc5_].parent)
                     {
                        _loc3_.toppings[_loc5_].parent.removeChild(_loc3_.toppings[_loc5_]);
                     }
                     _loc3_.toppings[_loc5_].stop();
                     _loc3_.toppings[_loc5_] = null;
                  }
                  _loc3_.toppings.splice(_loc5_,1);
                  _loc5_--;
               }
            }
            _loc3_.toppings = null;
            _loc3_.toppingNames = null;
            _loc5_ = int(_loc3_.bottles.length - 1);
            while(_loc5_ >= 0)
            {
               if(_loc3_.bottles[_loc5_])
               {
                  _loc3_.bottles[_loc5_].destroy();
                  _loc3_.bottles[_loc5_] = null;
               }
               _loc3_.bottles.splice(_loc5_,1);
               _loc3_.bottleTypes.splice(_loc5_,1);
               _loc5_--;
            }
            _loc3_.bottles = null;
            _loc3_.bottleTypes = null;
         }
      }
      
      public function setupFillings(param1:Boolean = true, param2:Number = -1) : void
      {
         var _loc4_:int = 0;
         var _loc5_:Number = NaN;
         var _loc6_:Boolean = false;
         var _loc7_:Array = null;
         var _loc8_:MovieClip = null;
         var _loc3_:BuildScreen = this;
         if(param1)
         {
            _loc3_.fillings = new Vector.<MovieClip>();
            _loc3_.fillingNames = new Vector.<String>();
            _loc5_ = _loc3_.gameObj.var_127.getMonth();
            _loc6_ = _loc3_.gameObj.var_127.isNewYear();
            if(param2 > -1)
            {
               _loc5_ = param2;
               _loc6_ = true;
            }
            _loc7_ = FoodData.getFillings(_loc5_,_loc6_);
            _loc4_ = 0;
            while(_loc4_ < Math.max(_loc7_.length,_loc3_.numBins))
            {
               if(_loc4_ < _loc7_.length && _loc7_[_loc4_] != null && _loc3_.gameObj.var_127.hasTopping(_loc7_[_loc4_]))
               {
                  (_loc8_ = class_14.method_103(_loc7_[_loc4_] + "_bin",true,false)).x = _loc3_.clip["bin" + _loc4_].x + 54;
                  _loc8_.y = _loc3_.clip["bin" + _loc4_].y - 3;
                  _loc8_.buttonMode = true;
                  _loc8_.useHandCursor = true;
                  _loc8_.cacheAsBitmap = true;
                  _loc8_.topperNormalY = _loc8_.topper.y;
                  _loc8_.topper.gotoAndStop(1);
                  _loc3_.fillings.push(_loc8_);
                  _loc3_.fillingNames.push(_loc7_[_loc4_]);
                  _loc8_.addEventListener(MouseEvent.MOUSE_DOWN,_loc3_.clickFillingBin);
                  _loc8_.addEventListener(MouseEvent.ROLL_OVER,_loc3_.rolloverFillingBin);
                  _loc8_.addEventListener(MouseEvent.ROLL_OUT,_loc3_.rolloutFillingBin);
               }
               else
               {
                  _loc3_.fillings.push(null);
                  _loc3_.fillingNames.push(null);
               }
               _loc4_++;
            }
         }
         else
         {
            if(_loc3_.fillings)
            {
               _loc4_ = int(_loc3_.fillings.length - 1);
               while(_loc4_ >= 0)
               {
                  if(_loc3_.fillings[_loc4_])
                  {
                     _loc3_.fillings[_loc4_].removeEventListener(MouseEvent.MOUSE_DOWN,_loc3_.clickFillingBin);
                     _loc3_.fillings[_loc4_].removeEventListener(MouseEvent.ROLL_OVER,_loc3_.rolloverFillingBin);
                     _loc3_.fillings[_loc4_].removeEventListener(MouseEvent.ROLL_OUT,_loc3_.rolloutFillingBin);
                     if(_loc3_.fillings[_loc4_].parent)
                     {
                        _loc3_.fillings[_loc4_].parent.removeChild(_loc3_.fillings[_loc4_]);
                     }
                     _loc3_.fillings[_loc4_].stop();
                     _loc3_.fillings[_loc4_] = null;
                  }
                  _loc3_.fillings.splice(_loc4_,1);
                  _loc4_--;
               }
            }
            _loc3_.fillings = null;
            _loc3_.fillingNames = null;
         }
      }
      
      public function clickFillingBin(param1:MouseEvent) : void
      {
         var _loc5_:String = null;
         var _loc2_:BuildScreen = this;
         var _loc3_:Number = -1;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.fillings.length)
         {
            if(param1.currentTarget == _loc2_.fillings[_loc4_])
            {
               _loc3_ = _loc4_;
               break;
            }
            _loc4_++;
         }
         if(_loc2_.gameObj.hud.whichContextTraining == "season")
         {
            _loc2_.gameObj.hud.removeContextTraining();
         }
         if(_loc3_ > -1 && _loc2_.toppingStack == null && _loc2_.mode == _loc2_.MODE_FILLING)
         {
            _loc5_ = _loc2_.fillingNames[_loc3_];
            if(_loc2_.gameObj.training == false || _loc2_.gameObj.method_105(12,13) && _loc5_ == FoodData.FILLING_SALMON || _loc2_.gameObj.method_105(14,15) && _loc5_ == FoodData.FILLING_CREAMCHEESE)
            {
               class_6.method_1("Clicked Filling: " + _loc5_);
               if(_loc2_.currentOrder && _loc2_.currentOrder.canAddFillings && _loc2_.currentOrder.isLeavingBuild == false)
               {
                  class_6.method_1("You can add them!  Create a stack.");
                  _loc2_.gameObj.var_128.playSound("grabtopping.wav");
                  if(_loc2_.toppingStack)
                  {
                     _loc2_.toppingStack.returnToBin();
                     _loc2_.returningStacks.push(_loc2_.toppingStack);
                     _loc2_.toppingStack = null;
                  }
                  _loc2_.toppingStack = new ToppingStack(_loc2_.gameObj,_loc2_,_loc5_,true);
                  _loc2_.isDraggingFilling = true;
               }
            }
         }
      }
      
      public function rolloverFillingBin(param1:MouseEvent) : void
      {
         var _loc2_:BuildScreen = this;
         try
         {
            if(_loc2_.canRollOver())
            {
               param1.currentTarget.topper.y = param1.currentTarget.topperNormalY - 2;
            }
         }
         catch(err:Error)
         {
         }
      }
      
      public function rolloutFillingBin(param1:MouseEvent) : void
      {
         this;
         try
         {
            param1.currentTarget.topper.y = param1.currentTarget.topperNormalY;
         }
         catch(err:Error)
         {
         }
      }
      
      public function releaseFillingBin() : void
      {
         var _loc1_:BuildScreen = this;
         if(_loc1_.toppingStack && _loc1_.currentOrder && _loc1_.currentOrder.filling && _loc1_.currentOrder.canAddFillings && _loc1_.currentOrder.isWithinFillingArea(_loc1_.toppingStack.getMouseX(),_loc1_.toppingStack.getTargetYForDropping(),_loc1_.toppingStack.partHeight))
         {
            if(_loc1_.toppingStack.didStartAdding == false || _loc1_.clip.mouseY < 430)
            {
               _loc1_.currentOrder.filling.addFilling(_loc1_.toppingStack.type,_loc1_.toppingStack.getTargetYForDropping());
               _loc1_.toppingStack.deductItem();
               _loc1_.gameObj.var_128.playSound("droptopping.wav");
            }
            else if(_loc1_.clip.mouseX >= 73)
            {
               _loc1_.showWarningBubble("filling");
            }
         }
         else
         {
            _loc1_.isDraggingFilling = false;
            if(_loc1_.toppingStack)
            {
               _loc1_.toppingStack.returnToBin();
               _loc1_.returningStacks.push(_loc1_.toppingStack);
               _loc1_.toppingStack = null;
            }
         }
      }
      
      public function clickToppingBin(param1:MouseEvent) : void
      {
         var _loc5_:String = null;
         var _loc2_:BuildScreen = this;
         var _loc3_:Number = -1;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.toppings.length)
         {
            if(param1.currentTarget == _loc2_.toppings[_loc4_])
            {
               _loc3_ = _loc4_;
               break;
            }
            _loc4_++;
         }
         if(_loc3_ > -1 && _loc2_.toppingStack == null && _loc2_.mode == _loc2_.MODE_TOPPING)
         {
            _loc5_ = _loc2_.toppingNames[_loc3_];
            if(_loc2_.gameObj.training == false || _loc2_.gameObj.method_105(18,19) && _loc5_ == FoodData.DROP_MANGO)
            {
               class_6.method_1("Clicked Topping: " + _loc5_);
               if(_loc2_.currentOrder && _loc2_.currentOrder.canAddToppings && _loc2_.currentOrder.isPouring() == false && _loc2_.currentOrder.isLeavingBuild == false)
               {
                  class_6.method_1("You can add them!  Create a stack.");
                  _loc2_.gameObj.var_128.playSound("grabtopping.wav");
                  if(_loc2_.toppingStack)
                  {
                     _loc2_.toppingStack.returnToBin();
                     _loc2_.returningStacks.push(_loc2_.toppingStack);
                     _loc2_.toppingStack = null;
                  }
                  _loc2_.toppingStack = new ToppingStack(_loc2_.gameObj,_loc2_,_loc5_,false);
                  _loc2_.isSelectingBin = true;
               }
            }
         }
      }
      
      public function rolloverToppingBin(param1:MouseEvent) : void
      {
         var _loc2_:BuildScreen = this;
         try
         {
            if(_loc2_.canRollOver())
            {
               param1.currentTarget.topper.y = param1.currentTarget.topperNormalY - 2;
            }
         }
         catch(err:Error)
         {
         }
      }
      
      public function rolloutToppingBin(param1:MouseEvent) : void
      {
         this;
         try
         {
            param1.currentTarget.topper.y = param1.currentTarget.topperNormalY;
         }
         catch(err:Error)
         {
         }
      }
      
      public function releaseToppingBin() : void
      {
         var _loc1_:BuildScreen = this;
         if(_loc1_.toppingStack && _loc1_.currentOrder && _loc1_.currentOrder.topping && _loc1_.currentOrder.canAddToppings && _loc1_.currentOrder.isWithinDropArea(_loc1_.toppingStack.getMouseX(),_loc1_.toppingStack.getTargetYForDropping(),_loc1_.toppingStack.partHeight))
         {
            if(_loc1_.toppingStack.didStartAdding == false || _loc1_.clip.mouseY < 430)
            {
               _loc1_.currentOrder.topping.addDrop(_loc1_.toppingStack.type,_loc1_.toppingStack.getTargetYForDropping());
               _loc1_.toppingStack.deductItem();
               _loc1_.gameObj.var_128.playSound("droptopping.wav");
            }
            else if(_loc1_.clip.mouseX >= 73)
            {
               _loc1_.showWarningBubble("topping");
            }
         }
         else
         {
            _loc1_.isSelectingBin = false;
            if(_loc1_.toppingStack)
            {
               _loc1_.toppingStack.returnToBin();
               _loc1_.returningStacks.push(_loc1_.toppingStack);
               _loc1_.toppingStack = null;
            }
         }
      }
      
      public function setNewTopping(param1:String) : void
      {
         var _loc2_:BuildScreen = this;
         _loc2_.selectedTopping = param1;
         _loc2_.toppingData = _loc2_.gameObj.toppingData.getToppingItemData(param1,false);
         _loc2_.toppingCapacity = _loc2_.toppingData.capacity;
         _loc2_.toppingRemaining = _loc2_.toppingCapacity;
         _loc2_.shouldDeselect = false;
      }
      
      public function handlePreviousTopping(param1:String) : void
      {
         var _loc3_:ToppingShaker = null;
         var _loc2_:BuildScreen = this;
         if(_loc2_.selectedTopping != "none")
         {
            _loc3_ = _loc2_.getSauceBottle(_loc2_.selectedTopping);
            if(_loc3_ != null)
            {
               _loc3_.putAwayBottle();
            }
         }
      }
      
      public function canRollOver() : Boolean
      {
         var _loc1_:BuildScreen = this;
         if(_loc1_.toppingStack != null || _loc1_.currentOrder && _loc1_.currentOrder.isPouring() == true || _loc1_.isDraggingFilling || _loc1_.isSelectingBin || _loc1_.isSelectingBottle)
         {
            return false;
         }
         return true;
      }
      
      public function clickTrash(param1:MouseEvent) : void
      {
         var _loc2_:BuildScreen = this;
         if(_loc2_.currentOrder && _loc2_.toppingStack == null && _loc2_.currentOrder.isFlipping == false && _loc2_.currentOrder.isFinishFlipping == false && _loc2_.currentOrder.isPouring() == false && _loc2_.currentOrder.isLeavingBuild == false && _loc2_.gameObj.training == false)
         {
            if(param1.currentTarget == _loc2_.clip.right_trash_btn)
            {
               _loc2_.clip.right_trash_btn.x = 682;
            }
            else if(param1.currentTarget == _loc2_.clip.left_trash_btn)
            {
               _loc2_.clip.left_trash_btn.x = -43;
            }
            _loc2_.gameObj.var_128.playSound("buttonclick.wav");
            _loc2_.gameObj.var_128.playSound("trayslide.wav");
            _loc2_.currentOrder.sendToBuildTrash();
            if(_loc2_.mode != _loc2_.MODE_FILLING)
            {
               _loc2_.switchMode(_loc2_.MODE_FILLING);
            }
            if(_loc2_.knife)
            {
               _loc2_.knife.returnToTable();
            }
         }
      }
      
      public function clickFlip(param1:MouseEvent) : void
      {
         var _loc2_:BuildScreen = this;
         if(_loc2_.mode == _loc2_.MODE_FILLING && _loc2_.currentOrder && _loc2_.toppingStack == null && _loc2_.currentOrder.filling && _loc2_.currentOrder.canAddFillings && !_loc2_.currentOrder.isFlipping && !_loc2_.currentOrder.isFinishFlipping && _loc2_.currentOrder.filling.layoutFillings && _loc2_.currentOrder.filling.layoutFillings.length == 0)
         {
            _loc2_.currentOrder.flipSushi();
            if(_loc2_.gameObj.hud.whichContextTraining == "flipsushi")
            {
               _loc2_.gameObj.var_127.setTrained("flipsushi");
               _loc2_.gameObj.hud.removeContextTraining();
            }
            if(_loc2_.gameObj.hud.whichContextTraining == "season")
            {
               _loc2_.gameObj.hud.removeContextTraining();
            }
            _loc2_.gameObj.var_128.playSound("press_machine_button.wav");
         }
      }
      
      public function clickRoll(param1:MouseEvent) : void
      {
         var _loc2_:BuildScreen = this;
         if(_loc2_.mode == _loc2_.MODE_FILLING && _loc2_.currentOrder && _loc2_.toppingStack == null && _loc2_.currentOrder.filling && _loc2_.currentOrder.canAddFillings && !_loc2_.currentOrder.isFlipping && !_loc2_.currentOrder.isFinishFlipping && _loc2_.currentOrder.filling.layoutFillings && _loc2_.currentOrder.filling.layoutFillings.length > 0 && (_loc2_.gameObj.training == false || _loc2_.gameObj.method_105(16)))
         {
            _loc2_.currentOrder.rollSushi();
            _loc2_.switchMode(_loc2_.MODE_TOPPING);
            _loc2_.gameObj.method_104(16);
            _loc2_.gameObj.var_128.playSound("press_machine_button.wav");
            _loc2_.gameObj.var_128.playSound("roll_sushi.wav");
         }
      }
      
      public function initStationUpgrades() : void
      {
         this;
      }
      
      public function showGuide() : void
      {
         var _loc1_:BuildScreen = this;
         _loc1_.clip.cutguide.visible = true;
      }
      
      public function hideGuide() : void
      {
         var _loc1_:BuildScreen = this;
         _loc1_.clip.cutguide.visible = false;
      }
      
      public function restoreSoundAfterAd() : void
      {
      }
      
      public function clickScreen(param1:MouseEvent = null) : void
      {
         var _loc2_:BuildScreen = this;
         if(_loc2_.isActive && !_loc2_.gameObj.var_169)
         {
            if(_loc2_.knife && _loc2_.knife.didStartCutting == true && _loc2_.knife.isReturning == false && _loc2_.knife.isCutting == false)
            {
               if(_loc2_.clip.mouseY < 430)
               {
                  _loc2_.knife.makeSlice(true);
               }
               else if(param1.currentTarget != _loc2_.gameObj.hud.clip.menu_btn && _loc2_.clip.mouseX >= 73)
               {
                  _loc2_.showWarningBubble("cutting");
               }
            }
         }
      }
      
      public function releaseScreen(param1:MouseEvent = null) : void
      {
         var _loc2_:BuildScreen = this;
         if(_loc2_.isActive && !_loc2_.gameObj.var_169)
         {
            if(_loc2_.knife && _loc2_.knife.didStartCutting == false && _loc2_.knife.isReturning == false && _loc2_.knife.isCutting == false)
            {
               _loc2_.knife.releaseKnife();
            }
            else if(_loc2_.isDraggingFilling)
            {
               _loc2_.releaseFillingBin();
            }
            else if(_loc2_.isSelectingBin)
            {
               _loc2_.releaseToppingBin();
            }
            else if(_loc2_.isSelectingBottle)
            {
               _loc2_.releaseBottle();
            }
         }
      }
      
      public function releaseBottle() : void
      {
         var _loc1_:BuildScreen = this;
         _loc1_.isSelectingBottle = false;
         var _loc2_:ToppingShaker = _loc1_.getSauceBottle(_loc1_.selectedTopping);
         if(_loc2_ != null)
         {
            if(_loc1_.currentOrder == null || _loc1_.isWithinTopping(_loc1_.clip.mouseX,_loc1_.clip.mouseY) == false)
            {
               _loc1_.shouldDeselect = true;
            }
            else
            {
               _loc1_.shouldStartPouring = true;
            }
         }
      }
      
      public function isWithinTopping(param1:Number, param2:Number, param3:Number = 0) : Boolean
      {
         var _loc4_:BuildScreen;
         if((_loc4_ = this).currentOrder)
         {
            return _loc4_.currentOrder.isWithinToppingArea(param1,param2,param3);
         }
         return false;
      }
      
      public function canLeaveStation(param1:Boolean = false) : Boolean
      {
         var _loc2_:BuildScreen = this;
         if(_loc2_.currentOrder && _loc2_.currentOrder.isPouring() || _loc2_.toppingStack != null && !param1 || _loc2_.isDraggingFilling && !param1 || _loc2_.isSelectingBin && !param1 || _loc2_.isSelectingBottle || _loc2_.knife != null && _loc2_.knife.isReturning == false && !param1)
         {
            return false;
         }
         return true;
      }
      
      public function switchMode(param1:String) : void
      {
         var _loc2_:BuildScreen = this;
         class_6.method_1("----> Switch to Mode: " + param1);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.numBins)
         {
            if(_loc2_.clip["bin" + _loc3_].currentFrame < 9)
            {
               _loc2_.clip["bin" + _loc3_].play();
            }
            _loc3_++;
         }
         if(param1 != _loc2_.MODE_TOPPING)
         {
            if(param1 != _loc2_.MODE_CUTTING)
            {
               if(param1 == _loc2_.MODE_FILLING)
               {
               }
            }
         }
         _loc2_.mode = param1;
         _loc2_.isSwitchingModes = true;
      }
      
      public function readyModeSwitch() : void
      {
         var _loc2_:int = 0;
         var _loc1_:BuildScreen = this;
         if(_loc1_.mode == _loc1_.MODE_TOPPING && _loc1_.currentOrder && _loc1_.currentOrder.isRolling)
         {
            return;
         }
         class_6.method_1("---> Ready for Mode Switch / Re-Pop: " + _loc1_.mode);
         if(_loc1_.mode == _loc1_.MODE_FILLING)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc1_.toppings.length)
            {
               if(_loc1_.toppings[_loc2_])
               {
                  if(_loc1_.clip.binholder.contains(_loc1_.toppings[_loc2_]))
                  {
                     _loc1_.clip.binholder.removeChild(_loc1_.toppings[_loc2_]);
                  }
               }
               _loc2_++;
            }
            _loc2_ = 0;
            while(_loc2_ < _loc1_.bottles.length)
            {
               if(_loc1_.bottles[_loc2_])
               {
                  _loc1_.bottles[_loc2_].hideBottle();
               }
               _loc2_++;
            }
            _loc2_ = 0;
            while(_loc2_ < _loc1_.fillings.length)
            {
               if(_loc1_.fillings[_loc2_])
               {
                  if(!_loc1_.clip.binholder.contains(_loc1_.fillings[_loc2_]))
                  {
                     _loc1_.clip.binholder.addChild(_loc1_.fillings[_loc2_]);
                  }
               }
               _loc2_++;
            }
         }
         else if(_loc1_.mode == _loc1_.MODE_TOPPING)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc1_.fillings.length)
            {
               if(_loc1_.fillings[_loc2_])
               {
                  if(_loc1_.clip.binholder.contains(_loc1_.fillings[_loc2_]))
                  {
                     _loc1_.clip.binholder.removeChild(_loc1_.fillings[_loc2_]);
                  }
               }
               _loc2_++;
            }
            _loc2_ = 0;
            while(_loc2_ < _loc1_.toppings.length)
            {
               if(_loc1_.toppings[_loc2_])
               {
                  if(!_loc1_.clip.binholder.contains(_loc1_.toppings[_loc2_]))
                  {
                     _loc1_.clip.binholder.addChild(_loc1_.toppings[_loc2_]);
                  }
               }
               _loc2_++;
            }
            _loc2_ = 0;
            while(_loc2_ < _loc1_.bottles.length)
            {
               if(_loc1_.bottles[_loc2_])
               {
                  _loc1_.bottles[_loc2_].showBottle();
               }
               _loc2_++;
            }
            _loc1_.gameObj.method_104(17);
            _loc1_.gameObj.method_121();
         }
         else if(_loc1_.mode == _loc1_.MODE_CUTTING)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc1_.toppings.length)
            {
               if(_loc1_.toppings[_loc2_])
               {
                  if(_loc1_.clip.binholder.contains(_loc1_.toppings[_loc2_]))
                  {
                     _loc1_.clip.binholder.removeChild(_loc1_.toppings[_loc2_]);
                  }
               }
               _loc2_++;
            }
            _loc2_ = 0;
            while(_loc2_ < _loc1_.bottles.length)
            {
               if(_loc1_.bottles[_loc2_])
               {
                  _loc1_.bottles[_loc2_].hideBottle();
               }
               _loc2_++;
            }
         }
         _loc1_.isSwitchingModes = false;
      }
      
      public function removeOrder(param1:Boolean = false) : void
      {
         var _loc2_:BuildScreen = this;
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
      
      public function finishedToppingStack() : void
      {
         var _loc1_:BuildScreen = this;
         if(_loc1_.toppingStack)
         {
            if(_loc1_.gameObj.method_105(13) && _loc1_.toppingStack.type == FoodData.FILLING_SALMON)
            {
               _loc1_.gameObj.method_104(13);
            }
            else if(_loc1_.gameObj.method_105(15) && _loc1_.toppingStack.type == FoodData.FILLING_CREAMCHEESE)
            {
               _loc1_.gameObj.method_104(15);
            }
            else if(_loc1_.gameObj.method_105(19) && _loc1_.toppingStack.type == FoodData.DROP_MANGO)
            {
               _loc1_.gameObj.method_104(19);
            }
            if(_loc1_.toppingStack.isFilling == false)
            {
               if(Boolean(_loc1_.currentOrder) && Boolean(_loc1_.currentOrder.topping))
               {
                  _loc1_.currentOrder.topping.lockDropDepths();
               }
               _loc1_.isSelectingBin = false;
            }
            else
            {
               _loc1_.isDraggingFilling = false;
            }
            _loc1_.toppingStack.destroy();
            _loc1_.toppingStack = null;
         }
      }
      
      public function removeReturningToppingStack(param1:ToppingStack) : void
      {
         var _loc2_:BuildScreen = this;
         var _loc3_:int = int(_loc2_.returningStacks.length - 1);
         while(_loc3_ >= 0)
         {
            if(_loc2_.returningStacks[_loc3_] == param1)
            {
               _loc2_.returningStacks[_loc3_].destroy();
               _loc2_.returningStacks[_loc3_] = null;
               _loc2_.returningStacks.splice(_loc3_,1);
               _loc2_.gameObj.var_128.playSound("droptopping.wav");
            }
            _loc3_--;
         }
      }
      
      public function getSauceBottle(param1:String) : ToppingShaker
      {
         var _loc2_:BuildScreen = this;
         var _loc3_:ToppingShaker = null;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.bottles.length)
         {
            if(_loc2_.bottles[_loc4_].type == param1)
            {
               _loc3_ = _loc2_.bottles[_loc4_];
               break;
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function playPouringSound(param1:String) : void
      {
         var whichSound:String = param1;
         var screen:BuildScreen = this;
         screen.stopPouringSound();
         try
         {
            screen.pouringSound = screen.gameObj.var_128.playSound(whichSound,true);
         }
         catch(err:Error)
         {
            class_6.method_1("Error playing Pouring Sound");
         }
      }
      
      public function stopPouringSound() : void
      {
         var screen:BuildScreen = this;
         try
         {
            if(screen.pouringSound)
            {
               screen.pouringSound.stop();
            }
         }
         catch(err:Error)
         {
            class_6.method_1("Error stopping pouring sound...");
         }
         screen.pouringSound = null;
      }
      
      public function stopSounds() : void
      {
         var _loc1_:BuildScreen = this;
         if(_loc1_.pouringSound)
         {
            _loc1_.pouringSound.stop();
            _loc1_.pouringSound = null;
         }
      }
      
      public function isPlayingPouringSound() : Boolean
      {
         var _loc1_:BuildScreen = this;
         var _loc2_:Boolean = false;
         if(_loc1_.pouringSound)
         {
            _loc2_ = true;
         }
         return _loc2_;
      }
      
      public function putAwayEverything() : void
      {
         var _loc1_:BuildScreen = this;
         class_6.method_1("--- PUT AWAY EVERYTHING ---");
         _loc1_.deselectToppings();
         if(_loc1_.toppingStack)
         {
            _loc1_.toppingStack.returnToBin();
            _loc1_.returningStacks.push(_loc1_.toppingStack);
            _loc1_.toppingStack = null;
         }
         _loc1_.putAwayKnife();
      }
      
      public function clickKnife(param1:MouseEvent) : void
      {
         var _loc2_:BuildScreen = this;
         if(_loc2_.clip.knife_btn.visible == true && _loc2_.currentOrder && _loc2_.currentOrder.topping && _loc2_.currentOrder.isPouring() == false && _loc2_.toppingStack == null && _loc2_.isSelectingBin == false && _loc2_.isSelectingBottle == false && _loc2_.mode == _loc2_.MODE_TOPPING && _loc2_.currentOrder.isLeavingBuild == false && _loc2_.knife == null && (!_loc2_.gameObj.training || _loc2_.gameObj.method_105(22,23)))
         {
            _loc2_.knife = new SushiKnife(_loc2_.gameObj);
            _loc2_.knife.setContainer(_loc2_.clip);
            _loc2_.clip.knife_btn.visible = false;
            _loc2_.gameObj.var_128.playSound("grabutensil.wav");
            _loc2_.currentOrder.addPlate();
         }
      }
      
      public function rolloverKnife(param1:MouseEvent) : void
      {
         var _loc2_:BuildScreen = this;
         if(_loc2_.canRollOver())
         {
            _loc2_.clip.knife_btn.gotoAndStop(2);
         }
      }
      
      public function rolloutKnife(param1:MouseEvent) : void
      {
         var _loc2_:BuildScreen = this;
         _loc2_.clip.knife_btn.gotoAndStop(1);
      }
      
      public function putAwayKnife() : void
      {
         var _loc1_:BuildScreen = this;
         _loc1_.clip.knife_btn.visible = true;
         if(_loc1_.knife)
         {
            _loc1_.knife.destroy();
            _loc1_.knife = null;
         }
      }
      
      public function addTrainingGuide() : void
      {
         var _loc1_:BuildScreen = this;
         if(_loc1_.trainingGuide == null)
         {
            _loc1_.trainingGuide = new training_sushislice();
            _loc1_.clip.holder.addChild(_loc1_.trainingGuide);
            _loc1_.trainingGuide.gotoAndStop(1);
            _loc1_.trainingGuide.mouseEnabled = false;
            _loc1_.trainingGuide.mouseChildren = false;
         }
      }
      
      public function removeTrainingGuide() : void
      {
         var _loc1_:BuildScreen = this;
         if(_loc1_.trainingGuide)
         {
            if(_loc1_.trainingGuide.parent)
            {
               _loc1_.trainingGuide.parent.removeChild(_loc1_.trainingGuide);
            }
            _loc1_.trainingGuide = null;
         }
      }
      
      public function showWarningBubble(param1:String) : void
      {
         var _loc2_:BuildScreen = this;
         _loc2_.warningTimer = 0;
         _loc2_.isShowingWarning = true;
         _loc2_.clip.warningbubble.visible = true;
         _loc2_.clip.warningbubble.mouseEnabled = false;
         _loc2_.clip.warningbubble.mouseChildren = false;
         _loc2_.gameObj.var_128.playSound("boing.wav");
         if(param1 == "topping")
         {
            _loc2_.clip.warningbubble.gotoAndStop(1);
         }
         else if(param1 == "filling")
         {
            _loc2_.clip.warningbubble.gotoAndStop(2);
         }
         else if(param1 == "cutting")
         {
            _loc2_.clip.warningbubble.gotoAndStop(3);
         }
         else
         {
            _loc2_.clip.warningbubble.gotoAndStop(1);
         }
      }
      
      public function hideWarningBubble() : void
      {
         var _loc1_:BuildScreen = this;
         _loc1_.clip.warningbubble.visible = false;
         _loc1_.clip.warningbubble.stop();
         _loc1_.isShowingWarning = false;
         _loc1_.warningTimer = 0;
      }
   }
}
