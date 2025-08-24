package sushiGame.models
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.geom.ColorTransform;
   import flash.media.SoundChannel;
   import package_2.class_6;
   import package_4.class_5;
   import sushiGame.data.FoodData;
   import sushiGame.screens.TeaScreen;
   
   public class Tea
   {
       
      
      public var gameObj:class_5;
      
      public var screen:TeaScreen;
      
      public var clip:MovieClip;
      
      public var teaType:String = null;
      
      public var bubbleType:String = null;
      
      public var teaPercent:Number = 0;
      
      public var bubblePercent:Number = 0;
      
      public var milkPercent:Number = 0;
      
      public var cupStartX:Number = 253;
      
      public var cupStartY:Number = 96;
      
      public var cupTargetY:Number = 235;
      
      public var cupDoneTargetX:Number = 233;
      
      public var cupDoneTargetY:Number = 255;
      
      public var cupSpeed:Number = 5;
      
      public var isDropping:Boolean = true;
      
      public var isBouncing:Boolean = false;
      
      public var isPouringMilk:Boolean = false;
      
      public var isPouringTea:Boolean = false;
      
      public var isPouringBubbles:Boolean = false;
      
      public var isDone:Boolean = false;
      
      public var streamStartY:Number = -244;
      
      public var streamTargetY:Number = -96;
      
      public var streamEndY:Number = 51;
      
      public var streamSpeed:Number = 12;
      
      public var bubbleStartY:Number = 38;
      
      public var bubbleEndY:Number = 47;
      
      public var clumpStartY:Number = -90;
      
      public var clumpFadeY:Number = 20;
      
      public var clumpEndY:Number = 54;
      
      public var clumpSpeed:Number = 6;
      
      public var lidStartY:Number = -328;
      
      public var lidTargetY:Number = -36;
      
      public var lidSpeed:Number = 4;
      
      public var lidSpeedMax:Number = 70;
      
      public var lidSpeedStart:Number = 25;
      
      public var strawStartY:Number = -375;
      
      public var strawTargetY:Number = -69;
      
      public var strawStartRotatingY:Number = -86;
      
      public var strawTargetRotation:Number = 7;
      
      public var strawSpeed:Number = 2;
      
      public var strawSpeedMax:Number = 65;
      
      public var strawSpeedStart:Number = 15;
      
      public var teaStartY:Number = 46;
      
      public var teaFullY:Number = -40;
      
      public var teaMinY:Number = 0;
      
      public var teaTargetY:Number = -40;
      
      public var milkTargetY:Number = 15;
      
      public var milkFullY:Number = 15;
      
      public var milkMinY:Number = 25;
      
      public var teaTransform:ColorTransform;
      
      public var teaTransformOffset:Number = 255;
      
      public var streamTransform:ColorTransform;
      
      public var streamColors:Array;
      
      public var streamIndex:Number = 0;
      
      public var streamDir:Number = 1;
      
      public var isDragging:Boolean = false;
      
      public var isTrashing:Boolean = false;
      
      public var isReturning:Boolean = false;
      
      public var isLeaving:Boolean = false;
      
      public var isOnPlate:Boolean = false;
      
      public var isGivingOrder:Boolean = false;
      
      public var giveTargetX:Number = 366;
      
      public var giveTargetY:Number = 282;
      
      public var giveTargetScale:Number = 0.58;
      
      public var giveDiningTargetX:Number = 290;
      
      public var giveDiningTargetY:Number = 295;
      
      public var trashTargetX:Number = 54;
      
      public var trashFinalX:Number = -116;
      
      public var trashTargetY:Number = 306;
      
      public var dragScale:Number = 1.164;
      
      public var dragScaleMinY:Number = 235;
      
      public var dragScaleMaxY:Number = 290;
      
      public var plateTargetX:Number = 435;
      
      public var plateTargetY:Number = 351;
      
      public var leaveX:Number = 800;
      
      public var internalPlateTargetX:Number = 593;
      
      public var internalPlateTargetY:Number = -80;
      
      public var hasLid:Boolean = false;
      
      public var playedLidSound:Boolean = false;
      
      public var playedSetSound:Boolean = false;
      
      public var pouringSound:SoundChannel = null;
      
      public function Tea(param1:class_5, param2:TeaScreen)
      {
         this.streamColors = [];
         super();
         this.gameObj = param1;
         this.screen = param2;
         this.setupTea();
      }
      
      public function setupTea() : void
      {
         var _loc1_:Tea = this;
         _loc1_.clip = new tea_cup();
         _loc1_.clip.x = _loc1_.cupStartX;
         _loc1_.clip.y = _loc1_.cupStartY;
         _loc1_.screen.clip.holder.addChild(_loc1_.clip);
         _loc1_.clip.stream.stop();
         _loc1_.clip.bubbles.stop();
         _loc1_.clip.clump.stop();
         _loc1_.clip.stream.stop();
         _loc1_.clip.straw.stop();
         _loc1_.clip.stream.visible = false;
         _loc1_.clip.bubbles.visible = false;
         _loc1_.clip.clump.visible = false;
         _loc1_.clip.lidbg.visible = false;
         _loc1_.clip.lidfg.visible = false;
         _loc1_.clip.straw.visible = false;
         _loc1_.clip.tea.mask = _loc1_.clip.masker;
         _loc1_.clip.tea.y = _loc1_.teaStartY;
      }
      
      public function pourMilk(param1:Number) : void
      {
         var _loc2_:Tea = this;
         _loc2_.isPouringMilk = true;
         _loc2_.milkPercent = param1;
         _loc2_.clip.stream.visible = true;
         _loc2_.clip.stream.scaleY = 1;
         _loc2_.clip.stream.y = _loc2_.streamStartY;
         _loc2_.clip.stream.play();
         _loc2_.teaTransform = new ColorTransform(1,1,1,1,255,255,255,0);
         _loc2_.clip.tea.transform.colorTransform = _loc2_.teaTransform;
         _loc2_.clip.tea.gotoAndStop(_loc2_.clip.tea.totalFrames);
         _loc2_.milkTargetY = Math.round(_loc2_.milkMinY + param1 / 100 * (_loc2_.milkFullY - _loc2_.milkMinY));
         class_6.method_1("Pour Milk: " + param1 + "%.  Target Y: " + _loc2_.milkTargetY);
         _loc2_.clip.buttonMode = true;
         _loc2_.clip.mouseEnabled = true;
         _loc2_.clip.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickTea);
         if(_loc2_.pouringSound)
         {
            _loc2_.pouringSound.stop();
            _loc2_.pouringSound = null;
         }
         _loc2_.pouringSound = _loc2_.gameObj.var_128.playSound("pour_tea.wav",false);
      }
      
      public function addTea(param1:String, param2:Number) : void
      {
         var _loc3_:Tea = this;
         _loc3_.teaPercent = param2;
         _loc3_.isPouringTea = true;
         _loc3_.teaType = param1;
         _loc3_.clip.tea.gotoAndStop(_loc3_.teaType);
         _loc3_.teaTargetY = Math.round(_loc3_.teaMinY + param2 / 100 * (_loc3_.teaFullY - _loc3_.teaMinY));
         _loc3_.streamColors = FoodData.getTeaTintColor(_loc3_.teaType);
         _loc3_.streamTransform = _loc3_.gameObj.var_134.createColorTransform(_loc3_.streamColors[0],false);
         _loc3_.clip.stream.transform.colorTransform = _loc3_.streamTransform;
         _loc3_.clip.stream.visible = true;
         _loc3_.clip.stream.scaleY = 1;
         _loc3_.clip.stream.y = _loc3_.streamStartY;
         _loc3_.clip.stream.play();
         class_6.method_1("Pour Tea: " + _loc3_.teaType + ", " + param2 + "%. Target Y: " + _loc3_.teaTargetY);
         if(_loc3_.pouringSound)
         {
            _loc3_.pouringSound.stop();
            _loc3_.pouringSound = null;
         }
         _loc3_.pouringSound = _loc3_.gameObj.var_128.playSound("pour_tea.wav",false);
      }
      
      public function addBubbles(param1:String, param2:Number) : void
      {
         var _loc3_:Tea = this;
         _loc3_.bubblePercent = param2;
         _loc3_.isPouringBubbles = true;
         _loc3_.bubbleType = param1;
         _loc3_.clip.bubbles.gotoAndStop(_loc3_.bubbleType);
         _loc3_.clip.clump.gotoAndStop(_loc3_.bubbleType);
         _loc3_.clip.straw.gotoAndStop(_loc3_.bubbleType);
         _loc3_.clip.clump.y = _loc3_.clumpStartY;
         _loc3_.clip.clump.visible = true;
         _loc3_.clip.bubbles.visible = true;
         _loc3_.clip.bubbles.alpha = 0;
         _loc3_.clip.bubbles.y = _loc3_.bubbleStartY;
         _loc3_.gameObj.var_128.playSound("drop_bubbles.wav");
      }
      
      public function addLid() : void
      {
         var _loc1_:Tea = this;
         _loc1_.clip.lidbg.y = _loc1_.lidStartY;
         _loc1_.clip.lidfg.y = _loc1_.lidStartY;
         _loc1_.clip.straw.y = _loc1_.strawStartY;
         _loc1_.clip.straw.rotation = 0;
         _loc1_.clip.lidbg.visible = true;
         _loc1_.clip.lidfg.visible = true;
         _loc1_.clip.straw.visible = true;
         _loc1_.lidSpeed = _loc1_.lidSpeedStart;
         _loc1_.strawSpeed = _loc1_.strawSpeedStart;
         _loc1_.hasLid = true;
      }
      
      public function removeLid() : void
      {
         var _loc1_:Tea = this;
         _loc1_.playedLidSound = false;
         _loc1_.gameObj.var_128.playSound("add_lid.wav");
         _loc1_.lidSpeed = _loc1_.strawSpeedStart;
         _loc1_.strawSpeed = _loc1_.lidSpeedStart;
         _loc1_.hasLid = false;
      }
      
      public function destroy() : void
      {
         var _loc1_:Tea = this;
         class_6.method_1("(Destroy Tea)");
         if(_loc1_.pouringSound)
         {
            _loc1_.pouringSound.stop();
            _loc1_.pouringSound = null;
         }
         if(_loc1_.clip)
         {
            _loc1_.clip.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickTea);
            _loc1_.clip.tea.mask = null;
            if(_loc1_.clip.parent)
            {
               _loc1_.clip.parent.removeChild(_loc1_.clip);
            }
         }
         _loc1_.clip = null;
         _loc1_.streamColors = null;
         _loc1_.streamTransform = null;
         _loc1_.teaTransform = null;
         _loc1_.screen = null;
         _loc1_.gameObj = null;
      }
      
      public function clickTea(param1:MouseEvent) : void
      {
         var _loc2_:Tea = this;
         if(_loc2_.isPouringBubbles == false && _loc2_.isPouringMilk == false && _loc2_.isPouringTea == false && _loc2_.isDropping == false && _loc2_.isBouncing == false && _loc2_.isTrashing == false && _loc2_.isDragging == false && (_loc2_.isOnPlate == false || _loc2_.screen.currentOrder.isLeavingTea == false) && (_loc2_.gameObj.training == false || _loc2_.gameObj.method_105(33)))
         {
            _loc2_.gameObj.var_128.playSound("grabtopping.wav");
            _loc2_.playedSetSound = false;
            _loc2_.gameObj.addEventListener(MouseEvent.MOUSE_UP,_loc2_.releaseTea);
            if(!_loc2_.screen.clip.topholder.contains(_loc2_.clip))
            {
               _loc2_.screen.clip.topholder.addChild(_loc2_.clip);
            }
            _loc2_.isDragging = true;
         }
      }
      
      public function setNotClickable() : void
      {
         var _loc1_:Tea = this;
         _loc1_.clip.mouseEnabled = false;
         _loc1_.clip.mouseChildren = false;
         _loc1_.clip.buttonMode = false;
      }
      
      public function releaseTea(param1:MouseEvent) : void
      {
         var _loc2_:Tea = this;
         _loc2_.gameObj.removeEventListener(MouseEvent.MOUSE_UP,_loc2_.releaseTea);
         _loc2_.isDragging = false;
         var _loc3_:Number = _loc2_.clip.y - 279;
         class_6.method_1("Release Tea: " + _loc2_.clip.x + ", " + _loc2_.clip.y + ".  Bounds are 268-344, X at 123 --> " + (123 - _loc3_));
         if(_loc2_.clip.y >= 268 && _loc2_.clip.y <= 344 && _loc2_.clip.x <= 123 - _loc3_ && _loc2_.gameObj.training == false && param1 != null)
         {
            _loc2_.isTrashing = true;
            _loc2_.clip.scaleX = _loc2_.dragScale;
            _loc2_.clip.scaleY = _loc2_.dragScale;
            _loc2_.clip.x = _loc2_.trashTargetX;
            _loc2_.clip.y = _loc2_.trashTargetY;
            _loc2_.clip.mouseEnabled = false;
            _loc2_.clip.mouseChildren = false;
            _loc2_.clip.buttonMode = false;
            if(_loc2_.isOnPlate)
            {
               if(_loc2_.screen.currentOrder)
               {
                  _loc2_.screen.currentOrder.removeTea();
               }
               _loc2_.isOnPlate = false;
            }
            _loc2_.gameObj.var_128.playSound("set_cup.wav");
         }
         else if(_loc2_.isOnPlate && _loc2_.clip.x >= 191 && _loc2_.clip.x <= 300 && _loc2_.clip.y >= 134 && _loc2_.clip.y <= 265)
         {
            _loc2_.screen.currentOrder.removeTea();
            _loc2_.isOnPlate = false;
            _loc2_.isReturning = true;
         }
         else if(_loc2_.screen.currentOrder && _loc2_.screen.currentOrder.attachedTea == null && _loc2_.clip.y >= 310 && _loc2_.clip.x >= 185 && _loc2_.clip.x <= 550)
         {
            _loc2_.screen.currentOrder.addTea(_loc2_);
            if(_loc2_.hasLid == false)
            {
               _loc2_.addLid();
            }
            _loc2_.isOnPlate = true;
         }
         else if(!_loc2_.isOnPlate)
         {
            _loc2_.isReturning = true;
         }
      }
      
      public function leaveForDelivery() : void
      {
         var _loc1_:Tea = this;
         _loc1_.isDragging = false;
         _loc1_.isLeaving = true;
         _loc1_.setNotClickable();
         _loc1_.gameObj.removeEventListener(MouseEvent.MOUSE_UP,_loc1_.releaseTea);
      }
      
      public function returnToMachine() : void
      {
         var _loc1_:Tea = this;
         _loc1_.isOnPlate = false;
         _loc1_.isReturning = true;
         _loc1_.isDragging = false;
         if(_loc1_.gameObj)
         {
            _loc1_.gameObj.removeEventListener(MouseEvent.MOUSE_UP,_loc1_.releaseTea);
         }
      }
      
      public function moveToGiveOrder(param1:MovieClip, param2:Boolean = false) : void
      {
         var _loc3_:Tea = this;
         _loc3_.isGivingOrder = true;
         _loc3_.isLeaving = false;
         param1.addChild(_loc3_.clip);
         _loc3_.clip.scaleX = _loc3_.giveTargetScale;
         _loc3_.clip.scaleY = _loc3_.giveTargetScale;
         if(param2)
         {
            _loc3_.clip.x = _loc3_.giveDiningTargetX;
            _loc3_.clip.y = _loc3_.giveDiningTargetY;
         }
         else
         {
            _loc3_.clip.x = _loc3_.giveTargetX;
            _loc3_.clip.y = _loc3_.giveTargetY;
         }
      }
      
      public function updateTea() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc1_:Tea = this;
         var _loc5_:Number = _loc1_.strawTargetY;
         var _loc6_:Number = _loc1_.strawTargetRotation;
         if(_loc1_.teaType == null)
         {
            _loc5_ = -32;
            _loc6_ = 3;
         }
         if(_loc1_.hasLid)
         {
            if(_loc1_.clip.lidfg.y < _loc1_.lidTargetY)
            {
               _loc1_.clip.lidfg.y += _loc1_.lidSpeed;
               if(_loc1_.lidSpeed < _loc1_.lidSpeedMax)
               {
                  ++_loc1_.lidSpeed;
               }
               if(_loc1_.clip.lidfg.y >= _loc1_.lidTargetY)
               {
                  _loc1_.clip.lidfg.y = _loc1_.lidTargetY;
               }
               _loc1_.clip.lidbg.y = _loc1_.clip.lidfg.y;
            }
            if(_loc1_.clip.lidfg.y == _loc1_.lidTargetY && _loc1_.playedLidSound == false)
            {
               _loc1_.gameObj.var_128.playSound("add_lid.wav");
               _loc1_.playedLidSound = true;
            }
            if(_loc1_.clip.straw.y < _loc5_)
            {
               _loc1_.clip.straw.y += _loc1_.strawSpeed;
               if(_loc1_.strawSpeed < _loc1_.strawSpeedMax)
               {
                  ++_loc1_.strawSpeed;
               }
               if(_loc1_.clip.straw.y >= _loc1_.strawStartRotatingY)
               {
                  _loc7_ = (_loc1_.clip.straw.y - _loc1_.strawStartRotatingY) / (_loc5_ - _loc1_.strawStartRotatingY);
                  _loc1_.clip.straw.rotation = _loc7_ * _loc6_;
               }
               if(_loc1_.clip.straw.y >= _loc5_)
               {
                  _loc1_.clip.straw.y = _loc5_;
                  _loc1_.clip.straw.rotation = _loc6_;
               }
            }
         }
         else if(_loc1_.clip.straw.visible === true || _loc1_.clip.lidfg.visible === true)
         {
            if(_loc1_.clip.lidfg.y > _loc1_.lidStartY)
            {
               _loc1_.clip.lidfg.y -= _loc1_.lidSpeed;
               if(_loc1_.lidSpeed < _loc1_.lidSpeedMax)
               {
                  ++_loc1_.lidSpeed;
               }
               if(_loc1_.clip.lidfg.y <= _loc1_.lidStartY)
               {
                  _loc1_.clip.lidfg.y = _loc1_.lidStartY;
                  _loc1_.clip.lidfg.visible = false;
                  _loc1_.clip.lidbg.visible = false;
               }
               _loc1_.clip.lidbg.y = _loc1_.clip.lidfg.y;
            }
            if(_loc1_.clip.straw.y > _loc1_.strawStartY)
            {
               _loc1_.clip.straw.y -= _loc1_.strawSpeed;
               if(_loc1_.strawSpeed < _loc1_.strawSpeedMax)
               {
                  ++_loc1_.strawSpeed;
               }
               if(_loc1_.clip.straw.y >= _loc1_.strawStartRotatingY)
               {
                  _loc8_ = (_loc1_.clip.straw.y - _loc1_.strawStartRotatingY) / (_loc5_ - _loc1_.strawStartRotatingY);
                  _loc1_.clip.straw.rotation = _loc8_ * _loc6_;
               }
               else
               {
                  _loc1_.clip.straw.rotation = 0;
               }
               if(_loc1_.clip.straw.y <= _loc1_.strawStartY)
               {
                  _loc1_.clip.straw.y = _loc1_.strawStartY;
                  _loc1_.clip.straw.rotation = 0;
                  _loc1_.clip.straw.visible = false;
               }
            }
         }
         if(!_loc1_.isGivingOrder)
         {
            if(_loc1_.isLeaving)
            {
               _loc2_ = _loc1_.leaveX;
               _loc3_ = _loc1_.plateTargetY;
               _loc1_.clip.x += (_loc2_ - _loc1_.clip.x) / 4;
               _loc1_.clip.y += (_loc3_ - _loc1_.clip.y) / 4;
            }
            else if(_loc1_.isTrashing)
            {
               _loc1_.clip.y = _loc1_.trashTargetY;
               _loc1_.clip.x += (_loc1_.trashFinalX - _loc1_.clip.x) / 2;
               if(Math.abs(_loc1_.trashFinalX - _loc1_.clip.x) <= 2)
               {
                  _loc1_.screen.removeTea(true);
                  return;
               }
            }
            else if(_loc1_.isDragging)
            {
               _loc2_ = _loc1_.screen.clip.mouseX;
               _loc3_ = _loc1_.screen.clip.mouseY;
               _loc4_ = _loc1_.dragScale;
               _loc1_.clip.x += (_loc2_ - _loc1_.clip.x) / 2;
               _loc1_.clip.y += (_loc3_ - _loc1_.clip.y) / 2;
               if(_loc1_.clip.y >= _loc1_.dragScaleMaxY)
               {
                  _loc4_ = _loc1_.dragScale;
               }
               else if(_loc1_.clip.y <= _loc1_.dragScaleMinY)
               {
                  _loc4_ = 1;
               }
               else
               {
                  _loc4_ = 1 + (_loc1_.clip.y - _loc1_.dragScaleMinY) / (_loc1_.dragScaleMaxY - _loc1_.dragScaleMinY) * (_loc1_.dragScale - 1);
               }
               _loc1_.clip.scaleX = _loc4_;
               _loc1_.clip.scaleY = _loc4_;
               if(_loc1_.screen.clip.mouseX < 0 || _loc1_.screen.clip.mouseX > 640 || _loc1_.screen.clip.mouseY < 0 || _loc1_.screen.clip.mouseY > 480)
               {
                  _loc1_.releaseTea(null);
               }
            }
            else if(_loc1_.isOnPlate)
            {
               _loc2_ = _loc1_.plateTargetX;
               _loc3_ = _loc1_.plateTargetY;
               _loc1_.clip.x += (_loc2_ - _loc1_.clip.x) / 2;
               _loc1_.clip.y += (_loc3_ - _loc1_.clip.y) / 2;
               if(Math.abs(_loc1_.clip.x - _loc2_) <= 1 && Math.abs(_loc1_.clip.y - _loc3_) <= 1 && _loc1_.playedSetSound == false)
               {
                  _loc1_.gameObj.var_128.playSound("set_cup.wav");
                  _loc1_.playedSetSound = true;
               }
            }
            else if(_loc1_.isReturning)
            {
               _loc2_ = _loc1_.cupStartX;
               _loc3_ = _loc1_.cupTargetY;
               if(_loc1_.bubbleType != null)
               {
                  _loc2_ = _loc1_.cupDoneTargetX;
                  _loc3_ = _loc1_.cupDoneTargetY;
               }
               _loc1_.clip.x += (_loc2_ - _loc1_.clip.x) / 2;
               _loc1_.clip.y += (_loc3_ - _loc1_.clip.y) / 2;
               if(_loc1_.clip.y >= _loc1_.dragScaleMaxY)
               {
                  _loc4_ = _loc1_.dragScale;
               }
               else if(_loc1_.clip.y <= _loc1_.dragScaleMinY)
               {
                  _loc4_ = 1;
               }
               else
               {
                  _loc4_ = 1 + (_loc1_.clip.y - _loc1_.dragScaleMinY) / (_loc1_.dragScaleMaxY - _loc1_.dragScaleMinY) * (_loc1_.dragScale - 1);
               }
               _loc1_.clip.scaleX = _loc4_;
               _loc1_.clip.scaleY = _loc4_;
               if(Math.abs(_loc2_ - _loc1_.clip.x) <= 1 && Math.abs(_loc3_ - _loc1_.clip.y) <= 1)
               {
                  _loc1_.isReturning = false;
                  _loc1_.clip.x = _loc2_;
                  _loc1_.clip.y = _loc3_;
                  if(_loc1_.clip.y >= _loc1_.dragScaleMaxY)
                  {
                     _loc4_ = _loc1_.dragScale;
                  }
                  else if(_loc1_.clip.y <= _loc1_.dragScaleMinY)
                  {
                     _loc4_ = 1;
                  }
                  else
                  {
                     _loc4_ = 1 + (_loc1_.clip.y - _loc1_.dragScaleMinY) / (_loc1_.dragScaleMaxY - _loc1_.dragScaleMinY) * (_loc1_.dragScale - 1);
                  }
                  if(_loc1_.isDone)
                  {
                     if(!_loc1_.screen.clip.doneholder.contains(_loc1_.clip))
                     {
                        _loc1_.screen.clip.doneholder.addChild(_loc1_.clip);
                     }
                  }
                  else if(!_loc1_.screen.clip.holder.contains(_loc1_.clip))
                  {
                     _loc1_.screen.clip.holder.addChild(_loc1_.clip);
                  }
                  if(_loc1_.playedSetSound == false)
                  {
                     _loc1_.gameObj.var_128.playSound("set_cup.wav");
                     _loc1_.playedSetSound = true;
                  }
                  if(_loc1_.hasLid && _loc1_.bubbleType == null)
                  {
                     _loc1_.removeLid();
                  }
               }
            }
            else if(_loc1_.isDone)
            {
               _loc2_ = _loc1_.cupDoneTargetX;
               _loc3_ = _loc1_.cupDoneTargetY;
               _loc1_.clip.x += (_loc2_ - _loc1_.clip.x) / 2;
               _loc1_.clip.y += (_loc3_ - _loc1_.clip.y) / 2;
               if(_loc1_.clip.y >= _loc1_.dragScaleMaxY)
               {
                  _loc4_ = _loc1_.dragScale;
               }
               else if(_loc1_.clip.y <= _loc1_.dragScaleMinY)
               {
                  _loc4_ = 1;
               }
               else
               {
                  _loc4_ = 1 + (_loc1_.clip.y - _loc1_.dragScaleMinY) / (_loc1_.dragScaleMaxY - _loc1_.dragScaleMinY) * (_loc1_.dragScale - 1);
               }
               _loc1_.clip.scaleX = _loc4_;
               _loc1_.clip.scaleY = _loc4_;
               if(Math.abs(_loc2_ - _loc1_.clip.x) <= 1 && Math.abs(_loc3_ - _loc1_.clip.y) <= 1 && _loc1_.hasLid == false)
               {
                  _loc1_.addLid();
               }
            }
            else if(_loc1_.isDropping)
            {
               if(_loc1_.clip.y < _loc1_.cupTargetY)
               {
                  _loc1_.cupSpeed += 4;
                  _loc1_.clip.y += _loc1_.cupSpeed;
                  if(_loc1_.clip.y >= _loc1_.cupTargetY)
                  {
                     _loc1_.clip.y = _loc1_.cupTargetY;
                     _loc1_.cupSpeed = -3;
                     _loc1_.isDropping = false;
                     _loc1_.isBouncing = true;
                     _loc1_.gameObj.var_128.playSound("set_empty_cup.wav");
                  }
               }
            }
            else if(_loc1_.isBouncing)
            {
               _loc1_.cupSpeed += 1;
               _loc1_.clip.y += _loc1_.cupSpeed;
               if(_loc1_.clip.y >= _loc1_.cupTargetY)
               {
                  _loc1_.clip.y = _loc1_.cupTargetY;
                  _loc1_.isBouncing = false;
                  _loc1_.screen.cupIsReady();
               }
            }
            else if(_loc1_.isPouringMilk)
            {
               if(_loc1_.clip.stream.y == _loc1_.streamTargetY)
               {
                  --_loc1_.clip.tea.y;
                  if(_loc1_.clip.tea.y <= _loc1_.milkTargetY)
                  {
                     _loc1_.clip.tea.y = _loc1_.milkTargetY;
                  }
               }
               if(_loc1_.clip.tea.y == _loc1_.milkTargetY)
               {
                  if(_loc1_.clip.stream.scaleY == 1)
                  {
                     _loc1_.screen.stopSpout();
                  }
                  _loc1_.clip.stream.y += _loc1_.streamSpeed;
                  _loc1_.clip.stream.height -= _loc1_.streamSpeed;
                  if(_loc1_.clip.stream.y >= _loc1_.streamEndY)
                  {
                     _loc1_.clip.stream.visible = false;
                     _loc1_.clip.stream.stop();
                     _loc1_.isPouringMilk = false;
                     _loc1_.gameObj.method_104(26);
                     _loc1_.screen.switchMode(_loc1_.screen.MODE_TEA);
                     _loc1_.screen.raiseSpout();
                     if(_loc1_.pouringSound)
                     {
                        _loc1_.pouringSound.stop();
                        _loc1_.pouringSound = null;
                     }
                  }
               }
               else if(_loc1_.clip.stream.y < _loc1_.streamTargetY)
               {
                  _loc1_.clip.stream.y += _loc1_.streamSpeed;
                  if(_loc1_.clip.stream.y >= _loc1_.streamTargetY)
                  {
                     _loc1_.clip.stream.y = _loc1_.streamTargetY;
                  }
               }
            }
            else if(_loc1_.isPouringTea)
            {
               if(_loc1_.clip.stream.y >= _loc1_.streamTargetY - (_loc1_.teaStartY - _loc1_.milkTargetY))
               {
                  --_loc1_.clip.tea.y;
                  if(_loc1_.clip.tea.y <= _loc1_.teaTargetY)
                  {
                     _loc1_.clip.tea.y = _loc1_.teaTargetY;
                  }
                  _loc9_ = _loc1_.milkTargetY - _loc1_.teaTargetY;
                  _loc10_ = (_loc1_.clip.tea.y - _loc1_.teaTargetY) / _loc9_;
                  _loc1_.teaTransformOffset = _loc10_ * 255;
                  _loc1_.teaTransform.redOffset = _loc1_.teaTransformOffset;
                  _loc1_.teaTransform.greenOffset = _loc1_.teaTransformOffset;
                  _loc1_.teaTransform.blueOffset = _loc1_.teaTransformOffset;
                  _loc1_.clip.tea.transform.colorTransform = _loc1_.teaTransform;
               }
               if(Boolean(_loc1_.clip.stream.visible) && _loc1_.clip.stream.y <= _loc1_.streamTargetY)
               {
                  _loc1_.streamIndex += _loc1_.streamDir;
                  if(_loc1_.streamIndex < 0)
                  {
                     _loc1_.streamIndex = 0;
                     _loc1_.streamDir = 1;
                  }
                  else if(_loc1_.streamIndex >= _loc1_.streamColors.length)
                  {
                     _loc1_.streamIndex = _loc1_.streamColors.length - 1;
                     _loc1_.streamDir = -1;
                  }
                  _loc1_.streamTransform = _loc1_.gameObj.var_134.createColorTransform(_loc1_.streamColors[_loc1_.streamIndex],false);
                  _loc1_.clip.stream.transform.colorTransform = _loc1_.streamTransform;
               }
               if(_loc1_.clip.tea.y == _loc1_.teaTargetY)
               {
                  if(_loc1_.clip.stream.scaleY == 1)
                  {
                     _loc1_.screen.stopSpout();
                  }
                  _loc1_.clip.stream.y += _loc1_.streamSpeed;
                  _loc1_.clip.stream.height -= _loc1_.streamSpeed;
                  if(_loc1_.clip.stream.y >= _loc1_.streamEndY)
                  {
                     _loc1_.clip.stream.visible = false;
                     _loc1_.clip.stream.stop();
                     _loc1_.isPouringTea = false;
                     _loc1_.teaTransformOffset = 0;
                     _loc1_.teaTransform.redOffset = _loc1_.teaTransformOffset;
                     _loc1_.teaTransform.greenOffset = _loc1_.teaTransformOffset;
                     _loc1_.teaTransform.blueOffset = _loc1_.teaTransformOffset;
                     _loc1_.clip.tea.transform.colorTransform = _loc1_.teaTransform;
                     _loc1_.gameObj.method_104(29);
                     _loc1_.screen.switchMode(_loc1_.screen.MODE_BUBBLES);
                     _loc1_.screen.raiseSpout();
                     if(_loc1_.pouringSound)
                     {
                        _loc1_.pouringSound.stop();
                        _loc1_.pouringSound = null;
                     }
                  }
               }
               else if(_loc1_.clip.stream.y < _loc1_.streamTargetY)
               {
                  _loc1_.clip.stream.y += _loc1_.streamSpeed;
                  if(_loc1_.clip.stream.y >= _loc1_.streamTargetY)
                  {
                     _loc1_.clip.stream.y = _loc1_.streamTargetY;
                  }
               }
            }
            else if(_loc1_.isPouringBubbles)
            {
               _loc1_.clip.clump.y += _loc1_.clumpSpeed;
               if(_loc1_.clip.clump.y >= _loc1_.clumpEndY)
               {
                  _loc1_.clip.clump.y = _loc1_.clumpEndY;
                  _loc1_.clip.clump.visible = false;
               }
               if(_loc1_.clip.clump.y >= _loc1_.clumpFadeY - 15)
               {
                  _loc1_.screen.stopSpout();
               }
               if(_loc1_.clip.clump.y >= _loc1_.clumpFadeY && _loc1_.clip.bubbles.alpha == 0)
               {
                  _loc1_.gameObj.var_128.playSound("donut_dip2.wav");
               }
               if(_loc1_.clip.clump.y >= _loc1_.clumpFadeY || _loc1_.clip.bubbles.alpha > 0)
               {
                  if(_loc1_.clip.bubbles.alpha < 1)
                  {
                     _loc1_.clip.bubbles.alpha += 0.05;
                  }
                  if(_loc1_.clip.bubbles.y < _loc1_.bubbleEndY)
                  {
                     _loc1_.clip.bubbles.y += 0.5;
                  }
                  if(_loc1_.clip.bubbles.alpha >= 1 && _loc1_.clip.bubbles.y >= _loc1_.bubbleEndY)
                  {
                     _loc1_.clip.bubbles.alpha = 1;
                     _loc1_.clip.clump.visible = false;
                     _loc1_.isPouringBubbles = false;
                     _loc1_.screen.switchMode(_loc1_.screen.MODE_DONE);
                     _loc1_.isDone = true;
                     if(!_loc1_.screen.clip.doneholder.contains(_loc1_.clip))
                     {
                        _loc1_.screen.clip.doneholder.addChild(_loc1_.clip);
                     }
                     _loc1_.screen.raiseSpout();
                     _loc1_.gameObj.method_104(32);
                  }
               }
            }
         }
      }
   }
}
