package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerMandi extends CustomerDataFile
   {
       
      
      public function CustomerMandi()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Mandi";
         this.customerClipName = "Mandi";
         this.thumbColor = "pink";
         this.customerFirstGame = "Papa\'s Pizzeria";
         this.flipdeckNumber = 110;
         this.houseColor = "brown";
         this.setupOrder();
         this.hasAlternateShoes = true;
         this.stickers = ["donut","peachbuzzy","hotdog"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_MOMOIRO);
         _loc1_.setRice(FoodData.RICE_WHITE);
         _loc1_.addFillings(FoodData.FILLING_TUNA,FoodData.FILLING_CARROTS);
         _loc1_.addToppings(FoodData.DROP_SAYORI,FoodData.SHAKER_BONITOFLAKES,FoodData.SAUCE_HIBACHI);
         _loc1_.setTea(FoodData.TEA_HONEYDEW,FoodData.BUBBLE_WATERMELON);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_APRIL);
         _loc2_.setPaper(FoodData.PAPER_MOMOIRO);
         _loc2_.setRice(FoodData.RICE_WHITE);
         _loc2_.addFillings(FoodData.FILLING_TUNA,FoodData.FILLING_KAMPACHI,FoodData.FILLING_CARROTS);
         _loc2_.addToppings(FoodData.DROP_SAYORI,FoodData.SHAKER_BONITOFLAKES,FoodData.SAUCE_SWEETSAKURA);
         _loc2_.setTea(FoodData.TEA_HONEYDEW,FoodData.BUBBLE_WATERMELON);
         this.addCustomerOrder(_loc2_);
      }
   }
}
