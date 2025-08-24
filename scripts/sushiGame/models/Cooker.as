package sushiGame.models
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.media.SoundChannel;
   import package_2.class_14;
   import package_2.class_6;
   import package_4.class_5;
   import sushiGame.data.FoodData;
   import sushiGame.screens.CookScreen;
   
   public class Cooker
   {
       
      
      public var gameObj:class_5;
      
      public var clip:MovieClip;
      
      public var normalContainer:MovieClip = null;
      
      public var index:Number = 0;
      
      public var cookAmount:Number = 0;
      
      public var vinegarAmount:Number = 0;
      
      public var vinegarTime:Number = 0;
      
      public var cookerTargetListX:Array;
      
      public var cookerTargetListY:Array;
      
      public var normalTargetX:Number = 0;
      
      public var normalTargetY:Number = 0;
      
      public var riceType:String = null;
      
      public var riceClip:MovieClip = null;
      
      public var riceHolderStartY:Number = 43;
      
      public var riceCoverStartY:Number = -69;
      
      public var riceLowerAmount:Number = 25;
      
      public var startingWaveAngle:Number = 4.71238898038469;
      
      public var waveAngle:Number = 4.71238898038469;
      
      public var waveRange:Number = 2;
      
      public var waveSpeed:Number = 0.1;
      
      public var isAddingToSushi:Boolean = false;
      
      public var isAddingMoving:Boolean = false;
      
      public var isRollingOverCooker:Boolean = false;
      
      public var isOnBase:Boolean = true;
      
      public var isInContainer:Boolean = true;
      
      public var isDragging:Boolean = false;
      
      public var isTrashing:Boolean = false;
      
      public var centerTargetOffsetX:Number = 15;
      
      public var centerTargetOffsetY:Number = -19;
      
      public var surfaceTopY:Number = -70;
      
      public var surfaceBottomY:Number = 16;
      
      public var surfaceTopLeft:Number = -41;
      
      public var surfaceWidth:Number = 162;
      
      public var surfaceChangeXPerY:Number = -0.9767441860465116;
      
      public var trashTargetX:Number = 2;
      
      public var trashTargetY:Number = 138;
      
      public var matTargetX:Number = 487;
      
      public var matTargetY:Number = 346;
      
      public var matOffscreenX:Number = 767;
      
      public var resetX:Number = -125;
      
      public var pouringSound:SoundChannel = null;
      
      public function Cooker(param1:class_5, param2:MovieClip, param3:Number)
      {
         this.cookerTargetListX = [32,128,225];
         this.cookerTargetListY = [351,254,158];
         super();
         this.gameObj = param1;
         this.index = param3;
         this.normalContainer = param2;
         this.setupCooker();
      }
      
      public function setupCooker() : void
      {
         var _loc1_:Cooker = this;
         _loc1_.clip = new cookerMC();
         _loc1_.clip.mouseEnabled = false;
         _loc1_.clip.mouseChildren = false;
         _loc1_.normalContainer.addChild(_loc1_.clip);
         _loc1_.normalTargetX = _loc1_.cookerTargetListX[_loc1_.index];
         _loc1_.normalTargetY = _loc1_.cookerTargetListY[_loc1_.index];
         _loc1_.clip.x = _loc1_.normalTargetX;
         _loc1_.clip.y = _loc1_.normalTargetY;
         _loc1_.clip.light.stop();
         _loc1_.clip.light.visible = false;
         _loc1_.clip.vinegarlight.stop();
         _loc1_.clip.vinegarlight.visible = false;
         _loc1_.clip.steam.stop();
         _loc1_.clip.steam.visible = false;
         _loc1_.clip.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickCooker);
         _loc1_.clip.addEventListener(MouseEvent.ROLL_OVER,_loc1_.rolloverCooker);
         _loc1_.clip.addEventListener(MouseEvent.ROLL_OUT,_loc1_.rolloutCooker);
      }
      
      public function updateCooker(param1:Number = 1) : void
      {
         var _loc6_:Number = NaN;
         var _loc2_:Cooker = this;
         if(_loc2_.riceType != null && _loc2_.riceClip != null && !_loc2_.isDragging && !_loc2_.isAddingToSushi && !_loc2_.isTrashing && _loc2_.isOnBase)
         {
            _loc2_.cookAmount += param1;
            if(_loc2_.gameObj.method_105(6,9) || _loc2_.gameObj.training == false && _loc2_.gameObj.var_127.currentDay == 1 && _loc2_.cookAmount < FoodData.getTargetCookTime())
            {
               _loc2_.cookAmount += param1;
               _loc2_.cookAmount += param1;
            }
            if(Boolean(_loc2_.gameObj) && Boolean(_loc2_.gameObj.var_135))
            {
               _loc2_.gameObj.var_135.updateMeter(_loc2_.index,_loc2_.cookAmount,_loc2_.vinegarAmount);
            }
         }
         if(_loc2_.gameObj.method_105(6) && _loc2_.cookAmount >= FoodData.getVinegarTime())
         {
            _loc2_.gameObj.method_104(6);
         }
         else if(_loc2_.gameObj.method_105(9) && _loc2_.cookAmount >= FoodData.getTargetCookTime())
         {
            _loc2_.gameObj.method_104(9);
         }
         var _loc3_:Boolean = false;
         if(_loc2_.gameObj && _loc2_.gameObj.var_135 && (_loc2_.gameObj.var_135.binsDragging.indexOf(true) > -1 || _loc2_.gameObj.var_135.binsPouring.indexOf(_loc2_.index) > -1))
         {
            if(_loc2_.riceType == null && _loc2_.isDragging == false && _loc2_.isAddingToSushi == false && _loc2_.isTrashing == false && _loc2_.isOnBase == true && _loc2_.gameObj.var_135.clip && _loc2_.isWithinRange(_loc2_.gameObj.var_135.clip.mouseX,_loc2_.gameObj.var_135.clip.mouseY))
            {
               _loc3_ = true;
            }
            else if(_loc2_.gameObj.var_135.binsPouring.indexOf(_loc2_.index) > -1)
            {
               _loc3_ = true;
            }
         }
         else if(_loc2_.gameObj && _loc2_.gameObj.var_135 && (_loc2_.gameObj.var_135.isDraggingBottle || _loc2_.gameObj.var_135.bottlePouringWhich == _loc2_.index))
         {
            if(_loc2_.riceType != null && _loc2_.canAddVinegar() && _loc2_.gameObj.var_135.clip && _loc2_.isWithinRange(_loc2_.gameObj.var_135.clip.mouseX,_loc2_.gameObj.var_135.clip.mouseY))
            {
               _loc3_ = true;
            }
            else if(_loc2_.gameObj.var_135.bottlePouringWhich == _loc2_.index)
            {
               _loc3_ = true;
            }
         }
         if(_loc3_ && _loc2_.clip.door.currentFrame < _loc2_.clip.door.totalFrames)
         {
            _loc2_.clip.door.nextFrame();
         }
         else if(!_loc3_ && _loc2_.clip.door.currentFrame > 1)
         {
            _loc2_.clip.door.prevFrame();
         }
         var _loc4_:Number = 0;
         var _loc5_:Number = 0;
         if(_loc2_.gameObj && _loc2_.gameObj.var_135 && Boolean(_loc2_.gameObj.var_135.clip))
         {
            _loc4_ = _loc2_.gameObj.var_135.clip.mouseX;
            _loc5_ = _loc2_.gameObj.var_135.clip.mouseY;
         }
         if(_loc2_.isDragging)
         {
            _loc2_.clip.x += (_loc4_ - _loc2_.clip.x) / 2;
            _loc2_.clip.y += (_loc5_ - _loc2_.clip.y) / 2;
            if(_loc2_.withinTrashRange() && _loc2_.clip.light.visible == false)
            {
               _loc2_.clip.light.visible = true;
               _loc2_.clip.light.play();
            }
            else if(!_loc2_.withinTrashRange() && _loc2_.clip.light.visible == true)
            {
               _loc2_.clip.light.visible = false;
               _loc2_.clip.light.stop();
            }
         }
         else if(_loc2_.isTrashing)
         {
            _loc4_ = _loc2_.trashTargetX;
            _loc5_ = _loc2_.trashTargetY;
            _loc2_.clip.x += (_loc4_ - _loc2_.clip.x) / 2;
            _loc2_.clip.y += (_loc5_ - _loc2_.clip.y) / 2;
            if(Math.abs(_loc4_ - _loc2_.clip.x) <= 1 && Math.abs(_loc5_ - _loc2_.clip.y) <= 1)
            {
               _loc2_.clip.riceholder.y += 2;
               _loc2_.clip.ricecover.y += 2;
               if(_loc2_.clip.riceholder.y >= _loc2_.riceHolderStartY + _loc2_.riceLowerAmount)
               {
                  _loc2_.clip.riceholder.y = _loc2_.riceHolderStartY + _loc2_.riceLowerAmount;
                  _loc2_.clip.ricecover.y = _loc2_.riceCoverStartY + _loc2_.riceLowerAmount;
                  if(Boolean(_loc2_.gameObj) && Boolean(_loc2_.gameObj.var_135))
                  {
                     _loc2_.gameObj.var_135.addRiceToTrash(_loc2_.riceType);
                  }
                  if(_loc2_.pouringSound)
                  {
                     _loc2_.pouringSound.stop();
                     _loc2_.pouringSound = null;
                  }
                  _loc2_.gameObj.var_128.playSound("finish_adding_rice.wav");
                  _loc2_.isTrashing = false;
                  _loc2_.removeRiceClip();
               }
            }
         }
         else if(_loc2_.isAddingToSushi && !_loc2_.isAddingMoving)
         {
            _loc4_ = _loc2_.matTargetX;
            _loc5_ = _loc2_.matTargetY;
            _loc2_.clip.x += (_loc4_ - _loc2_.clip.x) / 2;
            _loc2_.clip.y += (_loc5_ - _loc2_.clip.y) / 2;
            if(Math.abs(_loc4_ - _loc2_.clip.x) <= 1 && Math.abs(_loc5_ - _loc2_.clip.y) <= 1)
            {
               _loc2_.isAddingMoving = true;
               if(_loc2_.gameObj && _loc2_.gameObj.var_135 && _loc2_.gameObj.var_135.currentOrder && _loc2_.gameObj.var_135.currentOrder.riceType == null)
               {
                  _loc2_.gameObj.var_135.currentOrder.addRice(_loc2_.riceType,_loc2_.cookAmount,_loc2_.vinegarAmount,_loc2_.vinegarTime);
               }
            }
         }
         else if(_loc2_.isAddingMoving)
         {
            if(_loc2_.clip.x < 647)
            {
               _loc2_.clip.x += 5;
            }
            else
            {
               _loc2_.clip.x += 10;
            }
            if(_loc2_.riceClip != null)
            {
               _loc2_.clip.riceholder.y += 1;
               _loc2_.clip.ricecover.y += 1;
            }
            if(_loc2_.clip.riceholder.y >= _loc2_.riceHolderStartY + _loc2_.riceLowerAmount && _loc2_.riceClip != null)
            {
               _loc2_.clip.riceholder.y = _loc2_.riceHolderStartY + _loc2_.riceLowerAmount;
               _loc2_.clip.ricecover.y = _loc2_.riceCoverStartY + _loc2_.riceLowerAmount;
               _loc2_.removeRiceClip();
            }
            if(_loc2_.clip.x >= _loc2_.matOffscreenX)
            {
               _loc2_.clip.x = _loc2_.resetX;
               _loc2_.clip.y = _loc2_.normalTargetY;
               _loc2_.isAddingMoving = false;
               _loc2_.isAddingToSushi = false;
               if(!_loc2_.normalContainer.contains(_loc2_.clip))
               {
                  _loc2_.normalContainer.addChild(_loc2_.clip);
               }
               _loc2_.isInContainer = true;
               if(_loc2_.gameObj && _loc2_.gameObj.var_135 && Boolean(_loc2_.gameObj.var_135.currentOrder))
               {
                  _loc2_.gameObj.var_135.currentOrder.leaveCookStation();
               }
               if(_loc2_.pouringSound)
               {
                  _loc2_.pouringSound.stop();
                  _loc2_.pouringSound = null;
               }
               _loc2_.gameObj.var_128.playSound("finish_adding_rice.wav");
            }
         }
         else if(!_loc2_.isOnBase)
         {
            if(_loc2_.isInContainer)
            {
               _loc5_ = _loc2_.normalTargetY;
            }
            else
            {
               _loc5_ = _loc2_.normalTargetY - 45;
            }
            _loc4_ = _loc2_.normalTargetX;
            if(_loc2_.isInContainer)
            {
               _loc2_.clip.y += (_loc5_ - _loc2_.clip.y) / 2;
               _loc2_.clip.x += (_loc4_ - _loc2_.clip.x) / 2;
            }
            else
            {
               _loc2_.clip.y += (_loc5_ - _loc2_.clip.y) / 3;
               _loc2_.clip.x += (_loc4_ - _loc2_.clip.x) / 3;
            }
            if(Math.abs(_loc2_.clip.x - _loc4_) <= 1 && Math.abs(_loc2_.clip.y - _loc5_) <= 1)
            {
               if(!_loc2_.isInContainer)
               {
                  if(!_loc2_.normalContainer.contains(_loc2_.clip))
                  {
                     _loc2_.normalContainer.addChild(_loc2_.clip);
                  }
                  _loc2_.isInContainer = true;
                  _loc2_.gameObj.var_128.playSound("return_cooker.wav");
               }
               else if(_loc4_ == _loc2_.normalTargetX)
               {
                  _loc2_.isOnBase = true;
                  _loc2_.clip.light.visible = false;
                  _loc2_.clip.light.stop();
               }
            }
         }
         else if(_loc2_.isOnBase)
         {
            if(_loc2_.isRollingOverCooker)
            {
               _loc2_.clip.y = _loc2_.normalTargetY - 3;
            }
            else
            {
               _loc2_.clip.y = _loc2_.normalTargetY;
            }
            if(_loc2_.vinegarAmount > 0)
            {
               _loc2_.waveAngle += _loc2_.waveSpeed;
               if(_loc2_.gameObj && _loc2_.gameObj.var_135 && _loc2_.gameObj.var_135.isBoosting && _loc2_.gameObj.var_135.boostingWhich == _loc2_.index)
               {
                  _loc2_.waveAngle += _loc2_.waveSpeed;
               }
               _loc6_ = Math.sin(_loc2_.waveAngle) * _loc2_.waveRange;
               _loc2_.clip.riceholder.y = _loc2_.riceHolderStartY + _loc2_.waveRange + _loc6_;
               _loc2_.clip.ricecover.y = _loc2_.riceCoverStartY + _loc2_.waveRange + _loc6_;
            }
         }
      }
      
      public function setRiceType(param1:String) : void
      {
         var _loc2_:Cooker = this;
         _loc2_.riceType = param1;
         _loc2_.cookAmount = 0;
         _loc2_.vinegarAmount = 0;
         _loc2_.gameObj.method_104(5);
         if(Boolean(_loc2_.gameObj.hud) && _loc2_.gameObj.hud.whichContextTraining == "brownrice")
         {
            _loc2_.gameObj.var_127.setTrained("brownrice");
            _loc2_.gameObj.hud.removeContextTraining();
         }
      }
      
      public function removeRiceClip() : void
      {
         var _loc1_:Cooker = this;
         if(_loc1_.riceClip)
         {
            _loc1_.riceClip.stop();
            if(_loc1_.riceClip.parent)
            {
               _loc1_.riceClip.parent.removeChild(_loc1_.riceClip);
            }
            _loc1_.riceClip = null;
         }
         _loc1_.riceType = null;
         _loc1_.clip.mouseEnabled = false;
         _loc1_.clip.buttonMode = false;
         _loc1_.cookAmount = 0;
         _loc1_.vinegarAmount = 0;
         _loc1_.vinegarTime = 0;
         _loc1_.waveAngle = _loc1_.startingWaveAngle;
         _loc1_.clip.steam.visible = false;
         _loc1_.clip.steam.stop();
         _loc1_.clip.vinegarlight.visible = false;
      }
      
      public function addVinegar() : void
      {
         var _loc1_:Cooker = this;
         _loc1_.vinegarTime = _loc1_.cookAmount;
         ++_loc1_.vinegarAmount;
         _loc1_.clip.vinegarlight.visible = true;
         if(_loc1_.index == 1)
         {
            _loc1_.gameObj.method_104(7);
         }
      }
      
      public function addRiceClip() : void
      {
         var _loc1_:Cooker = this;
         if(_loc1_.riceClip)
         {
            _loc1_.riceClip.stop();
            if(_loc1_.riceClip.parent)
            {
               _loc1_.riceClip.parent.removeChild(_loc1_.riceClip);
            }
            _loc1_.riceClip = null;
         }
         _loc1_.riceClip = class_14.method_103(_loc1_.riceType + "_flat",false,false);
         _loc1_.riceClip.gotoAndStop(1);
         _loc1_.clip.riceholder.addChild(_loc1_.riceClip);
         _loc1_.clip.riceholder.y = _loc1_.riceHolderStartY;
         _loc1_.clip.ricecover.y = _loc1_.riceCoverStartY;
         _loc1_.clip.mouseEnabled = true;
         _loc1_.clip.buttonMode = true;
         _loc1_.clip.useHandCursor = true;
         _loc1_.cookAmount = 0;
         _loc1_.clip.steam.visible = true;
         _loc1_.clip.steam.gotoAndPlay(1);
         if(_loc1_.gameObj.var_127.hasTrained("boost") == false && _loc1_.gameObj.var_127.hasBonus("booster" + _loc1_.index))
         {
            _loc1_.gameObj.hud.showContextTraining("boost");
         }
      }
      
      public function destroy() : void
      {
         var _loc1_:Cooker = this;
         if(_loc1_.pouringSound)
         {
            _loc1_.pouringSound.stop();
            _loc1_.pouringSound = null;
         }
         if(_loc1_.riceClip)
         {
            _loc1_.riceClip.stop();
            if(_loc1_.riceClip.parent)
            {
               _loc1_.riceClip.parent.removeChild(_loc1_.riceClip);
            }
            _loc1_.riceClip = null;
         }
         if(_loc1_.clip)
         {
            _loc1_.clip.steam.stop();
            _loc1_.clip.light.stop();
            _loc1_.clip.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickCooker);
            _loc1_.clip.removeEventListener(MouseEvent.ROLL_OVER,_loc1_.rolloverCooker);
            _loc1_.clip.removeEventListener(MouseEvent.ROLL_OUT,_loc1_.rolloutCooker);
            if(_loc1_.clip.parent)
            {
               _loc1_.clip.parent.removeChild(_loc1_.clip);
            }
            _loc1_.clip = null;
         }
         _loc1_.normalContainer = null;
         _loc1_.gameObj = null;
      }
      
      public function clickCooker(param1:MouseEvent) : void
      {
         var _loc2_:Cooker = this;
         if(_loc2_.riceType != null && !_loc2_.isDragging && !_loc2_.isTrashing && !_loc2_.isAddingToSushi && _loc2_.gameObj && _loc2_.gameObj.var_135 && _loc2_.gameObj.var_135.bottlePouringWhich != _loc2_.index)
         {
            if(!_loc2_.gameObj.training || _loc2_.gameObj.method_105(10))
            {
               _loc2_.isDragging = true;
               _loc2_.isOnBase = false;
               _loc2_.isInContainer = false;
               if(_loc2_.gameObj.var_135.clip)
               {
                  if(_loc2_.gameObj.var_135.clip.holder.contains(_loc2_.clip) == false)
                  {
                     _loc2_.gameObj.var_135.clip.holder.addChild(_loc2_.clip);
                  }
               }
               _loc2_.gameObj.addEventListener(MouseEvent.MOUSE_UP,_loc2_.releaseCooker);
               _loc2_.gameObj.var_128.playSound("grab_cooker.wav");
            }
            else if(_loc2_.gameObj.method_105(6,7,8,9) && Boolean(_loc2_.gameObj.hud))
            {
               _loc2_.gameObj.hud.showTrainingWarning("waitmove");
            }
         }
      }
      
      public function rolloverCooker(param1:MouseEvent) : void
      {
         var _loc2_:Cooker = this;
         if(_loc2_.riceType != null && !_loc2_.isDragging && !_loc2_.isTrashing && !_loc2_.isAddingToSushi && _loc2_.isOnBase && _loc2_.gameObj && _loc2_.gameObj.var_135 && _loc2_.gameObj.var_135.isDraggingAnything() == false)
         {
            _loc2_.isRollingOverCooker = true;
         }
      }
      
      public function rolloutCooker(param1:MouseEvent) : void
      {
         var _loc2_:Cooker = this;
         _loc2_.isRollingOverCooker = false;
      }
      
      public function releaseCooker(param1:MouseEvent) : void
      {
         var _loc2_:Cooker = this;
         var _loc3_:CookScreen = _loc2_.gameObj.var_135;
         class_6.method_1("Cooker at " + _loc2_.clip.x + ", " + _loc2_.clip.y);
         _loc2_.gameObj.removeEventListener(MouseEvent.MOUSE_UP,_loc2_.releaseCooker);
         _loc2_.isDragging = false;
         _loc2_.clip.light.visible = false;
         _loc2_.clip.light.stop();
         if(_loc3_ != null)
         {
            if(!_loc2_.gameObj.training && _loc2_.withinTrashRange() && _loc3_.isTrashingAnyCooker() == false)
            {
               _loc2_.isTrashing = true;
               _loc2_.clip.mouseEnabled = false;
               _loc2_.clip.buttonMode = false;
               _loc2_.gameObj.var_135.updateMeter(_loc2_.index,0,0,true);
               _loc2_.clip.steam.stop();
               _loc2_.clip.steam.visible = false;
               _loc2_.pouringSound = _loc2_.gameObj.var_128.playSound("adding_rice.wav");
            }
            else if(_loc3_.withinMatRange(_loc3_.clip.mouseX,_loc3_.clip.mouseY,true))
            {
               if(_loc3_.currentOrder && _loc3_.currentOrder.isDraggingOnCook == false && _loc3_.currentOrder.isLeavingCook == false && _loc3_.currentOrder.isTrashingOnCook == false && _loc3_.currentOrder.riceType == null && _loc3_.currentOrder.paperType != null)
               {
                  _loc2_.isAddingToSushi = true;
                  _loc2_.clip.mouseEnabled = false;
                  _loc2_.clip.buttonMode = false;
                  _loc2_.gameObj.var_135.updateMeter(_loc2_.index,0,0,true);
                  _loc2_.clip.steam.stop();
                  _loc2_.clip.steam.visible = false;
                  _loc2_.gameObj.method_104(10);
                  _loc2_.pouringSound = _loc2_.gameObj.var_128.playSound("adding_rice.wav");
               }
               else if(Boolean(_loc3_.currentOrder) && _loc3_.currentOrder.paperType == null)
               {
                  _loc3_.currentOrder.showPaperWarning();
               }
            }
         }
      }
      
      public function withinTrashRange() : Boolean
      {
         var _loc1_:Cooker = this;
         var _loc2_:Boolean = false;
         if(_loc1_.clip.y > 71 && _loc1_.clip.y < 190 && _loc1_.clip.x < 132 + (_loc1_.clip.y - 71) * -1)
         {
            _loc2_ = true;
         }
         return _loc2_;
      }
      
      public function isWithinRange(param1:Number, param2:Number) : Boolean
      {
         var _loc3_:Cooker = this;
         var _loc4_:Boolean = false;
         param1 -= _loc3_.clip.x;
         param2 -= _loc3_.clip.y;
         var _loc5_:Number = param2 - _loc3_.surfaceTopY;
         if(!(param2 < _loc3_.surfaceTopY || param2 > _loc3_.surfaceBottomY))
         {
            if(param1 > _loc3_.surfaceTopLeft + _loc5_ * _loc3_.surfaceChangeXPerY && param1 < _loc3_.surfaceTopLeft + _loc5_ * _loc3_.surfaceChangeXPerY + _loc3_.surfaceWidth)
            {
               _loc4_ = true;
            }
         }
         return _loc4_;
      }
      
      public function canAddRice() : Boolean
      {
         var _loc1_:Cooker = this;
         if(!_loc1_.isDragging && !_loc1_.isAddingToSushi && !_loc1_.isTrashing && _loc1_.isOnBase && _loc1_.riceType == null)
         {
            return true;
         }
         return false;
      }
      
      public function canAddVinegar() : Boolean
      {
         var _loc1_:Cooker = this;
         if(!_loc1_.isDragging && !_loc1_.isAddingToSushi && !_loc1_.isTrashing && _loc1_.isOnBase && _loc1_.riceType != null && _loc1_.riceClip != null)
         {
            return true;
         }
         return false;
      }
   }
}
