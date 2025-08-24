package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerKoilee extends CustomerDataFile
   {
       
      
      public function CustomerKoilee()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Koilee";
         this.customerClipName = "Koilee";
         this.thumbColor = "fire";
         this.customerFirstGame = "Papa\'s Sushiria";
         this.stickers = ["crushers","donut","maracas"];
         this.setupOrder();
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_UKONIRO);
         _loc1_.setRice(FoodData.RICE_WHITE);
         _loc1_.addFillings(FoodData.FILLING_SALMON,FoodData.FILLING_CALAMARI,FoodData.FILLING_CREAMCHEESE);
         _loc1_.addToppings(FoodData.SHAKER_BONITOFLAKES,FoodData.SAUCE_YUZAKOSHO);
         _loc1_.setTea(FoodData.TEA_PINACOLADA,FoodData.BUBBLE_MANGO);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_APRIL);
         _loc2_.setPaper(FoodData.PAPER_SHIROI);
         _loc2_.setRice(FoodData.RICE_WHITE);
         _loc2_.addFillings(FoodData.FILLING_SALMON,FoodData.FILLING_KAMPACHI,FoodData.FILLING_CREAMCHEESE);
         _loc2_.addToppings(FoodData.SHAKER_BONITOFLAKES,FoodData.SAUCE_YUZAKOSHO);
         _loc2_.setTea(FoodData.TEA_PINACOLADA,FoodData.BUBBLE_MANGO);
         this.addCustomerOrder(_loc2_);
      }
   }
}
