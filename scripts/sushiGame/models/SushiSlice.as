package sushiGame.models
{
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.GlowFilter;
   import package_2.class_14;
   import package_4.class_5;
   
   public class SushiSlice
   {
       
      
      public var gameObj:class_5;
      
      public var sushi:SushiRoll;
      
      public var clip:MovieClip;
      
      public var logBitmap:Bitmap = null;
      
      public var toppingBitmap:Bitmap = null;
      
      public var logMask:MovieClip = null;
      
      public var toppingMask:MovieClip = null;
      
      public var crossSection:SushiCrossSection = null;
      
      public var cutEdge:MovieClip = null;
      
      public var maskStartX:Number = 51;
      
      public var maskStartY:Number = -127.5;
      
      public var maskRadius:Number = 26;
      
      public var maskAngle:Number = 0.7853981633974483;
      
      public var paddingBetweenSlices:Number = 20;
      
      public var startingY:Number = 0;
      
      public var endingY:Number = 0;
      
      public var isOnPlate:Boolean = false;
      
      public var movingToPlate:Boolean = false;
      
      public var whichColumn:Number = -1;
      
      public var columnDepthIndex:Number = -1;
      
      public var columnTargetX:Number = 0;
      
      public var columnTargetY:Number = 0;
      
      public var columnRiseY:Number = 52;
      
      public var wasOtherSliceBehind:Boolean = false;
      
      public var wasLastSlice:Boolean = false;
      
      public var delayTimer:Number = 0;
      
      public var delayTimerMax:Number = 10;
      
      public function SushiSlice(param1:class_5, param2:SushiRoll, param3:Number, param4:Number)
      {
         super();
         this.gameObj = param1;
         this.sushi = param2;
         this.startingY = param3;
         this.endingY = param4;
         this.setupSlice();
      }
      
      public function setupSlice() : void
      {
         var _loc1_:SushiSlice = this;
         _loc1_.clip = new MovieClip();
         _loc1_.logBitmap = new Bitmap(_loc1_.sushi.topping.sliceLogBMP,"auto",true);
         _loc1_.toppingBitmap = new Bitmap(_loc1_.sushi.topping.sliceToppingBMP,"auto",true);
         _loc1_.toppingBitmap.cacheAsBitmap = true;
         _loc1_.logMask = new MovieClip();
         _loc1_.toppingMask = new MovieClip();
         _loc1_.toppingMask.cacheAsBitmap = true;
         _loc1_.clip.addChild(_loc1_.logBitmap);
         _loc1_.clip.addChild(_loc1_.logMask);
         _loc1_.maskStartX -= _loc1_.sushi.topping.bitmapOffsetX;
         _loc1_.maskStartY -= _loc1_.sushi.topping.bitmapOffsetY;
         if(_loc1_.startingY > 0)
         {
            if(_loc1_.sushi.isFlipped)
            {
               _loc1_.cutEdge = class_14.method_103(_loc1_.sushi.riceType + "_cutedge",false,false);
            }
            else
            {
               _loc1_.cutEdge = class_14.method_103(_loc1_.sushi.paperType + "_cutedge",false,false);
            }
            _loc1_.clip.addChild(_loc1_.cutEdge);
         }
         _loc1_.clip.addChild(_loc1_.toppingBitmap);
         _loc1_.clip.addChild(_loc1_.toppingMask);
         _loc1_.updateMask();
         _loc1_.logBitmap.x = _loc1_.sushi.topping.clip.x + _loc1_.sushi.topping.bitmapOffsetX;
         _loc1_.logBitmap.y = _loc1_.sushi.topping.clip.y + _loc1_.sushi.topping.bitmapOffsetY;
         _loc1_.toppingBitmap.x = _loc1_.logBitmap.x;
         _loc1_.toppingBitmap.y = _loc1_.logBitmap.y;
         _loc1_.logMask.x = _loc1_.logBitmap.x;
         _loc1_.logMask.y = _loc1_.logBitmap.y;
         _loc1_.toppingMask.x = _loc1_.logBitmap.x;
         _loc1_.toppingMask.y = _loc1_.logBitmap.y;
         _loc1_.clip.x = 0;
         _loc1_.clip.y = 0;
         _loc1_.logBitmap.mask = _loc1_.logMask;
         _loc1_.toppingBitmap.mask = _loc1_.toppingMask;
         _loc1_.sushi.sliceHolder.addChild(_loc1_.clip);
         _loc1_.clip.mouseEnabled = false;
         _loc1_.clip.mouseChildren = false;
         var _loc2_:GlowFilter = new GlowFilter(657930,0.36,1.5,1.5,8.91,BitmapFilterQuality.MEDIUM,true);
         _loc1_.clip.filters = [_loc2_];
      }
      
      public function updateMask() : void
      {
         var _loc3_:Number = NaN;
         var _loc1_:SushiSlice = this;
         _loc1_.drawLogMask();
         _loc1_.drawToppingMask();
         if(_loc1_.cutEdge)
         {
            _loc1_.cutEdge.x = _loc1_.sushi.topping.clip.x + _loc1_.sushi.topping.bitmapOffsetX + _loc1_.maskStartX - _loc1_.startingY;
            _loc1_.cutEdge.y = _loc1_.sushi.topping.clip.y + _loc1_.sushi.topping.bitmapOffsetY + _loc1_.maskStartY + _loc1_.startingY + _loc1_.maskRadius;
         }
         if(_loc1_.crossSection)
         {
            _loc3_ = _loc1_.crossSection.id;
            _loc1_.crossSection = null;
            _loc1_.sushi.filling.destroyCrossSection(_loc3_);
         }
         var _loc2_:Number = _loc1_.getSliceSize();
         if(_loc1_.endingY == _loc1_.sushi.filling.heightMapRange)
         {
            _loc2_ = 15;
         }
         _loc1_.crossSection = _loc1_.sushi.filling.createCrossSection(_loc1_.endingY - _loc1_.sushi.filling.rangeInset,_loc2_);
         _loc1_.crossSection.attachCrossSection(-57.5 + _loc1_.sushi.topping.clip.x + (_loc1_.sushi.filling.heightMapRange - _loc1_.endingY),-19 + _loc1_.sushi.topping.clip.y - (_loc1_.sushi.filling.heightMapRange - _loc1_.endingY),_loc1_.clip);
      }
      
      public function drawLogMask() : void
      {
         var _loc1_:SushiSlice = this;
         _loc1_.logMask.graphics.clear();
         _loc1_.logMask.graphics.beginFill(16711680,1);
         var _loc2_:Number = _loc1_.maskStartY + _loc1_.startingY;
         var _loc3_:Number = _loc1_.maskStartX - _loc1_.startingY;
         var _loc4_:Number = _loc1_.maskStartY + _loc1_.endingY;
         var _loc5_:Number = _loc1_.maskStartX - _loc1_.endingY;
         var _loc6_:Number = _loc3_ + Math.sin(_loc1_.maskAngle) * _loc1_.maskRadius;
         var _loc7_:Number = _loc2_ + Math.cos(_loc1_.maskAngle) * _loc1_.maskRadius;
         var _loc8_:Number = _loc5_ + Math.sin(_loc1_.maskAngle) * _loc1_.maskRadius;
         var _loc9_:Number = _loc4_ + Math.cos(_loc1_.maskAngle) * _loc1_.maskRadius;
         var _loc10_:Number = _loc3_ - Math.sin(_loc1_.maskAngle) * _loc1_.maskRadius;
         var _loc11_:Number = _loc2_ - Math.cos(_loc1_.maskAngle) * _loc1_.maskRadius;
         var _loc12_:Number = _loc5_ - Math.sin(_loc1_.maskAngle) * _loc1_.maskRadius;
         var _loc13_:Number = _loc4_ - Math.cos(_loc1_.maskAngle) * _loc1_.maskRadius;
         _loc1_.logMask.graphics.moveTo(_loc6_,_loc7_);
         _loc1_.logMask.graphics.lineTo(_loc8_,_loc9_);
         _loc1_.logMask.graphics.lineTo(_loc12_,_loc13_);
         _loc1_.logMask.graphics.lineTo(_loc10_,_loc11_);
         _loc1_.logMask.graphics.lineTo(_loc6_,_loc7_);
         _loc1_.logMask.graphics.endFill();
         _loc1_.logMask.graphics.beginFill(16711680,1);
         _loc1_.logMask.graphics.drawCircle(_loc3_,_loc2_,_loc1_.maskRadius);
         _loc1_.logMask.graphics.endFill();
         _loc1_.logMask.graphics.beginFill(16711680,1);
         _loc1_.logMask.graphics.drawCircle(_loc5_,_loc4_,_loc1_.maskRadius);
         _loc1_.logMask.graphics.endFill();
      }
      
      public function drawToppingMask() : void
      {
         var _loc1_:SushiSlice = this;
         _loc1_.toppingMask.graphics.clear();
         var _loc2_:Number = _loc1_.maskStartY + _loc1_.startingY;
         var _loc3_:Number = _loc1_.maskStartX - _loc1_.startingY;
         var _loc4_:Number = _loc1_.maskStartY + _loc1_.endingY;
         var _loc5_:Number = _loc1_.maskStartX - _loc1_.endingY;
         var _loc6_:Number = _loc3_ - 13;
         var _loc7_:Number = _loc2_ - 25;
         var _loc8_:Number = _loc3_ - 36;
         var _loc9_:Number = _loc2_ - 15;
         var _loc10_:Number = _loc3_ + 27;
         var _loc11_:Number = _loc2_ + 9;
         var _loc12_:Number = _loc3_ + 24;
         var _loc13_:Number = _loc2_ + 22;
         var _loc14_:Number = _loc5_ - 24;
         var _loc15_:Number = _loc4_ - 6;
         var _loc16_:Number = _loc5_ - 25;
         var _loc17_:Number = _loc4_ - 14;
         var _loc18_:Number = _loc5_ + 18;
         var _loc19_:Number = _loc4_ + 18;
         var _loc20_:Number = _loc5_ + 25;
         var _loc21_:Number = _loc4_ + 13;
         var _loc22_:Number = _loc5_ - 19;
         var _loc23_:Number = _loc4_ - 32;
         var _loc24_:Number = _loc5_ + 41;
         var _loc25_:Number = _loc4_ + 4;
         if(_loc22_ > _loc8_)
         {
            _loc22_ = _loc8_;
            _loc23_ = _loc9_;
            _loc24_ = _loc12_;
            _loc25_ = _loc13_;
         }
         if(_loc16_ > _loc8_)
         {
            _loc16_ = _loc8_;
            _loc17_ = _loc9_;
            _loc20_ = _loc12_;
            _loc21_ = _loc13_;
         }
         _loc1_.toppingMask.graphics.beginFill(26112,1);
         _loc1_.toppingMask.graphics.moveTo(_loc6_,_loc7_);
         _loc1_.toppingMask.graphics.lineTo(_loc8_,_loc9_);
         _loc1_.toppingMask.graphics.lineTo(_loc22_,_loc23_);
         _loc1_.toppingMask.graphics.curveTo(_loc16_,_loc17_ - (_loc17_ - _loc23_) / 2,_loc16_,_loc17_);
         _loc1_.toppingMask.graphics.lineTo(_loc14_,_loc15_);
         _loc1_.toppingMask.graphics.lineTo(_loc18_,_loc19_);
         _loc1_.toppingMask.graphics.lineTo(_loc20_,_loc21_);
         _loc1_.toppingMask.graphics.lineTo(_loc24_,_loc25_);
         _loc1_.toppingMask.graphics.lineTo(_loc12_,_loc13_);
         _loc1_.toppingMask.graphics.lineTo(_loc10_,_loc11_);
         _loc1_.toppingMask.graphics.lineTo(_loc6_,_loc7_);
         _loc1_.toppingMask.graphics.endFill();
         _loc1_.toppingMask.graphics.beginFill(39168,1);
         _loc1_.toppingMask.graphics.drawCircle(_loc3_,_loc2_,_loc1_.maskRadius + 2.5);
         _loc1_.toppingMask.graphics.endFill();
         _loc1_.toppingMask.graphics.beginFill(62720,1);
         _loc1_.toppingMask.graphics.drawCircle(_loc5_,_loc4_,_loc1_.maskRadius - 0.5);
         _loc1_.toppingMask.graphics.endFill();
      }
      
      public function moveToPlate(param1:Boolean = false) : void
      {
         var _loc2_:SushiSlice = this;
         _loc2_.movingToPlate = true;
         _loc2_.wasLastSlice = param1;
         _loc2_.whichColumn = _loc2_.sushi.getColumnForSlice(_loc2_.getSliceSize());
         _loc2_.columnDepthIndex = _loc2_.sushi.getNumSlicesInColumn(_loc2_.whichColumn,_loc2_);
         _loc2_.sushi.adjustSlicePositionsInColumn(_loc2_.whichColumn);
      }
      
      public function stayForCutting(param1:Boolean) : void
      {
         var _loc2_:SushiSlice = this;
         _loc2_.wasOtherSliceBehind = param1;
      }
      
      public function updateSlice() : void
      {
         var _loc1_:SushiSlice = this;
         if((_loc1_.isOnPlate || _loc1_.movingToPlate) && (_loc1_.clip.x != _loc1_.columnTargetX || _loc1_.clip.y != _loc1_.columnTargetY))
         {
            if(_loc1_.delayTimer < _loc1_.delayTimerMax)
            {
               ++_loc1_.delayTimer;
            }
            else
            {
               _loc1_.clip.x += (_loc1_.columnTargetX - _loc1_.clip.x) / 3;
               _loc1_.clip.y += (_loc1_.columnTargetY - _loc1_.clip.y) / 3;
               if(Math.abs(_loc1_.columnTargetX - _loc1_.clip.x) <= 1 && Math.abs(_loc1_.columnTargetY - _loc1_.clip.y) <= 1)
               {
                  _loc1_.clip.x = _loc1_.columnTargetX;
                  _loc1_.clip.y = _loc1_.columnTargetY;
                  if(_loc1_.movingToPlate && _loc1_.isOnPlate == false)
                  {
                     _loc1_.movingToPlate = false;
                     _loc1_.isOnPlate = true;
                     if(_loc1_.wasLastSlice && !_loc1_.sushi.isLeavingBuild)
                     {
                        _loc1_.sushi.leaveBuildStation();
                     }
                  }
               }
            }
         }
      }
      
      public function isWithinSlice(param1:Number) : Boolean
      {
         var _loc2_:SushiSlice = this;
         if(param1 > _loc2_.startingY && param1 < _loc2_.endingY && _loc2_.isOnPlate == false && _loc2_.movingToPlate == false)
         {
            return true;
         }
         return false;
      }
      
      public function trimSlice(param1:Number) : Number
      {
         var _loc2_:SushiSlice = this;
         var _loc3_:Number = _loc2_.endingY;
         _loc2_.endingY = param1;
         _loc2_.updateMask();
         return _loc3_;
      }
      
      public function getSliceSize() : Number
      {
         var _loc1_:SushiSlice = this;
         return _loc1_.endingY - _loc1_.startingY;
      }
      
      public function adjustPositionInColumn() : void
      {
         var _loc1_:SushiSlice = this;
         var _loc2_:Array = _loc1_.sushi.getSizesInColumn(_loc1_.whichColumn);
         var _loc3_:Number = _loc1_.sushi.getSpaceUsedInColumn(_loc1_.whichColumn);
         var _loc4_:Number = _loc1_.paddingBetweenSlices;
         if(_loc3_ >= 40 && _loc3_ <= 50)
         {
            _loc4_ = 10;
         }
         else if(_loc3_ > 50)
         {
            _loc4_ = 5;
         }
         _loc3_ += Math.max(0,(_loc2_.length - 1) * _loc4_);
         var _loc5_:Number = _loc1_.sushi.sliceCenterY - _loc3_ / 2;
         var _loc6_:Number = 0;
         var _loc7_:int = 0;
         while(_loc7_ < _loc2_.length)
         {
            if(_loc7_ < _loc1_.columnDepthIndex)
            {
               _loc6_ += _loc2_[_loc7_];
            }
            _loc7_++;
         }
         _loc6_ += _loc1_.columnDepthIndex * _loc4_;
         var _loc8_:Number = _loc5_ + _loc6_;
         var _loc9_:Number = 0 - (_loc1_.sushi.filling.heightMapRange - _loc1_.startingY) - 8;
         var _loc10_:Number = _loc8_ - _loc9_;
         _loc1_.columnTargetY = _loc10_;
         _loc1_.columnTargetX = _loc1_.sushi.sliceColumnsX[_loc1_.whichColumn] - _loc1_.columnTargetY;
         _loc1_.delayTimer = 0;
      }
      
      public function destroy() : void
      {
         var _loc1_:SushiSlice = this;
         if(_loc1_.clip)
         {
            _loc1_.clip.filters = [];
         }
         if(_loc1_.crossSection)
         {
            _loc1_.crossSection.detachCrossSection();
            _loc1_.crossSection = null;
         }
         if(_loc1_.logBitmap)
         {
            _loc1_.logBitmap.mask = null;
            if(_loc1_.logBitmap.parent)
            {
               _loc1_.logBitmap.parent.removeChild(_loc1_.logBitmap);
            }
            _loc1_.logBitmap.bitmapData = null;
            _loc1_.logBitmap = null;
         }
         if(_loc1_.toppingBitmap)
         {
            _loc1_.toppingBitmap.mask = null;
            if(_loc1_.toppingBitmap.parent)
            {
               _loc1_.toppingBitmap.parent.removeChild(_loc1_.toppingBitmap);
            }
            _loc1_.toppingBitmap.bitmapData = null;
            _loc1_.toppingBitmap = null;
         }
         if(_loc1_.logMask)
         {
            if(_loc1_.logMask.parent)
            {
               _loc1_.logMask.parent.removeChild(_loc1_.logMask);
            }
            _loc1_.logMask.graphics.clear();
            _loc1_.logMask = null;
         }
         if(_loc1_.toppingMask)
         {
            if(_loc1_.toppingMask.parent)
            {
               _loc1_.toppingMask.parent.removeChild(_loc1_.toppingMask);
            }
            _loc1_.toppingMask.graphics.clear();
            _loc1_.toppingMask = null;
         }
         if(_loc1_.cutEdge)
         {
            if(_loc1_.cutEdge.parent)
            {
               _loc1_.cutEdge.parent.removeChild(_loc1_.cutEdge);
            }
            _loc1_.cutEdge = null;
         }
         if(_loc1_.clip)
         {
            if(_loc1_.clip.parent)
            {
               _loc1_.clip.parent.removeChild(_loc1_.clip);
            }
            _loc1_.clip = null;
         }
         _loc1_.sushi = null;
         _loc1_.gameObj = null;
      }
   }
}
