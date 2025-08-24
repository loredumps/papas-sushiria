package sushiGame.models
{
   import flash.display.*;
   import flash.events.*;
   import flash.utils.getDefinitionByName;
   import package_2.class_6;
   import package_4.*;
   import sushiGame.data.CustomerData;
   import sushiGame.data.FoodData;
   import sushiGame.events.ValueEvent;
   import sushiGame.managers.*;
   import sushiGame.screens.*;
   
   public class Customer
   {
       
      
      public var gameObj:class_5;
      
      public var clip:MovieClip;
      
      public var customerType:Number = 1;
      
      public var customerName:String = "Some Guy";
      
      public var isCloser:Boolean = false;
      
      public var isHuge:Boolean = false;
      
      public var timeEntered:Number = 0;
      
      public var timeOrderTaken:Number = 0;
      
      public var customersAlreadyWaiting:Number = 0;
      
      public var currentLine:String;
      
      public var orderIsPlaced:Boolean = false;
      
      public var isWalking:Boolean = false;
      
      public var walkSpeed:Number = 4;
      
      public var walkDir:Number;
      
      public var targetX:Number;
      
      public var order:Array;
      
      public var givingorder:Array;
      
      public var wearingFoamFinger:Boolean = false;
      
      public var wearingGlove:Boolean = false;
      
      public var hasHandExtra:Boolean = false;
      
      public var extraIsBasket:Boolean = false;
      
      public var isWaiter:Boolean = false;
      
      public var waiterObj:Worker = null;
      
      public var diningBuddy:Number = -1;
      
      public function Customer(param1:class_5, param2:Number, param3:Boolean = false, param4:Number = -1)
      {
         super();
         var _loc5_:Customer;
         (_loc5_ = this).gameObj = param1;
         _loc5_.customerType = param2;
         _loc5_.isCloser = _loc5_.gameObj.var_131.isCloser(param2);
         _loc5_.isHuge = _loc5_.gameObj.var_131.isHuge(param2);
         _loc5_.isWaiter = param3;
         _loc5_.diningBuddy = param4;
         _loc5_.defineVars();
         _loc5_.timeEntered = _loc5_.gameObj.controls.gameplayTimer;
         if(_loc5_.isWaiter)
         {
            _loc5_.setupWorker();
         }
         else
         {
            _loc5_.setupCustomer();
         }
         if(!_loc5_.isWaiter || _loc5_.gameObj.var_133.isWaiterInLine() == false)
         {
            _loc5_.startCustomerEntering();
         }
         else if(_loc5_.gameObj.var_133.isWaiterInLine())
         {
            _loc5_.moveToDiningQueue();
         }
         else
         {
            class_6.error("Don\'t know what to do here with this customer: isWaiter: " + _loc5_.isWaiter + ". Waiter in line: " + _loc5_.gameObj.var_133.isWaiterInLine());
         }
         _loc5_.gameObj.var_130.api.addEventListener(ValueEvent.OUTFIT,_loc5_.outfitChanged);
      }
      
      public function defineVars() : void
      {
         var _loc1_:Customer = this;
         var _loc2_:CustomerData = _loc1_.gameObj.var_131;
         _loc1_.customerName = _loc2_.getCustomerName(_loc1_.customerType);
         _loc1_.order = _loc2_.getCustomerOrder(_loc1_.customerType);
         _loc1_.givingorder = _loc2_.getCustomerOrderForGiving(_loc1_.customerType);
      }
      
      public function setupWorker() : void
      {
         var _loc1_:Customer = this;
         _loc1_.clip = new MovieClip();
         _loc1_.waiterObj = new Worker(_loc1_.gameObj,_loc1_.clip,_loc1_.gameObj.var_143,0,0,1,false,false);
         _loc1_.waiterObj.runOwnAnimations();
      }
      
      public function clearCustomer() : void
      {
         var ob:Customer = this;
         ob.clip.stop();
         try
         {
            ob.clip.body.removeChildAt(0);
            ob.clip.head.removeChildAt(0);
            ob.clip.eyes.removeChildAt(0);
            ob.clip.mouth.removeChildAt(0);
            ob.clip.neck.removeChildAt(0);
            ob.clip.front_shoe.removeChildAt(0);
            ob.clip.back_shoe.removeChildAt(0);
            ob.clip.fronthand.removeChildAt(0);
            ob.clip.backhand.removeChildAt(0);
            ob.clip.front_upperarm.removeChildAt(0);
            ob.clip.back_upperarm.removeChildAt(0);
            ob.clip.front_forearm.removeChildAt(0);
            ob.clip.back_forearm.removeChildAt(0);
         }
         catch(err:Error)
         {
            class_6.error("Error removing parts of customer");
         }
         try
         {
            ob.clip.hair.removeChildAt(0);
         }
         catch(err:Error)
         {
         }
         try
         {
            ob.clip.back_hair.removeChildAt(0);
         }
         catch(err:Error)
         {
         }
      }
      
      public function setupCustomer() : void
      {
         var _loc3_:MovieClip = null;
         var _loc4_:String = null;
         var _loc5_:Number = NaN;
         var _loc6_:Class = null;
         var _loc7_:MovieClip = null;
         var _loc1_:Customer = this;
         _loc1_.clip = new customerMC();
         var _loc2_:String = _loc1_.gameObj.var_131.getCustomerClipName(_loc1_.customerType);
         _loc1_.gameObj.var_131.buildCustomer(_loc2_,_loc1_.clip);
         if(_loc1_.gameObj.var_133 != null && _loc1_.gameObj.var_133.isBringingSpecial(_loc1_.customerType))
         {
            _loc1_.extraIsBasket = false;
            _loc3_ = new handextra_envelope();
            _loc1_.clip.handextra.addChild(_loc3_);
            _loc1_.hasHandExtra = true;
         }
         else
         {
            _loc4_ = null;
            if(_loc1_.gameObj.var_127.canWearHoliday(_loc1_.customerType))
            {
               _loc4_ = _loc1_.gameObj.var_131.getCustomerHolidayHandExtra(_loc1_.customerType,_loc1_.gameObj.var_127.getHolidayMonth());
            }
            else if(_loc1_.gameObj.var_127.isWearingAlternate(_loc1_.customerType))
            {
               _loc4_ = _loc1_.gameObj.var_131.getCustomerAlternateHandExtra(_loc1_.customerType);
            }
            if(_loc4_ == null)
            {
               if(Math.random() > 0.7)
               {
                  _loc5_ = _loc1_.gameObj.var_127.getHolidayMonth();
                  _loc1_.extraIsBasket = false;
                  if(_loc5_ == 1)
                  {
                     _loc4_ = "jubizela";
                  }
                  else if(_loc5_ == 2)
                  {
                     _loc4_ = "rose";
                  }
                  else if(_loc5_ == 3)
                  {
                     _loc4_ = "omamori";
                     _loc1_.extraIsBasket = true;
                  }
                  else if(_loc5_ == 4)
                  {
                     _loc4_ = "lantern";
                     _loc1_.extraIsBasket = true;
                  }
                  else if(_loc5_ == 5)
                  {
                     _loc4_ = "maracas";
                     _loc1_.extraIsBasket = true;
                  }
                  else if(_loc5_ == 6)
                  {
                     _loc4_ = "summerfan";
                  }
                  else if(_loc5_ == 7)
                  {
                     _loc4_ = "sparkler";
                  }
                  else if(_loc5_ == 8)
                  {
                     _loc4_ = "pretzel";
                  }
                  else if(_loc5_ == 9)
                  {
                     _loc4_ = "maplejug";
                     _loc1_.extraIsBasket = true;
                  }
                  else if(_loc5_ == 10)
                  {
                     _loc4_ = "candypail";
                     _loc1_.extraIsBasket = true;
                  }
                  else if(_loc5_ == 11)
                  {
                     _loc4_ = "turkeyleg";
                  }
                  else if(_loc5_ == 12)
                  {
                     _loc4_ = "candycane";
                  }
               }
            }
            if(_loc4_ != null)
            {
               (_loc7_ = new (_loc6_ = getDefinitionByName("handextra_" + _loc4_) as Class)()).mouseEnabled = false;
               _loc7_.mouseChildren = false;
               _loc7_.tabEnabled = false;
               _loc1_.clip.handextra.addChild(_loc7_);
               _loc1_.clip.frontHandClosed = true;
               _loc1_.hasHandExtra = true;
            }
         }
      }
      
      public function startCustomerEntering() : void
      {
         var _loc1_:Customer = this;
         var _loc2_:OrderScreen = _loc1_.gameObj.var_145;
         var _loc3_:CustomerManager = _loc1_.gameObj.var_133;
         var _loc4_:Number;
         var _loc5_:Number = (_loc4_ = _loc3_.orderline.length) + 1;
         _loc2_.clip.orderline_holder.addChild(_loc1_.clip);
         _loc2_.clip.orderline_holder.setChildIndex(_loc1_.clip,0);
         _loc1_.clip.scaleX = _loc2_.orderLineScale;
         _loc1_.clip.scaleY = _loc2_.orderLineScale;
         _loc1_.targetX = _loc2_.orderLineTargetX + _loc4_ * _loc2_.customerSpacing;
         _loc1_.clip.y = _loc2_.orderLineTargetY;
         _loc1_.clip.x = _loc2_.offScreenX + 50;
         _loc1_.walkDir = -1;
         _loc1_.isWalking = true;
         if(_loc3_.totalCustomers == 1)
         {
            _loc1_.clip.x = _loc2_.firstCustomerStartX;
         }
         if(_loc1_.isWaiter == false)
         {
            _loc1_.playAnimation("walk");
         }
         else
         {
            _loc1_.playAnimation("walk");
         }
         _loc1_.currentLine = "orderline";
         _loc3_.orderline.push(_loc1_);
         if(!_loc1_.clip.hasEventListener(Event.ENTER_FRAME))
         {
            _loc1_.clip.addEventListener(Event.ENTER_FRAME,_loc1_.walkCustomer);
         }
         _loc1_.gameObj.var_127.addToCustomersToday(_loc1_.customerType);
         _loc3_.gameObj.hud.showCustomerAlert(_loc1_.isWaiter);
      }
      
      public function moveToLeaveLine() : void
      {
         var _loc1_:Customer = this;
         var _loc2_:OrderScreen = _loc1_.gameObj.var_145;
         var _loc3_:CustomerManager = _loc1_.gameObj.var_133;
         _loc2_.clip.leaveline_holder.addChild(_loc1_.clip);
         _loc2_.clip.leaveline_holder.setChildIndex(_loc1_.clip,0);
         _loc1_.clip.scaleX = _loc2_.leaveLineScale * -1;
         _loc1_.clip.scaleY = _loc2_.leaveLineScale;
         _loc1_.targetX = _loc2_.offScreenX + _loc1_.clip.width;
         _loc1_.clip.x = _loc2_.leaveLineTargetX + _loc1_.clip.width;
         _loc1_.clip.y = _loc2_.leaveLineTargetY;
         _loc1_.walkDir = 1;
         _loc1_.isWalking = true;
         if(_loc1_.isWaiter == false)
         {
            _loc1_.playAnimation("walk");
         }
         else
         {
            _loc1_.playAnimation("walk");
         }
         try
         {
            _loc1_.clip.body.clip.logo.gotoAndStop(2);
         }
         catch(err:Error)
         {
         }
         _loc1_.currentLine = "leaveline";
         _loc3_.orderline.shift();
         _loc3_.leaveline.push(_loc1_);
         _loc3_.shiftCustomersInOrderLine();
         if(!_loc1_.clip.hasEventListener(Event.ENTER_FRAME))
         {
            _loc1_.clip.addEventListener(Event.ENTER_FRAME,_loc1_.walkCustomer);
         }
         class_6.error("===========================================================================================");
         class_6.error(_loc1_.customerName + " FINISHED TAKING ORDER");
         class_6.error("===========================================================================================");
      }
      
      public function moveToDiningWaiting() : void
      {
         var _loc1_:Customer = this;
         var _loc2_:OrderScreen = _loc1_.gameObj.var_145;
         var _loc3_:CustomerManager = _loc1_.gameObj.var_133;
         class_6.method_1("I\'m a Waiter, move to Dining Waiting instead of the regular waiting line!");
         _loc2_.clip.leaveline_holder.removeChild(_loc1_.clip);
         _loc1_.isWalking = false;
         _loc1_.waiterObj.playAnimation("standpad");
         _loc1_.currentLine = "dining_wait_line";
         _loc3_.leaveline.shift();
         _loc3_.dining_wait_line.push(_loc1_);
         _loc1_.clip.removeEventListener(Event.ENTER_FRAME,_loc1_.walkCustomer);
         _loc3_.checkForWaitingDining();
      }
      
      public function removeFromDiningQueue() : void
      {
         var _loc1_:Customer = this;
         var _loc2_:CustomerManager = _loc1_.gameObj.var_133;
         class_6.method_1(_loc1_.customerName + ": Waiter can take my order now.");
         -1;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.dining_order_line.length)
         {
            if(_loc2_.dining_order_line[_loc4_] == _loc1_)
            {
               _loc2_.dining_order_line.splice(_loc4_,1);
               break;
            }
            _loc4_++;
         }
         _loc1_.startCustomerEntering();
      }
      
      public function moveToDiningQueue() : void
      {
         var _loc1_:Customer = this;
         var _loc2_:CustomerManager = _loc1_.gameObj.var_133;
         class_6.method_1(_loc1_.customerName + ": The waiter is already busy in line.  Wait in the queue for the dining room.");
         _loc1_.currentLine = "dining_order_line";
         _loc2_.dining_order_line.push(_loc1_);
         _loc1_.isWalking = false;
      }
      
      public function moveToWaitLine() : void
      {
         var _loc1_:Customer = this;
         var _loc2_:OrderScreen = _loc1_.gameObj.var_145;
         var _loc3_:CustomerManager = _loc1_.gameObj.var_133;
         var _loc4_:Number = _loc3_.waitline.length;
         _loc2_.clip.waitline_holder.addChild(_loc1_.clip);
         _loc2_.clip.waitline_holder.setChildIndex(_loc1_.clip,0);
         _loc1_.clip.scaleX = _loc2_.waitLineScale;
         _loc1_.clip.scaleY = _loc2_.waitLineScale;
         _loc1_.targetX = _loc2_.waitLineTargetX + _loc4_ * _loc2_.customerSpacing;
         _loc1_.clip.y = _loc2_.waitLineTargetY;
         _loc1_.clip.x = _loc2_.offScreenX;
         _loc1_.walkDir = -1;
         _loc1_.isWalking = true;
         if(_loc1_.isWaiter == false)
         {
            _loc1_.playAnimation("walk");
         }
         else
         {
            _loc1_.playAnimation("walk");
         }
         try
         {
            _loc1_.clip.body.clip.logo.gotoAndStop(1);
         }
         catch(err:Error)
         {
         }
         _loc1_.currentLine = "waitline";
         _loc3_.leaveline.shift();
         _loc3_.waitline.push(_loc1_);
         if(!_loc1_.clip.hasEventListener(Event.ENTER_FRAME))
         {
            _loc1_.clip.addEventListener(Event.ENTER_FRAME,_loc1_.walkCustomer);
         }
      }
      
      public function moveToDiningTakeOrder() : void
      {
         var _loc1_:Customer = this;
         _loc1_.timeOrderTaken = _loc1_.gameObj.controls.gameplayTimer;
         _loc1_.customersAlreadyWaiting = _loc1_.gameObj.var_133.waitline.length + _loc1_.gameObj.var_133.leaveline.length + _loc1_.gameObj.var_133.dining_wait_line.length;
      }
      
      public function moveToTakeOrder() : void
      {
         var _loc1_:Customer = this;
         var _loc2_:TakeOrderScreen = _loc1_.gameObj.var_186;
         _loc1_.timeOrderTaken = _loc1_.gameObj.controls.gameplayTimer;
         _loc1_.customersAlreadyWaiting = _loc1_.gameObj.var_133.waitline.length + _loc1_.gameObj.var_133.leaveline.length + _loc1_.gameObj.var_133.dining_wait_line.length;
         _loc2_.clip.customer_holder.addChild(_loc1_.clip);
         _loc1_.clip.scaleX = _loc2_.customerScale;
         _loc1_.clip.scaleY = _loc2_.customerScale;
         _loc1_.clip.x = _loc2_.customerX;
         _loc1_.clip.y = _loc2_.customerY;
         _loc1_.targetX = _loc2_.customerX;
         _loc1_.isWalking = false;
         if(_loc1_.isWaiter == false)
         {
            _loc1_.playAnimation("stand");
         }
         else
         {
            _loc1_.playAnimation("waitplaceorder");
         }
      }
      
      public function moveToReceiveOrder() : void
      {
         var _loc1_:Customer = this;
         var _loc2_:GiveOrderScreen = _loc1_.gameObj.var_188;
         _loc2_.clip.customer_holder.addChild(_loc1_.clip);
         _loc1_.clip.scaleX = _loc2_.customerScale;
         _loc1_.clip.scaleY = _loc2_.customerScale;
         _loc1_.clip.x = _loc2_.customerX;
         _loc1_.clip.y = _loc2_.customerY;
         _loc1_.targetX = _loc2_.customerX;
         _loc1_.isWalking = false;
         if(_loc1_.clip.hasEventListener(Event.ENTER_FRAME))
         {
            _loc1_.clip.removeEventListener(Event.ENTER_FRAME,_loc1_.walkCustomer);
         }
         if(_loc1_.isWaiter == false)
         {
            _loc1_.playAnimation("look");
         }
         else
         {
            _loc1_.playAnimation("stand");
         }
      }
      
      public function destroy() : void
      {
         var ob:Customer = this;
         ob.gameObj.var_130.api.removeEventListener(ValueEvent.OUTFIT,ob.outfitChanged);
         try
         {
            if(ob.clip.hasEventListener(Event.ENTER_FRAME))
            {
               ob.clip.removeEventListener(Event.ENTER_FRAME,ob.walkCustomer);
            }
         }
         catch(err:Error)
         {
            class_6.error("Error stopping walking on customer.");
         }
         if(ob.isWaiter == false)
         {
            ob.clearCustomer();
            try
            {
               ob.clip.handextra.removeChildAt(0);
            }
            catch(err:Error)
            {
            }
         }
         else if(ob.waiterObj)
         {
            ob.waiterObj.destroy();
            ob.waiterObj = null;
         }
         try
         {
            ob.clip.parent.removeChild(ob.clip);
         }
         catch(err:Error)
         {
         }
         ob.clip = null;
      }
      
      public function walkCustomer(param1:Event = null) : void
      {
         var _loc2_:Customer = this;
         var _loc3_:OrderScreen = _loc2_.gameObj.var_145;
         if(!_loc2_.gameObj.var_169)
         {
            if(_loc2_.walkDir == -1 && _loc2_.clip.x + _loc2_.walkDir * _loc2_.walkSpeed <= _loc2_.targetX)
            {
               _loc2_.clip.x = _loc2_.targetX;
               _loc2_.isWalking = false;
               if(_loc2_.isWaiter == false)
               {
                  _loc2_.playAnimation("stand");
               }
               else
               {
                  _loc2_.playAnimation("standpad");
               }
               if(_loc2_.currentLine == "orderline")
               {
                  if(_loc2_.gameObj.var_133.orderline[0] == _loc2_)
                  {
                     _loc3_.showTakeOrderBubble(_loc2_.isCloser);
                  }
               }
               _loc2_.clip.removeEventListener(Event.ENTER_FRAME,_loc2_.walkCustomer);
            }
            else if(_loc2_.walkDir == 1 && _loc2_.clip.x + _loc2_.walkDir * _loc2_.walkSpeed >= _loc2_.targetX)
            {
               _loc2_.clip.x = _loc2_.targetX;
               if(_loc2_.isWaiter == false)
               {
                  _loc2_.playAnimation("stand");
               }
               else
               {
                  _loc2_.playAnimation("standpad");
               }
               if(_loc2_.currentLine == "leaveline")
               {
                  if(_loc2_.isWaiter == false)
                  {
                     _loc2_.moveToWaitLine();
                  }
                  else
                  {
                     _loc2_.moveToDiningWaiting();
                  }
               }
               else
               {
                  _loc2_.isWalking = false;
                  _loc2_.clip.removeEventListener(Event.ENTER_FRAME,_loc2_.walkCustomer);
               }
            }
            else
            {
               _loc2_.isWalking = true;
               _loc2_.clip.x += _loc2_.walkDir * _loc2_.walkSpeed;
            }
         }
      }
      
      public function resetContainer() : void
      {
         var _loc4_:Number = NaN;
         var _loc1_:Customer = this;
         var _loc2_:OrderScreen = _loc1_.gameObj.var_145;
         var _loc3_:CustomerManager = _loc1_.gameObj.var_133;
         if(_loc1_.currentLine == "waitline")
         {
            if(!_loc2_.clip.waitline_holder.contains(_loc1_.clip))
            {
               _loc2_.clip.waitline_holder.addChild(_loc1_.clip);
               _loc2_.clip.waitline_holder.setChildIndex(_loc1_.clip,0);
               _loc4_ = 0;
               while(true)
               {
                  if(_loc4_ < _loc3_.waitline.length)
                  {
                     if(_loc3_.waitline[_loc4_] != _loc1_)
                     {
                        continue;
                     }
                     _loc1_.clip.x = _loc2_.waitLineTargetX + _loc4_ * _loc2_.customerSpacing;
                     _loc1_.clip.y = _loc2_.waitLineTargetY;
                  }
               }
            }
         }
         else if(_loc1_.currentLine == "orderline")
         {
            if(!_loc2_.clip.orderline_holder.contains(_loc1_.clip))
            {
               _loc2_.clip.orderline_holder.addChild(_loc1_.clip);
               _loc2_.clip.orderline_holder.setChildIndex(_loc1_.clip,0);
               _loc4_ = 0;
               while(_loc4_ < _loc3_.orderline.length)
               {
                  if(_loc3_.orderline[_loc4_] == _loc1_)
                  {
                     _loc1_.clip.x = _loc2_.orderLineTargetX + _loc4_ * _loc2_.customerSpacing;
                     _loc1_.clip.y = _loc2_.orderLineTargetY;
                     break;
                  }
                  _loc4_++;
               }
            }
         }
      }
      
      public function shiftInOrderLine(param1:Number) : void
      {
         var _loc2_:Customer = this;
         _loc2_.targetX = param1;
         if(!_loc2_.isWalking)
         {
            _loc2_.clip.x = _loc2_.targetX;
         }
         if(!_loc2_.isWalking && _loc2_.gameObj.var_133.orderline[0] == _loc2_)
         {
            _loc2_.gameObj.var_145.showTakeOrderBubble(_loc2_.isCloser);
         }
      }
      
      public function shiftInWaitLine(param1:Number) : void
      {
         var _loc2_:Customer = this;
         _loc2_.targetX = param1;
         if(!_loc2_.isWalking)
         {
            _loc2_.clip.x = _loc2_.targetX;
         }
      }
      
      public function getOkayWaitingTime() : Number
      {
         this;
         var _loc2_:Number = 0;
         return FoodData.getTargetCookTime();
      }
      
      public function playAnimation(param1:String) : void
      {
         var _loc2_:Customer = this;
         if(_loc2_.isWaiter == false)
         {
            _loc2_.clip.gotoAndPlay(param1);
         }
         else if(_loc2_.waiterObj)
         {
            _loc2_.waiterObj.playAnimation(param1);
         }
      }
      
      public function outfitChanged(param1:ValueEvent) : void
      {
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc2_:Customer = this;
         if(param1.value == _loc2_.customerType && _loc2_.isWaiter == false)
         {
            class_6.method_1(_loc2_.customerName + " -- Your outfit changed!  Update!");
            _loc3_ = _loc2_.clip.currentLabel;
            _loc2_.clearCustomer();
            _loc4_ = _loc2_.gameObj.var_131.getCustomerClipName(_loc2_.customerType);
            _loc2_.gameObj.var_131.buildCustomer(_loc4_,_loc2_.clip);
            if(_loc3_ != null)
            {
               _loc2_.playAnimation(_loc3_);
            }
            else
            {
               class_6.error("Animation was null!  What to do now?  Standing...");
               _loc2_.playAnimation("stand1_1");
            }
         }
      }
   }
}
