package sushiGame.screens
{
   import flash.display.*;
   import flash.filters.GlowFilter;
   import flash.geom.ColorTransform;
   import flash.geom.Rectangle;
   import flash.text.TextFormat;
   import package_2.class_6;
   import package_4.*;
   import sushiGame.data.UserData;
   import sushiGame.managers.*;
   import sushiGame.models.Customer;
   import sushiGame.models.Ticket;
   import sushiGame.models.Worker;
   
   public class TakeOrderScreen
   {
       
      
      public var gameObj:class_5;
      
      public var clip:MovieClip;
      
      public var isActive:Boolean = false;
      
      public var customerScale:Number = 1.14;
      
      public var customerX:Number = 280;
      
      public var customerY:Number = 95;
      
      public var stepArray:Array;
      
      public var whichStep:Number = -1;
      
      public var stepTimer:Number = 0;
      
      public var lastStepTime:Number = 0;
      
      public var shorterTimingSpacing:Number = 15;
      
      public var timingSpacing:Number = 40;
      
      public var useTimingSpacing:Number = 15;
      
      public var seal0Spacing:Number = 24;
      
      public var seal1Spacing:Number = 18;
      
      public var seal2Spacing:Number = 15;
      
      public var seal3Spacing:Number = 12;
      
      public var isPlacingOrder:Boolean = false;
      
      public var currentTicket:Ticket;
      
      public var currentCustomer:Customer;
      
      public var timeActivated:Number = -1;
      
      public var triedToRestart:Boolean = false;
      
      public var backdropBitmap:Bitmap = null;
      
      public var countertopMC:MovieClip = null;
      
      public var worker:Worker = null;
      
      public var workerStartLabel:String = "starttakeorder";
      
      public var specialBitmap:Bitmap = null;
      
      public var kernFormat:TextFormat;
      
      public function TakeOrderScreen(param1:class_5)
      {
         this.stepArray = [];
         super();
         var _loc2_:TakeOrderScreen = this;
         _loc2_.gameObj = param1;
         _loc2_.kernFormat = new TextFormat();
         _loc2_.kernFormat.kerning = true;
         _loc2_.setupScreen();
      }
      
      public function setupScreen() : void
      {
         var _loc1_:TakeOrderScreen = this;
         _loc1_.clip = new takeOrderMC();
         _loc1_.clip.bubble.clip.gotoAndStop(1);
         _loc1_.worker = new Worker(_loc1_.gameObj,_loc1_.clip,_loc1_.gameObj.workerData,-10,192,1.14,true);
      }
      
      public function destroy() : void
      {
         var _loc1_:TakeOrderScreen = this;
         _loc1_.kernFormat = null;
         if(_loc1_.countertopMC != null)
         {
            _loc1_.clip.countertop.removeChild(_loc1_.countertopMC);
            _loc1_.countertopMC = null;
         }
         if(_loc1_.backdropBitmap != null)
         {
            _loc1_.backdropBitmap.bitmapData.dispose();
            try
            {
               _loc1_.clip.backdrop_holder.removeChild(_loc1_.backdropBitmap);
            }
            catch(err:Error)
            {
            }
            _loc1_.backdropBitmap = null;
         }
         _loc1_.worker.destroy();
         _loc1_.worker = null;
         if(_loc1_.gameObj.var_139.contains(_loc1_.clip))
         {
            _loc1_.gameObj.var_139.removeChild(_loc1_.clip);
         }
         _loc1_.clip = null;
      }
      
      public function activateScreen() : void
      {
         var _loc1_:TakeOrderScreen = this;
         if(!_loc1_.gameObj.var_139.contains(_loc1_.clip))
         {
            _loc1_.gameObj.var_139.addChild(_loc1_.clip);
         }
         _loc1_.currentCustomer = _loc1_.gameObj.var_133.orderline[0];
         _loc1_.currentCustomer.moveToTakeOrder();
         _loc1_.initializeOrder();
         _loc1_.timeActivated = _loc1_.gameObj.controls.gameplayTimer;
         _loc1_.gameObj.var_128.switchMusic("order");
         _loc1_.isActive = true;
      }
      
      public function deactivateScreen() : void
      {
         var _loc1_:TakeOrderScreen = this;
         if(_loc1_.gameObj.var_139.contains(_loc1_.clip))
         {
            _loc1_.gameObj.var_139.removeChild(_loc1_.clip);
         }
         if(_loc1_.currentCustomer != null)
         {
            _loc1_.currentCustomer.moveToLeaveLine();
            _loc1_.currentCustomer = null;
         }
         if(_loc1_.currentTicket != null)
         {
            _loc1_.currentTicket.finishDrawingTicket();
            _loc1_.currentTicket = null;
         }
         _loc1_.clip.envelope.stop();
         _loc1_.timeActivated = -1;
         _loc1_.triedToRestart = false;
         _loc1_.isActive = false;
      }
      
      public function initializeOrder() : void
      {
         var _loc2_:int = 0;
         var _loc1_:TakeOrderScreen = this;
         class_6.error("===========================================================================================");
         class_6.error(_loc1_.currentCustomer.customerName + " START TAKING ORDER");
         class_6.error("===========================================================================================");
         _loc1_.isPlacingOrder = true;
         _loc1_.stepTimer = 0;
         _loc1_.lastStepTime = 0;
         _loc1_.whichStep = -1;
         _loc1_.stepArray = [];
         _loc2_ = 0;
         while(_loc2_ < _loc1_.currentCustomer.givingorder.length)
         {
            _loc1_.stepArray.push([_loc2_]);
            _loc2_++;
         }
         _loc1_.clip.bubble.visible = false;
         _loc1_.clip.bubble.clip.gotoAndStop(1);
         _loc1_.currentTicket = _loc1_.gameObj.var_152.addTicket(_loc1_.currentCustomer.customerType);
         _loc1_.gameObj.var_128.playSound("dropticket.wav");
         _loc1_.clip.customername_txt.text = _loc1_.gameObj.var_131.getCustomerName(_loc1_.currentCustomer.customerType,true);
         _loc1_.clip.customername_txt.setTextFormat(_loc1_.kernFormat);
         var _loc3_:Number = _loc1_.gameObj.var_127.getCustomerStars(_loc1_.currentCustomer.customerType);
         var _loc4_:Number = _loc1_.gameObj.var_127.getCustomerSeal(_loc1_.currentCustomer.customerType);
         var _loc5_:int = 1;
         while(_loc5_ <= 5)
         {
            if(_loc3_ >= _loc5_)
            {
               if(_loc4_ == 0)
               {
                  _loc1_.clip.stars["star" + _loc5_].gotoAndStop(2);
               }
               else if(_loc4_ == 1)
               {
                  _loc1_.clip.stars["star" + _loc5_].gotoAndStop(3);
               }
               else
               {
                  _loc1_.clip.stars["star" + _loc5_].gotoAndStop(4);
               }
            }
            else
            {
               _loc1_.clip.stars["star" + _loc5_].gotoAndStop(1);
            }
            _loc5_++;
         }
         if(_loc4_ == 0)
         {
            _loc1_.clip.stars.currentseal.visible = false;
         }
         else
         {
            _loc1_.clip.stars.currentseal.visible = true;
            _loc1_.clip.stars.currentseal.gotoAndStop(_loc4_);
         }
         _loc1_.clip.stars.award.gotoAndStop(1);
         if(_loc1_.currentCustomer.isCloser)
         {
            _loc1_.clip.bubble.gotoAndStop("closer");
         }
         else
         {
            _loc1_.clip.bubble.gotoAndStop("normal");
         }
         var _loc6_:GlowFilter = _loc1_.clip.customername_txt.filters[0];
         if(_loc1_.currentCustomer.isCloser)
         {
            _loc6_.color = 13830400;
         }
         else if(_loc1_.gameObj.var_133.isBringingSpecial(_loc1_.currentCustomer.customerType))
         {
            _loc6_.color = 11692041;
         }
         else
         {
            _loc6_.color = _loc1_.getTextGlowColor();
         }
         if(_loc1_.gameObj.var_133.isBringingSpecial(_loc1_.currentCustomer.customerType))
         {
            _loc1_.clip.customername_txt.textColor = 16775783;
         }
         else
         {
            _loc1_.clip.customername_txt.textColor = 16777215;
         }
         _loc1_.clip.customername_txt.filters = [_loc6_];
         if(_loc1_.gameObj.var_133.isBringingSpecial(_loc1_.currentCustomer.customerType))
         {
            _loc1_.clip.envelope.visible = true;
            _loc1_.clip.envelope.play();
         }
         else
         {
            _loc1_.clip.envelope.visible = false;
            _loc1_.clip.envelope.stop();
         }
         var _loc7_:Number = _loc1_.gameObj.controls.gameplayTimer / _loc1_.gameObj.var_206;
         var _loc8_:Number = _loc1_.gameObj.var_132.getSkyStartingFrame();
         if(_loc7_ > 0.98)
         {
            _loc1_.clip.bg.gotoAndStop(_loc8_ + 6);
         }
         else if(_loc7_ > 0.8)
         {
            _loc1_.clip.bg.gotoAndStop(_loc8_ + 5);
         }
         else if(_loc7_ > 0.65)
         {
            _loc1_.clip.bg.gotoAndStop(_loc8_ + 4);
         }
         else if(_loc7_ > 0.5)
         {
            _loc1_.clip.bg.gotoAndStop(_loc8_ + 3);
         }
         else if(_loc7_ > 0.35)
         {
            _loc1_.clip.bg.gotoAndStop(_loc8_ + 2);
         }
         else if(_loc7_ > 0.2)
         {
            _loc1_.clip.bg.gotoAndStop(_loc8_ + 1);
         }
         else
         {
            _loc1_.clip.bg.gotoAndStop(_loc8_);
         }
         _loc1_.worker.playAnimation(_loc1_.workerStartLabel);
         if(_loc4_ == 0)
         {
            _loc1_.timingSpacing = _loc1_.seal0Spacing;
         }
         else if(_loc4_ == 1)
         {
            _loc1_.timingSpacing = _loc1_.seal1Spacing;
         }
         else if(_loc4_ == 2)
         {
            _loc1_.timingSpacing = _loc1_.seal2Spacing;
         }
         else if(_loc4_ == 3)
         {
            _loc1_.timingSpacing = _loc1_.seal3Spacing;
         }
         if(_loc1_.currentCustomer.customerType == 1 && !_loc1_.gameObj.var_127.hasTrained("critic"))
         {
            _loc1_.gameObj.hud.showContextTraining("critic");
            _loc1_.gameObj.var_127.setTrained("critic");
         }
         else if(_loc1_.currentCustomer.isCloser && !_loc1_.gameObj.var_127.hasTrained("closer"))
         {
            _loc1_.gameObj.hud.showContextTraining("closer");
            _loc1_.gameObj.var_127.setTrained("closer");
         }
         else if(_loc1_.gameObj.var_133.isBringingSpecial(_loc1_.currentCustomer.customerType) && !_loc1_.gameObj.var_127.hasTrained("bringspecial"))
         {
            _loc1_.gameObj.hud.showContextTraining("bringspecial");
            _loc1_.gameObj.var_127.setTrained("bringspecial");
         }
         else if(_loc1_.currentCustomer.isWaiter && !_loc1_.gameObj.var_127.hasTrained("server"))
         {
            _loc1_.gameObj.hud.showContextTraining("server");
            _loc1_.gameObj.var_127.setTrained("server");
         }
         else if(_loc1_.currentCustomer.customerName == "Santa" && !_loc1_.gameObj.var_127.hasTrained("santa"))
         {
            _loc1_.gameObj.hud.showContextTraining("santa");
            _loc1_.gameObj.var_127.setTrained("santa");
         }
      }
      
      public function updateScreen() : void
      {
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:Number = NaN;
         var _loc6_:Array = null;
         var _loc7_:String = null;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc1_:TakeOrderScreen = this;
         if(_loc1_.isPlacingOrder && !_loc1_.gameObj.var_169 && _loc1_.isActive)
         {
            ++_loc1_.stepTimer;
            if(_loc1_.currentCustomer.givingorder == null || _loc1_.currentCustomer.givingorder.length == 0)
            {
               _loc1_.currentCustomer.givingorder = _loc1_.gameObj.var_131.getCustomerOrderForGiving(_loc1_.currentCustomer.customerType);
            }
            if(_loc1_.stepTimer >= _loc1_.useTimingSpacing)
            {
               ++_loc1_.whichStep;
               if(_loc1_.whichStep >= 0 && _loc1_.whichStep < _loc1_.stepArray.length)
               {
                  _loc1_.useTimingSpacing = _loc1_.timingSpacing;
                  try
                  {
                     _loc3_ = String(_loc1_.currentCustomer.givingorder[_loc1_.stepArray[_loc1_.whichStep][0]][0]);
                     _loc4_ = String(_loc1_.currentCustomer.givingorder[_loc1_.stepArray[_loc1_.whichStep + 1][0]][0]);
                  }
                  catch(err:Error)
                  {
                  }
                  _loc1_.startCustomerAnimation();
                  _loc1_.clip.bubble.visible = true;
                  _loc1_.gameObj.var_128.playSound("talkbubble.wav");
                  if(_loc1_.stepArray[_loc1_.whichStep].length == 1 || _loc1_.stepArray[_loc1_.whichStep].length == 2 || _loc1_.stepArray[_loc1_.whichStep].length == 3)
                  {
                     _loc5_ = Number(_loc1_.stepArray[_loc1_.whichStep][0]);
                     _loc6_ = _loc1_.currentCustomer.givingorder[_loc5_];
                     if((_loc7_ = String(_loc1_.currentCustomer.givingorder[_loc5_][0])) == "speciallogo")
                     {
                        if(_loc1_.specialBitmap == null)
                        {
                           _loc1_.specialBitmap = new Bitmap(_loc1_.gameObj.var_133.specialBMP,"auto",true);
                           _loc1_.specialBitmap.scaleX = 0.75;
                           _loc1_.specialBitmap.scaleY = 0.75;
                           _loc1_.specialBitmap.x = 140;
                           _loc1_.specialBitmap.y = -13;
                        }
                        if(!_loc1_.clip.bubble.clip.contains(_loc1_.specialBitmap))
                        {
                           _loc1_.clip.bubble.clip.addChild(_loc1_.specialBitmap);
                        }
                        _loc1_.specialBitmap.visible = true;
                     }
                     else if(_loc1_.specialBitmap != null && Boolean(_loc1_.clip.bubble.clip.contains(_loc1_.specialBitmap)))
                     {
                        _loc1_.clip.bubble.clip.removeChild(_loc1_.specialBitmap);
                     }
                     _loc1_.clip.bubble.clip.gotoAndStop(_loc7_);
                     _loc1_.clip.bubble.bg.gotoAndPlay(1);
                     _loc1_.clip.bubble.bg2.gotoAndPlay(1);
                     _loc1_.currentTicket.drawTicketDetails(_loc1_.stepArray[_loc1_.whichStep][0]);
                  }
               }
               else if(_loc1_.whichStep == _loc1_.stepArray.length)
               {
                  _loc1_.finishCustomerAnimation();
                  _loc1_.clip.bubble.visible = false;
                  _loc1_.useTimingSpacing = _loc1_.shorterTimingSpacing;
               }
               else if(_loc1_.currentCustomer != null && _loc1_.currentCustomer.givingorder != null && _loc1_.currentCustomer.givingorder.length > 0 && _loc1_.whichStep > _loc1_.stepArray.length)
               {
                  _loc1_.finishPlacingOrder();
               }
               _loc1_.stepTimer = 0;
            }
         }
         var _loc2_:Number = _loc1_.gameObj.controls.gameplayTimer - _loc1_.timeActivated;
         if(_loc1_.timeActivated > -1 && _loc2_ >= 150)
         {
            if(_loc1_.isActive && !_loc1_.isPlacingOrder && _loc1_.whichStep <= 0)
            {
               if(!_loc1_.triedToRestart)
               {
                  _loc1_.whichStep = -1;
                  _loc1_.isPlacingOrder = true;
                  _loc1_.triedToRestart = true;
                  _loc1_.timeActivated = _loc1_.gameObj.controls.gameplayTimer;
               }
               else
               {
                  _loc8_ = 0;
                  _loc9_ = 0;
                  _loc10_ = 0;
                  try
                  {
                     _loc8_ = _loc1_.currentTicket.ticketNumber;
                  }
                  catch(err:Error)
                  {
                  }
                  try
                  {
                     _loc9_ = _loc1_.currentCustomer.customerType;
                  }
                  catch(err:Error)
                  {
                  }
                  try
                  {
                     _loc10_ = _loc1_.currentCustomer.givingorder.length;
                  }
                  catch(err:Error)
                  {
                  }
                  class_6.error("STUCK: " + _loc8_ + ", " + _loc9_ + ", " + _loc10_);
               }
            }
         }
         if(_loc1_.isActive)
         {
            _loc1_.worker.animateModel();
         }
      }
      
      public function finishPlacingOrder() : void
      {
         var _loc1_:TakeOrderScreen = this;
         _loc1_.isPlacingOrder = false;
         _loc1_.gameObj.hud.startTransition("order");
      }
      
      protected function createLobbyBackdropBitmap() : Bitmap
      {
         var _loc4_:Number = NaN;
         var _loc1_:TakeOrderScreen = this;
         var _loc2_:UserData = _loc1_.gameObj.var_127;
         var _loc3_:Bitmap = null;
         var _loc5_:MovieClip = new orderSushiriaBackdropMC();
         _loc4_ = 1;
         while(_loc4_ <= 9)
         {
            _loc5_.holder.wallparts["wall" + _loc4_].gotoAndStop(_loc2_.lobbyWallpaper);
            _loc4_++;
         }
         _loc4_ = 1;
         while(_loc4_ <= 7)
         {
            _loc5_.holder.floorparts["floor" + _loc4_].gotoAndStop(_loc2_.lobbyFlooring);
            _loc4_++;
         }
         _loc5_.holder.trim.transform.colorTransform = _loc1_.createColorTransform(_loc2_.lobbyTrim);
         _loc5_.holder.wallparts.mask = _loc5_.holder.wallmask;
         _loc5_.holder.floorparts.mask = _loc5_.holder.floormask;
         var _loc6_:BitmapData;
         (_loc6_ = new BitmapData(706,552,true,0)).draw(_loc5_,null,null,null,new Rectangle(0,0,706,552));
         _loc3_ = new Bitmap(_loc6_);
         _loc5_ = null;
         return _loc3_;
      }
      
      protected function createColorTransform(param1:Number) : ColorTransform
      {
         var _loc2_:ColorTransform = new ColorTransform();
         _loc2_.redMultiplier = ((param1 & 16711680) >>> 16) / 255;
         _loc2_.greenMultiplier = ((param1 & 65280) >>> 8) / 255;
         _loc2_.blueMultiplier = (param1 & 255) / 255;
         return _loc2_;
      }
      
      public function initStationUpgrades() : void
      {
         var _loc1_:TakeOrderScreen = this;
         if(_loc1_.backdropBitmap != null)
         {
            _loc1_.backdropBitmap.bitmapData.dispose();
            try
            {
               _loc1_.clip.backdrop_holder.removeChild(_loc1_.backdropBitmap);
            }
            catch(err:Error)
            {
            }
            _loc1_.backdropBitmap = null;
         }
         _loc1_.backdropBitmap = _loc1_.createLobbyBackdropBitmap();
         _loc1_.clip.backdrop_holder.addChild(_loc1_.backdropBitmap);
         _loc1_.backdropBitmap.x = -24;
         _loc1_.backdropBitmap.y = -40;
         _loc1_.countertopMC = new giveorder_countertop();
         _loc1_.countertopMC.transform.colorTransform = _loc1_.createColorTransform(_loc1_.gameObj.var_127.lobbyTop);
         _loc1_.clip.countertop.addChild(_loc1_.countertopMC);
      }
      
      public function destroyCustomerModel(param1:MovieClip) : void
      {
         var whichClip:MovieClip = param1;
         whichClip.stop();
         try
         {
            whichClip.body.removeChildAt(0);
            whichClip.head.removeChildAt(0);
            whichClip.eyes.removeChildAt(0);
            whichClip.mouth.removeChildAt(0);
            whichClip.neck.removeChildAt(0);
            whichClip.front_shoe.removeChildAt(0);
            whichClip.back_shoe.removeChildAt(0);
            whichClip.fronthand.removeChildAt(0);
            whichClip.backhand.removeChildAt(0);
            whichClip.front_upperarm.removeChildAt(0);
            whichClip.back_upperarm.removeChildAt(0);
            whichClip.front_forearm.removeChildAt(0);
            whichClip.back_forearm.removeChildAt(0);
         }
         catch(err:Error)
         {
            class_6.error("Error removing parts of customer");
         }
         try
         {
            whichClip.hair.removeChildAt(0);
         }
         catch(err:Error)
         {
         }
         try
         {
            whichClip.back_hair.removeChildAt(0);
         }
         catch(err:Error)
         {
         }
      }
      
      public function getTextGlowColor() : uint
      {
         var _loc1_:TakeOrderScreen = this;
         var _loc2_:uint = _loc1_.gameObj.var_127.lobbyTop;
         var _loc3_:uint = uint((_loc2_ & 16711680) >> 16);
         var _loc4_:uint = uint((_loc2_ & 65280) >> 8);
         var _loc5_:uint = uint(_loc2_ & 255);
         0.5;
         _loc3_ *= 0.5;
         _loc4_ *= 0.5;
         _loc5_ *= 0.5;
         return uint(_loc3_ << 16 | _loc4_ << 8 | _loc5_);
      }
      
      public function startCustomerAnimation() : void
      {
         var _loc1_:TakeOrderScreen = this;
         if(_loc1_.whichStep == 0)
         {
            _loc1_.currentCustomer.clip.gotoAndPlay("takeorder");
         }
      }
      
      public function finishCustomerAnimation() : void
      {
         var _loc1_:TakeOrderScreen = this;
         _loc1_.currentCustomer.clip.gotoAndPlay("stand");
      }
   }
}
