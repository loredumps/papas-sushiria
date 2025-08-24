package sushiGame.models
{
   import flash.display.MovieClip;
   import package_2.class_14;
   import package_2.class_6;
   import package_4.class_5;
   
   public class SushiCrossSection
   {
       
      
      public var gameObj:class_5;
      
      public var filling:SushiFilling;
      
      public var clip:MovieClip = null;
      
      public var parts:Vector.<MovieClip> = null;
      
      public var targetY:Number = 0;
      
      public var id:Number;
      
      public var maxDepth:Number = 1;
      
      public function SushiCrossSection(param1:class_5, param2:SushiFilling, param3:Number, param4:Number, param5:Number = 1)
      {
         super();
         this.gameObj = param1;
         this.filling = param2;
         this.targetY = param3;
         this.id = param4;
         this.maxDepth = param5;
         class_6.method_1("Create Cross Section for " + param3);
         this.setupCrossSection();
      }
      
      public function setupCrossSection() : void
      {
         var _loc3_:MovieClip = null;
         var _loc7_:MovieClip = null;
         var _loc8_:MovieClip = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:MovieClip = null;
         var _loc1_:SushiCrossSection = this;
         _loc1_.clip = new MovieClip();
         _loc1_.parts = new Vector.<MovieClip>();
         if(_loc1_.filling.sushi.isFlipped)
         {
            (_loc7_ = class_14.method_103(_loc1_.filling.sushi.paperType + "_empty",false,false)).x = 0;
            _loc7_.y = 18;
            _loc1_.clip.addChild(_loc7_);
            _loc1_.parts.push(_loc7_);
         }
         else
         {
            (_loc8_ = class_14.method_103(_loc1_.filling.sushi.riceType + "_empty",false,false)).x = 0;
            _loc8_.y = 18;
            _loc1_.clip.addChild(_loc8_);
            _loc1_.parts.push(_loc8_);
         }
         var _loc2_:MovieClip = class_14.method_103(_loc1_.filling.sushi.riceType + "_rolled",false,false);
         _loc2_.x = 0;
         _loc2_.y = 0;
         _loc2_.gotoAndStop(_loc1_.filling.sushi.riceFrame);
         if(_loc1_.filling.sushi.isFlipped)
         {
            _loc2_.scaleX = 0.93;
            _loc2_.scaleY = 0.93;
         }
         _loc1_.clip.addChild(_loc2_);
         _loc1_.parts.push(_loc2_);
         if(_loc1_.filling.sushi.isFlipped)
         {
            _loc3_ = class_14.method_103(_loc1_.filling.sushi.paperType + "_ring_flipped",false,false);
            _loc3_.x = 0;
            _loc3_.y = 18.25;
         }
         else
         {
            _loc3_ = class_14.method_103(_loc1_.filling.sushi.paperType + "_ring",false,false);
            _loc3_.x = 0;
            _loc3_.y = 26;
         }
         _loc1_.clip.addChild(_loc3_);
         _loc1_.parts.push(_loc3_);
         var _loc4_:Array = _loc1_.filling.getDistroItemsAtY(_loc1_.targetY);
         var _loc5_:Boolean = false;
         if(_loc4_.length == 0)
         {
            _loc9_ = 1;
            while(_loc9_ <= Math.min(_loc1_.maxDepth,15))
            {
               if((_loc4_ = _loc1_.filling.getDistroItemsAtY(_loc1_.targetY - _loc9_)).length > 0)
               {
                  if(_loc9_ <= 3)
                  {
                     break;
                  }
                  _loc5_ = true;
                  break;
               }
               _loc9_++;
            }
         }
         var _loc6_:Number = 1;
         if(_loc4_.length > 0)
         {
            _loc10_ = 0;
            while(_loc10_ < _loc4_.length)
            {
               (_loc11_ = class_14.method_103(_loc4_[_loc10_] + "_rolled",false,false)).x = 0;
               _loc11_.y = 0;
               if(_loc4_.length == 1)
               {
                  _loc6_ = 10;
               }
               else if(_loc4_.length == 2)
               {
                  if(_loc10_ == 0)
                  {
                     _loc6_ = 2;
                  }
                  else
                  {
                     _loc6_ = 1;
                  }
               }
               else if(_loc4_.length == 3)
               {
                  if(_loc10_ == 0)
                  {
                     _loc6_ = 9;
                  }
                  else if(_loc10_ == 1)
                  {
                     _loc6_ = 7;
                  }
                  else if(_loc10_ == 2)
                  {
                     _loc6_ = 8;
                  }
               }
               else if(_loc4_.length >= 4)
               {
                  if(_loc10_ == 0)
                  {
                     _loc6_ = 4;
                  }
                  else if(_loc10_ == 1)
                  {
                     _loc6_ = 6;
                  }
                  else if(_loc10_ == 2)
                  {
                     _loc6_ = 5;
                  }
                  else
                  {
                     _loc6_ = 3;
                  }
               }
               if(_loc5_)
               {
                  _loc6_ += 10;
               }
               _loc11_.gotoAndStop(_loc6_);
               _loc1_.clip.addChild(_loc11_);
               _loc1_.parts.push(_loc11_);
               _loc10_++;
            }
         }
      }
      
      public function attachCrossSection(param1:Number, param2:Number, param3:MovieClip, param4:Number = 1) : void
      {
         var _loc5_:SushiCrossSection;
         if((_loc5_ = this).clip)
         {
            _loc5_.clip.x = param1;
            _loc5_.clip.y = param2;
            _loc5_.clip.scaleX = param4;
            _loc5_.clip.scaleY = param4;
            param3.addChild(_loc5_.clip);
         }
      }
      
      public function detachCrossSection() : void
      {
         var _loc1_:SushiCrossSection = this;
         if(_loc1_.clip)
         {
            if(_loc1_.clip.parent)
            {
               _loc1_.clip.parent.removeChild(_loc1_.clip);
            }
         }
      }
      
      public function destroy() : void
      {
         var _loc2_:int = 0;
         var _loc1_:SushiCrossSection = this;
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
               _loc1_.parts.splice(_loc2_,1);
               _loc2_--;
            }
            _loc1_.parts = null;
         }
         if(_loc1_.clip)
         {
            if(_loc1_.clip.parent)
            {
               _loc1_.clip.parent.removeChild(_loc1_.clip);
            }
            _loc1_.clip = null;
         }
         _loc1_.filling = null;
         _loc1_.gameObj = null;
      }
   }
}
