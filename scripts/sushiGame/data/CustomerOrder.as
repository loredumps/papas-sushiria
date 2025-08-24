package sushiGame.data
{
   public class CustomerOrder
   {
       
      
      public var month:Number = 0;
      
      public var riceType:String = null;
      
      public var paperType:String = null;
      
      public var isFlipped:Boolean = false;
      
      public var teaType:String = null;
      
      public var bubbleType:String = null;
      
      public var toppings:Array;
      
      public var fillings:Array;
      
      public var isSpecial:Boolean = false;
      
      public function CustomerOrder(param1:Number = 0)
      {
         this.toppings = [];
         this.fillings = [];
         super();
         this.month = param1;
      }
      
      public function getOrderAsArray() : Array
      {
         var _loc3_:int = 0;
         var _loc1_:CustomerOrder = this;
         var _loc2_:Array = [];
         _loc2_.push([_loc1_.paperType,_loc1_.isFlipped]);
         _loc2_.push([_loc1_.riceType,_loc1_.isFlipped]);
         _loc3_ = 0;
         while(_loc3_ < _loc1_.fillings.length)
         {
            _loc2_.push([_loc1_.fillings[_loc3_],true]);
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < _loc1_.toppings.length)
         {
            _loc2_.push([_loc1_.toppings[_loc3_],true]);
            _loc3_++;
         }
         _loc2_.push([_loc1_.teaType]);
         _loc2_.push([_loc1_.bubbleType]);
         return _loc2_;
      }
      
      public function getOrderAsGivingArray() : Array
      {
         var _loc2_:Array = null;
         var _loc1_:CustomerOrder = this;
         if(_loc1_.isSpecial)
         {
            _loc2_ = [];
            _loc2_.push(["speciallogo"]);
            _loc2_.push([_loc1_.teaType]);
            _loc2_.push([_loc1_.bubbleType]);
            return _loc2_;
         }
         return this.getOrderAsArray();
      }
      
      public function setPaper(param1:String) : void
      {
         var _loc2_:CustomerOrder = this;
         _loc2_.paperType = param1;
      }
      
      public function setRice(param1:String, param2:Boolean = false) : void
      {
         var _loc3_:CustomerOrder = this;
         _loc3_.riceType = param1;
         _loc3_.isFlipped = param2;
      }
      
      public function setTea(param1:String, param2:String) : void
      {
         var _loc3_:CustomerOrder = this;
         _loc3_.teaType = param1;
         _loc3_.bubbleType = param2;
      }
      
      public function addToppings(... rest) : void
      {
         var _loc2_:CustomerOrder = this;
         var _loc3_:int = 0;
         while(_loc3_ < rest.length)
         {
            _loc2_.toppings.push(rest[_loc3_]);
            _loc3_++;
         }
      }
      
      public function addFillings(... rest) : void
      {
         var _loc2_:CustomerOrder = this;
         var _loc3_:int = 0;
         while(_loc3_ < rest.length)
         {
            _loc2_.fillings.push(rest[_loc3_]);
            _loc3_++;
         }
      }
      
      public function hasIngredient(param1:String) : Boolean
      {
         var _loc4_:int = 0;
         var _loc2_:CustomerOrder = this;
         var _loc3_:Boolean = false;
         if(_loc2_.riceType == param1 || _loc2_.paperType == param1 || _loc2_.teaType == param1 || _loc2_.bubbleType == param1)
         {
            _loc3_ = true;
         }
         else
         {
            _loc4_ = 0;
            while(_loc4_ < _loc2_.toppings.length)
            {
               if(_loc2_.toppings[_loc4_] == param1)
               {
                  _loc3_ = true;
                  break;
               }
               _loc4_++;
            }
            _loc4_ = 0;
            while(_loc4_ < _loc2_.fillings.length)
            {
               if(_loc2_.fillings[_loc4_] == param1)
               {
                  _loc3_ = true;
                  break;
               }
               _loc4_++;
            }
         }
         return _loc3_;
      }
      
      public function output() : String
      {
         var _loc1_:CustomerOrder = this;
         return _loc1_.paperType + ", " + _loc1_.riceType + ", Flipped: " + _loc1_.isFlipped + ", Fillings: " + _loc1_.fillings.toString() + " | Toppings: " + _loc1_.toppings.toString() + " | " + _loc1_.teaType + ", " + _loc1_.bubbleType;
      }
      
      public function clone() : CustomerOrder
      {
         var _loc3_:int = 0;
         var _loc1_:CustomerOrder = this;
         var _loc2_:CustomerOrder = new CustomerOrder(_loc1_.month);
         _loc2_.setPaper(_loc1_.paperType);
         _loc2_.setRice(_loc1_.riceType,_loc1_.isFlipped);
         _loc2_.setTea(_loc1_.teaType,_loc1_.bubbleType);
         _loc3_ = 0;
         while(_loc3_ < _loc1_.fillings.length)
         {
            _loc2_.addFillings(_loc1_.fillings[_loc3_]);
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < _loc1_.toppings.length)
         {
            _loc2_.addToppings(_loc1_.toppings[_loc3_]);
            _loc3_++;
         }
         return _loc2_;
      }
   }
}
