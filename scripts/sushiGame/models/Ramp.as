package sushiGame.models
{
   public class Ramp
   {
       
      
      public var x1:Number;
      
      public var x2:Number;
      
      public var y1:Number;
      
      public var y2:Number;
      
      public var decay:Number;
      
      public var isFloating:Boolean;
      
      public function Ramp(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Boolean = false)
      {
         super();
         this.x1 = param1;
         this.y1 = param2;
         this.x2 = param3;
         this.y2 = param4;
         this.decay = param5;
         this.isFloating = param6;
      }
      
      public function getSlope() : Number
      {
         var _loc1_:Number = this.y2 - this.y1;
         var _loc2_:Number = this.x2 - this.x1;
         var _loc3_:Number = _loc1_ / _loc2_;
         if(_loc3_ == Number.POSITIVE_INFINITY)
         {
            _loc3_ = 1000000;
         }
         else if(_loc3_ == Number.NEGATIVE_INFINITY)
         {
            _loc3_ = -1000000;
         }
         return _loc3_;
      }
      
      public function getIntercept() : Number
      {
         return this.y1 - this.getSlope() * this.x1;
      }
      
      public function getAngle() : Number
      {
         var _loc1_:Number = this.y2 - this.y1;
         var _loc2_:Number = this.x2 - this.x1;
         return Math.atan2(_loc1_,_loc2_);
      }
      
      public function getLeftY() : Number
      {
         if(this.x1 < this.x2)
         {
            return this.y1;
         }
         return this.y2;
      }
      
      public function getRightY() : Number
      {
         if(this.x1 > this.x2)
         {
            return this.y1;
         }
         return this.y2;
      }
      
      public function getLeftX() : Number
      {
         if(this.x1 < this.x2)
         {
            return this.x1;
         }
         return this.x2;
      }
      
      public function getRightX() : Number
      {
         if(this.x1 > this.x2)
         {
            return this.x1;
         }
         return this.x2;
      }
   }
}
