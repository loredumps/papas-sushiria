package sushiGame.models
{
   import flash.display.MovieClip;
   import package_2.class_14;
   import package_2.class_6;
   import package_4.class_5;
   import sushiGame.data.FoodData;
   import sushiGame.data.ToppingItem;
   
   public class SushiFilling
   {
       
      
      public var gameObj:class_5;
      
      public var sushi:SushiRoll;
      
      public var clip:MovieClip;
      
      public var layoutFillings:Vector.<MovieClip> = null;
      
      public var crossSections:Vector.<SushiCrossSection> = null;
      
      public var crossSectionIDCounter:Number = 0;
      
      public var heightMap:Array;
      
      public var heightMapRange:Number = 106;
      
      public var rangeInset:Number = 1;
      
      public var maxHeightOffset:Number = 13;
      
      public var distroArray:Array;
      
      public function SushiFilling(param1:class_5, param2:SushiRoll)
      {
         this.heightMap = [];
         this.distroArray = [];
         super();
         this.gameObj = param1;
         this.sushi = param2;
         this.setupFilling();
      }
      
      public function setupFilling() : void
      {
         var _loc1_:SushiFilling = this;
         _loc1_.clip = new MovieClip();
         _loc1_.sushi.clip.addChild(_loc1_.clip);
         _loc1_.layoutFillings = new Vector.<MovieClip>();
         _loc1_.crossSections = new Vector.<SushiCrossSection>();
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.heightMapRange)
         {
            _loc1_.heightMap.push(0);
            _loc2_++;
         }
      }
      
      public function destroy() : void
      {
         var _loc2_:int = 0;
         var _loc1_:SushiFilling = this;
         if(_loc1_.crossSections)
         {
            _loc2_ = int(_loc1_.crossSections.length - 1);
            while(_loc2_ >= 0)
            {
               if(_loc1_.crossSections[_loc2_])
               {
                  _loc1_.crossSections[_loc2_].destroy();
                  _loc1_.crossSections[_loc2_] = null;
               }
               _loc1_.crossSections.splice(_loc2_,1);
               _loc2_--;
            }
         }
         _loc1_.crossSections = null;
         if(_loc1_.layoutFillings)
         {
            _loc1_.clearLayoutFillings();
         }
         _loc1_.layoutFillings = null;
         if(_loc1_.clip)
         {
            if(_loc1_.clip.parent)
            {
               _loc1_.clip.parent.removeChild(_loc1_.clip);
            }
            _loc1_.clip = null;
         }
         _loc1_.gameObj = null;
         _loc1_.sushi = null;
      }
      
      public function updateFilling() : void
      {
         this;
      }
      
      public function addFilling(param1:String, param2:Number) : void
      {
         var _loc3_:SushiFilling = this;
         if(_loc3_.gameObj.method_105(12) && param1 == FoodData.FILLING_SALMON)
         {
            _loc3_.gameObj.method_104(12);
         }
         else if(_loc3_.gameObj.method_105(14) && param1 == FoodData.FILLING_CREAMCHEESE)
         {
            _loc3_.gameObj.method_104(14);
         }
         var _loc4_:ToppingItem = _loc3_.gameObj.toppingData.getToppingItemData(param1);
         var _loc5_:MovieClip;
         (_loc5_ = class_14.method_103(_loc4_.pieceName,false,false)).gotoAndStop(1);
         param2 -= _loc3_.sushi.clip.y;
         param2 = Math.round(param2);
         _loc5_.x = _loc3_.sushi.getFillingXatY(param2,false);
         var _loc6_:Number = _loc4_.partHeight;
         var _loc7_:Number = _loc3_.getHeightMapTarget(param2,_loc6_);
         _loc5_.heightMapY = _loc7_;
         class_6.method_1("Add " + param1 + " at " + param2 + ".  Height = " + _loc7_);
         _loc5_.y = param2 - _loc7_;
         _loc3_.clip.addChild(_loc5_);
         _loc3_.layoutFillings.push(_loc5_);
         _loc3_.setHeightMap(param2,_loc6_,_loc7_ + _loc4_.collisionPaddingY);
         _loc3_.addToDistro(param2,_loc6_,param1);
         _loc3_.depthSortFillings();
      }
      
      public function getHeightMapTarget(param1:Number, param2:Number) : Number
      {
         var _loc4_:int = 0;
         var _loc3_:SushiFilling = this;
         param1 -= _loc3_.sushi.fillingTopY;
         param1 = Math.round(param1);
         var _loc5_:Array = [];
         var _loc6_:Array = [];
         var _loc7_:Number = 0;
         var _loc8_:Boolean = false;
         _loc4_ = param1 - param2;
         while(_loc4_ < param1)
         {
            if(_loc4_ > -1 && _loc4_ < _loc3_.heightMap.length)
            {
               if(_loc5_.indexOf(_loc3_.heightMap[_loc4_]) > -1)
               {
                  ++_loc6_[_loc5_.indexOf(_loc3_.heightMap[_loc4_])];
               }
               else
               {
                  _loc5_.push(_loc3_.heightMap[_loc4_]);
                  _loc6_.push(1);
               }
               _loc7_++;
            }
            else
            {
               _loc8_ = true;
            }
            _loc4_++;
         }
         var _loc9_:Number = 0;
         var _loc10_:Number = 0;
         _loc4_ = 0;
         while(_loc4_ < _loc6_.length)
         {
            if(_loc6_[_loc4_] > _loc9_)
            {
               _loc9_ = Number(_loc6_[_loc4_]);
               _loc10_ = Number(_loc5_[_loc4_]);
            }
            _loc4_++;
         }
         var _loc11_:Number = 0;
         var _loc12_:Number = 0;
         _loc4_ = 0;
         while(_loc4_ < _loc5_.length)
         {
            if(_loc5_[_loc4_] > _loc11_ && _loc6_[_loc4_] / _loc7_ >= _loc12_)
            {
               _loc11_ = Number(_loc5_[_loc4_]);
               _loc12_ = _loc6_[_loc4_] / _loc7_;
            }
            _loc4_++;
         }
         if(_loc11_ > _loc10_ && _loc12_ > 0.3)
         {
            return Math.min(_loc3_.maxHeightOffset,_loc11_);
         }
         return Math.min(_loc3_.maxHeightOffset,_loc10_);
      }
      
      public function getFillingOverlap(param1:Number, param2:Number, param3:String) : Number
      {
         var _loc6_:int = 0;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc4_:SushiFilling = this;
         var _loc5_:Number = 1;
         param1 -= _loc4_.sushi.clip.y;
         param1 -= _loc4_.sushi.fillingTopY;
         param1 = Math.round(param1);
         _loc6_ = 0;
         while(_loc6_ < _loc4_.distroArray.length)
         {
            _loc7_ = 0;
            if(this.distroArray[_loc6_][2] == param3)
            {
               if(!(param1 - param2 > this.distroArray[_loc6_][1] || param1 < this.distroArray[_loc6_][0]))
               {
                  if(param1 > this.distroArray[_loc6_][1])
                  {
                     _loc7_ = this.distroArray[_loc6_][1] - (param1 - param2);
                  }
                  else if(param1 - param2 < this.distroArray[_loc6_][0])
                  {
                     _loc7_ = param1 - this.distroArray[_loc6_][0];
                  }
                  else
                  {
                     _loc7_ = param2;
                  }
               }
            }
            if(_loc7_ != 0)
            {
               if((_loc8_ = 1 - Math.min(1,_loc7_ / param2)) < _loc5_)
               {
                  _loc5_ = _loc8_;
               }
            }
            _loc6_++;
         }
         return _loc5_;
      }
      
      public function setHeightMap(param1:Number, param2:Number, param3:Number) : void
      {
         var _loc5_:int = 0;
         var _loc4_:SushiFilling = this;
         param1 -= _loc4_.sushi.fillingTopY;
         param1 = Math.round(param1);
         class_6.method_1("Set height map (" + (param1 - param2) + " to " + param1 + ") to " + param3);
         _loc5_ = param1 - param2;
         while(_loc5_ < param1)
         {
            if(_loc5_ > -1 && _loc5_ < _loc4_.heightMap.length)
            {
               _loc4_.heightMap[_loc5_] = param3;
            }
            _loc5_++;
         }
      }
      
      public function addToDistro(param1:Number, param2:Number, param3:String) : void
      {
         var _loc4_:SushiFilling = this;
         param1 -= _loc4_.sushi.fillingTopY;
         _loc4_.distroArray.push([param1 - param2,param1,param3]);
         class_6.method_1("Add Filling " + param3 + " from " + (param1 - param2) + " to " + param1);
      }
      
      public function getDistroItemsAtY(param1:Number) : Array
      {
         var _loc2_:SushiFilling = this;
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.distroArray.length)
         {
            if(_loc2_.distroArray[_loc4_][0] <= param1 && _loc2_.distroArray[_loc4_][1] >= param1)
            {
               _loc3_.push(_loc2_.distroArray[_loc4_][2]);
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function getDistroItems(param1:String) : Array
      {
         var _loc2_:SushiFilling = this;
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.distroArray.length)
         {
            if(_loc2_.distroArray[_loc4_][2] == param1)
            {
               _loc3_.push(_loc2_.distroArray[_loc4_]);
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function getNumDistroTypes() : Number
      {
         var _loc1_:SushiFilling = this;
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_.distroArray.length)
         {
            if(_loc2_.indexOf(_loc1_.distroArray[_loc3_][2]) == -1)
            {
               _loc2_.push(_loc1_.distroArray[_loc3_][2]);
            }
            _loc3_++;
         }
         return _loc2_.length;
      }
      
      public function createCrossSection(param1:Number, param2:Number = 1) : SushiCrossSection
      {
         var _loc3_:SushiFilling = this;
         ++_loc3_.crossSectionIDCounter;
         var _loc4_:SushiCrossSection = new SushiCrossSection(_loc3_.gameObj,_loc3_,param1,_loc3_.crossSectionIDCounter,param2);
         _loc3_.crossSections.push(_loc4_);
         return _loc4_;
      }
      
      public function destroyCrossSection(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc2_:SushiFilling = this;
         if(_loc2_.crossSections)
         {
            _loc3_ = int(_loc2_.crossSections.length - 1);
            while(_loc3_ >= 0)
            {
               if(Boolean(_loc2_.crossSections[_loc3_]) && _loc2_.crossSections[_loc3_].id == param1)
               {
                  _loc2_.crossSections[_loc3_].destroy();
                  _loc2_.crossSections[_loc3_] = null;
                  _loc2_.crossSections.splice(_loc3_,1);
                  break;
               }
               _loc3_--;
            }
         }
      }
      
      public function depthSortFillings() : void
      {
         var _loc1_:SushiFilling = this;
         if(_loc1_.layoutFillings)
         {
            _loc1_.layoutFillings = _loc1_.layoutFillings.sort(_loc1_.sortCompareFunction);
         }
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.layoutFillings.length)
         {
            _loc1_.clip.setChildIndex(_loc1_.layoutFillings[_loc2_],_loc2_);
            _loc2_++;
         }
      }
      
      public function sortCompareFunction(param1:MovieClip, param2:MovieClip) : Number
      {
         this;
         var _loc4_:Number = param1.y + param1.heightMapY * 1000;
         var _loc5_:Number = param2.y + param2.heightMapY * 1000;
         if(_loc4_ < _loc5_)
         {
            return -1;
         }
         if(_loc4_ > _loc5_)
         {
            return 1;
         }
         return 0;
      }
      
      public function clearLayoutFillings() : void
      {
         var _loc2_:int = 0;
         var _loc1_:SushiFilling = this;
         if(_loc1_.layoutFillings)
         {
            _loc2_ = int(_loc1_.layoutFillings.length - 1);
            while(_loc2_ >= 0)
            {
               if(_loc1_.layoutFillings[_loc2_])
               {
                  if(_loc1_.layoutFillings[_loc2_].parent)
                  {
                     _loc1_.layoutFillings[_loc2_].parent.removeChild(_loc1_.layoutFillings[_loc2_]);
                  }
                  _loc1_.layoutFillings[_loc2_].stop();
                  _loc1_.layoutFillings[_loc2_] = null;
               }
               _loc1_.layoutFillings.splice(_loc2_,1);
               _loc2_--;
            }
         }
      }
   }
}
