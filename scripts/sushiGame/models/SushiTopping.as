package sushiGame.models
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.filters.GlowFilter;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import package_2.class_14;
   import package_2.class_21;
   import package_2.class_6;
   import package_4.class_5;
   import sushiGame.data.FoodData;
   import sushiGame.data.ToppingItem;
   import sushiGame.screens.BuildScreen;
   
   public class SushiTopping
   {
       
      
      public var gameObj:class_5;
      
      public var sushi:SushiRoll;
      
      public var clip:MovieClip;
      
      public var noriClip:MovieClip = null;
      
      public var riceClip:MovieClip = null;
      
      public var isRolling:Boolean = true;
      
      public var isReturnRolling:Boolean = false;
      
      public var rollTimer:Number = 0;
      
      public var rollTimerMax:Number = 10;
      
      public var clipTargetY:Number = -15;
      
      public var clipTargetX:Number = 205;
      
      public var rollCoordsX:Array;
      
      public var rollCoordsY:Array;
      
      public var rollRotations:Array;
      
      public var rollSpeed:Number = 2;
      
      public var crossSection:SushiCrossSection = null;
      
      public var layoutToppings:Vector.<MovieClip> = null;
      
      public var distroArray:Array;
      
      public var dropHolder:MovieClip = null;
      
      public var currentTopping:String = "none";
      
      public var currentToppingData:ToppingItem;
      
      public var toppingHolder:MovieClip = null;
      
      public var coords:Array;
      
      public var rateTimer:Number = 0;
      
      public var isPouring:Boolean = false;
      
      public var lastCurveDir:Number = -1;
      
      public var squirtWaveRange:Number = 2;
      
      public var squirtWaveAngle:Number = 0;
      
      public var squirtWaveSpeed:Number = 0.3;
      
      public var shakerWaveRange:Number = 10;
      
      public var shakerWaveAngle:Number = 0;
      
      public var shakerWaveSpeed:Number = 2;
      
      public var gravity:Number = 1;
      
      public var nudgeRotation:Number = 2;
      
      public var layerTypes:Array;
      
      public var layerNodeTallies:Array;
      
      public var layerNodeDistributions:Array;
      
      public var sauceNodeDistributions:Array;
      
      public var sauceNodeTally:Number = 0;
      
      public var fallingBlobs:MovieClip;
      
      public var fallingBlobsHolder:MovieClip;
      
      public var fallingBlobLayerType:String = "none";
      
      public var fallingBackgroundBlobs:MovieClip;
      
      public var fallingBackgroundBlobsHolder:MovieClip;
      
      public var tally:Number = 0;
      
      public var originPoint:Point;
      
      public var whichColor:Number = 0;
      
      public var whichColorDir:Number = 1;
      
      public var startBlobDiff:Number = -80;
      
      public var startSauceDiff:Number = -80;
      
      public var bakedBlobs:MovieClip;
      
      public var bakedBMP:BitmapData;
      
      public var finalBMP:BitmapData;
      
      public var finalBitmap:Bitmap;
      
      public var progressBMP:BitmapData;
      
      public var progressBitmap:Bitmap;
      
      public var progressMC:MovieClip;
      
      public var looseBMP:BitmapData;
      
      public var looseBitmap:Bitmap;
      
      public var bitmapOffsetX:Number = -125;
      
      public var bitmapOffsetY:Number = -175;
      
      public var bitmapWidth:Number = 250;
      
      public var bitmapHeight:Number = 190;
      
      public var curveStartX:Number = 51;
      
      public var curveStartY:Number = -127.5;
      
      public var curveEndY:Number = -19;
      
      public var curveRadius:Number = 26;
      
      public var cutoutSolidBMP:BitmapData;
      
      public var cutoutHoleBMP:BitmapData;
      
      public var sliceLogBMP:BitmapData = null;
      
      public var sliceToppingBMP:BitmapData = null;
      
      public var isFlattened:Boolean = false;
      
      public var didMoveOutside:Boolean = false;
      
      public function SushiTopping(param1:class_5, param2:SushiRoll)
      {
         this.rollCoordsX = [240.5,268,298.5,331,366.2,403,407,409,412,413];
         this.rollCoordsY = [-17.5,-17.5,-17.5,-17.5,-17.5,-15,-15,-15,-15,-15];
         this.rollRotations = [130,170,210,250,290,320,352,357,359,0];
         this.distroArray = [];
         this.coords = [];
         this.layerTypes = [];
         this.layerNodeTallies = [];
         this.layerNodeDistributions = [];
         this.sauceNodeDistributions = [];
         this.originPoint = new Point(0,0);
         super();
         this.gameObj = param1;
         this.sushi = param2;
         this.setupSushiTopping();
      }
      
      public function setupSushiTopping() : void
      {
         var _loc1_:SushiTopping = this;
         _loc1_.clip = new MovieClip();
         _loc1_.sushi.clip.addChildAt(_loc1_.clip,_loc1_.sushi.clip.numChildren - 2);
         _loc1_.noriClip = class_14.method_103(_loc1_.sushi.paperType + "_log",false,false);
         _loc1_.noriClip.stop();
         _loc1_.noriClip.y = -76;
         _loc1_.clip.addChild(_loc1_.noriClip);
         if(_loc1_.sushi.isFlipped)
         {
            _loc1_.riceClip = class_14.method_103(_loc1_.sushi.riceType + "_log",false,false);
            _loc1_.riceClip.gotoAndStop(_loc1_.sushi.riceFrame);
            _loc1_.riceClip.y = -76;
            _loc1_.clip.addChild(_loc1_.riceClip);
            _loc1_.noriClip.scaleX = 0.94;
            _loc1_.noriClip.scaleY = 0.94;
         }
         _loc1_.clip.x = _loc1_.rollCoordsX[0];
         _loc1_.clip.y = _loc1_.rollCoordsY[0];
         _loc1_.crossSection = _loc1_.sushi.filling.createCrossSection(_loc1_.sushi.filling.heightMapRange - _loc1_.sushi.filling.rangeInset,15);
         _loc1_.crossSection.attachCrossSection(-57.5,-19,_loc1_.clip);
         _loc1_.crossSection.clip.rotation = _loc1_.rollRotations[0];
         _loc1_.dropHolder = new MovieClip();
         _loc1_.clip.addChild(_loc1_.dropHolder);
         _loc1_.dropHolder.x = 0;
         _loc1_.dropHolder.y = 0;
         _loc1_.toppingHolder = new MovieClip();
         _loc1_.clip.addChild(_loc1_.toppingHolder);
         _loc1_.toppingHolder.x = 0;
         _loc1_.toppingHolder.y = 0;
         _loc1_.setupPouringSystem();
         _loc1_.layoutToppings = new Vector.<MovieClip>();
         _loc1_.clip.mouseEnabled = false;
         _loc1_.clip.mouseChildren = false;
      }
      
      public function updateTopping() : void
      {
         var _loc1_:SushiTopping = this;
         if(_loc1_.isRolling || _loc1_.isReturnRolling)
         {
            _loc1_.updateRollCoords();
         }
         else
         {
            _loc1_.screenUpdate();
         }
      }
      
      public function addBlob(param1:Number = -1, param2:Number = -1, param3:Number = -1) : void
      {
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc25_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc27_:Number = NaN;
         var _loc28_:Number = NaN;
         var _loc29_:MovieClip = null;
         var _loc30_:Number = NaN;
         var _loc31_:Number = NaN;
         var _loc32_:Number = NaN;
         var _loc33_:Number = NaN;
         var _loc34_:Number = NaN;
         var _loc35_:Object = null;
         var _loc36_:ToppingItem = null;
         var _loc4_:SushiTopping;
         var _loc5_:Number = (_loc4_ = this).clip.mouseX;
         var _loc6_:Number;
         var _loc7_:Number = _loc6_ = _loc4_.clip.mouseY;
         var _loc8_:Number = _loc5_;
         var _loc9_:Number = _loc6_;
         var _loc10_:Number = 0;
         var _loc11_:ToppingShaker = _loc4_.gameObj.var_129.getSauceBottle(_loc4_.currentTopping);
         if(_loc4_.toppingIsSauce())
         {
            _loc8_ += Math.sin(_loc4_.squirtWaveAngle) * _loc4_.squirtWaveRange;
         }
         else
         {
            _loc8_ += Math.sin(_loc4_.shakerWaveAngle) * _loc4_.shakerWaveRange;
            _loc9_ += Math.cos(_loc4_.shakerWaveAngle) * _loc4_.shakerWaveRange * 0.8;
         }
         if(param1 > -1)
         {
            _loc8_ = param1;
         }
         if(param2 > -1)
         {
            _loc9_ = param2;
         }
         if(param3 > -1)
         {
            _loc10_ = param3;
         }
         _loc5_ = _loc8_;
         _loc6_ = _loc9_;
         if(_loc4_.toppingIsSauce())
         {
            _loc9_ += _loc4_.startSauceDiff;
         }
         else
         {
            _loc9_ += _loc4_.startBlobDiff;
         }
         var _loc12_:Boolean = _loc4_.willCoordBeOutside(_loc5_,_loc6_);
         var _loc13_:Boolean = false;
         if(_loc12_)
         {
            _loc13_ = _loc4_.willCoordBeBehind(_loc5_,_loc6_);
         }
         var _loc14_:Number = _loc4_.getPourableCoordY(_loc5_,_loc6_);
         var _loc15_:Number = _loc6_ - _loc14_;
         var _loc16_:Boolean = false;
         if(_loc4_.isDistroItemAtY(_loc6_))
         {
            _loc6_ -= 7;
            _loc16_ = true;
         }
         _loc6_ -= _loc15_;
         _loc7_ -= _loc7_ - _loc14_;
         if(param1 == -1)
         {
            _loc4_.adjustFallingLayer();
         }
         if(_loc4_.toppingIsSauce() && param1 == -1 && param2 == -1)
         {
            if(_loc4_.coords.length > 0 && _loc4_.toppingCanInbetween())
            {
               _loc17_ = Number(_loc4_.coords[_loc4_.coords.length - 1].x);
               _loc18_ = Number(_loc4_.coords[_loc4_.coords.length - 1].y);
               _loc19_ = Number(_loc4_.coords[_loc4_.coords.length - 1].speed);
               if(_loc4_.coords[_loc4_.coords.length - 1].end !== true)
               {
                  _loc20_ = _loc8_ - _loc17_;
                  _loc21_ = _loc9_ - _loc18_;
                  _loc22_ = Math.sqrt(_loc20_ * _loc20_ + _loc21_ * _loc21_);
                  if((_loc23_ = Math.floor(_loc22_ / 10)) > 0)
                  {
                     _loc24_ = 1;
                     while(_loc24_ < _loc23_)
                     {
                        _loc25_ = _loc17_ + _loc24_ * (_loc20_ / _loc23_);
                        _loc26_ = _loc18_ + _loc24_ * (_loc21_ / _loc23_);
                        if(_loc4_.toppingIsSauce())
                        {
                           _loc26_ -= _loc4_.startSauceDiff;
                        }
                        else
                        {
                           _loc26_ -= _loc4_.startBlobDiff;
                        }
                        _loc27_ = _loc19_ - _loc24_ * (_loc19_ / _loc23_);
                        _loc4_.addBlob(_loc25_,_loc26_,_loc27_);
                        _loc24_++;
                     }
                  }
               }
            }
         }
         if(_loc4_.gameObj.var_129.toppingRemaining > 0)
         {
            _loc28_ = _loc4_.clip.mouseX;
            if(_loc4_.sushi.isWithinToppingArea(_loc28_ + _loc4_.clip.x + _loc4_.sushi.clip.x,_loc7_ + _loc4_.clip.y + _loc4_.sushi.clip.y,0) && _loc28_ > _loc4_.bitmapOffsetX && _loc28_ < _loc4_.bitmapOffsetX + _loc4_.bitmapWidth)
            {
               _loc29_ = class_14.method_103(_loc4_.getToppingData().pieceName,false,false);
               _loc30_ = _loc4_.getToppingData().rotationMin;
               _loc32_ = (_loc31_ = _loc4_.getToppingData().rotationMax) - _loc30_;
               _loc33_ = Math.random() * _loc32_ + _loc30_;
               _loc34_ = _loc4_.gameObj.var_129.toppingRemaining / _loc4_.gameObj.var_129.toppingCapacity;
               _loc29_.rotation = _loc33_;
               _loc29_.gotoAndStop(Math.ceil(Math.random() * _loc29_.totalFrames));
               _loc35_ = {
                  "x":_loc8_,
                  "y":_loc9_,
                  "targetx":_loc5_,
                  "targety":_loc6_,
                  "speed":_loc10_,
                  "clip":_loc29_,
                  "usecoll":-1,
                  "percentdeep":_loc34_,
                  "isOutside":_loc12_,
                  "isBehind":_loc13_,
                  "offset":_loc15_,
                  "overItem":_loc16_
               };
               _loc4_.coords.push(_loc35_);
               if(param1 > -1)
               {
                  _loc35_.wasForced = true;
               }
               if(!_loc4_.toppingIsSauce())
               {
                  if(_loc13_)
                  {
                     _loc4_.fallingBackgroundBlobs.addChild(_loc35_.clip);
                  }
                  else
                  {
                     _loc4_.fallingBlobs.addChild(_loc35_.clip);
                  }
               }
               --_loc4_.gameObj.var_129.toppingRemaining;
               if(_loc11_)
               {
                  _loc11_.setIcon("none");
               }
               _loc36_ = _loc4_.getToppingData();
               if(_loc4_.gameObj.var_129.isPlayingPouringSound() == false)
               {
                  if(_loc36_.isSauce)
                  {
                     _loc4_.gameObj.var_129.playPouringSound("squeeze_bottle.wav");
                  }
                  else
                  {
                     _loc4_.gameObj.var_129.playPouringSound("pour_solid.wav");
                  }
               }
            }
            else if(_loc4_.sushi.isWithinToppingArea(_loc4_.gameObj.var_129.clip.mouseX,_loc4_.gameObj.var_129.clip.mouseY,0) && _loc4_.gameObj.var_129.clip.mouseX + _loc4_.clip.x + _loc4_.sushi.clip.x > _loc4_.bitmapOffsetX && _loc4_.gameObj.var_129.clip.mouseX + _loc4_.clip.x + _loc4_.sushi.clip.x < _loc4_.bitmapOffsetX + _loc4_.bitmapWidth)
            {
               class_6.method_1("INBETWEEN TOPPING AREA...");
               if(_loc4_.coords.length > 0)
               {
                  _loc4_.coords[_loc4_.coords.length - 1].end = true;
               }
            }
            else
            {
               if(_loc11_ != null)
               {
                  class_6.method_1("WENT OUTSIDE TOPPING AREA, SET THE BOTTLE ICON --- XY: " + (_loc4_.clip.mouseX + _loc4_.clip.x + _loc4_.sushi.clip.x) + ", " + (_loc7_ + _loc4_.clip.y + _loc4_.sushi.clip.y) + ". Mouse Y: " + _loc4_.clip.mouseY + ". Check Target Y: " + _loc7_);
                  if(_loc11_ != null)
                  {
                     _loc11_.setIcon("up");
                  }
                  if(_loc4_.coords.length > 0)
                  {
                     _loc4_.coords[_loc4_.coords.length - 1].end = true;
                  }
                  _loc4_.gameObj.var_129.stopPouringSound();
               }
               _loc4_.didMoveOutside = true;
            }
         }
         if(param1 == -1 && _loc4_.gameObj.var_129.toppingRemaining <= 0)
         {
            _loc4_.gameObj.var_129.toppingRemaining = 0;
            _loc4_.stopPouring(true);
         }
      }
      
      public function adjustFallingLayer() : void
      {
         var _loc1_:SushiTopping = this;
         _loc1_.fallingBlobLayerType = _loc1_.currentTopping;
      }
      
      public function screenUpdate() : void
      {
         var totalNodesDone:Number;
         var speedmax:Number;
         var i:Number = NaN;
         var useDropRate:Number = NaN;
         var shouldDrop:Boolean = false;
         var mx:Matrix = null;
         var whichLayer:Number = NaN;
         var useColor:uint = 0;
         var sauceLayer:Number = NaN;
         var sa:Number = NaN;
         var sauceMX:Matrix = null;
         var p:Number = NaN;
         var ob:SushiTopping = this;
         ob.whichColor = 0;
         ob.lastCurveDir = -1;
         ob.checkForStartPouring();
         if(ob.isPouring)
         {
            if(ob.toppingIsSauce())
            {
               ob.squirtWaveAngle += ob.squirtWaveSpeed;
               ob.shakerWaveAngle += ob.shakerWaveSpeed;
            }
            else
            {
               ob.squirtWaveAngle += ob.squirtWaveSpeed;
               ob.shakerWaveAngle += ob.shakerWaveSpeed;
            }
            useDropRate = ob.getToppingData().dropRate;
            if(ob.gameObj.training && ob.currentTopping == "sprinkles")
            {
               useDropRate = 2;
            }
            if(ob.rateTimer % useDropRate == 0)
            {
               if(ob.gameObj.var_129.toppingRemaining > 0)
               {
                  ob.addBlob();
               }
            }
            ++ob.rateTimer;
         }
         totalNodesDone = 0;
         speedmax = ob.getToppingData().maxSpeed;
         if(ob.fallingBlobs)
         {
            ob.fallingBlobs.graphics.clear();
         }
         if(ob.fallingBackgroundBlobs)
         {
            ob.fallingBackgroundBlobs.graphics.clear();
         }
         i = 0;
         while(i < ob.coords.length)
         {
            shouldDrop = false;
            if(ob.toppingIsSauce() && ob.coords[i].done === true)
            {
               totalNodesDone++;
            }
            else if(ob.coords[i].y >= ob.coords[i].targety)
            {
               ob.coords[i].y = ob.coords[i].targety;
               ob.coords[i].clip.x = ob.coords[i].x;
               ob.coords[i].clip.y = ob.coords[i].y;
               mx = new Matrix();
               mx.rotate(class_21.degreesToRads(ob.coords[i].clip.rotation));
               mx.tx = ob.coords[i].x;
               mx.ty = ob.coords[i].y;
               whichLayer = -1;
               if(ob.layerTypes.length > 0)
               {
                  if(ob.layerTypes[ob.layerTypes.length - 1] == ob.currentTopping)
                  {
                     whichLayer = ob.layerTypes.length - 1;
                  }
               }
               if(whichLayer == -1)
               {
                  ob.layerTypes.push(ob.currentTopping);
                  ob.layerNodeTallies.push(0);
                  ob.layerNodeDistributions.push([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
                  whichLayer = ob.layerTypes.length - 1;
               }
               if(ob.toppingIsSauce())
               {
                  ob.coords[i].done = true;
                  ob.saveNodeDistribution(whichLayer,ob.coords[i].x,ob.coords[i].y,true,ob.coords[i].isOutside,ob.coords[i].overItem);
               }
               else
               {
                  ob.coords[i].clip.visible = true;
                  if(ob.coords[i].isOutside == false)
                  {
                     ob.drawIntoBitmap(ob.coords[i].clip,mx);
                  }
                  else
                  {
                     ob.drawIntoBitmap(ob.coords[i].clip,mx,true);
                  }
                  if(ob.coords[i].clip.parent)
                  {
                     ob.coords[i].clip.parent.removeChild(ob.coords[i].clip);
                  }
                  ob.saveNodeDistribution(whichLayer,ob.coords[i].x,ob.coords[i].y,false,ob.coords[i].isOutside,ob.coords[i].overItem);
                  ob.coords[i].clip = null;
                  ob.redrawMainBitmap();
                  ob.coords.splice(i,1);
                  i--;
               }
            }
            else
            {
               ob.coords[i].clip.x = ob.coords[i].x;
               ob.coords[i].clip.y = ob.coords[i].y;
               shouldDrop = true;
            }
            if(shouldDrop)
            {
               if(ob.coords[i].y < ob.coords[i].targety)
               {
                  if(ob.coords[i].speed < speedmax)
                  {
                     ob.coords[i].speed = Math.min(ob.coords[i].speed + ob.gravity,speedmax);
                  }
                  if(ob.coords[i].y + ob.coords[i].speed < ob.coords[i].targety)
                  {
                     ob.coords[i].y += ob.coords[i].speed;
                  }
                  else
                  {
                     ob.coords[i].y = ob.coords[i].targety;
                  }
               }
            }
            if(ob.toppingIsSauce())
            {
               try
               {
                  if(ob.coords.length > i + 1)
                  {
                     if(Boolean(ob.coords[i + 1].isOutside) && (ob.coords[i + 1].done === true || ob.coords[i + 1].isBehind == true && ob.coords[i + 1].x >= ob.getTopEdgeX(ob.coords[i + 1].y)))
                     {
                        if(ob.coords[i].isOutside == false)
                        {
                           if(ob.coords[i].end !== true)
                           {
                              ob.coords[i].end = true;
                           }
                        }
                     }
                  }
                  if(i > 0)
                  {
                     if(Boolean(ob.coords[i - 1].isOutside) && (ob.coords[i - 1].done === true || ob.coords[i - 1].isBehind == true && ob.coords[i - 1].x >= ob.getTopEdgeX(ob.coords[i - 1].y)))
                     {
                        if(ob.coords[i].isOutside == false)
                        {
                           if(ob.coords[i - 1].end !== true)
                           {
                              ob.coords[i - 1].end = true;
                           }
                        }
                     }
                  }
               }
               catch(err:Error)
               {
                  class_6.method_1("Error with line cutting.");
               }
               ob.lastCurveDir *= -1;
               useColor = ob.changeSauceColor(ob.currentTopping);
               if(i > 0 && ob.coords[i - 1].end !== true)
               {
                  ob.drawSauceLine(ob.currentTopping,ob.coords[i].x,ob.coords[i].y,ob.coords[i - 1].x,ob.coords[i - 1].y,ob.coords[i].done,ob.fallingBlobs,ob.fallingBackgroundBlobs,ob.coords[i],ob.coords[i - 1],useColor);
               }
            }
            i++;
         }
         if(ob.toppingIsSauce() && totalNodesDone > 0 && totalNodesDone == ob.coords.length)
         {
            sauceLayer = -1;
            if(ob.layerTypes.length > 0)
            {
               if(ob.layerTypes[ob.layerTypes.length - 1] == ob.currentTopping)
               {
                  sauceLayer = ob.layerTypes.length - 1;
               }
            }
            if(sauceLayer == -1)
            {
               ob.finalBMP.draw(ob.progressMC,null,null,null,null,true);
               ob.progressBMP.fillRect(ob.progressBMP.rect,0);
               ob.progressMC.filters = ob.createFilters(ob.currentTopping);
               ob.layerTypes.push(ob.currentTopping);
               ob.layerNodeTallies.push(0);
               ob.layerNodeDistributions.push([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
               whichLayer = ob.layerTypes.length - 1;
               sauceLayer = ob.layerTypes.length - 1;
            }
            ob.layerNodeTallies[sauceLayer] += ob.sauceNodeTally;
            sa = 0;
            while(sa < ob.sauceNodeDistributions.length)
            {
               ob.layerNodeDistributions[sauceLayer][sa] += ob.sauceNodeDistributions[sa];
               sa++;
            }
            class_6.method_1("SAUCE DISTRO: " + ob.layerNodeDistributions[sauceLayer].toString());
            ob.sauceNodeTally = 0;
            ob.sauceNodeDistributions = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
            sauceMX = new Matrix();
            sauceMX.tx = 0 - ob.bitmapOffsetX;
            sauceMX.ty = 0 - ob.bitmapOffsetY;
            ob.progressBMP.draw(ob.fallingBlobs,sauceMX,null,null,null,true);
            ob.fallingBlobs.filters = [];
            ob.fallingBlobs.graphics.clear();
            ob.looseBMP.draw(ob.fallingBackgroundBlobs,sauceMX,null,null,null,true);
            ob.fallingBackgroundBlobs.filters = [];
            ob.fallingBackgroundBlobs.graphics.clear();
            ob.redrawMainBitmap();
            p = ob.coords.length - 1;
            while(p >= 0)
            {
               if(ob.coords[p].clip.parent)
               {
                  ob.coords[p].clip.parent.removeChild(ob.coords[p].clip);
               }
               ob.coords[p].clip = null;
               ob.coords.splice(p,1);
               p--;
            }
         }
      }
      
      public function toppingIsSauce(param1:String = null) : Boolean
      {
         var _loc2_:SushiTopping = this;
         var _loc3_:ToppingItem = _loc2_.getToppingData();
         if(_loc3_ == null)
         {
            return false;
         }
         return _loc3_.isSauce;
      }
      
      public function toppingCanInbetween(param1:String = null) : Boolean
      {
         var _loc2_:SushiTopping = this;
         var _loc3_:ToppingItem = _loc2_.getToppingData();
         if(_loc3_ == null)
         {
            return false;
         }
         return _loc3_.inbetweens;
      }
      
      public function getToppingData(param1:Boolean = false) : ToppingItem
      {
         var _loc2_:SushiTopping = this;
         var _loc3_:ToppingItem = null;
         if(_loc2_.currentToppingData != null && (!param1 || param1 && _loc2_.currentToppingData.type == _loc2_.currentTopping))
         {
            _loc3_ = _loc2_.currentToppingData;
         }
         else if(_loc2_.currentTopping != "" && _loc2_.currentTopping != "none")
         {
            _loc2_.currentToppingData = _loc2_.gameObj.toppingData.getToppingItemData(_loc2_.currentTopping);
            _loc3_ = _loc2_.currentToppingData;
         }
         else
         {
            _loc3_ = new ToppingItem("","",0,50,50,50,50,50,50);
         }
         return _loc3_;
      }
      
      public function updateRollCoords() : void
      {
         var _loc2_:Number = NaN;
         var _loc1_:SushiTopping = this;
         if(_loc1_.isRolling)
         {
            ++_loc1_.rollTimer;
            if(_loc1_.rollTimer >= _loc1_.rollTimerMax)
            {
               _loc1_.isRolling = false;
               _loc1_.isReturnRolling = true;
               _loc1_.crossSection.clip.rotation = 0;
            }
            else if(_loc1_.rollTimer < _loc1_.rollCoordsX.length)
            {
               _loc1_.clip.x = _loc1_.rollCoordsX[_loc1_.rollTimer];
               _loc1_.clip.y = _loc1_.rollCoordsY[_loc1_.rollTimer];
               _loc1_.crossSection.clip.rotation = _loc1_.rollRotations[_loc1_.rollTimer];
            }
         }
         else if(_loc1_.isReturnRolling)
         {
            if(_loc1_.clip.x > 309)
            {
               _loc1_.clip.x -= _loc1_.rollSpeed;
               _loc1_.rollSpeed += 3;
            }
            else
            {
               _loc1_.clip.x += (_loc1_.clipTargetX - _loc1_.clip.x) / 4;
            }
            _loc2_ = Math.max(0,Math.min(1,1 - Math.abs((309 - _loc1_.clip.x) / 104)));
            _loc1_.clip.y = _loc1_.clipTargetY - _loc2_ * 15;
            if(Math.abs(_loc1_.clipTargetX - _loc1_.clip.x) <= 1)
            {
               _loc1_.clip.x = _loc1_.clipTargetX;
               _loc1_.clip.y = _loc1_.clipTargetY;
               _loc1_.isRolling = false;
               _loc1_.isReturnRolling = false;
            }
         }
      }
      
      public function startPouring() : void
      {
         var _loc5_:ToppingShaker = null;
         var _loc1_:SushiTopping = this;
         var _loc2_:BuildScreen = _loc1_.gameObj.var_129;
         var _loc3_:Number = _loc2_.clip.mouseX;
         var _loc4_:Number = _loc2_.clip.mouseY;
         if(!_loc2_.isSelectingBottle && (_loc1_.coords.length == 0 && _loc2_.selectedTopping != "none" || _loc1_.coords.length > 0 && _loc2_.selectedTopping == _loc1_.currentTopping))
         {
            _loc1_.currentTopping = _loc2_.selectedTopping;
            _loc1_.getToppingData(true);
            _loc1_.isPouring = true;
            _loc1_.rateTimer = 0;
            _loc1_.squirtWaveAngle = 0;
            _loc1_.shakerWaveAngle = 0;
            if((_loc5_ = _loc2_.getSauceBottle(_loc1_.currentTopping)) != null)
            {
               _loc5_.startPouring();
            }
            _loc1_.fallingBlobs.filters = _loc1_.createFilters(_loc1_.currentTopping);
            _loc1_.fallingBackgroundBlobs.filters = _loc1_.createFilters(_loc1_.currentTopping);
            if(_loc1_.gameObj.method_105(20) && _loc1_.currentTopping == FoodData.SAUCE_DUCK)
            {
               _loc1_.gameObj.method_104(20);
            }
            else if(_loc2_.gameObj.hud.whichContextTraining == "shaker")
            {
               _loc2_.gameObj.var_127.setTrained("shaker");
               _loc2_.gameObj.hud.removeContextTraining();
            }
            if(_loc1_.gameObj.hud.whichContextTraining == "toppingouter")
            {
               _loc1_.gameObj.var_127.setTrained("toppingouter");
               _loc1_.gameObj.hud.removeContextTraining();
            }
         }
      }
      
      public function checkForStartPouring() : void
      {
         var _loc1_:SushiTopping = this;
         var _loc2_:BuildScreen = _loc1_.gameObj.var_129;
         if(_loc2_.shouldStartPouring && !_loc1_.isPouring && !_loc2_.isSelectingBottle && !_loc2_.isSelectingBin && (_loc1_.coords.length == 0 && _loc2_.selectedTopping != "none" || _loc1_.coords.length > 0 && _loc2_.selectedTopping == _loc1_.currentTopping))
         {
            _loc1_.startPouring();
            _loc2_.shouldStartPouring = false;
         }
      }
      
      public function stopPouring(param1:Boolean = false) : void
      {
         var _loc3_:ToppingShaker = null;
         var _loc2_:SushiTopping = this;
         if(!_loc2_.gameObj.var_129.isSelectingBottle && !_loc2_.gameObj.var_129.isSelectingBin && _loc2_.isPouring)
         {
            _loc2_.isPouring = false;
            if(_loc2_.coords.length > 0)
            {
               _loc2_.coords[_loc2_.coords.length - 1].end = true;
            }
            _loc3_ = _loc2_.gameObj.var_129.getSauceBottle(_loc2_.currentTopping);
            if(_loc3_ != null)
            {
               _loc3_.stopPouring();
            }
         }
         if(param1)
         {
            _loc2_.gameObj.var_129.shouldDeselect = true;
            class_6.method_1("LAST LAYER DISTRO: " + _loc2_.layerNodeDistributions[_loc2_.layerNodeDistributions.length - 1].toString());
            if(_loc2_.currentTopping == FoodData.SAUCE_DUCK)
            {
               _loc2_.gameObj.method_104(21);
               if(Boolean(_loc2_.gameObj.var_129) && _loc2_.gameObj.training)
               {
                  _loc2_.gameObj.var_129.addTrainingGuide();
               }
            }
            _loc2_.gameObj.method_121();
         }
         _loc2_.gameObj.var_129.stopPouringSound();
      }
      
      public function getTopEdgeX(param1:Number) : Number
      {
         var _loc2_:SushiTopping = this;
         var _loc3_:Number = _loc2_.curveStartY;
         var _loc4_:Number = _loc2_.curveStartX - _loc2_.curveRadius;
         var _loc5_:Number = param1 - _loc3_;
         return _loc4_ - _loc5_;
      }
      
      public function willCoordBeBehind(param1:Number, param2:Number) : Boolean
      {
         var _loc3_:SushiTopping = this;
         var _loc4_:Number = param2 - _loc3_.curveStartY;
         var _loc5_:Number = _loc3_.curveStartX - _loc4_;
         if(param1 < _loc5_)
         {
            return true;
         }
         return false;
      }
      
      public function willCoordBeOutside(param1:Number, param2:Number) : Boolean
      {
         var _loc3_:SushiTopping = this;
         var _loc4_:Boolean = false;
         var _loc5_:Number = param1;
         var _loc6_:Number = param2;
         var _loc7_:Number = _loc3_.curveStartX - (_loc6_ + _loc3_.curveRadius - _loc3_.curveStartY);
         var _loc8_:Number;
         if((_loc8_ = _loc6_ + _loc3_.curveRadius) < _loc3_.curveStartY)
         {
            _loc7_ -= _loc3_.curveStartY - _loc8_;
            _loc8_ = _loc3_.curveStartY;
            _loc5_ -= _loc3_.curveStartY - _loc8_;
            _loc6_ = _loc8_ - _loc3_.curveRadius;
         }
         else if(_loc8_ > _loc3_.curveEndY)
         {
            _loc7_ += _loc8_ - _loc3_.curveEndY;
            _loc8_ = _loc3_.curveEndY;
            _loc5_ += _loc8_ - _loc3_.curveEndY;
            _loc6_ = _loc8_ - _loc3_.curveRadius;
         }
         var _loc9_:Number;
         var _loc10_:Number = _loc9_ = _loc5_ - _loc7_;
         var _loc11_:Number;
         var _loc12_:Number = (_loc11_ = _loc6_ - _loc8_) + 200;
         var _loc13_:Number = _loc10_ - _loc9_;
         var _loc14_:Number = _loc12_ - _loc11_;
         var _loc15_:Number = Math.sqrt(_loc13_ * _loc13_ + _loc14_ * _loc14_);
         var _loc16_:Number = _loc9_ * _loc12_ - _loc10_ * _loc11_;
         var _loc17_:Number = _loc3_.curveRadius * _loc3_.curveRadius * (_loc15_ * _loc15_) - _loc16_ * _loc16_;
         var _loc18_:Number = Math.sqrt(_loc9_ * _loc9_ + _loc11_ * _loc11_);
         var _loc19_:Number = Math.sqrt(_loc10_ * _loc10_ + _loc12_ * _loc12_);
         0;
         0;
         if(_loc17_ <= 0)
         {
            _loc4_ = true;
         }
         return _loc4_;
      }
      
      public function getPourableCoordY(param1:Number, param2:Number) : Number
      {
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc25_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc3_:SushiTopping = this;
         var _loc4_:Number = param2;
         var _loc5_:Number = param1;
         var _loc6_:Number = param2;
         var _loc7_:Number = _loc3_.curveStartX - (_loc6_ + _loc3_.curveRadius - _loc3_.curveStartY);
         var _loc8_:Number;
         if((_loc8_ = _loc6_ + _loc3_.curveRadius) < _loc3_.curveStartY)
         {
            _loc7_ -= _loc3_.curveStartY - _loc8_;
            _loc8_ = _loc3_.curveStartY;
            _loc5_ -= _loc3_.curveStartY - _loc8_;
            _loc6_ = _loc8_ - _loc3_.curveRadius;
         }
         else if(_loc8_ > _loc3_.curveEndY)
         {
            _loc7_ += _loc8_ - _loc3_.curveEndY;
            _loc8_ = _loc3_.curveEndY;
            _loc5_ += _loc8_ - _loc3_.curveEndY;
            _loc6_ = _loc8_ - _loc3_.curveRadius;
         }
         var _loc9_:Number;
         var _loc10_:Number = _loc9_ = _loc5_ - _loc7_;
         var _loc11_:Number;
         var _loc12_:Number = (_loc11_ = _loc6_ - _loc8_) + 200;
         var _loc13_:Number = _loc10_ - _loc9_;
         var _loc14_:Number = _loc12_ - _loc11_;
         var _loc15_:Number = Math.sqrt(_loc13_ * _loc13_ + _loc14_ * _loc14_);
         var _loc16_:Number = _loc9_ * _loc12_ - _loc10_ * _loc11_;
         var _loc17_:Number = _loc3_.curveRadius * _loc3_.curveRadius * (_loc15_ * _loc15_) - _loc16_ * _loc16_;
         var _loc18_:Number = Math.sqrt(_loc9_ * _loc9_ + _loc11_ * _loc11_);
         var _loc19_:Number = Math.sqrt(_loc10_ * _loc10_ + _loc12_ * _loc12_);
         var _loc20_:Number = 0;
         var _loc21_:Number = 0;
         if(_loc17_ > 0)
         {
            if(_loc14_ < 0)
            {
               _loc22_ = -1;
            }
            else
            {
               _loc22_ = 1;
            }
            _loc23_ = (_loc16_ * _loc14_ + _loc22_ * _loc13_ * Math.sqrt(_loc17_)) / (_loc15_ * _loc15_);
            _loc24_ = (_loc16_ * _loc14_ - _loc22_ * _loc13_ * Math.sqrt(_loc17_)) / (_loc15_ * _loc15_);
            _loc25_ = (-1 * (_loc16_ * _loc13_) + Math.abs(_loc14_) * Math.sqrt(_loc17_)) / (_loc15_ * _loc15_);
            if((_loc26_ = (-1 * (_loc16_ * _loc13_) - Math.abs(_loc14_) * Math.sqrt(_loc17_)) / (_loc15_ * _loc15_)) < _loc25_)
            {
               _loc20_ = _loc24_ + _loc7_;
               _loc21_ = _loc26_ + _loc8_;
            }
            else
            {
               _loc20_ = _loc23_ + _loc7_;
               _loc21_ = _loc25_ + _loc8_;
            }
         }
         else
         {
            _loc20_ = _loc5_;
            _loc21_ = _loc6_ + _loc3_.curveRadius * 2;
         }
         return _loc21_;
      }
      
      public function destroy() : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc1_:SushiTopping = this;
         _loc1_.setupPouringSystem(false);
         if(_loc1_.sliceLogBMP)
         {
            _loc1_.sliceLogBMP.dispose();
            _loc1_.sliceLogBMP = null;
         }
         if(_loc1_.sliceToppingBMP)
         {
            _loc1_.sliceToppingBMP.dispose();
            _loc1_.sliceToppingBMP = null;
         }
         if(_loc1_.layoutToppings)
         {
            _loc2_ = int(_loc1_.layoutToppings.length - 1);
            while(_loc2_ >= 0)
            {
               if(_loc1_.layoutToppings[_loc2_])
               {
                  if(_loc1_.layoutToppings[_loc2_].parent)
                  {
                     _loc1_.layoutToppings[_loc2_].parent.removeChild(_loc1_.layoutToppings[_loc2_]);
                  }
                  _loc1_.layoutToppings[_loc2_] = null;
                  _loc1_.layoutToppings.splice(_loc2_,1);
               }
               _loc2_--;
            }
            _loc1_.layoutToppings = null;
         }
         if(_loc1_.dropHolder)
         {
            if(_loc1_.dropHolder.parent)
            {
               _loc1_.dropHolder.parent.removeChild(_loc1_.dropHolder);
            }
            _loc1_.dropHolder = null;
         }
         if(_loc1_.toppingHolder)
         {
            if(_loc1_.toppingHolder.parent)
            {
               _loc1_.toppingHolder.parent.removeChild(_loc1_.toppingHolder);
            }
            _loc1_.toppingHolder = null;
         }
         if(_loc1_.crossSection)
         {
            _loc3_ = _loc1_.crossSection.id;
            _loc1_.sushi.filling.destroyCrossSection(_loc3_);
            _loc1_.crossSection = null;
         }
         if(_loc1_.riceClip)
         {
            if(_loc1_.riceClip.parent)
            {
               _loc1_.riceClip.parent.removeChild(_loc1_.riceClip);
            }
            _loc1_.riceClip.stop();
            _loc1_.riceClip = null;
         }
         if(_loc1_.noriClip)
         {
            if(_loc1_.noriClip.parent)
            {
               _loc1_.noriClip.parent.removeChild(_loc1_.noriClip);
            }
            _loc1_.noriClip.stop();
            _loc1_.noriClip = null;
         }
         this.sushi = null;
         this.gameObj = null;
      }
      
      public function saveNodeDistribution(param1:Number, param2:Number, param3:Number, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false) : void
      {
         var _loc7_:SushiTopping = this;
         var _loc8_:Number = param2;
         var _loc9_:Number = param3;
         if(param6)
         {
            param3 += 7;
         }
         param2 += _loc7_.getNodeOffsetX();
         param3 += _loc7_.getNodeOffsetY();
         var _loc10_:Number = 0;
         var _loc11_:Number = _loc7_.curveStartX;
         var _loc12_:Number = _loc7_.curveStartY - _loc7_.curveRadius;
         var _loc13_:Number;
         var _loc14_:Number = ((_loc13_ = _loc7_.curveEndY - _loc7_.curveRadius) - _loc12_) / 4;
         if(param5 == false)
         {
            if((_loc10_ = _loc7_.getLogQuadrant(param2,param3,param6)) == -1)
            {
               param5 = true;
               _loc10_ = 0;
            }
         }
         if(param5)
         {
            _loc12_ += _loc7_.curveRadius * 2;
            _loc13_ += _loc7_.curveRadius * 2;
         }
         if(param3 < _loc12_)
         {
            param2 += _loc12_ - param3;
            param3 = _loc12_;
         }
         else if(param3 > _loc13_)
         {
            param2 -= param3 - _loc13_;
            param3 = _loc13_;
         }
         var _loc15_:Number = _loc11_ - (param3 - _loc12_);
         if(param2 < _loc15_)
         {
            if(param5 == true)
            {
               if(param3 < _loc12_ + _loc14_)
               {
                  _loc10_ = 8;
               }
               else if(param3 < _loc12_ + _loc14_ * 2)
               {
                  _loc10_ = 9;
               }
               else if(param3 < _loc12_ + _loc14_ * 3)
               {
                  _loc10_ = 10;
               }
               else
               {
                  _loc10_ = 11;
               }
            }
         }
         else if(param5 == true)
         {
            if(param3 < _loc12_ + _loc14_)
            {
               _loc10_ = 12;
            }
            else if(param3 < _loc12_ + _loc14_ * 2)
            {
               _loc10_ = 13;
            }
            else if(param3 < _loc12_ + _loc14_ * 3)
            {
               _loc10_ = 14;
            }
            else
            {
               _loc10_ = 15;
            }
         }
         else
         {
            _loc10_ += 4;
         }
         _loc7_.layerNodeDistributions[param1][_loc10_] += 1;
         _loc7_.layerNodeTallies[param1] += 1;
         if(_loc7_.coords.length <= 1)
         {
            class_6.method_1("Last Layer Distro: " + _loc7_.layerNodeDistributions[_loc7_.layerNodeDistributions.length - 1].toString());
         }
      }
      
      public function getNodeOffsetX() : Number
      {
         this;
         return 0;
      }
      
      public function getNodeOffsetY() : Number
      {
         this;
         return 0;
      }
      
      public function getBitmapDrawOffsetX() : Number
      {
         var _loc1_:SushiTopping = this;
         return 0 - _loc1_.bitmapOffsetX;
      }
      
      public function getBitmapDrawOffsetY() : Number
      {
         var _loc1_:SushiTopping = this;
         return 0 - _loc1_.bitmapOffsetY;
      }
      
      public function drawIntoBitmap(param1:MovieClip, param2:Matrix, param3:Boolean = false) : void
      {
         var _loc4_:SushiTopping = this;
         param2.tx += _loc4_.getBitmapDrawOffsetX();
         param2.ty += _loc4_.getBitmapDrawOffsetY();
         if(param3)
         {
            _loc4_.looseBMP.draw(param1,param2);
         }
         else
         {
            _loc4_.progressBMP.draw(param1,param2);
         }
      }
      
      public function redrawMainBitmap() : void
      {
         var _loc1_:SushiTopping = this;
         _loc1_.bakedBMP.copyPixels(_loc1_.finalBMP,_loc1_.finalBMP.rect,_loc1_.originPoint,null,null,true);
         _loc1_.bakedBMP.copyPixels(_loc1_.progressBMP,_loc1_.progressBMP.rect,_loc1_.originPoint,null,null,true);
      }
      
      public function createFilters(param1:String, param2:Boolean = false) : Array
      {
         var _loc6_:uint = 0;
         var _loc7_:GlowFilter = null;
         var _loc3_:SushiTopping = this;
         var _loc4_:Array = [];
         var _loc5_:Number = 1.2;
         if(param2)
         {
            _loc5_ = 1.05;
         }
         if(_loc3_.toppingIsSauce(param1))
         {
            if(_loc3_.toppingIsSauce(param1))
            {
               _loc5_ = 2;
               _loc6_ = _loc3_.getToppingData().sauceGlowColor;
               _loc4_ = [_loc7_ = new GlowFilter(_loc6_,1,_loc5_,_loc5_,1.2,1,true)];
            }
         }
         return _loc4_;
      }
      
      public function getSauceThicknessArray(param1:String, param2:*) : Array
      {
         var _loc5_:Array = null;
         var _loc3_:SushiTopping = this;
         1;
         if(param2 === true)
         {
            _loc5_ = _loc3_.getToppingData().sauceThicknessDone;
         }
         else
         {
            _loc5_ = _loc3_.getToppingData().sauceThicknessFall;
         }
         return _loc5_;
      }
      
      public function drawSauceLine(param1:String, param2:Number, param3:Number, param4:Number, param5:Number, param6:*, param7:MovieClip, param8:MovieClip, param9:Object, param10:Object, param11:uint) : void
      {
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc12_:SushiTopping = this;
         var _loc13_:Number = param2 - param4;
         var _loc14_:Number = param3 - param5;
         var _loc15_:Number = Math.sqrt(_loc13_ * _loc13_ + _loc14_ * _loc14_);
         var _loc18_:Number;
         var _loc19_:Number = (_loc18_ = Math.atan2(_loc14_,_loc13_)) + Math.PI / 2;
         if(this.lastCurveDir == 1)
         {
            _loc19_ += Math.PI;
         }
         var _loc20_:Number = param4 + _loc13_ / 2;
         var _loc21_:Number = param5 + _loc14_ / 2;
         _loc16_ = _loc20_ + Math.cos(_loc19_) * (_loc15_ / 5);
         _loc17_ = _loc21_ + Math.sin(_loc19_) * (_loc15_ / 5);
         var _loc22_:String = "normal";
         var _loc23_:MovieClip = param7;
         if(param6 === true && Boolean(param9.isOutside))
         {
            _loc23_ = param8;
            _loc22_ = "background";
         }
         else if(Boolean(param9.isOutside) && Boolean(param9.isBehind) && param9.x > _loc12_.getTopEdgeX(param9.y))
         {
            _loc23_ = param8;
            _loc22_ = "background";
         }
         else if(Boolean(param10.isOutside) && Boolean(param10.isBehind) && param10.x > _loc12_.getTopEdgeX(param10.y))
         {
            _loc23_ = param8;
            _loc22_ = "background";
         }
         var _loc24_:Array = _loc12_.getSauceThicknessArray(param1,param6);
         var _loc25_:Number = 1;
         if(_loc15_ < 5)
         {
            _loc25_ = Number(_loc24_[5]);
         }
         else if(_loc15_ < 10)
         {
            _loc25_ = Number(_loc24_[4]);
         }
         else if(_loc15_ < 15)
         {
            _loc25_ = Number(_loc24_[3]);
         }
         else if(_loc15_ < 20)
         {
            _loc25_ = Number(_loc24_[2]);
         }
         else if(_loc15_ < 25)
         {
            _loc25_ = Number(_loc24_[1]);
         }
         else
         {
            _loc25_ = Number(_loc24_[0]);
         }
         _loc23_.graphics.lineStyle(_loc25_,param11,1);
         _loc23_.graphics.moveTo(param2,param3);
         if(param6 && Math.abs(_loc13_) > 3)
         {
            _loc23_.graphics.curveTo(_loc16_,_loc17_,param4,param5);
         }
         else
         {
            _loc23_.graphics.lineTo(param4,param5);
         }
         _loc23_.graphics.lineStyle(1,16777215,0.3);
         _loc23_.graphics.moveTo(param2,param3 - _loc25_ / 2);
         if(param6 && Math.abs(_loc13_) > 3)
         {
            _loc23_.graphics.curveTo(_loc16_,_loc17_,param4,param5 - _loc25_ / 2);
         }
         else
         {
            _loc23_.graphics.lineTo(param4,param5 - _loc25_ / 2);
         }
      }
      
      public function changeSauceColor(param1:String) : uint
      {
         var _loc2_:SushiTopping = this;
         var _loc3_:Array = _loc2_.getToppingData().sauceColors;
         var _loc4_:uint = uint(_loc3_[_loc2_.whichColor]);
         _loc2_.whichColor += _loc2_.whichColorDir;
         if(_loc2_.whichColorDir == -1 && _loc2_.whichColor < 0)
         {
            _loc2_.whichColor = 1;
            _loc2_.whichColorDir = 1;
         }
         else if(_loc2_.whichColorDir == 1 && _loc2_.whichColor >= _loc3_.length)
         {
            _loc2_.whichColor = _loc3_.length - 2;
            _loc2_.whichColorDir = -1;
         }
         return _loc4_;
      }
      
      public function isWithinExactToppingArea(param1:Number, param2:Number, param3:Boolean = true, param4:Boolean = false) : Boolean
      {
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc5_:SushiTopping = this;
         var _loc6_:Boolean = false;
         var _loc7_:Number = _loc5_.curveStartX - (_loc5_.curveEndY - _loc5_.curveStartY) / 2;
         var _loc8_:Number = _loc5_.curveStartY + (_loc5_.curveEndY - _loc5_.curveStartY) / 2;
         var _loc9_:Number = _loc5_.curveEndY - _loc5_.curveStartY;
         var _loc10_:Number = _loc5_.curveStartX - (_loc5_.curveEndY - _loc5_.curveStartY) - _loc5_.curveStartX;
         var _loc11_:Number = Math.sqrt(_loc10_ * _loc10_ + _loc9_ * _loc9_);
         var _loc12_:Number = _loc5_.curveRadius * 2;
         if(param3)
         {
            param1 = param1 - _loc5_.sushi.clip.x - _loc5_.clip.x;
            param2 = param2 - _loc5_.sushi.clip.y - _loc5_.clip.y;
         }
         var _loc13_:Number = param1 - _loc7_;
         var _loc14_:Number = param2 - _loc8_;
         var _loc15_:Number = Math.sqrt(_loc13_ * _loc13_ + _loc14_ * _loc14_);
         var _loc16_:Number = (_loc16_ = Math.atan2(_loc14_,_loc13_)) - Math.PI / 4;
         var _loc17_:Number = _loc7_ + Math.sin(_loc16_) * _loc15_;
         var _loc18_:Number = _loc8_ + Math.cos(_loc16_) * _loc15_;
         if(_loc17_ >= _loc7_ - _loc11_ / 2 && _loc17_ <= _loc7_ + _loc11_ / 2 && _loc18_ >= _loc8_ - _loc12_ / 2 && _loc18_ <= _loc8_ + _loc12_ / 2)
         {
            _loc6_ = true;
         }
         else
         {
            _loc22_ = _loc5_.curveStartX - param1;
            _loc23_ = _loc5_.curveStartY - param2;
            if((_loc24_ = Math.sqrt(_loc22_ * _loc22_ + _loc23_ * _loc23_)) <= _loc5_.curveRadius)
            {
               _loc6_ = true;
            }
         }
         var _loc19_:Number = _loc5_.curveStartX - (_loc5_.curveEndY - _loc5_.curveStartY) - param1;
         var _loc20_:Number = _loc5_.curveEndY - param2;
         var _loc21_:Number;
         if((_loc21_ = Math.sqrt(_loc19_ * _loc19_ + _loc20_ * _loc20_)) <= _loc5_.curveRadius)
         {
            if(param4)
            {
               _loc6_ = true;
            }
            else
            {
               _loc6_ = false;
            }
         }
         return _loc6_;
      }
      
      public function getLogQuadrant(param1:Number, param2:Number, param3:Boolean) : Number
      {
         var _loc8_:Boolean = false;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc25_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc27_:Number = NaN;
         var _loc28_:Number = NaN;
         var _loc29_:Number = NaN;
         var _loc4_:SushiTopping = this;
         var _loc5_:Number = -1;
         var _loc6_:Number = (_loc4_.curveEndY - _loc4_.curveStartY) / 4;
         if(param3)
         {
            param2 += 7;
         }
         var _loc7_:int = 0;
         while(_loc7_ < 4)
         {
            _loc8_ = false;
            _loc9_ = _loc4_.curveStartX - _loc6_ * _loc7_;
            _loc11_ = (_loc10_ = _loc4_.curveStartY + _loc6_ * _loc7_) + _loc6_;
            _loc12_ = _loc9_ - (_loc11_ - _loc10_) / 2;
            _loc13_ = _loc10_ + (_loc11_ - _loc10_) / 2;
            _loc14_ = _loc11_ - _loc10_;
            _loc15_ = _loc9_ - (_loc11_ - _loc10_) - _loc9_;
            _loc16_ = Math.sqrt(_loc15_ * _loc15_ + _loc14_ * _loc14_);
            _loc17_ = _loc4_.curveRadius * 2;
            _loc18_ = param1 - _loc12_;
            _loc19_ = param2 - _loc13_;
            _loc20_ = Math.sqrt(_loc18_ * _loc18_ + _loc19_ * _loc19_);
            _loc21_ = (_loc21_ = Math.atan2(_loc19_,_loc18_)) - Math.PI / 4;
            _loc22_ = _loc12_ + Math.sin(_loc21_) * _loc20_;
            _loc23_ = _loc13_ + Math.cos(_loc21_) * _loc20_;
            if(Math.ceil(_loc22_) >= Math.floor(_loc12_ - _loc16_ / 2) && Math.floor(_loc22_) <= Math.ceil(_loc12_ + _loc16_ / 2) && Math.ceil(_loc23_) >= Math.floor(_loc13_ - _loc17_ / 2) && Math.floor(_loc23_) <= Math.ceil(_loc13_ + _loc17_ / 2))
            {
               _loc8_ = true;
            }
            else
            {
               _loc27_ = _loc9_ - param1;
               _loc28_ = _loc10_ - param2;
               if((_loc29_ = Math.floor(Math.sqrt(_loc27_ * _loc27_ + _loc28_ * _loc28_))) <= _loc4_.curveRadius)
               {
                  _loc8_ = true;
               }
            }
            _loc24_ = _loc9_ - (_loc11_ - _loc10_) - param1;
            _loc25_ = _loc11_ - param2;
            if((_loc26_ = Math.sqrt(_loc24_ * _loc24_ + _loc25_ * _loc25_)) < _loc4_.curveRadius)
            {
               _loc8_ = false;
            }
            if(_loc8_)
            {
               _loc5_ = _loc7_;
               break;
            }
            _loc7_++;
         }
         if(_loc5_ == -1)
         {
            _loc5_ = 3;
         }
         return _loc5_;
      }
      
      public function getHeightMapOffset(param1:Number, param2:Number) : Number
      {
         this;
         return 0;
      }
      
      public function setupPouringSystem(param1:Boolean = true) : void
      {
         var _loc2_:SushiTopping = this;
         if(param1)
         {
            _loc2_.bakedBlobs = new MovieClip();
            _loc2_.fallingBlobs = new MovieClip();
            _loc2_.fallingBlobsHolder = new MovieClip();
            _loc2_.fallingBlobsHolder.addChild(_loc2_.fallingBlobs);
            _loc2_.fallingBlobsHolder.x = _loc2_.toppingHolder.x;
            _loc2_.fallingBlobsHolder.y = _loc2_.toppingHolder.y;
            _loc2_.fallingBlobs.mouseEnabled = false;
            _loc2_.fallingBlobs.mouseChildren = false;
            _loc2_.fallingBlobsHolder.mouseEnabled = false;
            _loc2_.fallingBlobsHolder.mouseChildren = false;
            _loc2_.fallingBackgroundBlobs = new MovieClip();
            _loc2_.fallingBackgroundBlobsHolder = new MovieClip();
            _loc2_.fallingBackgroundBlobsHolder.addChild(_loc2_.fallingBackgroundBlobs);
            _loc2_.clip.addChildAt(_loc2_.fallingBackgroundBlobsHolder,0);
            _loc2_.fallingBackgroundBlobsHolder.x = _loc2_.toppingHolder.x;
            _loc2_.fallingBackgroundBlobsHolder.y = _loc2_.toppingHolder.y;
            _loc2_.fallingBackgroundBlobs.mouseEnabled = false;
            _loc2_.fallingBackgroundBlobs.mouseChildren = false;
            _loc2_.fallingBackgroundBlobsHolder.mouseEnabled = false;
            _loc2_.fallingBackgroundBlobsHolder.mouseChildren = false;
            _loc2_.toppingHolder.addChild(_loc2_.bakedBlobs);
            _loc2_.toppingHolder.mouseEnabled = false;
            _loc2_.toppingHolder.mouseChildren = false;
            _loc2_.bakedBMP = new BitmapData(_loc2_.bitmapWidth,_loc2_.bitmapHeight,true,0);
            _loc2_.finalBMP = new BitmapData(_loc2_.bakedBMP.width,_loc2_.bakedBMP.height,true,0);
            _loc2_.finalBitmap = new Bitmap(_loc2_.finalBMP,"auto",true);
            _loc2_.bakedBlobs.addChild(_loc2_.finalBitmap);
            _loc2_.bakedBlobs.mouseEnabled = false;
            _loc2_.bakedBlobs.mouseChildren = false;
            _loc2_.progressBMP = new BitmapData(_loc2_.bakedBMP.width,_loc2_.bakedBMP.height,true,0);
            _loc2_.progressBitmap = new Bitmap(_loc2_.progressBMP,"auto",true);
            _loc2_.progressMC = new MovieClip();
            _loc2_.progressMC.addChild(_loc2_.progressBitmap);
            _loc2_.progressMC.mouseEnabled = false;
            _loc2_.progressMC.mouseChildren = false;
            _loc2_.bakedBlobs.addChild(_loc2_.progressMC);
            _loc2_.bakedBlobs.mouseEnabled = false;
            _loc2_.bakedBlobs.mouseChildren = false;
            _loc2_.bakedBlobs.x = 0 + _loc2_.bitmapOffsetX;
            _loc2_.bakedBlobs.y = 0 + _loc2_.bitmapOffsetY;
            _loc2_.sauceNodeDistributions = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
            _loc2_.sauceNodeTally = 0;
            _loc2_.toppingHolder.addChild(_loc2_.fallingBlobsHolder);
            _loc2_.looseBMP = new BitmapData(_loc2_.bitmapWidth,_loc2_.bitmapHeight,true,0);
            _loc2_.looseBitmap = new Bitmap(_loc2_.looseBMP,"auto",true);
            _loc2_.looseBitmap.x = _loc2_.clipTargetX + _loc2_.toppingHolder.x + _loc2_.bitmapOffsetX;
            _loc2_.looseBitmap.y = _loc2_.clipTargetY + _loc2_.toppingHolder.y + _loc2_.bitmapOffsetY;
            _loc2_.sushi.clip.addChildAt(_loc2_.looseBitmap,0);
            _loc2_.cutoutSolidBMP = new BitmapData(_loc2_.bitmapWidth,_loc2_.bitmapHeight,true,0);
            _loc2_.cutoutHoleBMP = new BitmapData(_loc2_.bitmapWidth,_loc2_.bitmapHeight,true,0);
         }
         else
         {
            if(_loc2_.cutoutSolidBMP)
            {
               _loc2_.cutoutSolidBMP.dispose();
               _loc2_.cutoutSolidBMP = null;
            }
            if(_loc2_.cutoutHoleBMP)
            {
               _loc2_.cutoutHoleBMP.dispose();
               _loc2_.cutoutHoleBMP = null;
            }
            if(_loc2_.looseBitmap)
            {
               if(_loc2_.looseBitmap.parent)
               {
                  _loc2_.looseBitmap.parent.removeChild(_loc2_.looseBitmap);
               }
               _loc2_.looseBitmap.bitmapData = null;
               _loc2_.looseBitmap = null;
            }
            if(_loc2_.looseBMP)
            {
               _loc2_.looseBMP.dispose();
               _loc2_.looseBMP = null;
            }
            if(_loc2_.bakedBMP)
            {
               _loc2_.bakedBMP.dispose();
               _loc2_.bakedBMP = null;
            }
            if(_loc2_.progressBitmap)
            {
               if(_loc2_.progressBitmap.parent)
               {
                  _loc2_.progressBitmap.parent.removeChild(_loc2_.progressBitmap);
               }
               _loc2_.progressBitmap.bitmapData = null;
               _loc2_.progressBitmap = null;
            }
            if(_loc2_.progressBMP)
            {
               _loc2_.progressBMP.dispose();
               _loc2_.progressBMP = null;
            }
            if(_loc2_.finalBitmap)
            {
               if(_loc2_.finalBitmap.parent)
               {
                  _loc2_.finalBitmap.parent.removeChild(_loc2_.finalBitmap);
               }
               _loc2_.finalBitmap.bitmapData = null;
               _loc2_.finalBitmap = null;
            }
            if(_loc2_.finalBMP)
            {
               _loc2_.finalBMP.dispose();
               _loc2_.finalBMP = null;
            }
            if(_loc2_.progressMC)
            {
               if(_loc2_.progressMC.parent)
               {
                  _loc2_.progressMC.parent.removeChild(_loc2_.progressMC);
               }
               _loc2_.progressMC = null;
            }
            if(_loc2_.bakedBlobs)
            {
               if(_loc2_.bakedBlobs.parent)
               {
                  _loc2_.bakedBlobs.parent.removeChild(_loc2_.bakedBlobs);
               }
               _loc2_.bakedBlobs = null;
            }
            if(_loc2_.fallingBlobs)
            {
               if(_loc2_.fallingBlobs.parent)
               {
                  _loc2_.fallingBlobs.parent.removeChild(_loc2_.fallingBlobs);
               }
               _loc2_.fallingBlobs = null;
            }
            if(_loc2_.fallingBlobsHolder)
            {
               if(_loc2_.fallingBlobsHolder.parent)
               {
                  _loc2_.fallingBlobsHolder.parent.removeChild(_loc2_.fallingBlobsHolder);
               }
               _loc2_.fallingBlobsHolder = null;
            }
            if(_loc2_.fallingBackgroundBlobs)
            {
               if(_loc2_.fallingBackgroundBlobs.parent)
               {
                  _loc2_.fallingBackgroundBlobs.parent.removeChild(_loc2_.fallingBackgroundBlobs);
               }
               _loc2_.fallingBackgroundBlobs = null;
            }
            if(_loc2_.fallingBackgroundBlobsHolder)
            {
               if(_loc2_.fallingBackgroundBlobsHolder.parent)
               {
                  _loc2_.fallingBackgroundBlobsHolder.parent.removeChild(_loc2_.fallingBackgroundBlobsHolder);
               }
               _loc2_.fallingBackgroundBlobsHolder = null;
            }
         }
      }
      
      public function addDrop(param1:String, param2:Number) : void
      {
         var _loc3_:SushiTopping = this;
         if(_loc3_.gameObj.method_105(18) && param1 == FoodData.DROP_MANGO)
         {
            _loc3_.gameObj.method_104(18);
         }
         var _loc4_:ToppingItem = _loc3_.gameObj.toppingData.getToppingItemData(param1);
         var _loc5_:MovieClip;
         (_loc5_ = class_14.method_103(_loc4_.pieceName,false,false)).gotoAndStop(1);
         param2 = Math.round(param2);
         _loc5_.x = _loc3_.sushi.getDropXatY(param2,true);
         _loc5_.x -= _loc3_.sushi.clip.x;
         _loc5_.x -= _loc3_.clip.x;
         var _loc6_:Number = _loc4_.partHeight;
         _loc5_.dropindex = _loc3_.layoutToppings.length;
         _loc5_.y = param2;
         _loc5_.y -= _loc3_.sushi.clip.y;
         _loc5_.y -= _loc3_.clip.y;
         class_6.method_1("Add " + param1 + " at " + param2 + " ---> " + _loc5_.y + ".  Sushi Clip Y: " + _loc3_.sushi.clip.y + ", Topping Clip Y: " + _loc3_.clip.y + ", DropTopY: " + _loc3_.sushi.dropTopY);
         _loc5_.gotoAndStop(2);
         _loc3_.dropHolder.addChild(_loc5_);
         _loc3_.layoutToppings.push(_loc5_);
         _loc3_.addToDistro(param2 - _loc3_.sushi.clip.y - 1,_loc6_,param1);
         _loc3_.depthSortDrops();
         _loc3_.cutoutDrop(_loc5_);
      }
      
      public function cutoutDrop(param1:MovieClip) : void
      {
         var _loc2_:SushiTopping = this;
         _loc2_.cutoutSolidBMP.fillRect(_loc2_.cutoutSolidBMP.rect,0);
         _loc2_.cutoutHoleBMP.fillRect(_loc2_.cutoutHoleBMP.rect,0);
         var _loc3_:Point = new Point(0,0);
         var _loc4_:Matrix;
         (_loc4_ = new Matrix()).tx = 0 + param1.x - _loc2_.bitmapOffsetX;
         _loc4_.ty = 0 + param1.y - _loc2_.bitmapOffsetY;
         _loc2_.cutoutSolidBMP.draw(param1,_loc4_,null,null,null,true);
         _loc2_.cutoutHoleBMP.threshold(_loc2_.cutoutSolidBMP,_loc2_.cutoutSolidBMP.rect,new Point(0,0),"<",4278190080,4294901760,4278190080,false);
         var _loc5_:ColorTransform = new ColorTransform(0,0,0,1,0,255,0,0);
         var _loc6_:int = 0;
         while(_loc6_ < _loc2_.layoutToppings.length)
         {
            if(_loc2_.layoutToppings[_loc6_] && _loc2_.layoutToppings[_loc6_] != param1 && _loc2_.layoutToppings[_loc6_].locked !== true)
            {
               if(_loc2_.layoutToppings[_loc6_].y > param1.y)
               {
                  _loc4_.tx = 0 + _loc2_.layoutToppings[_loc6_].x - _loc2_.bitmapOffsetX;
                  _loc4_.ty = 0 + _loc2_.layoutToppings[_loc6_].y - _loc2_.bitmapOffsetY;
                  _loc2_.cutoutHoleBMP.draw(_loc2_.layoutToppings[_loc6_],_loc4_,_loc5_,null,null,true);
               }
            }
            _loc6_++;
         }
         _loc2_.cutoutSolidBMP.fillRect(_loc2_.cutoutSolidBMP.rect,0);
         _loc2_.cutoutSolidBMP.copyPixels(_loc2_.progressBMP,_loc2_.progressBMP.rect,_loc3_,_loc2_.cutoutHoleBMP,_loc3_,true);
         _loc2_.progressBMP.fillRect(_loc2_.progressBMP.rect,0);
         _loc2_.progressBMP.copyPixels(_loc2_.cutoutSolidBMP,_loc2_.cutoutSolidBMP.rect,_loc3_,null,null,true);
      }
      
      public function getDistroItems(param1:String) : Array
      {
         var _loc2_:SushiTopping = this;
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
         var _loc1_:SushiTopping = this;
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
      
      public function getDropOverlap(param1:Number, param2:Number, param3:String) : Number
      {
         var _loc6_:int = 0;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc4_:SushiTopping = this;
         var _loc5_:Number = 1;
         param1 -= _loc4_.sushi.clip.y;
         param1 -= _loc4_.sushi.dropTopY;
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
      
      public function addToDistro(param1:Number, param2:Number, param3:String) : void
      {
         var _loc4_:SushiTopping = this;
         param1 -= _loc4_.sushi.dropTopY;
         _loc4_.distroArray.push([param1 - param2,param1 - 4,param3]);
         class_6.method_1("Drop Distro: Add " + param3 + " from " + (param1 - param2) + " to " + (param1 - 4));
      }
      
      public function isDistroItemAtY(param1:Number) : Boolean
      {
         var _loc2_:SushiTopping = this;
         var _loc3_:Boolean = false;
         param1 -= _loc2_.sushi.dropTopY;
         param1 += _loc2_.clip.y;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.distroArray.length)
         {
            if(_loc2_.distroArray[_loc4_][0] <= param1 && _loc2_.distroArray[_loc4_][1] >= param1)
            {
               _loc3_ = true;
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function depthSortDrops() : void
      {
         var _loc2_:int = 0;
         var _loc1_:SushiTopping = this;
         if(_loc1_.layoutToppings)
         {
            _loc1_.layoutToppings = _loc1_.layoutToppings.sort(_loc1_.sortCompareFunction);
         }
         var _loc3_:Number = 0;
         _loc2_ = 0;
         while(_loc2_ < _loc1_.layoutToppings.length)
         {
            if(_loc1_.layoutToppings[_loc2_].locked === true)
            {
               _loc3_++;
            }
            _loc2_++;
         }
         var _loc4_:Number = -1;
         _loc2_ = 0;
         while(_loc2_ < _loc1_.layoutToppings.length)
         {
            if(_loc1_.layoutToppings[_loc2_].locked !== true)
            {
               _loc4_++;
               _loc1_.dropHolder.setChildIndex(_loc1_.layoutToppings[_loc2_],_loc3_ + _loc4_);
            }
            _loc2_++;
         }
      }
      
      public function lockDropDepths() : void
      {
         var _loc1_:SushiTopping = this;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.layoutToppings.length)
         {
            _loc1_.layoutToppings[_loc2_].locked = true;
            _loc2_++;
         }
      }
      
      public function sortCompareFunction(param1:MovieClip, param2:MovieClip) : Number
      {
         this;
         var _loc4_:Number = param1.y;
         var _loc5_:Number = param2.y;
         if(param1.locked === true)
         {
            _loc4_ = -9999;
         }
         if(param2.locked === true)
         {
            _loc5_ = -9999;
         }
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
      
      public function removeLooseBitmap() : void
      {
         var _loc1_:SushiTopping = this;
         if(_loc1_.looseBitmap)
         {
            if(_loc1_.looseBitmap.parent)
            {
               _loc1_.looseBitmap.parent.removeChild(_loc1_.looseBitmap);
            }
            _loc1_.looseBitmap.bitmapData = null;
            _loc1_.looseBitmap = null;
         }
         if(_loc1_.looseBMP)
         {
            _loc1_.looseBMP.dispose();
            _loc1_.looseBMP = null;
         }
      }
      
      public function flattenForSlicing() : void
      {
         var _loc2_:int = 0;
         var _loc4_:Matrix = null;
         var _loc5_:Number = NaN;
         var _loc1_:SushiTopping = this;
         _loc1_.sliceLogBMP = new BitmapData(_loc1_.bitmapWidth,_loc1_.bitmapHeight,true,0);
         _loc1_.sliceToppingBMP = new BitmapData(_loc1_.bitmapWidth,_loc1_.bitmapHeight,true,0);
         var _loc3_:Matrix = new Matrix();
         _loc3_.tx = 0 - _loc1_.bitmapOffsetX;
         _loc3_.ty = 0 - _loc1_.bitmapOffsetY;
         _loc1_.sliceToppingBMP.draw(_loc1_.dropHolder,_loc3_,null,null,null,true);
         _loc1_.sliceToppingBMP.copyPixels(_loc1_.progressBMP,_loc1_.progressBMP.rect,new Point(0,0),null,null,true);
         if(_loc1_.noriClip)
         {
            (_loc4_ = new Matrix()).scale(_loc1_.noriClip.scaleX,_loc1_.noriClip.scaleY);
            _loc4_.tx = 0 - _loc1_.bitmapOffsetX;
            _loc4_.ty = 0 - _loc1_.bitmapOffsetY + _loc1_.noriClip.y;
            _loc1_.sliceLogBMP.draw(_loc1_.noriClip,_loc4_,null,null,null,true);
         }
         if(_loc1_.riceClip)
         {
            _loc3_.ty = 0 - _loc1_.bitmapOffsetY + _loc1_.riceClip.y;
            _loc1_.sliceLogBMP.draw(_loc1_.riceClip,_loc3_,null,null,null,true);
         }
         _loc1_.isFlattened = true;
         if(_loc1_.layoutToppings)
         {
            _loc2_ = int(_loc1_.layoutToppings.length - 1);
            while(_loc2_ >= 0)
            {
               if(_loc1_.layoutToppings[_loc2_])
               {
                  if(_loc1_.layoutToppings[_loc2_].parent)
                  {
                     _loc1_.layoutToppings[_loc2_].parent.removeChild(_loc1_.layoutToppings[_loc2_]);
                  }
                  _loc1_.layoutToppings[_loc2_] = null;
                  _loc1_.layoutToppings.splice(_loc2_,1);
               }
               _loc2_--;
            }
         }
         if(_loc1_.dropHolder)
         {
            if(_loc1_.dropHolder.parent)
            {
               _loc1_.dropHolder.parent.removeChild(_loc1_.dropHolder);
            }
            _loc1_.dropHolder = null;
         }
         if(_loc1_.cutoutSolidBMP)
         {
            _loc1_.cutoutSolidBMP.dispose();
            _loc1_.cutoutSolidBMP = null;
         }
         if(_loc1_.cutoutHoleBMP)
         {
            _loc1_.cutoutHoleBMP.dispose();
            _loc1_.cutoutHoleBMP = null;
         }
         if(_loc1_.bakedBMP)
         {
            _loc1_.bakedBMP.dispose();
            _loc1_.bakedBMP = null;
         }
         if(_loc1_.progressBitmap)
         {
            if(_loc1_.progressBitmap.parent)
            {
               _loc1_.progressBitmap.parent.removeChild(_loc1_.progressBitmap);
            }
            _loc1_.progressBitmap.bitmapData = null;
            _loc1_.progressBitmap = null;
         }
         if(_loc1_.progressBMP)
         {
            _loc1_.progressBMP.dispose();
            _loc1_.progressBMP = null;
         }
         if(_loc1_.finalBitmap)
         {
            if(_loc1_.finalBitmap.parent)
            {
               _loc1_.finalBitmap.parent.removeChild(_loc1_.finalBitmap);
            }
            _loc1_.finalBitmap.bitmapData = null;
            _loc1_.finalBitmap = null;
         }
         if(_loc1_.finalBMP)
         {
            _loc1_.finalBMP.dispose();
            _loc1_.finalBMP = null;
         }
         if(_loc1_.progressMC)
         {
            if(_loc1_.progressMC.parent)
            {
               _loc1_.progressMC.parent.removeChild(_loc1_.progressMC);
            }
            _loc1_.progressMC = null;
         }
         if(_loc1_.bakedBlobs)
         {
            if(_loc1_.bakedBlobs.parent)
            {
               _loc1_.bakedBlobs.parent.removeChild(_loc1_.bakedBlobs);
            }
            _loc1_.bakedBlobs = null;
         }
         if(_loc1_.fallingBlobs)
         {
            if(_loc1_.fallingBlobs.parent)
            {
               _loc1_.fallingBlobs.parent.removeChild(_loc1_.fallingBlobs);
            }
            _loc1_.fallingBlobs = null;
         }
         if(_loc1_.fallingBlobsHolder)
         {
            if(_loc1_.fallingBlobsHolder.parent)
            {
               _loc1_.fallingBlobsHolder.parent.removeChild(_loc1_.fallingBlobsHolder);
            }
            _loc1_.fallingBlobsHolder = null;
         }
         if(_loc1_.fallingBackgroundBlobs)
         {
            if(_loc1_.fallingBackgroundBlobs.parent)
            {
               _loc1_.fallingBackgroundBlobs.parent.removeChild(_loc1_.fallingBackgroundBlobs);
            }
            _loc1_.fallingBackgroundBlobs = null;
         }
         if(_loc1_.fallingBackgroundBlobsHolder)
         {
            if(_loc1_.fallingBackgroundBlobsHolder.parent)
            {
               _loc1_.fallingBackgroundBlobsHolder.parent.removeChild(_loc1_.fallingBackgroundBlobsHolder);
            }
            _loc1_.fallingBackgroundBlobsHolder = null;
         }
         if(_loc1_.toppingHolder)
         {
            if(_loc1_.toppingHolder.parent)
            {
               _loc1_.toppingHolder.parent.removeChild(_loc1_.toppingHolder);
            }
            _loc1_.toppingHolder = null;
         }
         if(_loc1_.riceClip)
         {
            if(_loc1_.riceClip.parent)
            {
               _loc1_.riceClip.parent.removeChild(_loc1_.riceClip);
            }
            _loc1_.riceClip.stop();
            _loc1_.riceClip = null;
         }
         if(_loc1_.noriClip)
         {
            if(_loc1_.noriClip.parent)
            {
               _loc1_.noriClip.parent.removeChild(_loc1_.noriClip);
            }
            _loc1_.noriClip.stop();
            _loc1_.noriClip = null;
         }
         if(_loc1_.crossSection)
         {
            _loc5_ = _loc1_.crossSection.id;
            _loc1_.sushi.filling.destroyCrossSection(_loc5_);
            _loc1_.crossSection = null;
         }
      }
   }
}
