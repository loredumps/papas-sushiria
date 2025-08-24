package sushiGame.models
{
   import flash.display.MovieClip;
   import flash.geom.ColorTransform;
   import package_2.class_14;
   import package_2.class_6;
   import package_4.class_5;
   import sushiGame.data.ToppingItem;
   import sushiGame.screens.BuildScreen;
   
   public class ToppingStack
   {
       
      
      public var gameObj:class_5;
      
      public var screen:BuildScreen;
      
      public var clip:MovieClip;
      
      public var parts:Vector.<MovieClip> = null;
      
      public var type:String;
      
      public var amount:Number = 0;
      
      public var offsetX:Number = 0;
      
      public var offsetY:Number = 0;
      
      public var thickness:Number = 0;
      
      public var partHeight:Number = 0;
      
      public var isFilling:Boolean = false;
      
      public var isReturning:Boolean = false;
      
      public var binX:Number = 0;
      
      public var binY:Number = 0;
      
      public var didStartAdding:Boolean = false;
      
      public var colorTransform:ColorTransform;
      
      public var targetBrightness:Number = 0.7;
      
      public var currentBrightness:Number = 1;
      
      public var darkBrightness:Number = 0.7;
      
      public var brightnessSpeed:Number = 0.07;
      
      public var targetAccuracyPercent:Number = 1;
      
      public var currentAccuracyPercent:Number = 1;
      
      public function ToppingStack(param1:class_5, param2:BuildScreen, param3:String, param4:Boolean = false)
      {
         super();
         this.gameObj = param1;
         this.screen = param2;
         this.type = param3;
         this.isFilling = param4;
         this.setupStack();
      }
      
      public function setupStack() : void
      {
         var _loc5_:MovieClip = null;
         var _loc1_:ToppingStack = this;
         _loc1_.clip = new MovieClip();
         _loc1_.parts = new Vector.<MovieClip>();
         var _loc2_:ToppingItem = _loc1_.gameObj.toppingData.getToppingItemData(_loc1_.type);
         _loc1_.amount = _loc2_.capacity;
         _loc1_.thickness = _loc2_.collisionPaddingY;
         var _loc3_:Number = 0;
         var _loc4_:int = 0;
         while(_loc4_ < _loc1_.amount)
         {
            _loc5_ = class_14.method_103(_loc2_.pieceName,false,false);
            if(_loc1_.isFilling)
            {
               _loc5_.gotoAndStop(1);
            }
            else
            {
               _loc5_.gotoAndStop(1);
            }
            _loc5_.x = 0 + _loc4_ % 2 * -1;
            _loc5_.y = 0 - _loc4_;
            _loc1_.offsetY = Math.round(_loc5_.height / 2);
            _loc1_.partHeight = _loc2_.partHeight;
            _loc3_ = _loc5_.height;
            _loc1_.clip.addChild(_loc5_);
            _loc1_.parts.push(_loc5_);
            _loc4_++;
         }
         class_6.method_1("[Create Stack of " + _loc1_.amount + " " + _loc1_.type + ".  Vector Height: " + _loc3_ + ". Thickness: " + _loc1_.thickness + ".  Part Height: " + _loc1_.partHeight + "]");
         _loc1_.clip.x = _loc1_.screen.clip.mouseX + _loc1_.offsetX;
         _loc1_.clip.y = _loc1_.screen.clip.mouseY + _loc1_.offsetY;
         _loc1_.screen.clip.dragholder.addChild(_loc1_.clip);
         _loc1_.colorTransform = new ColorTransform();
         _loc1_.clip.transform.colorTransform = _loc1_.colorTransform;
      }
      
      public function destroy() : void
      {
         var _loc2_:int = 0;
         var _loc1_:ToppingStack = this;
         if(_loc1_.parts)
         {
            _loc2_ = int(_loc1_.parts.length - 1);
            while(_loc2_ >= 0)
            {
               if(_loc1_.parts[_loc2_])
               {
                  if(_loc1_.parts[_loc2_].parent)
                  {
                     _loc1_.parts[_loc2_].parent.removeChild(_loc1_.parts[_loc2_]);
                  }
                  _loc1_.parts[_loc2_].stop();
                  _loc1_.parts[_loc2_] = null;
               }
               _loc2_--;
            }
         }
         _loc1_.parts = null;
         _loc1_.colorTransform = null;
         if(_loc1_.clip)
         {
            if(_loc1_.clip.parent)
            {
               _loc1_.clip.parent.removeChild(_loc1_.clip);
            }
            _loc1_.clip = null;
         }
         _loc1_.screen = null;
         _loc1_.gameObj = null;
      }
      
      public function updateStack() : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc1_:ToppingStack = this;
         if(Boolean(_loc1_.clip) && Boolean(_loc1_.colorTransform))
         {
            if(_loc1_.targetBrightness > _loc1_.currentBrightness)
            {
               _loc1_.currentBrightness += _loc1_.brightnessSpeed;
               if(_loc1_.currentBrightness > _loc1_.targetBrightness)
               {
                  _loc1_.currentBrightness = _loc1_.targetBrightness;
               }
               _loc1_.colorTransform.redMultiplier = _loc1_.currentBrightness;
               _loc1_.colorTransform.greenMultiplier = _loc1_.currentBrightness;
               _loc1_.colorTransform.blueMultiplier = _loc1_.currentBrightness;
               _loc1_.currentAccuracyPercent = _loc1_.targetAccuracyPercent;
               if(_loc1_.currentAccuracyPercent != 1)
               {
                  _loc1_.colorTransform.redOffset = 40;
                  _loc1_.colorTransform.greenOffset = 40;
                  _loc1_.colorTransform.blueOffset = 40;
               }
               else
               {
                  _loc1_.colorTransform.redOffset = 0;
                  _loc1_.colorTransform.greenOffset = 0;
                  _loc1_.colorTransform.blueOffset = 0;
               }
               _loc1_.clip.transform.colorTransform = _loc1_.colorTransform;
            }
            else if(_loc1_.targetBrightness < _loc1_.currentBrightness)
            {
               _loc1_.currentBrightness -= _loc1_.brightnessSpeed;
               if(_loc1_.currentBrightness < _loc1_.targetBrightness)
               {
                  _loc1_.currentBrightness = _loc1_.targetBrightness;
               }
               _loc1_.colorTransform.redMultiplier = _loc1_.currentBrightness;
               _loc1_.colorTransform.greenMultiplier = _loc1_.currentBrightness;
               _loc1_.colorTransform.blueMultiplier = _loc1_.currentBrightness;
               _loc1_.currentAccuracyPercent = _loc1_.targetAccuracyPercent;
               if(_loc1_.currentAccuracyPercent != 1)
               {
                  _loc1_.colorTransform.redOffset = 40;
                  _loc1_.colorTransform.greenOffset = 40;
                  _loc1_.colorTransform.blueOffset = 40;
               }
               else
               {
                  _loc1_.colorTransform.redOffset = 0;
                  _loc1_.colorTransform.greenOffset = 0;
                  _loc1_.colorTransform.blueOffset = 0;
               }
               _loc1_.clip.transform.colorTransform = _loc1_.colorTransform;
            }
            else if(_loc1_.targetAccuracyPercent != _loc1_.currentAccuracyPercent)
            {
               _loc1_.colorTransform.redMultiplier = _loc1_.currentBrightness;
               _loc1_.colorTransform.greenMultiplier = _loc1_.currentBrightness;
               _loc1_.colorTransform.blueMultiplier = _loc1_.currentBrightness;
               _loc1_.currentAccuracyPercent = _loc1_.targetAccuracyPercent;
               if(_loc1_.currentAccuracyPercent != 1)
               {
                  _loc1_.colorTransform.redOffset = 40;
                  _loc1_.colorTransform.greenOffset = 40;
                  _loc1_.colorTransform.blueOffset = 40;
               }
               else
               {
                  _loc1_.colorTransform.redOffset = 0;
                  _loc1_.colorTransform.greenOffset = 0;
                  _loc1_.colorTransform.blueOffset = 0;
               }
               _loc1_.clip.transform.colorTransform = _loc1_.colorTransform;
            }
         }
         if(_loc1_.isReturning)
         {
            _loc1_.targetBrightness = 1;
            _loc2_ = int(_loc1_.parts.length - 1);
            while(_loc2_ >= 0)
            {
               _loc1_.parts[_loc2_].y += (0 - _loc2_ - _loc1_.parts[_loc2_].y) / 2;
               _loc2_--;
            }
            _loc1_.clip.x += (_loc1_.binX - _loc1_.clip.x) / 2;
            _loc1_.clip.y += (_loc1_.binY - _loc1_.clip.y) / 2;
            if(Math.abs(_loc1_.binX - _loc1_.clip.x) <= 1 && Math.abs(_loc1_.binY - _loc1_.clip.y) <= 1)
            {
               _loc1_.screen.removeReturningToppingStack(_loc1_);
               return;
            }
         }
         else
         {
            _loc2_ = int(_loc1_.parts.length - 1);
            while(_loc2_ >= 0)
            {
               _loc1_.parts[_loc2_].y += (0 - _loc1_.thickness * _loc2_ - _loc1_.parts[_loc2_].y) / 2;
               _loc2_--;
            }
            if(_loc1_.screen.currentOrder && _loc1_.screen.currentOrder.canAddFillings && _loc1_.isFilling)
            {
               _loc3_ = _loc1_.getMouseX() + _loc1_.offsetX;
               _loc4_ = _loc1_.getMouseY() + _loc1_.offsetY;
               if(_loc3_ - _loc1_.offsetX < 0 || _loc3_ - _loc1_.offsetX > 640 || _loc4_ - _loc1_.offsetY < 0 || _loc4_ - _loc1_.offsetY > 480)
               {
                  if(_loc1_.didStartAdding == false)
                  {
                     _loc1_.screen.releaseFillingBin();
                     return;
                  }
               }
               if(_loc1_.screen.currentOrder.isWithinFillingArea(_loc3_,_loc4_,this.partHeight))
               {
                  _loc1_.targetBrightness = 1;
                  _loc1_.targetAccuracyPercent = _loc1_.screen.currentOrder.getFillingOverlapPercent(_loc4_,this.partHeight,_loc1_.type);
                  _loc3_ = _loc1_.screen.currentOrder.getFillingXatY(_loc4_,true);
                  _loc4_ -= _loc1_.screen.currentOrder.getFillingHeightOffsetAtY(_loc4_,_loc1_.partHeight);
               }
               else
               {
                  _loc1_.targetBrightness = _loc1_.darkBrightness;
                  _loc1_.targetAccuracyPercent = 1;
               }
               _loc1_.clip.x += (_loc3_ - _loc1_.clip.x) / 2;
               _loc1_.clip.y += (_loc4_ - _loc1_.clip.y) / 2;
            }
            else if(_loc1_.screen.currentOrder && _loc1_.screen.currentOrder.canAddToppings && _loc1_.isFilling == false)
            {
               _loc3_ = _loc1_.getMouseX() + _loc1_.offsetX;
               _loc4_ = _loc1_.getMouseY() + _loc1_.offsetY;
               if(_loc3_ - _loc1_.offsetX < 0 || _loc3_ - _loc1_.offsetX > 640 || _loc4_ - _loc1_.offsetY < 0 || _loc4_ - _loc1_.offsetY > 480)
               {
                  if(_loc1_.didStartAdding == false)
                  {
                     _loc1_.screen.releaseToppingBin();
                     return;
                  }
               }
               if(_loc1_.screen.currentOrder.isWithinDropArea(_loc3_,_loc4_,this.partHeight) || _loc1_.screen.currentOrder.topping.isWithinExactToppingArea(_loc1_.screen.clip.mouseX,_loc1_.screen.clip.mouseY,true,true))
               {
                  _loc3_ = _loc1_.screen.currentOrder.getDropXatY(_loc4_,true) + _loc1_.offsetX;
                  _loc1_.targetBrightness = 1;
                  _loc1_.targetAccuracyPercent = _loc1_.screen.currentOrder.getToppingOverlapPercent(_loc4_,this.partHeight,_loc1_.type);
               }
               else
               {
                  _loc1_.targetBrightness = _loc1_.darkBrightness;
                  _loc1_.targetAccuracyPercent = 1;
               }
               _loc1_.clip.x += (_loc3_ - _loc1_.clip.x) / 2;
               _loc1_.clip.y += (_loc4_ - _loc1_.clip.y) / 2;
            }
            else
            {
               _loc1_.clip.x = _loc1_.screen.clip.mouseX + _loc1_.offsetX;
               _loc1_.clip.y = _loc1_.screen.clip.mouseY + _loc1_.offsetY;
               _loc1_.targetBrightness = _loc1_.darkBrightness;
            }
         }
      }
      
      public function getMouseX() : Number
      {
         var _loc1_:ToppingStack = this;
         if(_loc1_.isFilling == true && _loc1_.didStartAdding && Boolean(_loc1_.screen.currentOrder))
         {
            return _loc1_.screen.currentOrder.clip.x + _loc1_.screen.currentOrder.fillingTopX + 100;
         }
         if(_loc1_.isFilling == true && _loc1_.screen.currentOrder && _loc1_.screen.currentOrder.isWithinMatArea(_loc1_.screen.clip.mouseX,_loc1_.screen.clip.mouseY + _loc1_.offsetY,_loc1_.partHeight,true))
         {
            return _loc1_.screen.currentOrder.clip.x + _loc1_.screen.currentOrder.fillingTopX + 100;
         }
         if(_loc1_.isFilling == false && _loc1_.didStartAdding && Boolean(_loc1_.screen.currentOrder))
         {
            return _loc1_.screen.currentOrder.getDropXatY(_loc1_.getMouseY(),true);
         }
         return _loc1_.screen.clip.mouseX;
      }
      
      public function getMouseY() : Number
      {
         var _loc1_:ToppingStack = this;
         if(_loc1_.isFilling == true && (_loc1_.didStartAdding || _loc1_.screen.currentOrder && _loc1_.screen.currentOrder.isWithinMatArea(_loc1_.screen.clip.mouseX,_loc1_.screen.clip.mouseY + _loc1_.offsetY,_loc1_.partHeight,true)))
         {
            if(Boolean(_loc1_.screen.currentOrder) && _loc1_.screen.clip.mouseY + _loc1_.offsetY - _loc1_.partHeight <= _loc1_.screen.currentOrder.clip.y + _loc1_.screen.currentOrder.fillingTopY)
            {
               return _loc1_.screen.currentOrder.clip.y + _loc1_.screen.currentOrder.fillingTopY + _loc1_.partHeight + 1 - _loc1_.offsetY;
            }
            if(Boolean(_loc1_.screen.currentOrder) && _loc1_.screen.clip.mouseY + _loc1_.offsetY >= _loc1_.screen.currentOrder.clip.y + _loc1_.screen.currentOrder.fillingBottomY)
            {
               return _loc1_.screen.currentOrder.clip.y + _loc1_.screen.currentOrder.fillingBottomY - 1 - _loc1_.offsetY;
            }
            return _loc1_.screen.clip.mouseY;
         }
         if(_loc1_.isFilling == false && (_loc1_.didStartAdding || _loc1_.screen.currentOrder && (_loc1_.screen.currentOrder.isWithinDropArea(_loc1_.screen.clip.mouseX,_loc1_.screen.clip.mouseY + _loc1_.offsetY,_loc1_.partHeight) || _loc1_.screen.currentOrder.topping.isWithinExactToppingArea(_loc1_.screen.clip.mouseX,_loc1_.screen.clip.mouseY,true,true))))
         {
            if(Boolean(_loc1_.screen.currentOrder) && _loc1_.screen.clip.mouseY + _loc1_.offsetY - _loc1_.partHeight <= _loc1_.screen.currentOrder.clip.y + _loc1_.screen.currentOrder.dropTopY)
            {
               return _loc1_.screen.currentOrder.clip.y + _loc1_.screen.currentOrder.dropTopY + _loc1_.partHeight + 1 - _loc1_.offsetY;
            }
            if(Boolean(_loc1_.screen.currentOrder) && _loc1_.screen.clip.mouseY + _loc1_.offsetY >= _loc1_.screen.currentOrder.clip.y + _loc1_.screen.currentOrder.dropBottomY)
            {
               return _loc1_.screen.currentOrder.clip.y + _loc1_.screen.currentOrder.dropBottomY - 1 - _loc1_.offsetY;
            }
            return _loc1_.screen.clip.mouseY;
         }
         return _loc1_.screen.clip.mouseY;
      }
      
      public function returnToBin() : void
      {
         var _loc2_:Number = NaN;
         var _loc1_:ToppingStack = this;
         if(_loc1_.screen)
         {
            if(_loc1_.isFilling && Boolean(_loc1_.screen.fillingNames))
            {
               _loc2_ = _loc1_.screen.fillingNames.indexOf(_loc1_.type);
               if(_loc2_ > -1 && _loc1_.screen.fillings && _loc2_ < _loc1_.screen.fillings.length && Boolean(_loc1_.screen.fillings[_loc2_]))
               {
                  _loc1_.binX = _loc1_.screen.fillings[_loc2_].x;
                  _loc1_.binY = _loc1_.screen.fillings[_loc2_].y;
               }
               else
               {
                  _loc1_.binX = -50;
                  _loc1_.binY = 240;
               }
            }
            else if(_loc1_.isFilling == false && Boolean(_loc1_.screen.toppingNames))
            {
               _loc2_ = _loc1_.screen.toppingNames.indexOf(_loc1_.type);
               if(_loc2_ > -1 && _loc1_.screen.toppings && _loc2_ < _loc1_.screen.toppings.length && Boolean(_loc1_.screen.toppings[_loc2_]))
               {
                  _loc1_.binX = _loc1_.screen.toppings[_loc2_].x;
                  _loc1_.binY = _loc1_.screen.toppings[_loc2_].y;
               }
               else
               {
                  _loc1_.binX = -50;
                  _loc1_.binY = 240;
               }
            }
         }
         _loc1_.isReturning = true;
      }
      
      public function getTargetYForDropping() : Number
      {
         var _loc1_:ToppingStack = this;
         return _loc1_.getMouseY() + _loc1_.offsetY;
      }
      
      public function deductItem() : void
      {
         var _loc1_:ToppingStack = this;
         _loc1_.didStartAdding = true;
         if(_loc1_.parts.length > 0)
         {
            if(_loc1_.parts[0])
            {
               if(_loc1_.parts[0].parent)
               {
                  _loc1_.parts[0].parent.removeChild(_loc1_.parts[0]);
               }
               _loc1_.parts[0].stop();
               _loc1_.parts[0] = null;
            }
            _loc1_.parts.splice(0,1);
            if(_loc1_.parts.length == 0)
            {
               if(_loc1_.screen)
               {
                  _loc1_.screen.finishedToppingStack();
                  return;
               }
            }
         }
      }
   }
}
