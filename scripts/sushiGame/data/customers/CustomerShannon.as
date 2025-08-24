package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerShannon extends CustomerDataFile
   {
       
      
      public function CustomerShannon()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Shannon";
         this.customerClipName = "Shannon";
         this.thumbColor = "skyblue";
         this.customerFirstGame = "Papa\'s Hot Doggeria";
         this.flipdeckNumber = 77;
         this.setupOrder();
         this.stickers = ["sarge","sandbucket","dillwheel"];
         this.hasAlternateShoes = true;
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_UKONIRO);
         _loc1_.setRice(FoodData.RICE_WHITE,true);
         _loc1_.addFillings(FoodData.FILLING_SHRIMP,FoodData.FILLING_AVOCADO);
         _loc1_.addToppings(FoodData.DROP_AVOCADO,FoodData.SHAKER_BONITOFLAKES,FoodData.SAUCE_TERIYAKI);
         _loc1_.setTea(FoodData.TEA_BLUEBERRY,FoodData.BUBBLE_CHERRY);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_AUGUST);
         _loc2_.setPaper(FoodData.PAPER_UKONIRO);
         _loc2_.setRice(FoodData.RICE_WHITE,true);
         _loc2_.addFillings(FoodData.FILLING_BRATWURST,FoodData.FILLING_AVOCADO);
         _loc2_.addToppings(FoodData.DROP_BREZN,FoodData.SHAKER_SAUERKRAUT,FoodData.SAUCE_MUSTARD);
         _loc2_.setTea(FoodData.TEA_BLUEBERRY,FoodData.BUBBLE_CHERRY);
         this.addCustomerOrder(_loc2_);
      }
   }
}
