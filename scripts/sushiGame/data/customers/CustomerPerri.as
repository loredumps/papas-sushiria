package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerPerri extends CustomerDataFile
   {
       
      
      public function CustomerPerri()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Perri";
         this.customerClipName = "Perri";
         this.customerFirstGame = "Papa\'s Cheeseria";
         this.thumbColor = "seafoam";
         this.setupOrder();
         this.stickers = ["chilifeather","maracas","donut"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_UKONIRO);
         _loc1_.setRice(FoodData.RICE_WHITE);
         _loc1_.addFillings(FoodData.FILLING_LOBSTER,FoodData.FILLING_CREAMCHEESE);
         _loc1_.addToppings(FoodData.DROP_SABA,FoodData.SAUCE_PONZU,FoodData.SHAKER_BONITOFLAKES);
         _loc1_.setTea(FoodData.TEA_PINACOLADA,FoodData.BUBBLE_WATERMELON);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_JUNE);
         _loc2_.setPaper(FoodData.PAPER_MIZUIRO);
         _loc2_.setRice(FoodData.RICE_WHITE);
         _loc2_.addFillings(FoodData.FILLING_LOBSTER,FoodData.FILLING_CREAMCHEESE);
         _loc2_.addToppings(FoodData.DROP_SABA,FoodData.SAUCE_CALYPSO,FoodData.SHAKER_BONITOFLAKES);
         _loc2_.setTea(FoodData.TEA_LUAUPUNCH,FoodData.BUBBLE_WATERMELON);
         this.addCustomerOrder(_loc2_);
      }
   }
}
