package sushiGame.managers
{
   import flash.display.BitmapData;
   import package_2.class_6;
   import package_4.class_5;
   import sushiGame.data.FurniData;
   import sushiGame.data.GameData;
   import sushiGame.data.UserData;
   import sushiGame.models.Customer;
   import sushiGame.models.FurnitureItem;
   import sushiGame.screens.OrderScreen;
   
   public class CustomerManager
   {
       
      
      public var gameObj:class_5;
      
      public var totalCustomers:Number = 0;
      
      public var orderline:Array;
      
      public var leaveline:Array;
      
      public var waitline:Array;
      
      public var specialBMP:BitmapData = null;
      
      public var numberOfCustomers:Array;
      
      public var customerLineup:Array;
      
      public var minSpawnTiming:Number = 0;
      
      public var spawnTiming:Number = 0;
      
      public var firstSpawnTiming:Number = 1050;
      
      public var secondSpawnTiming:Number = 1350;
      
      public var finalSpawnTiming:Number = 1350;
      
      public var lastSpawnTime:Number = 0;
      
      public var totalTime:Number = 0;
      
      public var showNewCustomer:Boolean = false;
      
      public var showNewCustomerNum:Number = 1;
      
      public var specialCustomers:Array;
      
      public var customerBringingSpecial:Number = -1;
      
      public var whichSpecialToEarn:Number = -1;
      
      public var diningLineup:Array;
      
      public var diningBuddies:Array;
      
      public var dining_wait_line:Array;
      
      public var dining_order_line:Array;
      
      public var didSkipTraining:Boolean = false;
      
      public function CustomerManager(param1:class_5)
      {
         this.orderline = [];
         this.leaveline = [];
         this.waitline = [];
         this.numberOfCustomers = [4,4,5,5,5,5,6,6,6,6,6,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,8];
         this.customerLineup = [];
         this.specialCustomers = [];
         this.diningLineup = [];
         this.diningBuddies = [];
         this.dining_wait_line = [];
         this.dining_order_line = [];
         super();
         var _loc2_:CustomerManager = this;
         _loc2_.gameObj = param1;
         _loc2_.setupManager();
      }
      
      public function setupManager() : void
      {
         var _loc1_:CustomerManager = this;
         _loc1_.totalCustomers = 0;
         _loc1_.orderline = [];
         _loc1_.leaveline = [];
         _loc1_.waitline = [];
         _loc1_.customerLineup = [];
         _loc1_.diningLineup = [];
         _loc1_.diningBuddies = [];
         _loc1_.dining_order_line = [];
         _loc1_.dining_wait_line = [];
      }
      
      public function setupLineup() : void
      {
         var _loc1_:CustomerManager = this;
         if(_loc1_.gameObj.var_127.currentDay == 1)
         {
            _loc1_.trainingLineup();
         }
         else
         {
            _loc1_.decideLineup();
         }
         if(_loc1_.specialBMP)
         {
            _loc1_.specialBMP.dispose();
            _loc1_.specialBMP = null;
         }
         if(_loc1_.gameObj.var_127.currentSpecial > -1)
         {
            _loc1_.specialBMP = _loc1_.gameObj.var_132.getSpecialLogo(_loc1_.gameObj.var_127.currentSpecial);
         }
      }
      
      public function trainingLineup() : void
      {
         var _loc1_:CustomerManager = this;
         _loc1_.customerLineup = [10,13];
         _loc1_.diningLineup = [false,false];
         _loc1_.diningBuddies = [-1,-1];
      }
      
      public function decideLineup() : void
      {
         var _loc3_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:Array = null;
         var _loc23_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc25_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc27_:Boolean = false;
         var _loc28_:int = 0;
         var _loc29_:Number = NaN;
         var _loc30_:Number = NaN;
         var _loc31_:Array = null;
         var _loc32_:int = 0;
         var _loc33_:Number = NaN;
         var _loc34_:Number = NaN;
         var _loc35_:Number = NaN;
         var _loc36_:Boolean = false;
         var _loc37_:Array = null;
         var _loc38_:Number = NaN;
         var _loc39_:Array = null;
         var _loc40_:Array = null;
         var _loc1_:CustomerManager = this;
         var _loc2_:UserData = _loc1_.gameObj.var_127;
         var _loc4_:Number = _loc1_.gameObj.var_127.getRank();
         var _loc5_:Number = 0;
         if(_loc4_ >= _loc1_.numberOfCustomers.length)
         {
            _loc5_ = _loc1_.numberOfCustomers.length - 1;
         }
         else
         {
            _loc5_ = _loc4_;
         }
         var _loc6_:Number = (_loc6_ = Number(_loc1_.numberOfCustomers[_loc5_])) - 1;
         var _loc7_:Array = _loc2_.getCustomerPool(_loc6_);
         var _loc8_:Number = _loc2_.getNewestCustomer();
         var _loc9_:Number = _loc2_.getCloserCustomer();
         var _loc10_:Array = [];
         if(_loc2_.getMonth() != GameData.STARTER_MONTH || _loc2_.isNewYear())
         {
            _loc10_ = _loc1_.gameObj.var_131.getCustomersWithHolidayOrder(_loc2_.getMonth(),_loc2_.getCustomerPool(int.MAX_VALUE));
         }
         var _loc11_:Number = 0;
         var _loc12_:Number;
         if((_loc12_ = Math.max(2,_loc1_.numberOfCustomers[_loc5_] - 4)) > 3)
         {
            _loc12_ = 3;
         }
         if(_loc2_.getMonth() == GameData.STARTER_MONTH && _loc2_.isNewYear() == false)
         {
            _loc12_ = 0;
         }
         class_6.method_1("-- Possible Customers: " + _loc7_.toString() + ".  New Customer: " + _loc8_ + ". Closer Customer: " + _loc9_ + ". Holiday Orders: " + _loc10_.toString() + ". Target Holiday # to use: " + _loc12_);
         var _loc13_:Array = [];
         var _loc14_:Array = [];
         _loc1_.customerLineup = [];
         if(_loc2_.isBeyondFullYear() && _loc10_.length > 0)
         {
            if(_loc2_.getCustomerTotalOrders(_loc8_) > 0)
            {
               try
               {
                  _loc15_ = Number(_loc10_[Math.floor(Math.random() * _loc10_.length)]);
                  _loc10_.splice(_loc10_.indexOf(_loc15_),1);
                  _loc11_++;
                  class_6.method_1("(It\'s a New Year, the newest (" + _loc8_ + ") is actually old, pick a holiday customer instead: " + _loc15_ + ")");
                  _loc8_ = _loc15_;
               }
               catch(err:Error)
               {
               }
            }
            else
            {
               class_6.method_1("(It\'s a New Year, but you haven\'t served the newest customer yet! (" + _loc8_ + ")  Don\'t change anything.)");
            }
         }
         if(_loc8_ > 0)
         {
            _loc1_.customerLineup.push(_loc8_);
            _loc14_.push("new");
            _loc13_.push(_loc1_.customerLineup.length - 1);
            if(_loc7_.indexOf(_loc8_) > -1)
            {
               _loc7_.splice(_loc7_.indexOf(_loc8_),1);
            }
            if(_loc10_.indexOf(_loc8_) > -1)
            {
               _loc10_.splice(_loc10_.indexOf(_loc8_),1);
               _loc11_++;
            }
            _loc6_--;
            if(this.gameObj.var_127.alreadyEarnedCustomer(_loc8_))
            {
               class_6.method_1("Already Earned Customer " + _loc8_ + ".");
               _loc1_.showNewCustomer = false;
            }
            else
            {
               class_6.method_1("Customer " + _loc8_ + " is new!");
               _loc1_.showNewCustomer = true;
               _loc1_.showNewCustomerNum = _loc8_;
            }
         }
         class_6.method_1("Which Topping to Reveal/Feature: " + this.gameObj.var_127.getToppingToReveal());
         if(this.gameObj.var_127.getToppingToReveal() != "none")
         {
            if(_loc8_ > 0 && _loc1_.gameObj.var_131.customersHaveTopping(_loc8_,this.gameObj.var_127.getToppingToReveal()))
            {
               class_6.method_1("Customer " + _loc8_ + " is already ordering " + this.gameObj.var_127.getToppingToReveal() + ". Don\'t need to add one in for this.");
            }
            else if((_loc16_ = _loc1_.gameObj.var_131.getCustomerWithTopping(this.gameObj.var_127.getToppingToReveal(),_loc7_)) > 0)
            {
               if(_loc1_.customerLineup.indexOf(_loc16_) == -1)
               {
                  class_6.method_1("Add Customer " + _loc16_ + " to order " + this.gameObj.var_127.getToppingToReveal());
                  _loc1_.customerLineup.push(_loc16_);
                  _loc14_.push("topping");
                  _loc13_.push(_loc1_.customerLineup.length - 1);
                  if(_loc7_.indexOf(_loc16_) > -1)
                  {
                     _loc7_.splice(_loc7_.indexOf(_loc16_),1);
                  }
                  if(_loc10_.indexOf(_loc16_) > -1)
                  {
                     _loc10_.splice(_loc10_.indexOf(_loc16_),1);
                     _loc11_++;
                  }
                  _loc6_--;
               }
            }
            else
            {
               class_6.method_1("Couldn\'t find a Customer to order " + this.gameObj.var_127.getToppingToReveal());
            }
         }
         else
         {
            class_6.method_1("No new toppings to feature.");
         }
         _loc3_ = 0;
         while(_loc3_ < _loc6_)
         {
            if(_loc7_.length > 0)
            {
               _loc17_ = _loc7_.length;
               _loc18_ = Math.floor(Math.random() * _loc17_);
               _loc19_ = Number(_loc7_[_loc18_]);
               _loc1_.customerLineup.push(_loc19_);
               _loc7_.splice(_loc18_,1);
               if(_loc10_.indexOf(_loc19_) > -1)
               {
                  _loc10_.splice(_loc10_.indexOf(_loc19_),1);
                  _loc11_++;
                  _loc14_.push("holiday");
               }
               else
               {
                  _loc14_.push("none");
               }
            }
            _loc3_++;
         }
         _loc1_.customerLineup.push(_loc9_);
         _loc14_.push("closer");
         _loc13_.push(_loc1_.customerLineup.length - 1);
         if(_loc11_ < _loc12_)
         {
            _loc3_ = 2;
            while(_loc3_ < this.customerLineup.length - 1)
            {
               if(_loc11_ < _loc12_ && _loc10_.length > 0)
               {
                  if(_loc1_.gameObj.var_131.customersHaveHolidayOrder(this.customerLineup[_loc3_],_loc2_.getMonth()) == false)
                  {
                     _loc20_ = Number(_loc10_[Math.floor(Math.random() * _loc10_.length)]);
                     _loc10_.splice(_loc10_.indexOf(_loc20_),1);
                     _loc11_++;
                     class_6.method_1(" -- Not enough holiday, replace " + this.customerLineup[_loc3_] + " with a holiday guy: " + _loc20_);
                     this.customerLineup[_loc3_] = _loc20_;
                     _loc14_[_loc3_] = "holiday";
                     _loc13_.push(_loc3_);
                  }
               }
               _loc3_++;
            }
         }
         if(_loc2_.getHolidayMonth() == GameData.MONTH_DECEMBER)
         {
            _loc21_ = _loc1_.gameObj.var_131.getCustomerIndex("Santa");
            if(this.customerLineup.indexOf(_loc21_) == -1)
            {
               class_6.method_1(" -- Add Santa to the Lineup");
               this.customerLineup[2] = _loc21_;
               _loc14_[2] = "santa";
               _loc13_.push(2);
            }
            else
            {
               class_6.method_1(" -- Santa was already in the Lineup (#" + this.customerLineup.indexOf(_loc21_) + ")");
            }
         }
         class_6.method_1("--- Lineup Before Specials: " + this.customerLineup.toString());
         _loc1_.specialCustomers = [];
         if(_loc2_.currentSpecial != -1)
         {
            _loc22_ = _loc1_.gameObj.var_131.getCustomersForSpecial();
            _loc23_ = -1;
            if((_loc24_ = _loc22_.indexOf(this.customerLineup[0])) > -1)
            {
               class_6.method_1("--- first customer was in the lineup of possible guys ordering specials.  remove him!");
               _loc22_.splice(_loc24_,1);
               if(_loc22_.length == 0)
               {
                  class_6.error(" --- UH OH, now NOBODY will order it!  This isn\'t good...");
               }
            }
            _loc25_ = 1;
            if(_loc2_.hasBonus("specialsign") && _loc2_.showSpecialSign === 1)
            {
               _loc25_ = 2;
            }
            _loc26_ = 0;
            while(_loc26_ < _loc25_)
            {
               if(_loc22_.length > 0)
               {
                  _loc27_ = false;
                  if(_loc2_.hasTrained("cheatsheet") || _loc26_ > 0)
                  {
                     _loc28_ = 0;
                     while(_loc28_ < _loc22_.length)
                     {
                        if(this.customerLineup.indexOf(_loc22_[_loc28_]) > 0 && _loc1_.specialCustomers.indexOf(_loc22_[_loc28_]) == -1)
                        {
                           class_6.method_1(" -- " + _loc22_[_loc28_] + " was already in today\'s lineup, use him for the special!");
                           _loc1_.specialCustomers.push(_loc22_[_loc28_]);
                           _loc13_.push(this.customerLineup.indexOf(_loc22_[_loc28_]));
                           _loc23_ = this.customerLineup.indexOf(_loc22_[_loc28_]);
                           _loc14_[this.customerLineup.indexOf(_loc22_[_loc28_])] = "special";
                           _loc22_.splice(_loc28_,1);
                           _loc27_ = true;
                           break;
                        }
                        _loc28_++;
                     }
                  }
                  if(_loc27_ == false)
                  {
                     _loc29_ = Math.floor(Math.random() * _loc22_.length);
                     _loc30_ = Number(_loc22_[_loc29_]);
                     _loc31_ = [];
                     _loc32_ = 0;
                     while(_loc32_ < this.customerLineup.length)
                     {
                        if(_loc13_.indexOf(_loc32_) == -1)
                        {
                           _loc31_.push(_loc32_);
                        }
                        _loc32_++;
                     }
                     if(_loc2_.hasTrained("cheatsheet") == false && _loc26_ == 0)
                     {
                        class_6.method_1(" ---- SPECIAL ---- FIRST TIME ---- MAKE SECOND CUSTOMER ORDER IT");
                        _loc33_ = this.customerLineup.indexOf(_loc30_);
                        _loc34_ = Number(this.customerLineup[1]);
                        this.customerLineup[1] = _loc30_;
                        _loc14_[1] = "special";
                        _loc23_ = 1;
                        _loc13_.push(1);
                        if(_loc33_ > -1 && _loc33_ != 1)
                        {
                           class_6.method_1(" ------------- UH OH, this customer was already in the lineup!  Do a switcheroo between " + _loc30_ + " and " + _loc34_);
                           this.customerLineup[_loc33_] = _loc34_;
                           _loc13_.push(_loc33_);
                        }
                     }
                     else if(_loc31_.length == 0)
                     {
                        if(_loc26_ == 1 && _loc23_ == 2)
                        {
                           class_6.method_1(" -- SECOND special, nowhere to squeeze him, first guy was already at 2.  make this guy at 3. (Customer +" + _loc30_ + ")");
                           this.customerLineup[3] = _loc30_;
                           _loc14_[3] = "special";
                        }
                        else if(_loc26_ == 1 && _loc23_ == 3)
                        {
                           class_6.method_1(" -- SECOND special, nowhere to squeeze him, first guy was already at 3.  make this guy at 2. (Customer +" + _loc30_ + ")");
                           this.customerLineup[2] = _loc30_;
                           _loc14_[2] = "special";
                        }
                        else if(this.customerLineup.length > 4 && _loc23_ != 3)
                        {
                           class_6.method_1(" -- Nowhere to squeeze a special-ordering guy?  I guess make him at index 3. (Customer " + _loc30_ + ")");
                           this.customerLineup[3] = _loc30_;
                           _loc23_ = 3;
                           _loc13_.push(3);
                           _loc14_[3] = "special";
                        }
                        else
                        {
                           class_6.method_1(" -- Nowhere at all to squeeze a special-ordering guy?  I guess make him at index 2. (Customer " + _loc30_ + ")");
                           this.customerLineup[2] = _loc30_;
                           _loc23_ = 2;
                           _loc13_.push(2);
                           _loc14_[2] = "special";
                        }
                     }
                     else
                     {
                        _loc35_ = Number(_loc31_[Math.floor(Math.random() * _loc31_.length)]);
                        class_6.method_1(" -- Add a special-ordering guy at " + _loc35_ + ". (Customer " + _loc30_ + ")");
                        this.customerLineup[_loc35_] = _loc30_;
                        _loc23_ = _loc35_;
                        _loc13_.push(_loc35_);
                        _loc14_[_loc35_] = "special";
                     }
                     _loc1_.specialCustomers.push(_loc30_);
                     _loc22_.splice(_loc29_,1);
                  }
               }
               else
               {
                  class_6.error("ERROR: Needed another customer to order a special, but there was nobody left!  Yikes!");
               }
               _loc26_++;
            }
         }
         if(_loc2_.couponCustomer > -1 && _loc2_.couponDay == _loc2_.currentDay)
         {
            if(this.customerLineup.indexOf(_loc2_.couponCustomer) > -1)
            {
               class_6.method_1(" -- Coupon Customer is already in this lineup!  Awesome!");
            }
            else
            {
               _loc36_ = false;
               _loc3_ = 0;
               while(_loc3_ < _loc14_.length)
               {
                  if(_loc14_[_loc3_] == "none")
                  {
                     class_6.method_1(" -- Add Coupon Customer at " + _loc3_ + ", replacing regular customer.");
                     this.customerLineup[_loc3_] = _loc2_.couponCustomer;
                     _loc36_ = true;
                     break;
                  }
                  _loc3_++;
               }
               if(!_loc36_)
               {
                  _loc3_ = 0;
                  while(_loc3_ < _loc14_.length)
                  {
                     if(_loc14_[_loc3_] == "holiday")
                     {
                        class_6.method_1(" -- Add Coupon Customer at " + _loc3_ + ", replacing holiday customer.");
                        this.customerLineup[_loc3_] = _loc2_.couponCustomer;
                        _loc36_ = true;
                        break;
                     }
                     _loc3_++;
                  }
               }
               if(!_loc36_)
               {
                  _loc3_ = 0;
                  while(_loc3_ < _loc14_.length)
                  {
                     if(_loc14_[_loc3_] == "special")
                     {
                        class_6.method_1(" -- Add Coupon Customer at " + _loc3_ + ", replacing special-ordering customer.");
                        this.customerLineup[_loc3_] = _loc2_.couponCustomer;
                        _loc36_ = true;
                        break;
                     }
                     _loc3_++;
                  }
               }
               if(!_loc36_)
               {
                  this.customerLineup[1] = _loc2_.couponCustomer;
                  _loc36_ = true;
               }
            }
         }
         _loc1_.diningLineup = [];
         _loc1_.diningBuddies = [];
         _loc3_ = 0;
         while(_loc3_ < _loc1_.customerLineup.length)
         {
            _loc1_.diningLineup.push(false);
            _loc1_.diningBuddies.push(-1);
            _loc3_++;
         }
         if(_loc2_.getDay() >= GameData.DAY_TO_HIRE)
         {
            _loc3_ = (_loc37_ = _loc2_.getCustomerPool(99,true)).length - 1;
            while(_loc3_ >= 0)
            {
               if(_loc1_.customerLineup.indexOf(_loc37_[_loc3_]) > -1)
               {
                  _loc37_.splice(_loc3_,1);
               }
               _loc3_--;
            }
            _loc3_ = 1;
            while(_loc3_ < _loc1_.customerLineup.length - 1)
            {
               if(_loc3_ == 1 || _loc3_ == _loc1_.customerLineup.length - 2 && _loc1_.customerLineup.length > 4)
               {
                  _loc1_.diningLineup[_loc3_] = true;
                  if(_loc37_ != null && _loc37_.length > 0)
                  {
                     _loc38_ = Math.floor(Math.random() * _loc37_.length);
                     _loc1_.diningBuddies[_loc3_] = _loc37_[_loc38_];
                     _loc37_.splice(_loc38_,1);
                  }
               }
               _loc3_++;
            }
         }
         _loc1_.customerBringingSpecial = -1;
         _loc1_.whichSpecialToEarn = -1;
         if(_loc1_.gameObj.var_127.currentDay - _loc1_.gameObj.var_127.lastDaySpecialEarned >= GameData.DELAY_BETWEEN_BRINGING_SPECIALS)
         {
            class_6.method_1(" -- You can earn a new special today!");
            if((_loc39_ = _loc1_.gameObj.var_132.getPossibleSpecialsToEarn()).length == 0)
            {
               class_6.method_1(" -- -- BUT NONE ARE AVAILABLE!  Wait to get a new one later.");
            }
            else
            {
               _loc1_.whichSpecialToEarn = _loc39_[Math.floor(Math.random() * _loc39_.length)];
               class_6.method_1(" -- -- Will Possibly Earn Special #" + _loc1_.whichSpecialToEarn);
               _loc40_ = [];
               _loc3_ = 1;
               while(_loc3_ < this.customerLineup.length - 1)
               {
                  if(this.diningLineup[_loc3_] != true)
                  {
                     if(this.specialCustomers.indexOf(this.customerLineup[_loc3_]) <= -1)
                     {
                        _loc40_.push(this.customerLineup[_loc3_]);
                     }
                  }
                  _loc3_++;
               }
               if(_loc40_.length == 0)
               {
                  class_6.error(" -- -- Couldn\'t find anyone to bring a new Special -- make the first guy do it.");
                  _loc40_.push(this.customerLineup[0]);
               }
               _loc1_.customerBringingSpecial = _loc40_[Math.floor(Math.random() * _loc40_.length)];
               class_6.method_1(" -- -- Customer " + _loc1_.customerBringingSpecial + " will bring the new Special.");
               _loc1_.gameObj.var_127.lastDaySpecialEarned = _loc1_.gameObj.var_127.currentDay;
            }
         }
         else
         {
            class_6.method_1(" -- (Can\'t earn a new special yet)");
         }
         class_6.method_1("Chosen Customers Today: " + this.customerLineup);
         class_6.method_1("Dining Lineup: " + this.diningLineup);
         class_6.method_1("Dining Buddies: " + this.diningBuddies);
         class_6.method_1("Customers Ordering Special: " + this.specialCustomers);
         if(_loc1_.customerBringingSpecial > -1)
         {
            class_6.method_1("Customer bringing a new Special: " + _loc1_.customerBringingSpecial);
         }
      }
      
      public function startSpawningCustomers() : void
      {
         var _loc1_:CustomerManager = this;
         if(_loc1_.customerLineup == null || _loc1_.customerLineup.length == 0)
         {
            class_6.error("ERROR - the lineup was never set up!  Do that now.");
            _loc1_.setupLineup();
         }
         class_6.error("=============================================================== START OF DAY " + _loc1_.gameObj.var_127.currentDay);
         _loc1_.totalTime = _loc1_.gameObj.var_206;
         var _loc2_:Number = _loc1_.customerLineup.length;
         _loc1_.spawnTiming = 2700;
         _loc1_.minSpawnTiming = 2700;
         if(!_loc1_.gameObj.training)
         {
            _loc1_.spawnCustomer();
         }
      }
      
      public function spawnCustomer() : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Boolean = false;
         var _loc5_:Number = NaN;
         var _loc6_:Boolean = false;
         var _loc1_:CustomerManager = this;
         var _loc2_:Number = _loc1_.totalCustomers;
         if(!(_loc2_ == _loc1_.customerLineup.length - 1 && _loc1_.dining_order_line.length > 0))
         {
            if(_loc2_ < _loc1_.customerLineup.length)
            {
               _loc3_ = Number(_loc1_.customerLineup[_loc2_]);
               _loc4_ = Boolean(_loc1_.diningLineup[_loc2_]);
               _loc5_ = Number(_loc1_.diningBuddies[_loc2_]);
               if(_loc4_ && !_loc1_.gameObj.var_127.didCreateWaiter)
               {
                  class_6.error("This was supposed to be a dining customer, but you don\'t have a waiter!");
                  _loc4_ = false;
               }
               _loc6_ = false;
               _loc1_.gameObj.var_145.clicksToStation = 0;
               if(_loc2_ == _loc1_.customerLineup.length - 1)
               {
                  _loc1_.gameObj.var_145.clip.opensign.sign.gotoAndPlay(2);
                  _loc6_ = true;
               }
               _loc1_.addCustomer(_loc3_,_loc4_,_loc5_);
               _loc1_.lastSpawnTime = _loc1_.gameObj.controls.gameplayTimer;
            }
         }
      }
      
      public function addCustomer(param1:Number, param2:Boolean, param3:Number = -1) : void
      {
         var _loc4_:CustomerManager;
         ++(_loc4_ = this).totalCustomers;
         var _loc5_:Customer = new Customer(_loc4_.gameObj,param1,param2,param3);
      }
      
      public function deleteCustomer(param1:Customer) : void
      {
         var _loc3_:Number = NaN;
         var _loc2_:CustomerManager = this;
         var _loc4_:Number = -1;
         _loc3_ = 0;
         while(_loc3_ < _loc2_.waitline.length)
         {
            if(_loc2_.waitline[_loc3_] == param1)
            {
               _loc4_ = _loc3_;
               break;
            }
            _loc3_++;
         }
         if(_loc4_ > -1)
         {
            _loc2_.waitline.splice(_loc4_,1);
            _loc2_.shiftCustomersInWaitLine(_loc4_);
         }
         if(_loc4_ == -1)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc2_.dining_wait_line.length)
            {
               if(_loc2_.dining_wait_line[_loc3_] == param1)
               {
                  _loc4_ = _loc3_;
                  break;
               }
               _loc3_++;
            }
            if(_loc4_ > -1)
            {
               _loc2_.dining_wait_line.splice(_loc4_,1);
            }
            else
            {
               class_6.error("Couldn\'t find this customer in either the waitline OR the dining_wait_line: " + param1.customerName);
            }
         }
         param1.destroy();
         param1 = null;
         if(_loc2_.waitline.length == 0 && _loc2_.orderline.length == 0)
         {
            if(_loc2_.totalCustomers == _loc2_.customerLineup.length)
            {
            }
         }
      }
      
      public function destroy() : void
      {
         var _loc2_:Number = NaN;
         var _loc1_:CustomerManager = this;
         _loc2_ = 0;
         while(_loc2_ < _loc1_.waitline.length)
         {
            _loc1_.waitline[_loc2_].destroy();
            _loc1_.waitline[_loc2_] = null;
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc1_.leaveline.length)
         {
            _loc1_.leaveline[_loc2_].destroy();
            _loc1_.leaveline[_loc2_] = null;
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc1_.orderline.length)
         {
            _loc1_.orderline[_loc2_].destroy();
            _loc1_.orderline[_loc2_] = null;
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc1_.dining_wait_line.length)
         {
            _loc1_.dining_wait_line[_loc2_].destroy();
            _loc1_.dining_wait_line[_loc2_] = null;
            _loc2_++;
         }
         _loc1_.waitline = null;
         _loc1_.leaveline = null;
         _loc1_.orderline = null;
         _loc1_.dining_wait_line = null;
         if(_loc1_.specialBMP)
         {
            _loc1_.specialBMP.dispose();
            _loc1_.specialBMP = null;
         }
      }
      
      public function getWaitingCustomer(param1:Number) : Customer
      {
         var _loc4_:Number = NaN;
         var _loc5_:Customer = null;
         var _loc6_:Customer = null;
         var _loc7_:Customer = null;
         var _loc2_:CustomerManager = this;
         var _loc3_:Customer = null;
         _loc4_ = 0;
         while(_loc4_ < _loc2_.waitline.length)
         {
            if(_loc2_.waitline[_loc4_] is Customer)
            {
               if((_loc5_ = _loc2_.waitline[_loc4_]).customerType == param1)
               {
                  _loc3_ = _loc5_;
                  break;
               }
            }
            _loc4_++;
         }
         if(_loc3_ == null)
         {
            if(_loc2_.dining_wait_line.length > 0)
            {
               _loc4_ = 0;
               while(_loc4_ < _loc2_.dining_wait_line.length)
               {
                  if(_loc2_.dining_wait_line[_loc4_] is Customer)
                  {
                     if((_loc6_ = _loc2_.dining_wait_line[_loc4_]).customerType == param1)
                     {
                        _loc3_ = _loc6_;
                        break;
                     }
                  }
                  _loc4_++;
               }
            }
         }
         if(_loc3_ == null)
         {
            if(_loc2_.leaveline.length > 0)
            {
               _loc4_ = 0;
               while(_loc4_ < _loc2_.leaveline.length)
               {
                  if(_loc2_.leaveline[_loc4_] is Customer)
                  {
                     if((_loc7_ = _loc2_.leaveline[_loc4_]).customerType == param1)
                     {
                        if(_loc7_.isWaiter == false)
                        {
                           _loc7_.moveToWaitLine();
                        }
                        else
                        {
                           _loc7_.moveToDiningWaiting();
                        }
                        _loc3_ = _loc7_;
                        break;
                     }
                  }
                  _loc4_++;
               }
            }
         }
         return _loc3_;
      }
      
      public function shiftCustomersInWaitLine(param1:Number) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Customer = null;
         var _loc2_:CustomerManager = this;
         var _loc3_:OrderScreen = _loc2_.gameObj.var_145;
         var _loc4_:int = param1;
         while(_loc4_ < _loc2_.waitline.length)
         {
            _loc5_ = _loc3_.waitLineTargetX + _loc4_ * _loc3_.customerSpacing;
            (_loc6_ = _loc2_.waitline[_loc4_]).shiftInWaitLine(_loc5_);
            _loc4_++;
         }
      }
      
      public function shiftCustomersInOrderLine() : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Customer = null;
         var _loc1_:CustomerManager = this;
         var _loc2_:OrderScreen = _loc1_.gameObj.var_145;
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_.orderline.length)
         {
            _loc4_ = _loc2_.orderLineTargetX + _loc3_ * _loc2_.customerSpacing;
            (_loc5_ = _loc1_.orderline[_loc3_]).shiftInOrderLine(_loc4_);
            _loc3_++;
         }
      }
      
      public function checkForWaitingDining() : void
      {
         var _loc2_:Customer = null;
         var _loc1_:CustomerManager = this;
         if(_loc1_.dining_order_line.length > 0)
         {
            class_6.method_1("There was someone waiting in the dining room!  Bring them in with the waiter now!");
            _loc2_ = _loc1_.dining_order_line[0];
            _loc2_.removeFromDiningQueue();
         }
      }
      
      public function resetAllCustomerContainers() : void
      {
         var _loc2_:Number = NaN;
         var _loc1_:CustomerManager = this;
         _loc2_ = 0;
         while(_loc2_ < _loc1_.waitline.length)
         {
            _loc1_.waitline[_loc2_].resetContainer();
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc1_.orderline.length)
         {
            _loc1_.orderline[_loc2_].resetContainer();
            _loc2_++;
         }
      }
      
      public function updateManager() : void
      {
         var _loc1_:CustomerManager = this;
         var _loc2_:Number = _loc1_.gameObj.controls.gameplayTimer;
         if(_loc1_.gameObj.var_127.currentDay == 1 && !_loc1_.didSkipTraining)
         {
            if(_loc1_.gameObj.method_105(1) && _loc1_.orderline.length == 0)
            {
               _loc1_.spawnCustomer();
            }
            else if(_loc1_.gameObj.method_105(36))
            {
               _loc1_.spawnCustomer();
            }
         }
         else if(_loc1_.totalCustomers < _loc1_.customerLineup.length)
         {
            if(_loc1_.orderline.length == 0 && _loc1_.waitline.length == 0 && _loc1_.leaveline.length == 0)
            {
               _loc1_.spawnCustomer();
            }
            else if(_loc2_ - _loc1_.lastSpawnTime >= _loc1_.minSpawnTiming && _loc1_.orderline.length == 0)
            {
               _loc1_.spawnCustomer();
            }
            else if(_loc2_ - _loc1_.lastSpawnTime >= _loc1_.firstSpawnTiming && _loc1_.orderline.length == 0 && _loc1_.totalCustomers == 1)
            {
               class_6.method_1("Quicker Second Customer!");
               _loc1_.spawnCustomer();
            }
            else if(_loc2_ - _loc1_.lastSpawnTime >= _loc1_.finalSpawnTiming && _loc1_.totalCustomers == _loc1_.customerLineup.length - 2 && _loc1_.customerLineup.length >= 7)
            {
               _loc1_.spawnCustomer();
            }
            else if(_loc2_ - _loc1_.lastSpawnTime >= _loc1_.finalSpawnTiming && _loc1_.totalCustomers == _loc1_.customerLineup.length - 1 && _loc1_.customerLineup.length >= 6)
            {
               _loc1_.spawnCustomer();
            }
            else if(_loc2_ - _loc1_.lastSpawnTime >= _loc1_.spawnTiming)
            {
               _loc1_.spawnCustomer();
            }
         }
      }
      
      public function outOfCustomers(param1:Boolean = false) : Boolean
      {
         var _loc2_:CustomerManager = this;
         var _loc3_:Boolean = false;
         if(_loc2_.totalCustomers == _loc2_.customerLineup.length)
         {
            if(param1 == true && _loc2_.waitline.length == 0 && _loc2_.leaveline.length == 0 && _loc2_.orderline.length == 0 && _loc2_.dining_wait_line.length == 0 && _loc2_.dining_order_line.length == 0)
            {
               _loc3_ = true;
            }
            else if(param1 == false && (_loc2_.waitline.length <= 1 && _loc2_.dining_wait_line.length == 0 || _loc2_.waitline.length == 0 && _loc2_.dining_wait_line.length <= 1) && _loc2_.leaveline.length == 0 && _loc2_.orderline.length == 0 && _loc2_.dining_order_line.length == 0)
            {
               _loc3_ = true;
            }
         }
         return _loc3_;
      }
      
      private function getBonusesWithinRange(param1:String, param2:Number) : Array
      {
         var _loc7_:Array = null;
         var _loc8_:Array = null;
         var _loc11_:int = 0;
         var _loc3_:CustomerManager = this;
         var _loc4_:UserData = _loc3_.gameObj.var_127;
         var _loc5_:OrderScreen = _loc3_.gameObj.var_145;
         var _loc6_:Array = [];
         if(param1 == "waitline")
         {
            _loc7_ = [0,1];
         }
         else if(param1 == "orderline")
         {
            _loc7_ = [1,2];
         }
         if(param2 == 0)
         {
            _loc8_ = [0,1,2];
         }
         else if(param2 == 1)
         {
            _loc8_ = [3,4,5];
         }
         else if(param2 == 2)
         {
            _loc8_ = [5,6,7];
         }
         else if(param2 == 3)
         {
            _loc8_ = [8,9,10];
         }
         else if(param2 == 4)
         {
            _loc8_ = [10,11,12];
         }
         else if(param2 == 5)
         {
            _loc8_ = [13,14,15];
         }
         var _loc9_:Boolean = false;
         if(param1 == "orderline" && param2 == 0)
         {
            _loc9_ = true;
         }
         var _loc10_:int = 0;
         while(_loc10_ < _loc5_.furniItems.length)
         {
            if(_loc5_.furniItems[_loc10_].data.special != "none" && _loc5_.furniItems[_loc10_].data.special != FurniData.SPECIAL_SCORE && _loc5_.furniItems[_loc10_].isOccupied == false)
            {
               if(!_loc9_ || _loc5_.furniItems[_loc10_].data.special != FurniData.SPECIAL_ARCADE && _loc5_.furniItems[_loc10_].data.special != FurniData.SPECIAL_BOOK && _loc5_.furniItems[_loc10_].data.special != FurniData.SPECIAL_COMICS && _loc5_.furniItems[_loc10_].data.special != FurniData.SPECIAL_NEWSPAPER)
               {
                  _loc11_ = _loc5_.furniItems[_loc10_].xtile;
                  while(_loc11_ < _loc5_.furniItems[_loc10_].xtile + _loc5_.furniItems[_loc10_].data.width)
                  {
                     if(_loc8_.indexOf(_loc11_) > -1 && _loc7_.indexOf(_loc5_.furniItems[_loc10_].ytile) > -1)
                     {
                        _loc6_.push(_loc5_.furniItems[_loc10_]);
                        break;
                     }
                     _loc11_++;
                  }
               }
            }
            _loc10_++;
         }
         return _loc6_;
      }
      
      public function isOrderingSpecial(param1:Number) : Boolean
      {
         var _loc2_:CustomerManager = this;
         if(_loc2_.specialCustomers != null && _loc2_.specialCustomers.length > 0 && _loc2_.specialCustomers.indexOf(param1) > -1)
         {
            return true;
         }
         return false;
      }
      
      public function isBringingSpecial(param1:Number) : Boolean
      {
         var _loc2_:CustomerManager = this;
         if(_loc2_.customerBringingSpecial == param1)
         {
            return true;
         }
         return false;
      }
      
      public function isInRestaurantRightNow(param1:Number) : Boolean
      {
         var _loc4_:Number = NaN;
         var _loc5_:Customer = null;
         var _loc6_:Customer = null;
         var _loc7_:Customer = null;
         var _loc8_:Customer = null;
         var _loc2_:CustomerManager = this;
         var _loc3_:Boolean = false;
         if(_loc2_.orderline.length > 0)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc2_.orderline.length)
            {
               if(_loc2_.orderline[_loc4_] is Customer)
               {
                  if((_loc5_ = _loc2_.orderline[_loc4_]).customerType == param1)
                  {
                     _loc3_ = true;
                     break;
                  }
               }
               _loc4_++;
            }
         }
         if(_loc3_ == false)
         {
            if(_loc2_.waitline.length > 0)
            {
               _loc4_ = 0;
               while(_loc4_ < _loc2_.waitline.length)
               {
                  if(_loc2_.waitline[_loc4_] is Customer)
                  {
                     if((_loc6_ = _loc2_.waitline[_loc4_]).customerType == param1)
                     {
                        _loc3_ = true;
                        break;
                     }
                  }
                  _loc4_++;
               }
            }
         }
         if(_loc3_ == false)
         {
            if(_loc2_.dining_wait_line.length > 0)
            {
               _loc4_ = 0;
               while(_loc4_ < _loc2_.dining_wait_line.length)
               {
                  if(_loc2_.dining_wait_line[_loc4_] is Customer)
                  {
                     if((_loc7_ = _loc2_.dining_wait_line[_loc4_]).customerType == param1)
                     {
                        _loc3_ = true;
                        break;
                     }
                  }
                  _loc4_++;
               }
            }
         }
         if(_loc3_ == false)
         {
            if(_loc2_.leaveline.length > 0)
            {
               _loc4_ = 0;
               while(_loc4_ < _loc2_.leaveline.length)
               {
                  if(_loc2_.leaveline[_loc4_] is Customer)
                  {
                     if((_loc8_ = _loc2_.leaveline[_loc4_]).customerType == param1)
                     {
                        _loc3_ = true;
                        break;
                     }
                  }
                  _loc4_++;
               }
            }
         }
         return _loc3_;
      }
      
      public function isWaiterInLine() : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:Customer = null;
         var _loc1_:CustomerManager = this;
         var _loc4_:Boolean = false;
         _loc2_ = 0;
         while(_loc2_ < _loc1_.orderline.length)
         {
            _loc3_ = _loc1_.orderline[_loc2_];
            if(_loc3_.isWaiter)
            {
               _loc4_ = true;
               break;
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc1_.leaveline.length)
         {
            _loc3_ = _loc1_.leaveline[_loc2_];
            if(_loc3_.isWaiter)
            {
               _loc4_ = true;
               break;
            }
            _loc2_++;
         }
         return _loc4_;
      }
      
      public function updateCustomersForBonuses() : void
      {
         var ln:int;
         var i:Number = NaN;
         var customer:Customer = null;
         var whichLine:Array = null;
         var whichVariation:Number = NaN;
         var chooseIndex:Number = NaN;
         var furni:FurnitureItem = null;
         var whichDance:Number = NaN;
         var actionOptions:Array = null;
         var actionChoice:String = null;
         var actionVariation:Number = NaN;
         var currFrame:Number = NaN;
         var manager:CustomerManager = this;
         var data:UserData = manager.gameObj.var_127;
         var maxPerLine:Number = 6;
         var available:Array = null;
         var gotBonus:Boolean = false;
         var numDancing:Number = 0;
         var lines:Array = ["waitline","orderline"];
         i = 0;
         while(i < manager.gameObj.var_145.furniItems.length)
         {
            manager.gameObj.var_145.furniItems[i].isOccupied = false;
            i++;
         }
         manager.resetAllCustomerContainers();
         ln = 0;
         while(ln < lines.length)
         {
            whichLine = manager[lines[ln]];
            if(whichLine.length > 0)
            {
               i = 0;
               for(; i < whichLine.length; i++)
               {
                  gotBonus = false;
                  customer = whichLine[i];
                  if(i < maxPerLine && !customer.isWalking && !customer.isWaiter)
                  {
                     whichVariation = Math.ceil(Math.random() * 4);
                     available = manager.getBonusesWithinRange(lines[ln],i);
                     if(available != null && available.length > 0)
                     {
                        chooseIndex = Math.floor(Math.random() * available.length);
                        furni = available[chooseIndex];
                        gotBonus = true;
                        if(furni.data.special == FurniData.SPECIAL_ARCADE)
                        {
                           customer.playAnimation("playgame" + whichVariation);
                           furni.clip.addChild(customer.clip);
                           customer.clip.x = 84;
                           customer.clip.y = -190;
                           furni.isOccupied = true;
                        }
                        else if(furni.data.special == FurniData.SPECIAL_BUBBLEGUM || furni.data.special == FurniData.SPECIAL_SCOREBUBBLEGUM)
                        {
                           customer.playAnimation("chewgum" + whichVariation);
                        }
                        else if(furni.data.special == FurniData.SPECIAL_MUSIC)
                        {
                           whichDance = Math.ceil(Math.random() * 3);
                           if(customer.hasHandExtra)
                           {
                              if(customer.extraIsBasket)
                              {
                                 whichDance = 1;
                              }
                              else
                              {
                                 whichDance = 3;
                              }
                           }
                           customer.playAnimation("dance" + whichDance + "_" + whichVariation);
                           numDancing++;
                        }
                        else if(furni.data.special == FurniData.SPECIAL_BOOK || furni.data.special == FurniData.SPECIAL_NEWSPAPER || furni.data.special == FurniData.SPECIAL_COMICS)
                        {
                           customer.playAnimation("readpaper" + whichVariation);
                           try
                           {
                              customer.clip.book.gotoAndStop(furni.data.special);
                           }
                           catch(err:Error)
                           {
                              class_6.method_1("Error setting correct book for Customer.. (Trying to go to readpaper" + whichVariation + ", trying to set book to " + furni.data.special + ")");
                           }
                        }
                        else if(furni.data.special == FurniData.SPECIAL_COFFEE || furni.data.special == FurniData.SPECIAL_PUNCH || furni.data.special == FurniData.SPECIAL_SODA)
                        {
                           customer.playAnimation("drinkcoffee" + whichVariation);
                           try
                           {
                              customer.clip.mug.gotoAndStop(furni.data.special);
                           }
                           catch(err:Error)
                           {
                              class_6.method_1("Error setting correct drink for Customer.. (Trying to go to drinkcoffee" + whichVariation + ", trying to set drink to " + furni.data.special + ")");
                           }
                        }
                     }
                  }
                  if(!gotBonus)
                  {
                     if(!customer.isWalking && !customer.isWaiter)
                     {
                        actionOptions = ["stand1","stand2","stand3","stand1","stand2","stand3","standphone1","standphone2","standds1"];
                        if(customer.isHuge || customer.hasHandExtra)
                        {
                           actionOptions = ["stand1","stand2","stand3"];
                        }
                        actionChoice = String(actionOptions[Math.floor(Math.random() * actionOptions.length)]);
                        actionVariation = Math.ceil(Math.random() * 4);
                        customer.playAnimation(actionChoice + "_" + actionVariation);
                        try
                        {
                           if(actionChoice == "standphone1" || actionChoice == "standphone2")
                           {
                              customer.clip.phone.gotoAndStop(customer.customerType % 5 + 1);
                           }
                           else if(actionChoice == "standds1")
                           {
                              customer.clip.handheld.gotoAndStop(customer.customerType % 5 + 1);
                           }
                        }
                        catch(err:Error)
                        {
                           class_6.method_1("Error skinning phone/handheld.");
                        }
                        try
                        {
                           currFrame = customer.clip.currentFrame;
                           customer.clip.gotoAndPlay(currFrame + Math.floor(Math.random() * 12));
                        }
                        catch(err:Error)
                        {
                           class_6.method_1("Error advancing frames");
                        }
                        continue;
                     }
                  }
               }
            }
            ln++;
         }
         if(numDancing >= 3)
         {
            manager.gameObj.var_136.recordTagged("danceparty");
         }
      }
   }
}
