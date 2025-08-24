package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerAustin extends CustomerDataFile
   {
       
      
      public function CustomerAustin()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Austin";
         this.customerClipName = "Austin";
         this.customerFirstGame = "Papa\'s Cheeseria";
         this.thumbColor = "yelloworange";
         this.setupOrder();
         this.stickers = ["maracas","blueribbon","grilledcheese"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_SHISO);
         _loc1_.addFillings(FoodData.FILLING_TOFU,FoodData.FILLING_SNOWPEAS,FoodData.FILLING_CREAMCHEESE);
         _loc1_.addToppings(FoodData.SHAKER_FURIKAKE,FoodData.SAUCE_YUMYUM);
         _loc1_.setTea(FoodData.TEA_MATCHA,FoodData.BUBBLE_PAWPAW);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_APRIL);
         _loc2_.setPaper(FoodData.PAPER_NORI);
         _loc2_.setRice(FoodData.RICE_SHISO);
         _loc2_.addFillings(FoodData.FILLING_TOFU,FoodData.FILLING_SNOWPEAS,FoodData.FILLING_NARUTOMAKI);
         _loc2_.addToppings(FoodData.SHAKER_WAKAME,FoodData.SAUCE_YUMYUM);
         _loc2_.setTea(FoodData.TEA_HAKUTO,FoodData.BUBBLE_PAWPAW);
         this.addCustomerOrder(_loc2_);
      }
   }
}
