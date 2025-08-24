package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerBertha extends CustomerDataFile
   {
       
      
      public function CustomerBertha()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Bertha";
         this.customerClipName = "Bertha";
         this.customerFirstGame = "Papa\'s Hot Doggeria";
         this.thumbColor = "emerald";
         this.flipdeckNumber = 137;
         this.isHuge = true;
         this.setupOrder();
         this.stickers = ["cherryblossom","batters","shrooms"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_UKONIRO);
         _loc1_.setRice(FoodData.RICE_BROWN);
         _loc1_.addFillings(FoodData.FILLING_CRABSTICK,FoodData.FILLING_RADISHSPROUTS,FoodData.FILLING_SNOWPEAS);
         _loc1_.addToppings(FoodData.DROP_MANGO,FoodData.SAUCE_PONZU);
         _loc1_.setTea(FoodData.TEA_ALMOND,FoodData.BUBBLE_MANGO);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_NOVEMBER);
         _loc2_.setPaper(FoodData.PAPER_CHAIRO);
         _loc2_.setRice(FoodData.RICE_BROWN);
         _loc2_.addFillings(FoodData.FILLING_CRABSTICK,FoodData.FILLING_RADISHSPROUTS,FoodData.FILLING_SNOWPEAS);
         _loc2_.addToppings(FoodData.DROP_MANGO,FoodData.SAUCE_GRAVY);
         _loc2_.setTea(FoodData.TEA_PUMPKINSPICE,FoodData.BUBBLE_MANGO);
         this.addCustomerOrder(_loc2_);
      }
   }
}
