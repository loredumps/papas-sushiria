package sushiGame.models
{
   import flash.display.MovieClip;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import package_2.class_6;
   import package_4.class_5;
   
   public class SushiKnife
   {
       
      
      public var gameObj:class_5;
      
      public var clip:MovieClip;
      
      public var container:MovieClip;
      
      public var isCutting:Boolean = false;
      
      public var shadowClip:MovieClip = null;
      
      public var offsetY:Number = 17;
      
      public var isCuttingDown:Boolean = false;
      
      public var isCuttingUp:Boolean = false;
      
      public var cutStartX:Number = 0;
      
      public var cutStartY:Number = 0;
      
      public var cutDownAmount:Number = 52;
      
      public var isReturning:Boolean = false;
      
      public var maxCuts:Number = 7;
      
      public var numCuts:Number = 0;
      
      public var didStartCutting:Boolean = false;
      
      public var mx:Matrix;
      
      public var containerOffsetX:Number = 0;
      
      public var containerOffsetY:Number = 0;
      
      public var colorTransform:ColorTransform;
      
      public var targetBrightness:Number = 0.7;
      
      public var currentBrightness:Number = 1;
      
      public var darkBrightness:Number = 0.7;
      
      public var brightnessSpeed:Number = 0.07;
      
      public var whichCutSound:Number = 1;
      
      public var wasWithinSushi:Boolean = false;
      
      public function SushiKnife(param1:class_5)
      {
         super();
         this.gameObj = param1;
         this.setupKnife();
      }
      
      public function setupKnife() : void
      {
         var _loc1_:SushiKnife = this;
         _loc1_.clip = new sushi_knife();
         _loc1_.clip.num_txt.text = Math.max(0,this.maxCuts - this.numCuts);
         _loc1_.clip.x = _loc1_.gameObj.var_129.knifeTargetX;
         _loc1_.clip.y = _loc1_.gameObj.var_129.knifeTargetY;
         _loc1_.gameObj.var_129.showGuide();
         if(_loc1_.gameObj && _loc1_.gameObj.var_129 && Boolean(_loc1_.gameObj.var_129.currentOrder))
         {
            _loc1_.gameObj.var_129.currentOrder.addCuttingGuide();
         }
         if(_loc1_.gameObj.training == false && !_loc1_.gameObj.var_127.hasTrained("cutting"))
         {
            _loc1_.gameObj.hud.showContextTraining("cutting");
         }
         _loc1_.shadowClip = new sushi_knife_shadow();
         _loc1_.shadowClip.x = _loc1_.clip.x;
         _loc1_.shadowClip.y = _loc1_.clip.y;
         _loc1_.gameObj.var_129.clip.shadowholder.addChild(_loc1_.shadowClip);
         _loc1_.colorTransform = new ColorTransform();
         _loc1_.clip.transform.colorTransform = _loc1_.colorTransform;
      }
      
      public function setContainer(param1:MovieClip) : void
      {
         var _loc2_:SushiKnife = this;
         _loc2_.container = param1;
         if(_loc2_.clip)
         {
            _loc2_.container.addChild(_loc2_.clip);
         }
      }
      
      public function destroy() : void
      {
         var _loc1_:SushiKnife = this;
         _loc1_.colorTransform = null;
         if(_loc1_.mx)
         {
            _loc1_.mx = null;
         }
         if(_loc1_.shadowClip)
         {
            if(_loc1_.shadowClip.parent)
            {
               _loc1_.shadowClip.parent.removeChild(_loc1_.shadowClip);
            }
            _loc1_.shadowClip = null;
         }
         if(_loc1_.clip)
         {
            if(_loc1_.clip.parent)
            {
               _loc1_.clip.parent.removeChild(_loc1_.clip);
            }
            _loc1_.clip = null;
         }
         if(_loc1_.container)
         {
            _loc1_.container = null;
         }
         _loc1_.gameObj = null;
      }
      
      public function getMouseX() : Number
      {
         var _loc1_:SushiKnife = this;
         if(_loc1_.didStartCutting && Boolean(_loc1_.gameObj.var_129.currentOrder))
         {
            return _loc1_.gameObj.var_129.currentOrder.getDropXatY(_loc1_.getMouseY(),true);
         }
         if(!_loc1_.didStartCutting && _loc1_.gameObj.var_129.currentOrder && _loc1_.gameObj.var_129.currentOrder.isWithinDropArea(_loc1_.gameObj.var_129.clip.mouseX,_loc1_.gameObj.var_129.clip.mouseY + this.offsetY,0))
         {
            this.wasWithinSushi = true;
            return _loc1_.gameObj.var_129.currentOrder.getDropXatY(_loc1_.getMouseY(),true);
         }
         if(this.wasWithinSushi && _loc1_.gameObj.var_129.clip.mouseX < _loc1_.gameObj.var_129.currentOrder.getDropXatY(_loc1_.getMouseY(),true))
         {
            return _loc1_.gameObj.var_129.currentOrder.getDropXatY(_loc1_.getMouseY(),true);
         }
         return _loc1_.gameObj.var_129.clip.mouseX;
      }
      
      public function getMouseY() : Number
      {
         var _loc1_:SushiKnife = this;
         if(Boolean(_loc1_.gameObj.var_129.currentOrder) && (_loc1_.didStartCutting || _loc1_.gameObj.var_129.currentOrder.isWithinDropArea(_loc1_.gameObj.var_129.clip.mouseX,_loc1_.gameObj.var_129.clip.mouseY + this.offsetY,0)))
         {
            if(Boolean(_loc1_.gameObj.var_129.currentOrder) && _loc1_.gameObj.var_129.clip.mouseY + this.offsetY <= _loc1_.gameObj.var_129.currentOrder.clip.y + _loc1_.gameObj.var_129.currentOrder.dropTopY)
            {
               return _loc1_.gameObj.var_129.currentOrder.clip.y + _loc1_.gameObj.var_129.currentOrder.dropTopY + 1 - this.offsetY;
            }
            if(Boolean(_loc1_.gameObj.var_129.currentOrder) && _loc1_.gameObj.var_129.clip.mouseY + this.offsetY >= _loc1_.gameObj.var_129.currentOrder.clip.y + _loc1_.gameObj.var_129.currentOrder.dropBottomY)
            {
               return _loc1_.gameObj.var_129.currentOrder.clip.y + _loc1_.gameObj.var_129.currentOrder.dropBottomY - 1 - this.offsetY;
            }
            return _loc1_.gameObj.var_129.clip.mouseY;
         }
         if(Boolean(_loc1_.gameObj.var_129.currentOrder) && _loc1_.gameObj.var_129.clip.mouseY + this.offsetY <= _loc1_.gameObj.var_129.currentOrder.clip.y + _loc1_.gameObj.var_129.currentOrder.dropTopY)
         {
            this.wasWithinSushi = false;
         }
         else if(Boolean(_loc1_.gameObj.var_129.currentOrder) && _loc1_.gameObj.var_129.clip.mouseY + this.offsetY >= _loc1_.gameObj.var_129.currentOrder.clip.y + _loc1_.gameObj.var_129.currentOrder.dropBottomY)
         {
            this.wasWithinSushi = false;
         }
         else if(_loc1_.gameObj.var_129.currentOrder == null)
         {
            this.wasWithinSushi = false;
         }
         return _loc1_.gameObj.var_129.clip.mouseY;
      }
      
      public function updateKnife() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc1_:SushiKnife = this;
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
               _loc1_.clip.transform.colorTransform = _loc1_.colorTransform;
            }
         }
         if(!_loc1_.isReturning && !_loc1_.isCuttingDown && !_loc1_.isCuttingUp && _loc1_.gameObj && _loc1_.gameObj.var_129 && Boolean(_loc1_.gameObj.var_129.currentOrder))
         {
            if((_loc5_ = _loc1_.clip.y + _loc1_.offsetY - _loc1_.gameObj.var_129.currentOrder.dropTopY - _loc1_.gameObj.var_129.currentOrder.clip.y) < 0 || _loc5_ > _loc1_.gameObj.var_129.currentOrder.filling.heightMapRange)
            {
               _loc1_.gameObj.var_129.currentOrder.removeCuttingGuide();
               _loc1_.targetBrightness = _loc1_.darkBrightness;
            }
            else if(_loc1_.gameObj.var_129.currentOrder.isWithinDropArea(_loc1_.clip.x,_loc1_.clip.y + _loc1_.offsetY,0))
            {
               _loc1_.gameObj.var_129.currentOrder.updateCuttingGuide(_loc5_);
               _loc1_.targetBrightness = 1;
            }
            else
            {
               _loc1_.gameObj.var_129.currentOrder.removeCuttingGuide();
               _loc1_.targetBrightness = _loc1_.darkBrightness;
            }
         }
         if(_loc1_.isCutting)
         {
            if(_loc1_.isCuttingDown)
            {
               _loc2_ = _loc1_.cutStartX;
               _loc3_ = _loc1_.cutStartY + _loc1_.cutDownAmount;
               _loc4_ = -6;
               _loc1_.clip.x += (_loc2_ - _loc1_.clip.x) / 2;
               _loc1_.clip.y += (_loc3_ - _loc1_.clip.y) / 2;
               if(_loc1_.clip.rotation > _loc4_)
               {
                  --_loc1_.clip.rotation;
               }
               if(Math.abs(_loc2_ - _loc1_.clip.x) <= 1 && Math.abs(_loc3_ - _loc1_.clip.y) <= 1)
               {
                  _loc1_.isCuttingDown = false;
                  _loc1_.isCuttingUp = true;
               }
            }
            else if(_loc1_.isCuttingUp)
            {
               _loc2_ = _loc1_.cutStartX;
               _loc3_ = _loc1_.cutStartY;
               _loc4_ = 0;
               _loc1_.clip.x += (_loc2_ - _loc1_.clip.x) / 2;
               _loc1_.clip.y += (_loc3_ - _loc1_.clip.y) / 2;
               if(_loc1_.clip.rotation < _loc4_)
               {
                  ++_loc1_.clip.rotation;
               }
               if(Math.abs(_loc2_ - _loc1_.clip.x) <= 1 && Math.abs(_loc3_ - _loc1_.clip.y) <= 1)
               {
                  _loc1_.isCuttingDown = false;
                  _loc1_.isCuttingUp = false;
                  _loc1_.isCutting = false;
                  _loc1_.clip.rotation = 0;
                  if(Boolean(_loc1_.container) && Boolean(_loc1_.clip) && _loc1_.clip.parent != _loc1_.container)
                  {
                     _loc1_.container.addChild(_loc1_.clip);
                     _loc1_.clip.x += _loc1_.containerOffsetX;
                     _loc1_.clip.y += _loc1_.containerOffsetY;
                  }
                  if(_loc1_.numCuts >= _loc1_.maxCuts)
                  {
                     _loc1_.returnToTable(true);
                  }
                  else if(_loc1_.gameObj && _loc1_.gameObj.var_129 && _loc1_.gameObj.var_129.currentOrder && _loc1_.gameObj.var_129.currentOrder.isLastSliceSmall())
                  {
                     _loc1_.returnToTable(true);
                  }
               }
            }
         }
         else if(_loc1_.isReturning)
         {
            _loc2_ = Number(_loc1_.gameObj.var_129.clip.knife_btn.x);
            _loc3_ = Number(_loc1_.gameObj.var_129.clip.knife_btn.y);
            _loc1_.clip.x += (_loc2_ - _loc1_.clip.x) / 2;
            _loc1_.clip.y += (_loc3_ - _loc1_.clip.y) / 2;
            _loc1_.mx = _loc1_.clip.transform.matrix;
            this.mx.c += (-0.70709 - this.mx.c) / 2;
            this.mx.d += (0.70709 - this.mx.d) / 2;
            _loc1_.clip.transform.matrix = this.mx;
            if(_loc1_.shadowClip)
            {
               _loc1_.shadowClip.x = _loc1_.clip.x;
               _loc1_.shadowClip.y = _loc1_.clip.y;
            }
            if(Math.abs(_loc2_ - _loc1_.clip.x) <= 1 && Math.abs(_loc3_ - _loc1_.clip.y) <= 1)
            {
               _loc1_.gameObj.var_128.playSound("drop_knife.wav");
               _loc1_.gameObj.var_129.putAwayKnife();
               return;
            }
         }
         else
         {
            _loc2_ = _loc1_.getMouseX();
            _loc3_ = _loc1_.getMouseY();
            _loc1_.clip.x += (_loc2_ - _loc1_.clip.x) / 2;
            _loc1_.clip.y += (_loc3_ - _loc1_.clip.y) / 2;
            if(_loc1_.shadowClip)
            {
               _loc1_.shadowClip.x = _loc1_.clip.x;
               _loc1_.shadowClip.y = Math.max(39,_loc1_.clip.y);
            }
            if(_loc1_.gameObj.var_129.clip.mouseX < 0 || _loc1_.gameObj.var_129.clip.mouseX > 640 || _loc1_.gameObj.var_129.clip.mouseY < 0 || _loc1_.gameObj.var_129.clip.mouseY > 480)
            {
               if(_loc1_.didStartCutting == false)
               {
                  _loc1_.returnToTable();
               }
            }
         }
      }
      
      public function releaseKnife() : void
      {
         var _loc1_:SushiKnife = this;
         if(Boolean(_loc1_.gameObj.var_129) && Boolean(_loc1_.gameObj.var_129.currentOrder))
         {
            if(_loc1_.gameObj.var_129.currentOrder.isWithinDropArea(_loc1_.clip.x,_loc1_.clip.y + _loc1_.offsetY,0))
            {
               _loc1_.makeSlice();
            }
         }
         if(_loc1_.isCutting)
         {
            _loc1_.didStartCutting = true;
         }
         else
         {
            _loc1_.returnToTable();
         }
      }
      
      public function returnToTable(param1:Boolean = false) : void
      {
         var _loc2_:SushiKnife = this;
         _loc2_.wasWithinSushi = false;
         _loc2_.targetBrightness = 1;
         _loc2_.isReturning = true;
         _loc2_.isCutting = false;
         _loc2_.clip.num_txt.text = "";
         if(_loc2_.gameObj.var_129)
         {
            _loc2_.gameObj.var_129.hideGuide();
         }
         if(_loc2_.gameObj.hud.whichContextTraining == "cutting")
         {
            if(param1)
            {
               _loc2_.gameObj.var_127.setTrained("cutting");
            }
            _loc2_.gameObj.hud.removeContextTraining();
         }
         if(Boolean(_loc2_.gameObj.var_129) && Boolean(_loc2_.gameObj.var_129.currentOrder))
         {
            _loc2_.gameObj.var_129.currentOrder.removeCuttingGuide();
            _loc2_.gameObj.var_129.currentOrder.removeHelperGuide();
         }
         if(param1)
         {
            if(Boolean(_loc2_.gameObj.var_129) && Boolean(_loc2_.gameObj.var_129.currentOrder))
            {
               _loc2_.gameObj.var_129.currentOrder.moveLastSlice();
            }
         }
      }
      
      public function makeSlice(param1:Boolean = true) : void
      {
         var distY:Number = NaN;
         var sliceDepth:Number = NaN;
         var guideDepth:Number = NaN;
         var alwaysCut:Boolean = param1;
         var ob:SushiKnife = this;
         var didSlice:Boolean = false;
         if(Boolean(ob.gameObj.var_129) && Boolean(ob.gameObj.var_129.currentOrder))
         {
            distY = ob.clip.y + ob.offsetY - ob.gameObj.var_129.currentOrder.dropTopY - ob.gameObj.var_129.currentOrder.clip.y;
            class_6.method_1("Make Slice at " + ob.clip.y + ".  Dist Y = " + distY + ".  Offset Y: " + ob.offsetY + ", Drop Top Y:" + ob.gameObj.var_129.currentOrder.dropTopY);
            if(!(distY < 0 || distY > ob.gameObj.var_129.currentOrder.filling.heightMapRange))
            {
               didSlice = ob.gameObj.var_129.currentOrder.sliceSushi(distY);
            }
         }
         if(didSlice)
         {
            ++ob.numCuts;
            ob.clip.num_txt.text = Math.max(0,this.maxCuts - this.numCuts);
         }
         if(didSlice || alwaysCut)
         {
            ob.cutStartX = ob.clip.x;
            ob.cutStartY = ob.clip.y;
            ob.isCutting = true;
            ob.isCuttingDown = true;
            ++ob.whichCutSound;
            if(ob.whichCutSound > 2)
            {
               ob.whichCutSound = 1;
            }
            ob.gameObj.var_128.playSound("cut_" + ob.whichCutSound + ".wav");
            if(ob.shadowClip)
            {
               ob.shadowClip.gotoAndPlay("cut");
            }
            try
            {
               if(Boolean(ob.gameObj.var_129) && Boolean(ob.gameObj.var_129.currentOrder))
               {
                  sliceDepth = ob.gameObj.var_129.currentOrder.getStaticSliceDepth();
                  guideDepth = sliceDepth;
                  if(ob.gameObj.var_129.currentOrder.isKnifeBehindSlice(distY))
                  {
                     class_6.method_1("Knife goes BEHIND static slice - at " + sliceDepth);
                     if(!ob.gameObj.var_129.currentOrder.sliceHolder.contains(ob.clip))
                     {
                        ob.gameObj.var_129.currentOrder.sliceHolder.addChildAt(ob.clip,sliceDepth);
                     }
                     else
                     {
                        class_6.method_1("ALREADY CONTAINS?!");
                        ob.gameObj.var_129.currentOrder.sliceHolder.setChildIndex(ob.clip,sliceDepth);
                     }
                     guideDepth = int.MAX_VALUE;
                  }
                  else
                  {
                     class_6.method_1("Knife goes IN FRONT of static slice - at " + sliceDepth + " + 1");
                     guideDepth = sliceDepth + 1;
                     if(!ob.gameObj.var_129.currentOrder.sliceHolder.contains(ob.clip))
                     {
                        ob.gameObj.var_129.currentOrder.sliceHolder.addChildAt(ob.clip,sliceDepth + 1);
                     }
                     else
                     {
                        class_6.method_1("ALREADY CONTAINS 2?!");
                        ob.gameObj.var_129.currentOrder.sliceHolder.setChildIndex(ob.clip,sliceDepth + 1);
                     }
                  }
                  ob.containerOffsetX = ob.gameObj.var_129.currentOrder.clip.x;
                  ob.containerOffsetY = ob.gameObj.var_129.currentOrder.clip.y;
                  ob.clip.x -= ob.containerOffsetX;
                  ob.clip.y -= ob.containerOffsetY;
                  ob.cutStartX -= ob.containerOffsetX;
                  ob.cutStartY -= ob.containerOffsetY;
                  try
                  {
                     if(ob.gameObj.var_129.currentOrder.helperGuide)
                     {
                        if(ob.gameObj.var_129.currentOrder.helperGuide.parent != ob.gameObj.var_129.currentOrder.sliceHolder)
                        {
                           ob.gameObj.var_129.currentOrder.sliceHolder.addChild(ob.gameObj.var_129.currentOrder.helperGuide);
                           ob.gameObj.var_129.currentOrder.helperGuide.x -= ob.gameObj.var_129.currentOrder.buildTargetX;
                           ob.gameObj.var_129.currentOrder.helperGuide.y -= ob.gameObj.var_129.currentOrder.buildTargetY;
                        }
                        if(guideDepth == int.MAX_VALUE)
                        {
                           guideDepth = ob.gameObj.var_129.currentOrder.sliceHolder.numChildren - 1;
                        }
                        ob.gameObj.var_129.currentOrder.sliceHolder.setChildIndex(ob.gameObj.var_129.currentOrder.helperGuide,guideDepth);
                     }
                  }
                  catch(err:Error)
                  {
                     class_6.error("Error with depth sorting helper guide: " + err.message);
                  }
               }
            }
            catch(err:Error)
            {
               class_6.error("Error setting depth of knife when cutting");
            }
         }
      }
   }
}
