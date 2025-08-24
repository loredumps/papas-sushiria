package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerDoan extends CustomerDataFile
   {
       
      
      public function CustomerDoan()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Doan";
         this.customerClipName = "Doan";
         this.customerFirstGame = "Papa\'s Burgeria";
         this.thumbColor = "midblue";
         this.flipdeckNumber = 37;
         this.hasAlternateShoes = true;
         this.setupOrder();
         this.stickers = ["radish","stache","sandbucket"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_BROWN);
         _loc1_.addFillings(FoodData.FILLING_SHRIMP,FoodData.FILLING_SNOWPEAS);
         _loc1_.addToppings(FoodData.DROP_SAYORI,FoodData.SAUCE_SRIRACHA,FoodData.SHAKER_FURIKAKE);
         _loc1_.setTea(FoodData.TEA_MATCHA,FoodData.BUBBLE_CUCUMBER);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_MARCH);
         _loc2_.setPaper(FoodData.PAPER_LUCKY);
         _loc2_.setRice(FoodData.RICE_BROWN);
         _loc2_.addFillings(FoodData.FILLING_SHRIMP,FoodData.FILLING_SNOWPEAS);
         _loc2_.addToppings(FoodData.DROP_SAYORI,FoodData.SAUCE_SRIRACHA,FoodData.SHAKER_LUCKYDUST);
         _loc2_.setTea(FoodData.TEA_IYOKAN,FoodData.BUBBLE_CUCUMBER);
         this.addCustomerOrder(_loc2_);
      }
   }
}
