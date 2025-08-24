package sushiGame.data
{
   public class SpecialItem
   {
       
      
      public var index:Number = -1;
      
      public var title:String = null;
      
      public var tag:String = null;
      
      public var bonusType:String = null;
      
      public var bonusAmount:Number = 0;
      
      public var rank:Number = 0;
      
      public var ingredients:Array;
      
      public var dominantIngredients:Array;
      
      public var prizeSKU:String = null;
      
      public var removePrizeFromStore:Boolean = false;
      
      public function SpecialItem(param1:Number, param2:String, param3:String, param4:String, param5:Number, param6:Number, param7:Array, param8:Array, param9:String = null, param10:Boolean = false)
      {
         this.ingredients = [];
         this.dominantIngredients = [];
         super();
         this.index = param1;
         this.title = param2;
         this.tag = param3;
         this.bonusType = param4;
         this.bonusAmount = param5;
         this.rank = param6;
         this.ingredients = param7;
         this.dominantIngredients = param8;
         this.prizeSKU = param9;
         this.removePrizeFromStore = param10;
      }
      
      public function getBonusString() : String
      {
         if(this.bonusType == "tips")
         {
            return this.bonusAmount + "x Tips";
         }
         if(this.bonusType == "tickets")
         {
            if(this.bonusAmount == 1)
            {
               return "+ 1 Ticket";
            }
            return "+ " + this.bonusAmount + " Tickets";
         }
         if(this.bonusType == "points")
         {
            return "" + this.bonusAmount + "% Points";
         }
         if(this.bonusType == "stars")
         {
            if(this.bonusAmount == 1)
            {
               return "+ 1 Customer Star";
            }
            return "+ " + this.bonusAmount + " Customer Star";
         }
         return "?????";
      }
   }
}
