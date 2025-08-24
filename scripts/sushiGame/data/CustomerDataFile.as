package sushiGame.data
{
   import package_2.class_6;
   
   public class CustomerDataFile
   {
       
      
      public var customerName:String = "Placeholder";
      
      public var customerOrders:Vector.<CustomerOrder>;
      
      public var customerClipName:String = "Placeholder";
      
      public var customerFirstGame:String = "Papa\'s Pizzeria";
      
      public var thumbColor:String = "lime";
      
      public var houseColor:String = null;
      
      public var isCloser:Boolean = false;
      
      public var isHuge:Boolean = false;
      
      public var holidayOutfit:Number = 0;
      
      public var holidayHandExtra:String = null;
      
      public var hasHolidayMouth:Boolean = false;
      
      public var hasHolidayEyes:Boolean = false;
      
      public var hasHolidayHands:Boolean = false;
      
      public var hasHolidayShoes:Boolean = false;
      
      public var hasAlternateMouth:Boolean = false;
      
      public var hasAlternateEyes:Boolean = false;
      
      public var hasAlternateHands:Boolean = false;
      
      public var hasAlternateShoes:Boolean = false;
      
      public var alternateHandExtra:String = null;
      
      public var notInPool:Boolean = false;
      
      public var flipdeckNumber:Number = 0;
      
      public var stickers:Array;
      
      public var secretSpecialIndex:Number = -1;
      
      public var livesInApartment:Boolean = false;
      
      public function CustomerDataFile()
      {
         this.stickers = ["musicnote","burger","tomato"];
         super();
         this.customerOrders = new Vector.<CustomerOrder>();
         this.initCustomerData();
      }
      
      public function initCustomerData() : void
      {
      }
      
      public function addCustomerOrder(param1:CustomerOrder) : void
      {
         if(this.customerOrders == null)
         {
            this.customerOrders = new Vector.<CustomerOrder>();
         }
         this.customerOrders.push(param1);
      }
      
      public function getCustomerOrder(param1:Number = 0, param2:Boolean = false) : CustomerOrder
      {
         var _loc4_:int = 0;
         var _loc3_:CustomerDataFile = this;
         var _loc5_:CustomerOrder = null;
         _loc4_ = 0;
         while(_loc4_ < _loc3_.customerOrders.length)
         {
            if(_loc3_.customerOrders[_loc4_].month == param1 && (param1 != GameData.STARTER_MONTH || param2 == true))
            {
               _loc5_ = _loc3_.customerOrders[_loc4_];
               break;
            }
            _loc4_++;
         }
         if(_loc5_ == null)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc3_.customerOrders.length)
            {
               if(_loc3_.customerOrders[_loc4_].month == 0)
               {
                  _loc5_ = _loc3_.customerOrders[_loc4_];
                  break;
               }
               _loc4_++;
            }
         }
         return _loc5_;
      }
      
      public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_WHITE);
         _loc1_.addFillings(FoodData.FILLING_TUNA);
         _loc1_.addToppings(FoodData.SAUCE_TERIYAKI);
         _loc1_.setTea(FoodData.TEA_CHAI,FoodData.BUBBLE_TAPIOCA);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_MARCH);
         _loc2_.setPaper(FoodData.PAPER_LUCKY);
         _loc2_.setRice(FoodData.RICE_BLACK);
         _loc2_.addFillings(FoodData.FILLING_TUNA);
         _loc2_.addToppings(FoodData.SAUCE_TERIYAKI);
         _loc2_.setTea(FoodData.TEA_IYOKAN,FoodData.BUBBLE_PAWPAW);
         this.addCustomerOrder(_loc2_);
      }
      
      public function verifyOrder(param1:CustomerData) : void
      {
         var _loc3_:int = 0;
         var _loc6_:Number = NaN;
         var _loc7_:int = 0;
         var _loc8_:CustomerOrder = null;
         var _loc2_:CustomerDataFile = this;
         [];
         var _loc5_:Number = _loc2_.customerOrders.length;
         if(_loc2_.customerName != "Jojo")
         {
            if(_loc2_.isCloser && _loc5_ != 13)
            {
               class_6.error(_loc2_.customerName + " - CLOSER: Only has " + _loc5_ + " orders.");
            }
            else if(!_loc2_.isCloser && _loc5_ != 2)
            {
               class_6.error(_loc2_.customerName + " - Customer only has " + _loc5_ + " orders.");
            }
            _loc7_ = 0;
            while(_loc7_ < _loc2_.customerOrders.length)
            {
               if((_loc8_ = _loc2_.customerOrders[_loc7_]).toppings.length > 3)
               {
                  class_6.error(_loc2_.customerName + " - ERROR: Too many toppings!: " + _loc8_.toppings.length);
               }
               if(_loc8_.fillings.length > 3)
               {
                  class_6.error(_loc2_.customerName + " - ERROR: Too many fillings!: " + _loc8_.fillings.length);
               }
               _loc3_ = 0;
               while(_loc3_ < _loc8_.fillings.length)
               {
                  if(!FoodData.isFilling(_loc8_.fillings[_loc3_]))
                  {
                     class_6.error(_loc2_.customerName + " - ERROR: Not a filling: " + _loc8_.fillings[_loc3_]);
                  }
                  if(!_loc2_.verifyMonth(_loc8_.fillings[_loc3_],_loc8_.month))
                  {
                     class_6.error(_loc2_.customerName + " - ERROR: FILLING IN THE WRONG MONTH: " + _loc8_.fillings[_loc3_] + ", " + _loc8_.month);
                  }
                  _loc3_++;
               }
               if(!FoodData.isRice(_loc8_.riceType))
               {
                  class_6.error(_loc2_.customerName + " - ERROR: Not a rice: " + _loc8_.riceType);
               }
               if(!FoodData.isPaper(_loc8_.paperType))
               {
                  class_6.error(_loc2_.customerName + " - ERROR: Not a paper: " + _loc8_.paperType);
               }
               if(!FoodData.isTea(_loc8_.teaType))
               {
                  class_6.error(_loc2_.customerName + " - ERROR: Not a tea: " + _loc8_.teaType);
               }
               if(!FoodData.isBubble(_loc8_.bubbleType))
               {
                  class_6.error(_loc2_.customerName + " - ERROR: Not a bubble: " + _loc8_.bubbleType);
               }
               if(!_loc2_.verifyMonth(_loc8_.riceType,_loc8_.month))
               {
                  class_6.error(_loc2_.customerName + " - ERROR: RICE IN THE WRONG MONTH: " + _loc8_.riceType + ", " + _loc8_.month);
               }
               if(!_loc2_.verifyMonth(_loc8_.paperType,_loc8_.month))
               {
                  class_6.error(_loc2_.customerName + " - ERROR: PAPER IN THE WRONG MONTH: " + _loc8_.paperType + ", " + _loc8_.month);
               }
               if(!_loc2_.verifyMonth(_loc8_.teaType,_loc8_.month))
               {
                  class_6.error(_loc2_.customerName + " - ERROR: TEA IN THE WRONG MONTH: " + _loc8_.teaType + ", " + _loc8_.month);
               }
               if(!_loc2_.verifyMonth(_loc8_.bubbleType,_loc8_.month))
               {
                  class_6.error(_loc2_.customerName + " - ERROR: BUBBLE IN THE WRONG MONTH: " + _loc8_.bubbleType + ", " + _loc8_.month);
               }
               _loc3_ = 0;
               while(_loc3_ < _loc8_.toppings.length)
               {
                  if(!FoodData.isDrop(_loc8_.toppings[_loc3_]) && !FoodData.isSauce(_loc8_.toppings[_loc3_]) && !FoodData.isShaker(_loc8_.toppings[_loc3_]))
                  {
                     class_6.error(_loc2_.customerName + " - ERROR: Not a topping: " + _loc8_.toppings[_loc3_]);
                  }
                  if(!_loc2_.verifyMonth(_loc8_.toppings[_loc3_],_loc8_.month))
                  {
                     class_6.error(_loc2_.customerName + " - ERROR: TOPPING IN THE WRONG MONTH: " + _loc8_.toppings[_loc3_] + ", " + _loc8_.month);
                  }
                  _loc3_++;
               }
               _loc7_++;
            }
         }
      }
      
      private function verifyMonth(param1:String, param2:Number) : Boolean
      {
         this;
         var _loc4_:Boolean = false;
         var _loc5_:Array;
         if((_loc5_ = (_loc5_ = FoodData.getHolidayItems(param2,true,"all")).concat(FoodData.getStandardItems())).indexOf(param1) > -1)
         {
            _loc4_ = true;
         }
         return _loc4_;
      }
   }
}
