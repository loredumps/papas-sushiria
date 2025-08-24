package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerRoy extends CustomerDataFile
   {
       
      
      public function CustomerRoy()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Roy";
         this.customerClipName = "Roy";
         this.thumbColor = "lightred";
         this.customerFirstGame = "Papa Louie";
         this.flipdeckNumber = 16;
         this.setupOrder();
         this.stickers = ["stache","burgerzilla","pancakes"];
         this.hasAlternateShoes = true;
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_MOMOIRO);
         _loc1_.setRice(FoodData.RICE_BLACK);
         _loc1_.addFillings(FoodData.FILLING_ASAPARAGUS,FoodData.FILLING_CREAMCHEESE);
         _loc1_.addToppings(FoodData.SAUCE_HIBACHI,FoodData.SHAKER_BONITOFLAKES);
         _loc1_.setTea(FoodData.TEA_STRAWBERRY,FoodData.BUBBLE_KIWI);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_FEBRUARY);
         _loc2_.setPaper(FoodData.PAPER_AKAI);
         _loc2_.setRice(FoodData.RICE_BLACK);
         _loc2_.addFillings(FoodData.FILLING_STRAWBERRY,FoodData.FILLING_CREAMCHEESE);
         _loc2_.addToppings(FoodData.SAUCE_HIBACHI,FoodData.SHAKER_POMEGRANATE);
         _loc2_.setTea(FoodData.TEA_RASPBERRY,FoodData.BUBBLE_KIWI);
         this.addCustomerOrder(_loc2_);
      }
   }
}
