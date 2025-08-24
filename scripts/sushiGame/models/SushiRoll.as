package sushiGame.models
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import package_2.class_14;
   import package_2.class_6;
   import package_4.class_5;
   import sushiGame.data.FoodData;
   
   public class SushiRoll
   {
       
      
      public var gameObj:class_5;
      
      public var clip:MovieClip = null;
      
      public var attachedTea:Tea = null;
      
      public var matClip:MovieClip = null;
      
      public var paperClip:MovieClip = null;
      
      public var riceClip:MovieClip = null;
      
      public var warningClip:MovieClip = null;
      
      public var matRollClip:MovieClip = null;
      
      public var plateClip:MovieClip = null;
      
      public var sliceHolder:MovieClip = null;
      
      public var paperType:String = null;
      
      public var riceType:String = null;
      
      public var riceFrame:Number = 1;
      
      public var riceCookAmount:Number = 0;
      
      public var riceVinegarAmount:Number = 0;
      
      public var riceVinegarTime:Number = 0;
      
      public var cookScale:Number = 0.701;
      
      public var cookOffscreenX:Number = 625;
      
      public var cookTargetX:Number = 328;
      
      public var cookTargetY:Number = 422;
      
      public var cookLeaveSpeed:Number = 10;
      
      public var paperTargetX:Number = 229;
      
      public var paperTargetY:Number = -11;
      
      public var riceTargetX:Number = 229;
      
      public var riceTargetY:Number = -16;
      
      public var plateTargetX:Number = 269;
      
      public var plateTargetY:Number = -8;
      
      public var plateOffscreenX:Number = 550;
      
      public var isDraggingOnCook:Boolean = false;
      
      public var wasDraggingOnCook:Boolean = false;
      
      public var isTrashingOnCook:Boolean = false;
      
      public var isLeavingCook:Boolean = false;
      
      public var isLeavingBuild:Boolean = false;
      
      public var isTrashingBuild:Boolean = false;
      
      public var isFlipping:Boolean = false;
      
      public var isFinishFlipping:Boolean = false;
      
      public var isLeavingTea:Boolean = false;
      
      public var isTrashingTea:Boolean = false;
      
      public var isDraggingOnTea:Boolean = false;
      
      public var wasDraggingOnTea:Boolean = false;
      
      public var isFlipped:Boolean = false;
      
      public var buildScale:Number = 1;
      
      public var buildStartX:Number = -430;
      
      public var buildTargetX:Number = 100;
      
      public var buildTargetY:Number = 423;
      
      public var buildLeaveX:Number = 620;
      
      public var buildLeaveSpeed:Number = 10;
      
      public var buildFlipX:Number = -50;
      
      public var buildFlipY:Number = 573;
      
      public var teaScale:Number = 1;
      
      public var teaStartX:Number = -618;
      
      public var teaTargetX:Number = -158;
      
      public var teaTargetY:Number = 432;
      
      public var teaLeaveX:Number = 392;
      
      public var teaTrashX:Number = -900;
      
      public var teaTrashY:Number = 409;
      
      public var teaLeaveSpeed:Number = 10;
      
      public var giveTargetX:Number = -28;
      
      public var giveTargetY:Number = 350;
      
      public var giveTargetScale:Number = 0.45;
      
      public var giveDiningTargetX:Number = 40;
      
      public var giveDiningTargetY:Number = 327;
      
      public var canAddFillings:Boolean = false;
      
      public var filling:SushiFilling = null;
      
      public var fillingXoffset:Number = 43;
      
      public var fillingTopX:Number = 176;
      
      public var fillingTopY:Number = -121;
      
      public var fillingBottomY:Number = -14;
      
      public var fillingWidth:Number = 224;
      
      public var canAddToppings:Boolean = false;
      
      public var toppingTopX:Number = 16;
      
      public var toppingTopY:Number = -154;
      
      public var toppingBottomY:Number = 8;
      
      public var toppingWidth:Number = 191;
      
      public var toppingXoffset:Number = 35;
      
      public var dropTopX:Number = 224;
      
      public var dropTopY:Number = -172;
      
      public var dropBottomY:Number = -58;
      
      public var dropWidth:Number = 100;
      
      public var dropXoffset:Number = 43;
      
      public var isRolling:Boolean = false;
      
      public var rollTimer:Number = 0;
      
      public var rollTimerMax:Number = 30;
      
      public var topping:SushiTopping = null;
      
      public var slices:Vector.<SushiSlice> = null;
      
      public var sliceColumnsX:Array;
      
      public var sliceCenterY:Number = -48;
      
      public var isGivingOrder:Boolean = false;
      
      public var cuttingGuide:MovieClip = null;
      
      public var helperGuide:MovieClip = null;
      
      public var helperGuideLineNum:Number = 7;
      
      public var ticketHolderClip:MovieClip = null;
      
      public var ticketHolderStartX:Number = 647;
      
      public var ticketHolderTargetX:Number = 487;
      
      public var ticketHolderTargetY:Number = 311;
      
      public var ticketHolderSpeed:Number = 2;
      
      public var attachedTicket:Ticket;
      
      public function SushiRoll(param1:class_5, param2:MovieClip)
      {
         this.sliceColumnsX = [172,222,272,322];
         super();
         this.gameObj = param1;
         this.setupRoll(param2);
      }
      
      public function setupRoll(param1:MovieClip) : void
      {
         var _loc2_:SushiRoll = this;
         _loc2_.clip = new MovieClip();
         _loc2_.matClip = new cook_sushi_mat();
         _loc2_.matClip.stop();
         _loc2_.matClip.mouseEnabled = false;
         _loc2_.matClip.mouseChildren = false;
         _loc2_.clip.addChild(_loc2_.matClip);
         _loc2_.clip.scaleX = _loc2_.cookScale;
         _loc2_.clip.scaleY = _loc2_.cookScale;
         _loc2_.clip.y = _loc2_.cookTargetY;
         _loc2_.clip.x = _loc2_.cookOffscreenX;
         param1.addChildAt(_loc2_.clip,0);
      }
      
      public function destroy() : void
      {
         var _loc2_:int = 0;
         var _loc1_:SushiRoll = this;
         if(_loc1_.attachedTicket)
         {
            _loc1_.gameObj.var_152.removeTicket(_loc1_.attachedTicket);
            _loc1_.attachedTicket = null;
         }
         if(_loc1_.ticketHolderClip)
         {
            if(_loc1_.ticketHolderClip.parent)
            {
               _loc1_.ticketHolderClip.parent.removeChild(_loc1_.ticketHolderClip);
            }
            _loc1_.ticketHolderClip = null;
         }
         if(_loc1_.attachedTea)
         {
            _loc1_.attachedTea.destroy();
            _loc1_.attachedTea = null;
         }
         if(_loc1_.cuttingGuide)
         {
            if(_loc1_.cuttingGuide.parent)
            {
               _loc1_.cuttingGuide.parent.removeChild(_loc1_.cuttingGuide);
            }
            _loc1_.cuttingGuide = null;
         }
         if(_loc1_.helperGuide)
         {
            if(_loc1_.helperGuide.parent)
            {
               _loc1_.helperGuide.parent.removeChild(_loc1_.helperGuide);
            }
            _loc1_.helperGuide = null;
         }
         if(_loc1_.slices)
         {
            _loc2_ = int(_loc1_.slices.length - 1);
            while(_loc2_ >= 0)
            {
               if(_loc1_.slices[_loc2_])
               {
                  _loc1_.slices[_loc2_].destroy();
               }
               _loc1_.slices[_loc2_] = null;
               _loc1_.slices.splice(_loc2_,1);
               _loc2_--;
            }
            _loc1_.slices = null;
         }
         if(_loc1_.sliceHolder)
         {
            if(_loc1_.sliceHolder.parent)
            {
               _loc1_.sliceHolder.parent.removeChild(_loc1_.sliceHolder);
            }
            _loc1_.sliceHolder = null;
         }
         if(_loc1_.topping)
         {
            _loc1_.topping.destroy();
            _loc1_.topping = null;
         }
         if(_loc1_.filling)
         {
            _loc1_.filling.destroy();
            _loc1_.filling = null;
         }
         _loc1_.gameObj.removeEventListener(MouseEvent.MOUSE_UP,_loc1_.releaseOnTea);
         _loc1_.gameObj.removeEventListener(MouseEvent.MOUSE_UP,_loc1_.releaseOnCook);
         if(_loc1_.plateClip)
         {
            if(_loc1_.plateClip.parent)
            {
               _loc1_.plateClip.parent.removeChild(_loc1_.plateClip);
            }
            _loc1_.plateClip = null;
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
         if(_loc1_.paperClip)
         {
            if(_loc1_.paperClip.parent)
            {
               _loc1_.paperClip.parent.removeChild(_loc1_.paperClip);
            }
            _loc1_.paperClip.stop();
            _loc1_.paperClip = null;
         }
         if(_loc1_.matClip)
         {
            if(_loc1_.matClip.parent)
            {
               _loc1_.matClip.parent.removeChild(_loc1_.matClip);
            }
            _loc1_.matClip.stop();
            _loc1_.matClip = null;
         }
         if(_loc1_.matRollClip)
         {
            if(_loc1_.matRollClip.parent)
            {
               _loc1_.matRollClip.parent.removeChild(_loc1_.matRollClip);
            }
            _loc1_.matRollClip.stop();
            _loc1_.matRollClip = null;
         }
         if(_loc1_.clip)
         {
            _loc1_.clip.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickOnCook);
            _loc1_.clip.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickOnTea);
            if(_loc1_.clip.parent)
            {
               _loc1_.clip.parent.removeChild(_loc1_.clip);
            }
            _loc1_.clip.stop();
            _loc1_.clip = null;
         }
         _loc1_.gameObj = null;
      }
      
      public function addToCookTrash(param1:MovieClip) : void
      {
         var _loc2_:SushiRoll = this;
         _loc2_.clip.x = -127;
         _loc2_.clip.y = -5;
         param1.addChild(_loc2_.clip);
         _loc2_.isTrashingOnCook = true;
         _loc2_.isDraggingOnCook = false;
         _loc2_.isLeavingCook = false;
      }
      
      public function addPaper(param1:String) : void
      {
         var _loc2_:SushiRoll = this;
         _loc2_.paperType = param1;
         _loc2_.paperClip = class_14.method_103(_loc2_.paperType + "_flat",false,false);
         _loc2_.paperClip.x = _loc2_.paperTargetX;
         _loc2_.paperClip.y = _loc2_.paperTargetY;
         _loc2_.clip.addChild(_loc2_.paperClip);
         _loc2_.clip.mouseEnabled = true;
         _loc2_.clip.buttonMode = true;
         _loc2_.clip.useHandCursor = true;
         _loc2_.clip.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickOnCook);
      }
      
      public function addRice(param1:String, param2:Number, param3:Number, param4:Number) : void
      {
         var _loc5_:SushiRoll;
         (_loc5_ = this).riceType = param1;
         _loc5_.riceCookAmount = param2;
         _loc5_.riceVinegarAmount = param3;
         _loc5_.riceVinegarTime = param4;
         _loc5_.riceClip = class_14.method_103(_loc5_.riceType + "_flat",false,false);
         var _loc6_:Number;
         if((_loc6_ = Math.abs(_loc5_.riceCookAmount - FoodData.getTargetCookTime())) < 300)
         {
            _loc5_.riceFrame = 1;
         }
         else if(_loc6_ < 600)
         {
            _loc5_.riceFrame = 2;
         }
         else if(_loc6_ < 900)
         {
            _loc5_.riceFrame = 3;
         }
         else if(_loc6_ < 1200)
         {
            _loc5_.riceFrame = 4;
         }
         else
         {
            _loc5_.riceFrame = 5;
         }
         _loc5_.riceClip.gotoAndStop(_loc5_.riceFrame);
         _loc5_.riceClip.cacheAsBitmap = true;
         _loc5_.riceClip.x = _loc5_.riceTargetX;
         _loc5_.riceClip.y = _loc5_.riceTargetY;
         _loc5_.clip.addChild(_loc5_.riceClip);
         _loc5_.clip.mouseEnabled = false;
         _loc5_.clip.buttonMode = false;
         _loc5_.clip.removeEventListener(MouseEvent.MOUSE_DOWN,_loc5_.clickOnCook);
         _loc5_.isDraggingOnCook = false;
         _loc5_.hidePaperWarning();
      }
      
      public function clickOnCook(param1:MouseEvent) : void
      {
         var _loc2_:SushiRoll = this;
         if(_loc2_.paperType != null && _loc2_.riceType == null && _loc2_.isTrashingOnCook == false && _loc2_.isLeavingCook == false && !_loc2_.gameObj.training)
         {
            _loc2_.gameObj.var_128.playSound("grabtopping.wav");
            _loc2_.isDraggingOnCook = true;
            _loc2_.wasDraggingOnCook = true;
            _loc2_.gameObj.addEventListener(MouseEvent.MOUSE_UP,_loc2_.releaseOnCook);
            if(!_loc2_.gameObj.var_135.clip.holder.contains(_loc2_.clip))
            {
               _loc2_.gameObj.var_135.clip.holder.addChild(_loc2_.clip);
            }
         }
      }
      
      public function releaseOnCook(param1:MouseEvent) : void
      {
         var _loc2_:SushiRoll = this;
         _loc2_.isDraggingOnCook = false;
         _loc2_.gameObj.removeEventListener(MouseEvent.MOUSE_UP,_loc2_.releaseOnCook);
         var _loc3_:Number = _loc2_.gameObj.var_135.clip.mouseX;
         var _loc4_:Number;
         var _loc5_:Number = (_loc4_ = _loc2_.gameObj.var_135.clip.mouseY) - 117;
         if(_loc2_.gameObj.training == false && _loc4_ >= 117 && _loc4_ <= 217 && _loc3_ > -45 - _loc5_ && _loc3_ < -45 - _loc5_ + 186 && param1 != null)
         {
            _loc2_.gameObj.var_128.playSound("droptopping.wav");
            _loc2_.gameObj.var_128.playSound("trayslide.wav");
            _loc2_.gameObj.var_135.moveSushiToTrash();
         }
         else
         {
            _loc2_.gameObj.var_128.playSound("trayslide.wav");
         }
      }
      
      public function clickOnTea(param1:MouseEvent) : void
      {
         var _loc2_:SushiRoll = this;
         if(_loc2_.isTrashingTea == false && _loc2_.isLeavingTea == false && _loc2_.gameObj.training == false)
         {
            _loc2_.gameObj.var_128.playSound("grabtopping.wav");
            _loc2_.isDraggingOnTea = true;
            _loc2_.gameObj.addEventListener(MouseEvent.MOUSE_UP,_loc2_.releaseOnTea);
         }
      }
      
      public function releaseOnTea(param1:MouseEvent) : void
      {
         var _loc2_:SushiRoll = this;
         _loc2_.isDraggingOnTea = false;
         _loc2_.gameObj.removeEventListener(MouseEvent.MOUSE_UP,_loc2_.releaseOnTea);
         var _loc3_:Number = _loc2_.clip.x;
         var _loc4_:Number;
         var _loc5_:Number = (_loc4_ = _loc2_.clip.y) - 369;
         class_6.method_1("Released Plate on Tea.  X: " + _loc3_ + ", Y:" + _loc4_ + ", DiffTopY: " + _loc5_ + ".   Bounds = Y 369-459, X = -288 --> " + (-288 - _loc5_));
         if(_loc4_ >= 369 && _loc4_ <= 459 && _loc3_ <= -288 - _loc5_ && _loc2_.gameObj.training == false && param1 != null)
         {
            _loc2_.leaveTeaStation(true);
         }
      }
      
      public function showPaperWarning() : void
      {
         var _loc1_:SushiRoll = this;
         if(!_loc1_.warningClip)
         {
            _loc1_.warningClip = new mat_warning();
            _loc1_.warningClip.x = 227;
            _loc1_.warningClip.y = -70;
            _loc1_.clip.addChild(_loc1_.warningClip);
         }
      }
      
      public function hidePaperWarning() : void
      {
         var _loc1_:SushiRoll = this;
         if(_loc1_.warningClip)
         {
            if(_loc1_.warningClip.parent)
            {
               _loc1_.warningClip.parent.removeChild(_loc1_.warningClip);
            }
            _loc1_.warningClip = null;
         }
      }
      
      public function leaveCookStation() : void
      {
         var _loc1_:SushiRoll = this;
         if(_loc1_.gameObj.hud.currentStation == "cook" && !_loc1_.gameObj.hud.duringTransition && _loc1_.gameObj.var_135.getTotalRiceCooking() == 0)
         {
            _loc1_.gameObj.hud.disableStationButtons();
         }
         _loc1_.isLeavingCook = true;
         _loc1_.isDraggingOnCook = false;
         _loc1_.isTrashingOnCook = false;
      }
      
      public function updateSushiOnCook() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc1_:SushiRoll = this;
         if(_loc1_.isLeavingCook)
         {
            _loc1_.clip.x += _loc1_.cookLeaveSpeed;
            _loc1_.clip.y = _loc1_.cookTargetY;
            _loc1_.cookLeaveSpeed += 10;
            if(_loc1_.clip.x > _loc1_.cookOffscreenX)
            {
               _loc1_.gameObj.var_129.addToWaitingOrders(_loc1_);
               _loc1_.gameObj.var_135.removeOrder();
               if(_loc1_.gameObj.hud.currentStation == "cook" && !_loc1_.gameObj.hud.duringTransition && _loc1_.gameObj.hud.clip.build_btn.visible == false)
               {
                  _loc1_.gameObj.hud.startTransition("build");
               }
               else if(_loc1_.gameObj.hud.currentStation == "build")
               {
                  _loc1_.gameObj.var_129.checkForFoodOrder();
               }
               else if(_loc1_.gameObj.hud.currentStation == "cook")
               {
                  _loc1_.gameObj.var_135.checkForFoodOrder();
               }
            }
         }
         else if(_loc1_.isDraggingOnCook)
         {
            _loc2_ = _loc1_.gameObj.var_135.clip.mouseX - 164;
            _loc3_ = _loc1_.gameObj.var_135.clip.mouseY + 51;
            _loc1_.clip.x += (_loc2_ - _loc1_.clip.x) / 2;
            _loc1_.clip.y += (_loc3_ - _loc1_.clip.y) / 2;
            if(_loc1_.gameObj.var_135.clip.mouseX < 0 || _loc1_.gameObj.var_135.clip.mouseY < 0 || _loc1_.gameObj.var_135.clip.mouseX > 640 || _loc1_.gameObj.var_135.clip.mouseY > 480)
            {
               _loc1_.releaseOnCook(null);
            }
         }
         else if(!_loc1_.isTrashingOnCook)
         {
            _loc2_ = _loc1_.cookTargetX;
            _loc3_ = _loc1_.cookTargetY;
            _loc1_.clip.x += (_loc2_ - _loc1_.clip.x) / 2;
            _loc1_.clip.y += (_loc3_ - _loc1_.clip.y) / 2;
            if(Math.abs(_loc2_ - _loc1_.clip.x) <= 1 && Math.abs(_loc3_ - _loc1_.clip.y) <= 1)
            {
               _loc1_.clip.x = _loc1_.cookTargetX;
               _loc1_.clip.y = _loc1_.cookTargetY;
               if(_loc1_.wasDraggingOnCook)
               {
                  if(!_loc1_.gameObj.var_135.clip.tableholder.contains(_loc1_.clip))
                  {
                     _loc1_.gameObj.var_135.clip.tableholder.addChild(_loc1_.clip);
                  }
                  _loc1_.wasDraggingOnCook = false;
               }
            }
         }
      }
      
      public function updateSushiOnTea() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Customer = null;
         var _loc1_:SushiRoll = this;
         if(_loc1_.ticketHolderClip != null)
         {
            _loc4_ = _loc1_.ticketHolderTargetX;
            if(_loc1_.isLeavingTea || _loc1_.isTrashingTea || _loc1_.attachedTea == null)
            {
               _loc4_ = _loc1_.ticketHolderStartX;
            }
            if(_loc1_.ticketHolderClip.x != _loc4_)
            {
               _loc5_ = _loc4_ - _loc1_.ticketHolderClip.x;
               _loc1_.ticketHolderClip.x += _loc5_ / _loc1_.ticketHolderSpeed;
               if(Math.abs(_loc5_) <= 1)
               {
                  _loc1_.ticketHolderClip.x = _loc4_;
               }
            }
         }
         if(!_loc1_.isGivingOrder)
         {
            if(_loc1_.isTrashingTea)
            {
               _loc2_ = _loc1_.teaTrashX;
               _loc3_ = _loc1_.teaTrashY;
               _loc1_.clip.x += (_loc2_ - _loc1_.clip.x) / 2;
               _loc1_.clip.y += (_loc3_ - _loc1_.clip.y) / 2;
               if(Math.abs(_loc2_ - _loc1_.clip.x) <= 1 && Math.abs(_loc3_ - _loc1_.clip.y) <= 1)
               {
                  _loc1_.gameObj.var_137.removeOrder(true);
                  return;
               }
            }
            else if(_loc1_.isLeavingTea)
            {
               _loc1_.clip.x += _loc1_.teaLeaveSpeed;
               _loc1_.clip.y = _loc1_.teaTargetY;
               _loc1_.teaLeaveSpeed += 10;
               if(_loc1_.clip.x > _loc1_.teaLeaveX)
               {
                  if((_loc6_ = _loc1_.gameObj.var_133.getWaitingCustomer(_loc1_.attachedTicket.customerType)) != null && _loc6_.isWaiter)
                  {
                     _loc1_.gameObj.hud.startTransition("diningGiveOrder");
                  }
                  else
                  {
                     _loc1_.gameObj.hud.startTransition("giveOrder");
                  }
                  return;
               }
            }
            else if(_loc1_.isDraggingOnTea)
            {
               _loc2_ = _loc1_.gameObj.var_137.clip.mouseX - 424;
               _loc3_ = _loc1_.gameObj.var_137.clip.mouseY + 58;
               _loc1_.clip.x += (_loc2_ - _loc1_.clip.x) / 2;
               _loc1_.clip.y += (_loc3_ - _loc1_.clip.y) / 2;
               if(_loc1_.clip.y > _loc1_.teaTargetY)
               {
                  _loc1_.clip.y = _loc1_.teaTargetY;
               }
               if(_loc1_.clip.x > _loc1_.teaTargetX)
               {
                  _loc1_.clip.x = _loc1_.teaTargetX;
               }
               if(_loc1_.gameObj.var_137.clip.mouseX < 0 || _loc1_.gameObj.var_137.clip.mouseY < 0 || _loc1_.gameObj.var_137.clip.mouseX > 640 || _loc1_.gameObj.var_137.clip.mouseY > 480)
               {
                  _loc1_.releaseOnTea(null);
               }
            }
            else if(_loc1_.clip.x != _loc1_.teaTargetX || _loc1_.clip.y != _loc1_.teaTargetY)
            {
               _loc2_ = _loc1_.teaTargetX;
               _loc3_ = _loc1_.teaTargetY;
               _loc1_.clip.x += (_loc2_ - _loc1_.clip.x) / 2;
               _loc1_.clip.y += (_loc3_ - _loc1_.clip.y) / 2;
               if(Math.abs(_loc2_ - _loc1_.clip.x) <= 1 && Math.abs(_loc3_ - _loc1_.clip.y) <= 1)
               {
                  _loc1_.clip.x = _loc1_.teaTargetX;
                  _loc1_.clip.y = _loc1_.teaTargetY;
                  if(_loc1_.attachedTea == null)
                  {
                     if(Boolean(_loc1_.gameObj) && Boolean(_loc1_.gameObj.var_137))
                     {
                        _loc1_.gameObj.var_137.showDottedLine();
                     }
                  }
               }
            }
         }
      }
      
      public function updateSushiOnBuild() : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc1_:SushiRoll = this;
         if(_loc1_.filling)
         {
            _loc1_.filling.updateFilling();
         }
         if(_loc1_.topping)
         {
            _loc1_.topping.updateTopping();
         }
         if(_loc1_.slices)
         {
            _loc2_ = int(_loc1_.slices.length - 1);
            while(_loc2_ >= 0)
            {
               if(_loc1_.slices[_loc2_])
               {
                  _loc1_.slices[_loc2_].updateSlice();
               }
               _loc2_--;
            }
         }
         if(_loc1_.plateClip)
         {
            _loc3_ = _loc1_.plateOffscreenX;
            if(Boolean(_loc1_.slices) && _loc1_.slices.length > 0)
            {
               _loc3_ = _loc1_.plateTargetX;
            }
            else if(_loc1_.gameObj && _loc1_.gameObj.var_129 && _loc1_.gameObj.var_129.knife && !_loc1_.gameObj.var_129.knife.isReturning)
            {
               _loc3_ = _loc1_.plateTargetX;
            }
            if(_loc1_.plateClip.x != _loc3_)
            {
               _loc1_.plateClip.x += (_loc3_ - _loc1_.plateClip.x) / 3;
               if(Math.abs(_loc3_ - _loc1_.plateClip.x) <= 1)
               {
                  _loc1_.plateClip.x = _loc3_;
               }
            }
         }
         if(_loc1_.isRolling)
         {
            ++_loc1_.rollTimer;
            if(_loc1_.matRollClip)
            {
               _loc1_.matRollClip.nextFrame();
               if(_loc1_.matClip)
               {
                  _loc1_.matClip.gotoAndStop(_loc1_.matRollClip.currentFrame);
               }
               if(_loc1_.matRollClip.currentFrame == 12)
               {
                  _loc1_.topping = new SushiTopping(_loc1_.gameObj,_loc1_);
               }
               else if(_loc1_.matRollClip.currentFrame == 16)
               {
                  if(_loc1_.riceClip)
                  {
                     _loc1_.riceClip.stop();
                     if(_loc1_.riceClip.parent)
                     {
                        _loc1_.riceClip.parent.removeChild(_loc1_.riceClip);
                     }
                     _loc1_.riceClip = null;
                  }
                  if(_loc1_.paperClip)
                  {
                     _loc1_.paperClip.stop();
                     if(_loc1_.paperClip.parent)
                     {
                        _loc1_.paperClip.parent.removeChild(_loc1_.paperClip);
                     }
                     _loc1_.paperClip = null;
                  }
                  if(_loc1_.filling)
                  {
                     _loc1_.filling.clearLayoutFillings();
                  }
               }
               else if(_loc1_.matRollClip.currentFrame == 18)
               {
                  if(_loc1_.matClip)
                  {
                     _loc1_.matClip.stop();
                     if(_loc1_.matClip.parent)
                     {
                        _loc1_.matClip.parent.removeChild(_loc1_.matClip);
                     }
                     _loc1_.matClip = null;
                  }
               }
               else if(_loc1_.matRollClip.currentFrame == _loc1_.matRollClip.totalFrames)
               {
                  _loc1_.matRollClip.stop();
                  if(_loc1_.matRollClip.parent)
                  {
                     _loc1_.matRollClip.parent.removeChild(_loc1_.matRollClip);
                  }
                  _loc1_.matRollClip = null;
                  _loc1_.gameObj.var_128.playSound("trayslide.wav");
               }
            }
            if(_loc1_.rollTimer >= _loc1_.rollTimerMax)
            {
               class_6.method_1("DONE ROLLING");
               _loc1_.isRolling = false;
               _loc1_.canAddToppings = true;
            }
         }
         else if(_loc1_.isLeavingBuild)
         {
            _loc1_.clip.x += _loc1_.buildLeaveSpeed;
            _loc1_.clip.y = _loc1_.buildTargetY;
            if(Boolean(_loc1_.topping) && Boolean(_loc1_.topping.looseBitmap))
            {
               _loc1_.topping.looseBitmap.x -= _loc1_.buildLeaveSpeed;
            }
            _loc1_.buildLeaveSpeed += 10;
            if(_loc1_.clip.x > _loc1_.buildLeaveX)
            {
               if(_loc1_.isTrashingBuild != false)
               {
                  _loc1_.gameObj.var_129.removeOrder(true);
                  return;
               }
               _loc1_.gameObj.var_137.addToWaitingOrders(_loc1_);
               _loc1_.gameObj.var_129.removeOrder();
               if(_loc1_.gameObj.hud.currentStation == "build" && !_loc1_.gameObj.hud.duringTransition)
               {
                  _loc1_.gameObj.hud.startTransition("tea");
               }
               else if(_loc1_.gameObj.hud.currentStation == "tea")
               {
                  _loc1_.gameObj.var_137.checkForFoodOrder();
               }
            }
         }
         else if(_loc1_.isFlipping && !_loc1_.isFinishFlipping)
         {
            _loc3_ = _loc1_.buildFlipX;
            _loc4_ = _loc1_.buildFlipY;
            if(_loc1_.clip.x != _loc3_ || _loc1_.clip.y != _loc4_)
            {
               _loc1_.clip.x += (_loc3_ - _loc1_.clip.x) / 2;
               _loc1_.clip.y += (_loc4_ - _loc1_.clip.y) / 2;
               if(Math.abs(_loc3_ - _loc1_.clip.x) <= 1 && Math.abs(_loc4_ - _loc1_.clip.y) <= 1)
               {
                  _loc1_.clip.x = _loc3_;
                  _loc1_.clip.y = _loc4_;
                  if(!_loc1_.isFlipped)
                  {
                     _loc1_.riceClip.x = _loc1_.riceTargetX + 3;
                     _loc1_.riceClip.y = _loc1_.riceTargetY + 8;
                     _loc1_.clip.swapChildren(_loc1_.riceClip,_loc1_.paperClip);
                     _loc1_.isFlipped = true;
                  }
                  else
                  {
                     _loc1_.riceClip.x = _loc1_.riceTargetX;
                     _loc1_.riceClip.y = _loc1_.riceTargetY;
                     _loc1_.clip.swapChildren(_loc1_.riceClip,_loc1_.paperClip);
                     _loc1_.isFlipped = false;
                  }
                  _loc1_.isFinishFlipping = true;
                  _loc1_.gameObj.var_128.playSound("trayslide.wav");
               }
            }
         }
         else if(_loc1_.isFlipping && _loc1_.isFinishFlipping)
         {
            _loc3_ = _loc1_.buildTargetX;
            _loc4_ = _loc1_.buildTargetY;
            if(_loc1_.clip.x != _loc3_ || _loc1_.clip.y != _loc4_)
            {
               _loc1_.clip.x += (_loc3_ - _loc1_.clip.x) / 3;
               _loc1_.clip.y += (_loc4_ - _loc1_.clip.y) / 3;
               if(Math.abs(_loc3_ - _loc1_.clip.x) <= 1 && Math.abs(_loc4_ - _loc1_.clip.y) <= 1)
               {
                  _loc1_.clip.x = _loc3_;
                  _loc1_.clip.y = _loc4_;
                  _loc1_.isFinishFlipping = false;
                  _loc1_.isFlipping = false;
                  _loc1_.canAddFillings = true;
               }
            }
         }
         else
         {
            _loc3_ = _loc1_.buildTargetX;
            _loc4_ = _loc1_.buildTargetY;
            if(_loc1_.clip.x != _loc3_ || _loc1_.clip.y != _loc4_)
            {
               _loc1_.clip.x += (_loc3_ - _loc1_.clip.x) / 2;
               _loc1_.clip.y += (_loc4_ - _loc1_.clip.y) / 2;
               if(Math.abs(_loc3_ - _loc1_.clip.x) <= 1 && Math.abs(_loc4_ - _loc1_.clip.y) <= 1)
               {
                  _loc1_.clip.x = _loc3_;
                  _loc1_.clip.y = _loc4_;
               }
               _loc1_.canAddFillings = true;
            }
         }
      }
      
      public function moveToBuildStation(param1:MovieClip) : void
      {
         var _loc2_:SushiRoll = this;
         _loc2_.clip.scaleX = _loc2_.buildScale;
         _loc2_.clip.scaleY = _loc2_.buildScale;
         _loc2_.clip.x = _loc2_.buildStartX;
         _loc2_.clip.y = _loc2_.buildTargetY;
         param1.addChild(_loc2_.clip);
         _loc2_.clip.mouseEnabled = false;
         _loc2_.clip.mouseChildren = false;
         _loc2_.filling = new SushiFilling(_loc2_.gameObj,_loc2_);
      }
      
      public function sendToBuildTrash() : void
      {
         var _loc1_:SushiRoll = this;
         _loc1_.isLeavingBuild = true;
         _loc1_.isTrashingBuild = true;
         if(Boolean(_loc1_.slices) && _loc1_.slices.length == 8)
         {
            if(Boolean(_loc1_.gameObj) && Boolean(_loc1_.gameObj.var_137))
            {
               _loc1_.gameObj.var_137.recordThrowAway();
            }
         }
      }
      
      public function leaveBuildStation() : void
      {
         var _loc1_:SushiRoll = this;
         if(_loc1_.gameObj.hud.currentStation == "build" && !_loc1_.gameObj.hud.duringTransition)
         {
            _loc1_.gameObj.hud.disableStationButtons();
         }
         _loc1_.isLeavingBuild = true;
         _loc1_.isTrashingBuild = false;
         _loc1_.gameObj.var_128.playSound("trayslide.wav");
      }
      
      public function moveToTeaStation(param1:MovieClip) : void
      {
         var _loc2_:SushiRoll = this;
         _loc2_.clip.scaleX = _loc2_.teaScale;
         _loc2_.clip.scaleY = _loc2_.teaScale;
         _loc2_.clip.x = _loc2_.teaStartX;
         _loc2_.clip.y = _loc2_.teaTargetY;
         param1.addChild(_loc2_.clip);
         _loc2_.topping.removeLooseBitmap();
         _loc2_.clip.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickOnTea);
         _loc2_.clip.mouseEnabled = true;
         if(_loc2_.helperGuide)
         {
            if(_loc2_.helperGuide.parent)
            {
               _loc2_.helperGuide.parent.removeChild(_loc2_.helperGuide);
            }
            _loc2_.helperGuide = null;
         }
         _loc2_.gameObj.var_128.playSound("trayslide.wav");
      }
      
      public function leaveTeaStation(param1:Boolean = false) : void
      {
         var _loc2_:SushiRoll = this;
         if(!param1)
         {
            if(_loc2_.gameObj.hud.currentStation == "tea" && !_loc2_.gameObj.hud.duringTransition)
            {
               _loc2_.gameObj.hud.disableStationButtons();
            }
         }
         _loc2_.isLeavingTea = true;
         _loc2_.isTrashingTea = param1;
         _loc2_.clip.mouseEnabled = false;
         _loc2_.clip.mouseChildren = false;
         _loc2_.clip.buttonMode = false;
         _loc2_.clip.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickOnTea);
         if(param1)
         {
            if(Boolean(_loc2_.gameObj) && Boolean(_loc2_.gameObj.var_137))
            {
               _loc2_.gameObj.var_137.recordThrowAway();
            }
         }
         if(_loc2_.attachedTea)
         {
            if(param1)
            {
               _loc2_.attachedTea.returnToMachine();
               _loc2_.attachedTea = null;
            }
            else
            {
               _loc2_.attachedTea.leaveForDelivery();
            }
         }
         if(Boolean(_loc2_.gameObj) && Boolean(_loc2_.gameObj.var_137))
         {
            _loc2_.gameObj.var_137.hideDottedLine();
         }
         _loc2_.gameObj.var_128.playSound("trayslide.wav");
      }
      
      public function isWithinFillingArea(param1:Number, param2:Number, param3:Number) : Boolean
      {
         var _loc4_:SushiRoll = this;
         param1 -= _loc4_.clip.x;
         param2 -= _loc4_.clip.y;
         var _loc5_:Number = param2 - _loc4_.fillingTopY;
         if(param2 > _loc4_.fillingTopY + param3 && param2 < _loc4_.fillingBottomY && param1 > _loc4_.fillingTopX - _loc5_ && param1 < _loc4_.fillingTopX - _loc5_ + _loc4_.fillingWidth)
         {
            return true;
         }
         return false;
      }
      
      public function isWithinMatArea(param1:Number, param2:Number, param3:Number, param4:Boolean = false) : Boolean
      {
         var _loc5_:SushiRoll = this;
         param1 -= _loc5_.clip.x;
         param2 -= _loc5_.clip.y;
         var _loc6_:Number = param2 - _loc5_.fillingTopY - 19;
         if(param2 > _loc5_.fillingTopY - 19 + param3 && (param2 < _loc5_.fillingBottomY + 17 || param4) && param1 > _loc5_.fillingTopX - 13 - _loc6_ && param1 < _loc5_.fillingTopX - 13 - _loc6_ + _loc5_.fillingWidth + 13)
         {
            return true;
         }
         return false;
      }
      
      public function isWithinDropArea(param1:Number, param2:Number, param3:Number) : Boolean
      {
         var _loc4_:SushiRoll = this;
         var _loc5_:Number = param1;
         var _loc6_:Number = param2;
         param1 -= _loc4_.clip.x;
         param2 -= _loc4_.clip.y;
         var _loc7_:Number = param2 - _loc4_.dropTopY;
         if(param2 >= _loc4_.dropTopY + param3 && param2 <= _loc4_.dropBottomY && param1 >= _loc4_.dropTopX - _loc7_ && param1 <= _loc4_.dropTopX - _loc7_ + _loc4_.dropWidth)
         {
            return true;
         }
         return false;
      }
      
      public function isWithinToppingArea(param1:Number, param2:Number, param3:Number) : Boolean
      {
         var _loc4_:SushiRoll = this;
         param1 -= _loc4_.clip.x;
         param2 -= _loc4_.clip.y;
         if(_loc4_.topping)
         {
            param1 -= _loc4_.topping.clipTargetX;
            param2 -= _loc4_.topping.clipTargetY;
         }
         var _loc5_:Number = param2 - _loc4_.toppingTopY;
         if(param2 > _loc4_.toppingTopY + param3 && param2 < _loc4_.toppingBottomY && param1 > _loc4_.toppingTopX - _loc5_ && param1 < _loc4_.toppingTopX - _loc5_ + _loc4_.toppingWidth)
         {
            return true;
         }
         return false;
      }
      
      public function getDropXatY(param1:Number, param2:Boolean = false) : Number
      {
         var _loc3_:SushiRoll = this;
         if(param2)
         {
            param1 -= _loc3_.clip.y;
         }
         var _loc4_:Number = param1 - _loc3_.dropTopY;
         if(param2)
         {
            return _loc3_.dropTopX - _loc4_ + _loc3_.dropXoffset + _loc3_.clip.x;
         }
         return _loc3_.dropTopX - _loc4_ + _loc3_.dropXoffset;
      }
      
      public function getDropY(param1:Number, param2:Number) : Number
      {
         var _loc3_:SushiRoll = this;
         param1 -= _loc3_.clip.y;
         if(param1 < _loc3_.dropTopY + param2)
         {
            param1 = _loc3_.dropTopY + param2;
         }
         else if(param1 > _loc3_.dropBottomY)
         {
            param1 = _loc3_.dropBottomY;
         }
         return param1 + _loc3_.clip.y;
      }
      
      public function getFillingXatY(param1:Number, param2:Boolean = false) : Number
      {
         var _loc3_:SushiRoll = this;
         if(param2)
         {
            param1 -= _loc3_.clip.y;
         }
         var _loc4_:Number = param1 - _loc3_.fillingTopY;
         if(param2)
         {
            return _loc3_.fillingTopX - _loc4_ + _loc3_.fillingXoffset + _loc3_.clip.x;
         }
         return _loc3_.fillingTopX - _loc4_ + _loc3_.fillingXoffset;
      }
      
      public function getFillingOverlapPercent(param1:Number, param2:Number, param3:String) : Number
      {
         this;
         return this.filling.getFillingOverlap(param1,param2,param3);
      }
      
      public function getToppingOverlapPercent(param1:Number, param2:Number, param3:String) : Number
      {
         var _loc4_:SushiRoll;
         if((_loc4_ = this).topping)
         {
            return _loc4_.topping.getDropOverlap(param1,param2,param3);
         }
         return 1;
      }
      
      public function getFillingHeightOffsetAtY(param1:Number, param2:Number) : Number
      {
         var _loc3_:SushiRoll = this;
         param1 -= _loc3_.clip.y;
         if(_loc3_.filling)
         {
            return _loc3_.filling.getHeightMapTarget(param1,param2);
         }
         return 0;
      }
      
      public function flipSushi() : void
      {
         var _loc1_:SushiRoll = this;
         _loc1_.isFlipping = true;
         _loc1_.canAddFillings = false;
         _loc1_.gameObj.var_128.playSound("trayslide.wav");
      }
      
      public function rollSushi() : void
      {
         var _loc1_:SushiRoll = this;
         _loc1_.isRolling = true;
         _loc1_.rollTimer = 0;
         _loc1_.matRollClip = new build_sushi_rollup();
         _loc1_.matRollClip.x = 229.2;
         _loc1_.matRollClip.y = -68.1;
         _loc1_.clip.addChild(_loc1_.matRollClip);
         _loc1_.matRollClip.nextFrame();
         _loc1_.canAddFillings = false;
      }
      
      public function isPouring() : Boolean
      {
         var _loc1_:SushiRoll = this;
         if(_loc1_.topping)
         {
            return _loc1_.topping.isPouring;
         }
         return false;
      }
      
      public function stopPouring() : void
      {
         var _loc1_:SushiRoll = this;
         if(_loc1_.topping)
         {
            _loc1_.topping.stopPouring();
         }
      }
      
      public function addPlate() : void
      {
         var _loc1_:SushiRoll = this;
         if(_loc1_.plateClip == null)
         {
            _loc1_.plateClip = new build_plate();
            _loc1_.plateClip.x = _loc1_.plateOffscreenX;
            _loc1_.plateClip.y = _loc1_.plateTargetY;
            _loc1_.clip.addChildAt(_loc1_.plateClip,0);
         }
      }
      
      public function updateHelperLines() : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc1_:SushiRoll = this;
         try
         {
            if(_loc1_.helperGuide)
            {
               if(_loc1_.slices != null && _loc1_.slices.length > 0)
               {
                  _loc3_ = 0;
                  _loc4_ = 106;
                  _loc2_ = 0;
                  while(_loc2_ < _loc1_.slices.length)
                  {
                     if(_loc1_.slices[_loc2_] && _loc1_.slices[_loc2_].isOnPlate == false && _loc1_.slices[_loc2_].movingToPlate == false)
                     {
                        _loc3_ = _loc1_.slices[_loc2_].startingY;
                        _loc4_ = _loc1_.slices[_loc2_].endingY;
                        break;
                     }
                     _loc2_++;
                  }
                  _loc5_ = 106 / 8;
                  _loc2_ = 0;
                  while(_loc2_ < _loc1_.helperGuideLineNum)
                  {
                     if((_loc6_ = (_loc2_ + 1) * _loc5_) <= _loc3_ + 2 || _loc6_ >= _loc4_ - 2)
                     {
                        _loc1_.helperGuide["line" + _loc2_].visible = false;
                     }
                     else
                     {
                        _loc1_.helperGuide["line" + _loc2_].visible = true;
                     }
                     _loc2_++;
                  }
               }
            }
         }
         catch(err:Error)
         {
         }
      }
      
      public function sliceSushi(param1:Number) : Boolean
      {
         var _loc5_:SushiSlice = null;
         var _loc6_:Number = NaN;
         var _loc7_:SushiSlice = null;
         var _loc2_:SushiRoll = this;
         _loc2_.gameObj.method_104(22);
         if(Boolean(_loc2_.gameObj.var_129) && Boolean(_loc2_.gameObj.var_129.trainingGuide))
         {
            _loc2_.gameObj.var_129.removeTrainingGuide();
            if(_loc2_.gameObj.training)
            {
               _loc2_.addCuttingGuide(true);
            }
         }
         param1 = Math.round(param1);
         class_6.method_1("Slice Sushi at " + param1);
         if(Boolean(_loc2_.topping) && _loc2_.topping.isFlattened == false)
         {
            _loc2_.topping.flattenForSlicing();
            if(_loc2_.gameObj.var_129)
            {
               _loc2_.gameObj.var_129.switchMode(_loc2_.gameObj.var_129.MODE_CUTTING);
            }
            if(!_loc2_.sliceHolder)
            {
               _loc2_.sliceHolder = new MovieClip();
               _loc2_.clip.addChild(_loc2_.sliceHolder);
            }
         }
         if(_loc2_.slices == null)
         {
            _loc2_.slices = new Vector.<SushiSlice>();
            _loc5_ = new SushiSlice(_loc2_.gameObj,_loc2_,0,_loc2_.filling.heightMapRange);
            _loc2_.slices.push(_loc5_);
         }
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.slices.length)
         {
            if(Boolean(_loc2_.slices[_loc4_]) && _loc2_.slices[_loc4_].isWithinSlice(param1))
            {
               _loc6_ = _loc2_.slices[_loc4_].trimSlice(param1);
               _loc7_ = new SushiSlice(_loc2_.gameObj,_loc2_,param1,_loc6_);
               _loc2_.slices.push(_loc7_);
               if(_loc7_.getSliceSize() < _loc2_.slices[_loc4_].getSliceSize())
               {
                  _loc7_.moveToPlate();
                  _loc2_.slices[_loc4_].stayForCutting(false);
               }
               else
               {
                  _loc2_.slices[_loc4_].moveToPlate();
                  _loc7_.stayForCutting(true);
               }
               _loc3_ = true;
               break;
            }
            _loc4_++;
         }
         if(_loc3_)
         {
            _loc2_.depthSortSlices();
         }
         else
         {
            class_6.error("ERROR -- Couldn\'t find any slices to trim to create this slice!");
         }
         _loc2_.updateHelperLines();
         return _loc3_;
      }
      
      public function moveLastSlice() : void
      {
         var _loc2_:int = 0;
         var _loc1_:SushiRoll = this;
         _loc1_.gameObj.method_104(23);
         if(_loc1_.gameObj.var_129)
         {
            _loc1_.gameObj.var_129.removeTrainingGuide();
         }
         if(_loc1_.slices)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc1_.slices.length)
            {
               if(_loc1_.slices[_loc2_] && _loc1_.slices[_loc2_].isOnPlate == false && _loc1_.slices[_loc2_].movingToPlate == false)
               {
                  _loc1_.slices[_loc2_].moveToPlate(true);
                  break;
               }
               _loc2_++;
            }
            _loc1_.depthSortSlices();
            if(_loc1_.gameObj.hud.currentStation == "build" && !_loc1_.gameObj.hud.duringTransition)
            {
               _loc1_.gameObj.hud.disableStationButtons();
            }
         }
      }
      
      public function isLastSliceSmall() : Boolean
      {
         var _loc3_:int = 0;
         var _loc1_:SushiRoll = this;
         var _loc2_:Boolean = false;
         if(_loc1_.slices)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc1_.slices.length)
            {
               if(_loc1_.slices[_loc3_] && _loc1_.slices[_loc3_].isOnPlate == false && _loc1_.slices[_loc3_].movingToPlate == false)
               {
                  if(_loc1_.slices[_loc3_].getSliceSize() <= 10)
                  {
                     _loc2_ = true;
                  }
                  break;
               }
               _loc3_++;
            }
         }
         return _loc2_;
      }
      
      public function isKnifeBehindSlice(param1:Number) : Boolean
      {
         var _loc4_:int = 0;
         var _loc2_:SushiRoll = this;
         var _loc3_:Boolean = false;
         if(_loc2_.slices)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc2_.slices.length)
            {
               if(_loc2_.slices[_loc4_] && _loc2_.slices[_loc4_].isOnPlate == false && _loc2_.slices[_loc4_].movingToPlate == false)
               {
                  class_6.method_1("Check for behind -- knife at " + Math.round(param1) + ", slice startingY = " + _loc2_.slices[_loc4_].startingY);
                  if(Math.round(param1) <= _loc2_.slices[_loc4_].startingY)
                  {
                     _loc3_ = true;
                  }
                  break;
               }
               _loc4_++;
            }
         }
         return _loc3_;
      }
      
      public function getStaticSliceDepth() : Number
      {
         var _loc3_:int = 0;
         var _loc1_:SushiRoll = this;
         var _loc2_:Number = 0;
         try
         {
            if(_loc1_.slices)
            {
               _loc3_ = 0;
               while(_loc3_ < _loc1_.slices.length)
               {
                  if(_loc1_.slices[_loc3_] && _loc1_.slices[_loc3_].isOnPlate == false && _loc1_.slices[_loc3_].movingToPlate == false)
                  {
                     _loc2_ = _loc1_.sliceHolder.getChildIndex(_loc1_.slices[_loc3_].clip);
                     break;
                  }
                  _loc3_++;
               }
            }
         }
         catch(err:Error)
         {
         }
         return _loc2_;
      }
      
      public function depthSortSlices() : void
      {
         var _loc2_:int = 0;
         var _loc1_:SushiRoll = this;
         if(_loc1_.slices)
         {
            _loc1_.slices = _loc1_.slices.sort(_loc1_.sortCompareFunction);
            _loc2_ = 0;
            while(_loc2_ < _loc1_.slices.length)
            {
               _loc1_.sliceHolder.setChildIndex(_loc1_.slices[_loc2_].clip,_loc2_);
               _loc2_++;
            }
         }
      }
      
      public function sortCompareFunction(param1:SushiSlice, param2:SushiSlice) : Number
      {
         this;
         var _loc4_:Number = 0;
         if(param1.whichColumn == -1)
         {
            if(param1.wasOtherSliceBehind)
            {
               _loc4_ = 1;
            }
            else if(param1.wasOtherSliceBehind == false)
            {
               _loc4_ = -1;
            }
         }
         else if(param2.whichColumn == -1)
         {
            if(param2.wasOtherSliceBehind)
            {
               _loc4_ = -1;
            }
            else if(param2.wasOtherSliceBehind == false)
            {
               _loc4_ = 1;
            }
         }
         else if(param1.whichColumn > param2.whichColumn)
         {
            _loc4_ = 1;
         }
         else if(param1.whichColumn < param2.whichColumn)
         {
            _loc4_ = -1;
         }
         else if(param1.whichColumn == param2.whichColumn)
         {
            if(param1.columnDepthIndex < param2.columnDepthIndex)
            {
               _loc4_ = -1;
            }
            else
            {
               _loc4_ = 1;
            }
         }
         return _loc4_;
      }
      
      public function getColumnForSlice(param1:Number) : Number
      {
         var _loc3_:int = 0;
         var _loc2_:SushiRoll = this;
         var _loc4_:Array = [54,54,54,54];
         _loc3_ = 0;
         while(_loc3_ < _loc2_.sliceColumnsX.length)
         {
            _loc4_[_loc3_] -= _loc2_.getSpaceUsedInColumn(_loc3_,null,true);
            _loc3_++;
         }
         var _loc5_:Number = -99999;
         var _loc6_:Number = -1;
         _loc3_ = int(_loc4_.length - 1);
         while(_loc3_ >= 0)
         {
            if(_loc4_[_loc3_] > _loc5_)
            {
               _loc5_ = Number(_loc4_[_loc3_]);
               _loc6_ = _loc3_;
            }
            _loc3_--;
         }
         return _loc6_;
      }
      
      public function getNumSlicesInColumn(param1:Number, param2:SushiSlice = null) : Number
      {
         var _loc3_:SushiRoll = this;
         var _loc4_:Number = 0;
         var _loc5_:int = int(_loc3_.slices.length - 1);
         while(_loc5_ >= 0)
         {
            if(_loc3_.slices[_loc5_] && _loc3_.slices[_loc5_].whichColumn == param1 && _loc3_.slices[_loc5_] != param2)
            {
               _loc4_ += 1;
            }
            _loc5_--;
         }
         return _loc4_;
      }
      
      public function getSizesInColumn(param1:Number) : Array
      {
         var _loc4_:int = 0;
         var _loc2_:SushiRoll = this;
         var _loc3_:Array = [];
         _loc4_ = 0;
         while(_loc4_ < _loc2_.slices.length)
         {
            if(Boolean(_loc2_.slices[_loc4_]) && _loc2_.slices[_loc4_].whichColumn == param1)
            {
               _loc3_[_loc2_.slices[_loc4_].columnDepthIndex] = _loc2_.slices[_loc4_].getSliceSize();
            }
            _loc4_++;
         }
         _loc4_ = int(_loc3_.length - 1);
         while(_loc4_ >= 0)
         {
            if(_loc3_[_loc4_] == undefined)
            {
               _loc3_.splice(_loc4_,1);
            }
            _loc4_--;
         }
         return _loc3_;
      }
      
      public function getSpaceUsedInColumn(param1:Number, param2:SushiSlice = null, param3:Boolean = false) : Number
      {
         var _loc4_:SushiRoll = this;
         var _loc5_:Number = 0;
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_.slices.length)
         {
            if(_loc4_.slices[_loc6_] && _loc4_.slices[_loc6_].whichColumn == param1 && _loc4_.slices[_loc6_] != param2)
            {
               _loc5_ += _loc4_.slices[_loc6_].getSliceSize();
               if(_loc4_.slices[_loc6_].columnDepthIndex > 0 && param3)
               {
                  _loc5_ += _loc4_.slices[_loc6_].paddingBetweenSlices;
               }
            }
            _loc6_++;
         }
         return _loc5_;
      }
      
      public function adjustSlicePositionsInColumn(param1:Number) : void
      {
         var _loc2_:SushiRoll = this;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.slices.length)
         {
            if(Boolean(_loc2_.slices[_loc3_]) && _loc2_.slices[_loc3_].whichColumn == param1)
            {
               _loc2_.slices[_loc3_].adjustPositionInColumn();
            }
            _loc3_++;
         }
      }
      
      public function addTea(param1:Tea) : void
      {
         var _loc2_:SushiRoll = this;
         _loc2_.attachedTea = param1;
         _loc2_.gameObj.method_104(33);
         _loc2_.addTicketHolder();
         if(Boolean(_loc2_.gameObj) && Boolean(_loc2_.gameObj.var_137))
         {
            _loc2_.gameObj.var_137.hideDottedLine();
         }
      }
      
      public function removeTea() : void
      {
         var _loc1_:SushiRoll = this;
         _loc1_.attachedTea = null;
         if(_loc1_.gameObj && _loc1_.gameObj.var_137 && _loc1_.isLeavingTea == false && _loc1_.isGivingOrder == false)
         {
            _loc1_.gameObj.var_137.showDottedLine();
         }
      }
      
      public function moveToGiveOrder(param1:MovieClip) : void
      {
         var _loc2_:SushiRoll = this;
         if(_loc2_.attachedTea)
         {
            _loc2_.attachedTea.moveToGiveOrder(param1,false);
         }
         _loc2_.isGivingOrder = true;
         _loc2_.isLeavingTea = false;
         param1.addChild(_loc2_.clip);
         _loc2_.clip.x = _loc2_.giveTargetX;
         _loc2_.clip.y = _loc2_.giveTargetY;
         _loc2_.clip.scaleX = _loc2_.giveTargetScale;
         _loc2_.clip.scaleY = _loc2_.giveTargetScale;
         if(_loc2_.ticketHolderClip)
         {
            _loc2_.ticketHolderClip.visible = false;
         }
      }
      
      public function moveToGiveDiningOrder(param1:MovieClip) : void
      {
         var _loc2_:SushiRoll = this;
         _loc2_.isGivingOrder = true;
         _loc2_.isLeavingTea = false;
         param1.addChild(_loc2_.clip);
         _loc2_.clip.x = _loc2_.giveDiningTargetX;
         _loc2_.clip.y = _loc2_.giveDiningTargetY;
         _loc2_.clip.scaleX = _loc2_.giveTargetScale;
         _loc2_.clip.scaleY = _loc2_.giveTargetScale;
         if(_loc2_.attachedTea)
         {
            _loc2_.attachedTea.moveToGiveOrder(param1,true);
         }
         if(_loc2_.ticketHolderClip)
         {
            _loc2_.ticketHolderClip.visible = false;
         }
      }
      
      public function getToppingNames(param1:Array, param2:Boolean = false) : Array
      {
         var _loc5_:Number = NaN;
         var _loc8_:int = 0;
         var _loc3_:SushiRoll = this;
         var _loc4_:Array = [];
         var _loc6_:Array = [];
         _loc5_ = 0;
         while(_loc5_ < param1.length)
         {
            _loc8_ = 0;
            while(_loc8_ < param1[_loc5_].length)
            {
               if(param1[_loc5_][_loc8_] != "" && param1[_loc5_][_loc8_] !== true && param1[_loc5_][_loc8_] !== false)
               {
                  _loc6_.push(param1[_loc5_][_loc8_]);
               }
               _loc8_++;
            }
            _loc5_++;
         }
         var _loc7_:Array = [];
         if(_loc6_.indexOf(_loc3_.paperType) > -1 && _loc4_.indexOf(_loc3_.paperType) == -1)
         {
            _loc4_.push(_loc3_.paperType);
         }
         else if(_loc6_.indexOf(_loc3_.paperType) == -1 && _loc7_.indexOf(_loc3_.paperType) == -1)
         {
            _loc7_.push(_loc3_.paperType);
         }
         if(_loc6_.indexOf(_loc3_.riceType) > -1 && _loc4_.indexOf(_loc3_.riceType) == -1)
         {
            _loc4_.push(_loc3_.riceType);
         }
         else if(_loc6_.indexOf(_loc3_.riceType) == -1 && _loc7_.indexOf(_loc3_.riceType) == -1)
         {
            _loc7_.push(_loc3_.riceType);
         }
         if(_loc6_.indexOf(_loc3_.attachedTea.teaType) > -1 && _loc4_.indexOf(_loc3_.attachedTea.teaType) == -1)
         {
            _loc4_.push(_loc3_.attachedTea.teaType);
         }
         else if(_loc6_.indexOf(_loc3_.attachedTea.teaType) == -1 && _loc7_.indexOf(_loc3_.attachedTea.teaType) == -1)
         {
            _loc7_.push(_loc3_.attachedTea.teaType);
         }
         if(_loc6_.indexOf(_loc3_.attachedTea.bubbleType) > -1 && _loc4_.indexOf(_loc3_.attachedTea.bubbleType) == -1)
         {
            _loc4_.push(_loc3_.attachedTea.bubbleType);
         }
         else if(_loc6_.indexOf(_loc3_.attachedTea.bubbleType) == -1 && _loc7_.indexOf(_loc3_.attachedTea.bubbleType) == -1)
         {
            _loc7_.push(_loc3_.attachedTea.bubbleType);
         }
         _loc5_ = 0;
         while(_loc5_ < _loc3_.filling.distroArray.length)
         {
            if(_loc6_.indexOf(_loc3_.filling.distroArray[_loc5_][2]) > -1 && _loc4_.indexOf(_loc3_.filling.distroArray[_loc5_][2]) == -1)
            {
               _loc4_.push(_loc3_.filling.distroArray[_loc5_][2]);
            }
            else if(_loc6_.indexOf(_loc3_.filling.distroArray[_loc5_][2]) == -1 && _loc7_.indexOf(_loc3_.filling.distroArray[_loc5_][2]) == -1)
            {
               _loc7_.push(_loc3_.filling.distroArray[_loc5_][2]);
            }
            _loc5_++;
         }
         if(_loc3_.topping)
         {
            _loc5_ = 0;
            while(_loc5_ < _loc3_.topping.layerTypes.length)
            {
               if(_loc6_.indexOf(_loc3_.topping.layerTypes[_loc5_]) > -1 && _loc4_.indexOf(_loc3_.topping.layerTypes[_loc5_]) == -1)
               {
                  _loc4_.push(_loc3_.topping.layerTypes[_loc5_]);
               }
               else if(_loc6_.indexOf(_loc3_.topping.layerTypes[_loc5_]) == -1 && _loc7_.indexOf(_loc3_.topping.layerTypes[_loc5_]) == -1)
               {
                  _loc7_.push(_loc3_.topping.layerTypes[_loc5_]);
               }
               _loc5_++;
            }
         }
         if(_loc3_.topping)
         {
            _loc5_ = 0;
            while(_loc5_ < _loc3_.topping.distroArray.length)
            {
               if(_loc6_.indexOf(_loc3_.topping.distroArray[_loc5_][2]) > -1 && _loc4_.indexOf(_loc3_.topping.distroArray[_loc5_][2]) == -1)
               {
                  _loc4_.push(_loc3_.topping.distroArray[_loc5_][2]);
               }
               else if(_loc6_.indexOf(_loc3_.topping.distroArray[_loc5_][2]) == -1 && _loc7_.indexOf(_loc3_.topping.distroArray[_loc5_][2]) == -1)
               {
                  _loc7_.push(_loc3_.topping.distroArray[_loc5_][2]);
               }
               _loc5_++;
            }
         }
         class_6.method_1("Get valid toppings for sushi: " + _loc4_.toString());
         class_6.method_1("WRONG items on the sushi: " + _loc7_.toString());
         if(param2)
         {
            _loc4_ = null;
            _loc4_ = _loc7_.concat();
         }
         return _loc4_;
      }
      
      public function setNotClickable() : void
      {
         var _loc1_:SushiRoll = this;
         _loc1_.clip.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickOnTea);
         _loc1_.isDraggingOnTea = false;
         if(_loc1_.attachedTea)
         {
            _loc1_.attachedTea.setNotClickable();
         }
      }
      
      public function addCuttingGuide(param1:Boolean = false) : void
      {
         var _loc3_:int = 0;
         var _loc2_:SushiRoll = this;
         if(_loc2_.gameObj.var_127.hasBonus("cutguide") || param1)
         {
            if(_loc2_.helperGuide == null)
            {
               _loc2_.helperGuide = new sushi_topguide();
            }
            else
            {
               _loc2_.helperGuide.visible = true;
            }
            if(_loc2_.isFlipped && _loc2_.riceType != FoodData.RICE_BLACK)
            {
               _loc3_ = 0;
               while(_loc3_ < _loc2_.helperGuideLineNum)
               {
                  _loc2_.helperGuide["line" + _loc3_].gotoAndStop(2);
                  _loc3_++;
               }
            }
            if(Boolean(_loc2_.clip.parent) && !_loc2_.helperGuide.parent != _loc2_.clip.parent)
            {
               _loc2_.clip.parent.addChild(_loc2_.helperGuide);
               _loc2_.helperGuide.x = 201.7 + _loc2_.buildTargetX;
               _loc2_.helperGuide.y = -101.2 + _loc2_.buildTargetY;
            }
         }
         if(!param1)
         {
            if(_loc2_.cuttingGuide == null)
            {
               _loc2_.cuttingGuide = new knife_sushi_topguide();
            }
            else
            {
               _loc2_.cuttingGuide.visible = true;
            }
            if(_loc2_.isFlipped && _loc2_.riceType == FoodData.RICE_WHITE)
            {
               _loc2_.cuttingGuide.gotoAndStop(2);
            }
            if(_loc2_.clip.parent)
            {
               _loc2_.clip.parent.addChild(_loc2_.cuttingGuide);
            }
         }
      }
      
      public function removeCuttingGuide() : void
      {
         var _loc1_:SushiRoll = this;
         if(_loc1_.cuttingGuide)
         {
            _loc1_.cuttingGuide.visible = false;
         }
      }
      
      public function removeHelperGuide() : void
      {
         var _loc1_:SushiRoll = this;
         if(_loc1_.helperGuide)
         {
            _loc1_.helperGuide.visible = false;
         }
      }
      
      public function updateCuttingGuide(param1:Number) : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         var _loc2_:SushiRoll = this;
         if(_loc2_.cuttingGuide)
         {
            _loc3_ = false;
            if(_loc2_.slices == null || _loc2_.slices.length == 0)
            {
               _loc3_ = true;
            }
            else
            {
               _loc4_ = 0;
               while(_loc4_ < _loc2_.slices.length)
               {
                  if(Boolean(_loc2_.slices[_loc4_]) && _loc2_.slices[_loc4_].isWithinSlice(Math.round(param1)))
                  {
                     _loc3_ = true;
                     break;
                  }
                  _loc4_++;
               }
            }
            if(_loc3_)
            {
               _loc2_.cuttingGuide.visible = true;
               _loc2_.cuttingGuide.x = _loc2_.clip.x + _loc2_.topping.clip.x + 51 - param1;
               _loc2_.cuttingGuide.y = _loc2_.clip.y + _loc2_.topping.clip.y - 127.5 + param1 + 26;
            }
            else
            {
               _loc2_.cuttingGuide.visible = false;
            }
         }
      }
      
      public function addTicketHolder() : void
      {
         var _loc1_:SushiRoll = this;
         if(_loc1_.ticketHolderClip == null)
         {
            class_6.method_1("Attach ticket holder!");
            _loc1_.ticketHolderClip = new ticketHolderMC();
            _loc1_.gameObj.var_137.clip.addChild(_loc1_.ticketHolderClip);
            _loc1_.ticketHolderClip.x = _loc1_.ticketHolderStartX;
            _loc1_.ticketHolderClip.y = _loc1_.ticketHolderTargetY;
         }
      }
      
      public function attachTicket(param1:Ticket) : void
      {
         var _loc2_:SushiRoll = this;
         _loc2_.gameObj.hud.disableStationButtons();
         _loc2_.attachedTicket = param1;
      }
   }
}
