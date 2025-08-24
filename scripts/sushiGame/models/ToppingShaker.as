package sushiGame.models
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.ui.Mouse;
   import package_2.class_14;
   import package_2.class_21;
   import package_2.class_6;
   import package_4.*;
   import sushiGame.data.FoodData;
   import sushiGame.data.UserData;
   import sushiGame.screens.*;
   
   public class ToppingShaker
   {
       
      
      public var gameObj:class_5;
      
      public var backContainer:MovieClip;
      
      public var topContainer:MovieClip;
      
      public var clip:MovieClip;
      
      public var shadow:MovieClip;
      
      public var type:String = "none";
      
      public var fromWhichSide:String = "left";
      
      public var isDragging:Boolean = false;
      
      public var isMoving:Boolean = false;
      
      public var tweenSpeed:Number = 2;
      
      public var returningToSpot:Boolean = false;
      
      public var droppingToSquirt:Boolean = false;
      
      public var raisingFromSquirt:Boolean = false;
      
      public var bottomPutAwayBounds:Number = 380;
      
      public var leftPutAwayBounds:Number = 85;
      
      public var rightPutAwayBounds:Number = 405;
      
      public var spotX:Number = 0;
      
      public var spotY:Number = 208;
      
      public var shakerSpotY:Number = 126;
      
      public var hidingX:Number = 0;
      
      public var hidingY:Number = 208;
      
      public var targetX:Number = 0;
      
      public var targetY:Number = 0;
      
      public var lastX:Number = 0;
      
      public var lastY:Number = 0;
      
      public var stackingBufferY:Number = 20;
      
      public var squirtDropHeight:Number = 20;
      
      public var boundsLeft:Number = 120;
      
      public var boundsRight:Number = 368;
      
      public var rotationSpeed:Number = 10;
      
      public var isRotating:Boolean = false;
      
      public var isShaker:Boolean = false;
      
      public var isPouring:Boolean = false;
      
      public var shakingOffset:Number = 0;
      
      public var shakingOffsetMax:Number = 10;
      
      public var shakingOffsetSpeed:Number = 2;
      
      public var shakingDirection:Number = 1;
      
      public var pourOffset:Number = 0;
      
      public var pourOffsetMax:Number = 60;
      
      public var pourOffsetSpeed:Number = 10;
      
      public var risingOffset:Number = 0;
      
      public var risingOffsetMax:Number = 35;
      
      public var risingOffsetSpeed:Number = 6;
      
      public var grabScale:Number = 1;
      
      public var grabScaleSpeed:Number = 0.05;
      
      public var shouldShowPutAway:Boolean = false;
      
      public var shadowOOBPercent:Number = 0;
      
      public var shadowOOBTarget:Number = 0;
      
      public function ToppingShaker(param1:class_5, param2:String, param3:MovieClip, param4:MovieClip, param5:Number, param6:Number, param7:Boolean)
      {
         super();
         var _loc8_:ToppingShaker;
         (_loc8_ = this).gameObj = param1;
         _loc8_.type = param2;
         _loc8_.backContainer = param3;
         _loc8_.topContainer = param4;
         _loc8_.risingOffsetMax = 48;
         _loc8_.risingOffsetMax += 20;
         _loc8_.isShaker = param7;
         _loc8_.spotX = param5;
         _loc8_.spotY = param6;
         if(_loc8_.isShaker == false)
         {
            _loc8_.hidingX = param5 - 640;
         }
         else
         {
            _loc8_.hidingX = param5 - 300;
         }
         _loc8_.hidingY = param6;
         _loc8_.setupBottle();
      }
      
      public function setupBottle() : void
      {
         var _loc3_:Rectangle = null;
         var _loc4_:Number = NaN;
         var _loc1_:ToppingShaker = this;
         var _loc2_:UserData = _loc1_.gameObj.var_127;
         _loc1_.clip = class_14.method_103(_loc1_.type,true,true);
         _loc1_.backContainer.addChild(_loc1_.clip);
         if(_loc1_.isShaker)
         {
            _loc3_ = _loc1_.clip.getBounds(_loc1_.clip);
            _loc4_ = 0 - _loc3_.height / 2 - _loc3_.y;
            _loc1_.spotY += _loc4_;
            _loc1_.hidingY += _loc4_;
         }
         _loc1_.clip.x = _loc1_.hidingX;
         _loc1_.clip.y = _loc1_.hidingY;
         _loc1_.clip.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.selectBottle);
         _loc1_.clip.addEventListener(MouseEvent.ROLL_OVER,_loc1_.rolloverBottle);
         _loc1_.clip.addEventListener(MouseEvent.ROLL_OUT,_loc1_.rolloutBottle);
         _loc1_.clip.icon.gotoAndStop("start");
         _loc1_.clip.icon.mouseEnabled = false;
         _loc1_.clip.icon.mouseChildren = false;
         _loc1_.clip.mouseEnabled = true;
         _loc1_.clip.buttonMode = true;
         _loc1_.clip.useHandCursor = true;
         _loc1_.isDragging = false;
         _loc1_.isMoving = false;
         if(!_loc2_.hasTopping(_loc1_.type))
         {
            _loc1_.clip.visible = false;
         }
         _loc1_.shadow = new bottle_cursor();
         _loc1_.shadow.x = _loc1_.clip.x;
         _loc1_.shadow.y = _loc1_.clip.y + _loc1_.risingOffsetMax;
         _loc1_.shadow.mouseEnabled = false;
         _loc1_.shadow.mouseChildren = false;
         _loc1_.shadow.visible = false;
         _loc1_.topContainer.addChild(_loc1_.shadow);
      }
      
      public function selectBottle(param1:MouseEvent = null) : void
      {
         var _loc2_:ToppingShaker = this;
         if(!_loc2_.isMoving && !_loc2_.isDragging && _loc2_.gameObj.var_129.currentOrder != null && _loc2_.gameObj.var_129.currentOrder.isLeavingBuild == false && _loc2_.gameObj.var_129.currentOrder.isPouring() == false && _loc2_.gameObj.var_129.toppingStack == null && _loc2_.gameObj.var_129.selectedTopping == "none" && _loc2_.gameObj.var_129.mode == _loc2_.gameObj.var_129.MODE_TOPPING)
         {
            if(_loc2_.gameObj.training == false || _loc2_.gameObj.method_105(20,21) && _loc2_.type == FoodData.SAUCE_DUCK)
            {
               _loc2_.risingOffset = 0;
               _loc2_.pourOffset = 0;
               _loc2_.gameObj.var_129.handlePreviousTopping(_loc2_.type);
               _loc2_.gameObj.var_129.setNewTopping(_loc2_.type);
               _loc2_.gameObj.var_129.isSelectingBottle = true;
               _loc2_.lastX = _loc2_.clip.x;
               _loc2_.lastY = _loc2_.clip.y;
               _loc2_.isDragging = true;
               _loc2_.shouldShowPutAway = false;
               _loc2_.topContainer.addChild(_loc2_.clip);
               if(!_loc2_.clip.hasEventListener(Event.ENTER_FRAME))
               {
                  _loc2_.clip.addEventListener(Event.ENTER_FRAME,this.animateBottle);
               }
               if(_loc2_.gameObj.hud.whichContextTraining == "season")
               {
                  _loc2_.gameObj.hud.removeContextTraining();
               }
               _loc2_.gameObj.var_128.playSound("grabtopping.wav");
               Mouse.hide();
            }
         }
         else if(_loc2_.isDragging)
         {
         }
      }
      
      public function putAwayBottle() : void
      {
         var _loc1_:ToppingShaker = this;
         class_6.method_1("Put away bottle.");
         _loc1_.isDragging = false;
         _loc1_.isMoving = true;
         _loc1_.targetX = _loc1_.spotX;
         _loc1_.targetY = _loc1_.spotY;
         _loc1_.returningToSpot = true;
         if(!_loc1_.clip.hasEventListener(Event.ENTER_FRAME))
         {
            _loc1_.clip.addEventListener(Event.ENTER_FRAME,this.animateBottle);
         }
         _loc1_.clip.gotoAndStop("static");
         _loc1_.clip.icon.gotoAndStop("start");
         try
         {
            _loc1_.gameObj.removeEventListener(MouseEvent.MOUSE_UP,_loc1_.releaseBottle);
         }
         catch(err:Error)
         {
         }
         try
         {
            _loc1_.gameObj.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickBottle);
         }
         catch(err:Error)
         {
         }
         Mouse.show();
      }
      
      public function clickBottle(param1:MouseEvent = null) : void
      {
         var _loc2_:ToppingShaker = this;
         _loc2_.clip.gotoAndStop("squeeze");
      }
      
      public function releaseBottle(param1:MouseEvent = null) : void
      {
         this;
      }
      
      public function setIcon(param1:String) : void
      {
         var _loc2_:ToppingShaker = this;
         if(_loc2_.clip.icon.currentLabel != param1)
         {
            _loc2_.clip.icon.gotoAndStop(param1);
            if(param1 == "none" || param1 == "start")
            {
               _loc2_.clip.gotoAndStop("squeeze");
            }
            else
            {
               _loc2_.clip.gotoAndStop("static");
            }
         }
      }
      
      public function stopPouring() : void
      {
         var _loc1_:ToppingShaker = this;
         _loc1_.isPouring = false;
         _loc1_.clip.gotoAndStop("static");
         _loc1_.clip.icon.gotoAndStop("start");
      }
      
      public function startPouring() : void
      {
         var _loc1_:ToppingShaker = this;
         _loc1_.isPouring = true;
      }
      
      public function getShadowTargetY() : Number
      {
         var _loc1_:ToppingShaker = this;
         var _loc2_:Number = 0;
         if(_loc1_.gameObj.var_129 && _loc1_.gameObj.var_129.currentOrder && _loc1_.gameObj.var_129.currentOrder.topping && _loc1_.gameObj.var_129.currentOrder.topping.willCoordBeOutside(_loc1_.gameObj.var_129.currentOrder.topping.clip.mouseX,_loc1_.gameObj.var_129.currentOrder.topping.clip.mouseY))
         {
         }
         return _loc1_.gameObj.mouseY;
      }
      
      public function getFoodCenterX() : Number
      {
         var _loc1_:ToppingShaker = this;
         var _loc2_:Number = 0;
         if(Boolean(_loc1_.gameObj.var_129) && Boolean(_loc1_.gameObj.var_129.currentOrder))
         {
            _loc2_ = _loc1_.gameObj.var_129.currentOrder.clip.x;
            if(_loc1_.gameObj.var_129.currentOrder.topping)
            {
               _loc2_ += _loc1_.gameObj.var_129.currentOrder.topping.clip.x;
            }
         }
         return _loc2_;
      }
      
      public function getFoodCenterY() : Number
      {
         var _loc1_:ToppingShaker = this;
         var _loc2_:Number = 0;
         if(Boolean(_loc1_.gameObj.var_129) && Boolean(_loc1_.gameObj.var_129.currentOrder))
         {
            _loc2_ = _loc1_.gameObj.var_129.currentOrder.clip.y;
            if(_loc1_.gameObj.var_129.currentOrder.topping)
            {
               _loc2_ += _loc1_.gameObj.var_129.currentOrder.topping.clip.y;
            }
         }
         return _loc2_;
      }
      
      public function dragBottle(param1:Event = null) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc2_:ToppingShaker = this;
         var _loc3_:Number = _loc2_.gameObj.var_139.mouseX;
         var _loc4_:Number = _loc2_.gameObj.var_139.mouseY;
         _loc2_.clip.x = _loc3_;
         _loc2_.clip.y = _loc4_;
         if(_loc2_.clip.scaleX < _loc2_.grabScale)
         {
            _loc2_.clip.scaleX += _loc2_.grabScaleSpeed;
            _loc2_.clip.scaleY = _loc2_.clip.scaleX;
         }
         _loc2_.risingOffset += (_loc2_.risingOffsetMax - _loc2_.risingOffset) / 4;
         if(Math.abs(_loc2_.risingOffsetMax - _loc2_.risingOffset) <= 1)
         {
            _loc2_.risingOffset = _loc2_.risingOffsetMax;
         }
         else if(_loc2_.isPouring)
         {
            _loc2_.risingOffset = _loc2_.risingOffsetMax;
         }
         _loc2_.clip.y -= _loc2_.risingOffset;
         if(_loc2_.isShaker && _loc2_.isPouring)
         {
            if(_loc2_.clip.icon.currentLabel == "up")
            {
               try
               {
                  _loc5_ = _loc2_.getFoodCenterX() - _loc2_.gameObj.mouseX;
                  _loc6_ = _loc2_.getFoodCenterY() - _loc2_.gameObj.mouseY - 35;
                  _loc7_ = (_loc7_ = Math.atan2(_loc6_,_loc5_)) - Math.PI / 2;
                  _loc2_.clip.icon.pointer.rotation = _loc7_ * (180 / Math.PI);
               }
               catch(err:Error)
               {
               }
               if(_loc2_.pourOffset > 0)
               {
                  _loc2_.pourOffset /= 2;
                  if(Math.abs(this.pourOffset) <= 1)
                  {
                     _loc2_.pourOffset = 0;
                  }
               }
            }
            else
            {
               _loc2_.shakingOffset += _loc2_.shakingOffsetSpeed * _loc2_.shakingDirection;
               if(_loc2_.shakingOffset >= _loc2_.shakingOffsetMax)
               {
                  _loc2_.shakingOffset = _loc2_.shakingOffsetMax;
                  _loc2_.shakingDirection = -1;
               }
               else if(_loc2_.shakingOffset <= 0)
               {
                  _loc2_.shakingOffset = 0;
                  _loc2_.shakingDirection = 1;
               }
               _loc2_.clip.y += _loc2_.shakingOffset;
               if(_loc2_.pourOffset < _loc2_.pourOffsetMax)
               {
                  _loc2_.pourOffset += (_loc2_.pourOffsetMax - _loc2_.pourOffset) / 2;
                  if(Math.abs(_loc2_.pourOffsetMax - _loc2_.pourOffset) <= 1)
                  {
                     _loc2_.pourOffset = _loc2_.pourOffsetMax;
                  }
               }
            }
            _loc2_.clip.y -= _loc2_.pourOffset;
            _loc2_.shadow.visible = true;
            _loc2_.shadow.x = _loc2_.gameObj.mouseX;
            _loc2_.shadow.y = _loc2_.getShadowTargetY();
         }
         else if(_loc2_.isShaker == false && _loc2_.isPouring)
         {
            if(_loc2_.clip.icon.currentLabel == "up")
            {
               try
               {
                  _loc5_ = _loc2_.getFoodCenterX() - _loc2_.gameObj.mouseX;
                  _loc6_ = _loc2_.getFoodCenterY() - _loc2_.gameObj.mouseY - 35;
                  _loc7_ = (_loc7_ = (_loc7_ = Math.atan2(_loc6_,_loc5_)) - Math.PI / 2) + Math.PI;
                  _loc2_.clip.icon.pointer.rotation = _loc7_ * (180 / Math.PI);
               }
               catch(err:Error)
               {
               }
               if(_loc2_.pourOffset > 0)
               {
                  _loc2_.pourOffset /= 2;
                  if(Math.abs(this.pourOffset) <= 1)
                  {
                     _loc2_.pourOffset = 0;
                  }
               }
            }
            else if(_loc2_.pourOffset < _loc2_.pourOffsetMax)
            {
               _loc2_.pourOffset += (_loc2_.pourOffsetMax - _loc2_.pourOffset) / 2;
               if(Math.abs(_loc2_.pourOffsetMax - _loc2_.pourOffset) <= 1)
               {
                  _loc2_.pourOffset = _loc2_.pourOffsetMax;
               }
            }
            _loc2_.clip.y -= _loc2_.pourOffset;
            _loc2_.shadow.visible = true;
            _loc2_.shadow.x = _loc2_.gameObj.mouseX;
            _loc2_.shadow.y = _loc2_.getShadowTargetY();
         }
         else if(_loc2_.isDragging)
         {
            _loc2_.shadow.visible = true;
            _loc2_.shadow.x = _loc2_.gameObj.mouseX;
            _loc2_.shadow.y = _loc2_.getShadowTargetY();
         }
         else
         {
            _loc2_.shadow.visible = false;
         }
         if(_loc2_.isShaker == false && _loc2_.shadow != null && _loc2_.clip.y <= _loc2_.spotY)
         {
            _loc2_.shouldShowPutAway = true;
         }
         else if(_loc2_.isShaker == true && _loc2_.shadow != null && _loc2_.getDistToShelfSpot() <= 20)
         {
            _loc2_.shouldShowPutAway = true;
         }
         else
         {
            _loc2_.shouldShowPutAway = false;
         }
         if(_loc2_.shadow != null)
         {
            _loc2_.setCursorFrame();
         }
         if(!_loc2_.isPouring && _loc2_.isDragging && (_loc3_ > 640 || _loc3_ < 0 || _loc4_ > 480 || _loc4_ < 0))
         {
            _loc2_.gameObj.var_129.releaseScreen();
         }
      }
      
      public function getDistToShelfSpot() : Number
      {
         var _loc1_:ToppingShaker = this;
         if(_loc1_.shadow != null)
         {
            return class_21.method_167(_loc1_.shadow.x,_loc1_.spotX,_loc1_.shadow.y,_loc1_.spotY + 33);
         }
         if(_loc1_.clip != null)
         {
            return class_21.method_167(_loc1_.clip.x,_loc1_.spotX,_loc1_.clip.y,_loc1_.spotY);
         }
         return 999;
      }
      
      public function tweenBottle(param1:Event) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc2_:ToppingShaker = this;
         if(!_loc2_.gameObj.var_169)
         {
            _loc3_ = _loc2_.targetX - _loc2_.clip.x;
            _loc4_ = _loc2_.targetY - _loc2_.clip.y;
            if(_loc2_.targetX == _loc2_.hidingX && _loc2_.isShaker == false)
            {
               _loc2_.clip.x += _loc3_ / 6;
            }
            else
            {
               _loc2_.clip.x += _loc3_ / _loc2_.tweenSpeed;
            }
            _loc2_.clip.y += _loc4_ / _loc2_.tweenSpeed;
            if(_loc2_.clip.scaleX > 1)
            {
               _loc2_.clip.scaleX -= _loc2_.grabScaleSpeed;
               _loc2_.clip.scaleY = _loc2_.clip.scaleX;
            }
            if(_loc2_.isShaker && _loc2_.returningToSpot == true && _loc2_.clip.x < 218)
            {
               if(_loc2_.isShaker)
               {
                  if(!_loc2_.backContainer.contains(_loc2_.clip))
                  {
                     _loc2_.backContainer.addChild(_loc2_.clip);
                  }
               }
            }
            if(Math.abs(_loc3_) <= 1 && Math.abs(_loc4_) <= 1)
            {
               _loc2_.clip.x = _loc2_.targetX;
               _loc2_.clip.y = _loc2_.targetY;
               _loc2_.isMoving = false;
               if(_loc2_.returningToSpot)
               {
                  _loc2_.returningToSpot = false;
                  if(!_loc2_.backContainer.contains(_loc2_.clip))
                  {
                     _loc2_.backContainer.addChild(_loc2_.clip);
                  }
               }
               else if(_loc2_.droppingToSquirt)
               {
                  _loc2_.droppingToSquirt = false;
                  _loc2_.raisingFromSquirt = true;
                  _loc2_.targetY = _loc2_.clip.y - _loc2_.squirtDropHeight;
                  _loc2_.isMoving = true;
               }
               else if(_loc2_.raisingFromSquirt)
               {
                  _loc2_.raisingFromSquirt = false;
                  _loc2_.targetX = _loc2_.spotX;
                  _loc2_.targetY = _loc2_.spotY;
                  _loc2_.isMoving = true;
               }
            }
            _loc2_.shadow.x = _loc2_.clip.x;
            _loc2_.shadow.y = _loc2_.clip.y + _loc2_.risingOffsetMax;
         }
      }
      
      public function animateBottle(param1:Event) : void
      {
         var _loc2_:ToppingShaker = this;
         if(_loc2_.isDragging)
         {
            _loc2_.dragBottle(param1);
            _loc2_.rotateBottle();
            _loc2_.updateTimerClock();
         }
         else if(_loc2_.isMoving)
         {
            _loc2_.tweenBottle(param1);
            _loc2_.rotateBottle();
            _loc2_.shadow.visible = false;
         }
         else if(_loc2_.isRotating)
         {
            _loc2_.rotateBottle();
         }
         else
         {
            _loc2_.clip.scaleX = 1;
            _loc2_.clip.scaleY = 1;
            _loc2_.shadow.visible = false;
            _loc2_.clip.removeEventListener(Event.ENTER_FRAME,_loc2_.animateBottle);
         }
      }
      
      public function rotateBottle() : void
      {
         var _loc2_:Number = NaN;
         var _loc1_:ToppingShaker = this;
         if(_loc1_.isDragging && !_loc1_.isShaker && (_loc1_.isPouring || _loc1_.clip.y > _loc1_.spotY || _loc1_.isCursorWithinSushi()) || _loc1_.isPouring && _loc1_.isShaker && _loc1_.clip.icon.currentLabel != "point" && _loc1_.clip.icon.currentLabel != "up" && _loc1_.clip.icon.currentLabel != "putaway")
         {
            if(_loc1_.clip.rotation < 180)
            {
               _loc2_ = 180 - _loc1_.clip.rotation;
               _loc1_.clip.rotation += _loc2_ / _loc1_.tweenSpeed;
               if(_loc2_ <= 1)
               {
                  _loc1_.clip.rotation = 180;
                  _loc1_.isRotating = false;
               }
               else
               {
                  _loc1_.isRotating = true;
               }
            }
            else
            {
               _loc1_.isRotating = false;
            }
         }
         else if(_loc1_.clip.rotation > 0)
         {
            _loc2_ = _loc1_.clip.rotation;
            _loc1_.clip.rotation -= _loc2_ / _loc1_.tweenSpeed;
            if(_loc2_ <= 1)
            {
               _loc1_.clip.rotation = 0;
               _loc1_.isRotating = false;
            }
            else
            {
               _loc1_.isRotating = true;
            }
         }
         else
         {
            _loc1_.isRotating = false;
         }
      }
      
      public function destroy() : void
      {
         var ob:ToppingShaker = this;
         if(ob.shadow)
         {
            if(ob.shadow.parent)
            {
               ob.shadow.parent.removeChild(ob.shadow);
            }
            ob.shadow = null;
         }
         if(ob.clip.hasEventListener(MouseEvent.MOUSE_DOWN))
         {
            ob.clip.removeEventListener(MouseEvent.MOUSE_DOWN,this.selectBottle);
         }
         try
         {
            ob.gameObj.removeEventListener(MouseEvent.MOUSE_UP,ob.releaseBottle);
         }
         catch(err:Error)
         {
         }
         ob.clip.removeEventListener(MouseEvent.ROLL_OVER,ob.rolloverBottle);
         ob.clip.removeEventListener(MouseEvent.ROLL_OUT,ob.rolloutBottle);
         if(ob.clip.hasEventListener(Event.ENTER_FRAME))
         {
            ob.clip.removeEventListener(Event.ENTER_FRAME,this.animateBottle);
         }
         try
         {
            ob.clip.parent.removeChild(ob.clip);
         }
         catch(err:Error)
         {
            class_6.error("Error removing saucebottle clip.");
         }
         ob.clip = null;
      }
      
      public function hideBottle() : void
      {
         var _loc1_:ToppingShaker = this;
         _loc1_.isMoving = true;
         _loc1_.targetX = _loc1_.hidingX;
         _loc1_.targetY = _loc1_.hidingY;
         _loc1_.returningToSpot = true;
         if(!_loc1_.clip.hasEventListener(Event.ENTER_FRAME))
         {
            _loc1_.clip.addEventListener(Event.ENTER_FRAME,this.animateBottle);
         }
      }
      
      public function showBottle() : void
      {
         var _loc1_:ToppingShaker = this;
         _loc1_.isMoving = true;
         _loc1_.targetX = _loc1_.spotX;
         _loc1_.targetY = _loc1_.spotY;
         _loc1_.returningToSpot = true;
         if(!_loc1_.clip.hasEventListener(Event.ENTER_FRAME))
         {
            _loc1_.clip.addEventListener(Event.ENTER_FRAME,this.animateBottle);
         }
      }
      
      public function rolloverBottle(param1:MouseEvent = null) : void
      {
         var _loc2_:ToppingShaker = this;
         if(!_loc2_.isMoving && !_loc2_.isDragging && (_loc2_.gameObj.var_129.currentOrder == null || !_loc2_.gameObj.var_129.currentOrder.isPouring()) && !_loc2_.gameObj.var_129.isSelectingBottle && !_loc2_.gameObj.var_129.isSelectingBin)
         {
            _loc2_.clip.y = _loc2_.spotY - 2;
         }
      }
      
      public function rolloutBottle(param1:MouseEvent = null) : void
      {
         var _loc2_:ToppingShaker = this;
         if(!_loc2_.isMoving && !_loc2_.isDragging)
         {
            _loc2_.clip.y = _loc2_.spotY;
         }
      }
      
      public function updateTimerClock() : void
      {
         var _loc1_:ToppingShaker = this;
         if(_loc1_.gameObj.training)
         {
         }
      }
      
      public function isCursorWithinSushi(param1:Boolean = true) : Boolean
      {
         var _loc2_:ToppingShaker = this;
         var _loc3_:BuildScreen = _loc2_.gameObj.var_129;
         var _loc4_:Boolean = false;
         try
         {
            if(param1 == false)
            {
               if(_loc3_ && _loc3_.currentOrder && _loc3_.currentOrder.topping && _loc3_.currentOrder.topping.willCoordBeOutside(_loc3_.currentOrder.topping.clip.mouseX,_loc3_.currentOrder.topping.clip.mouseY) == false)
               {
                  _loc4_ = true;
               }
            }
            else if(_loc3_.isWithinTopping(_loc2_.shadow.x,_loc2_.shadow.y,0))
            {
               _loc4_ = true;
            }
         }
         catch(err:Error)
         {
         }
         return _loc4_;
      }
      
      public function setCursorFrame() : void
      {
         var _loc1_:ToppingShaker = this;
         var _loc2_:BuildScreen = _loc1_.gameObj.var_129;
         if(_loc1_.shadow)
         {
            if(_loc2_ && _loc2_.currentOrder && Boolean(_loc2_.currentOrder.topping))
            {
               if(_loc1_.isPouring && _loc2_.currentOrder.topping.willCoordBeOutside(_loc2_.currentOrder.topping.clip.mouseX,_loc2_.currentOrder.topping.clip.mouseY))
               {
                  if(_loc2_.currentOrder.topping.willCoordBeBehind(_loc2_.currentOrder.topping.clip.mouseX,_loc2_.currentOrder.topping.clip.mouseY))
                  {
                     _loc1_.shadow.gotoAndStop(5);
                  }
                  else
                  {
                     _loc1_.shadow.gotoAndStop(4);
                  }
               }
               else if(_loc2_.isWithinTopping(_loc1_.shadow.x,_loc1_.shadow.y,0))
               {
                  _loc1_.shadow.gotoAndStop(1);
               }
               else
               {
                  _loc1_.shadow.gotoAndStop(2);
               }
            }
            else
            {
               _loc1_.shadow.gotoAndStop(2);
            }
         }
      }
   }
}
