package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerHackyZak extends CustomerDataFile
   {
       
      
      public function CustomerHackyZak()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Hacky Zak";
         this.customerClipName = "HackyZak";
         this.customerFirstGame = "Papa\'s Donuteria";
         this.thumbColor = "lime";
         this.hasAlternateShoes = true;
         this.flipdeckNumber = 139;
         this.setupOrder();
         this.stickers = ["radish","bacobites","cheesecake"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_WHITE);
         _loc1_.addFillings(FoodData.FILLING_SALMON,FoodData.FILLING_CREAMCHEESE);
         _loc1_.addToppings(FoodData.DROP_MANGO,FoodData.SAUCE_DUCK);
         _loc1_.setTea(FoodData.TEA_STRAWBERRY,FoodData.BUBBLE_MANGO);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_APRIL);
         _loc2_.setPaper(FoodData.PAPER_NORI);
         _loc2_.setRice(FoodData.RICE_WHITE);
         _loc2_.addFillings(FoodData.FILLING_KAMPACHI,FoodData.FILLING_CREAMCHEESE);
         _loc2_.addToppings(FoodData.DROP_MANGO,FoodData.SHAKER_WAKAME,FoodData.SAUCE_SWEETSAKURA);
         _loc2_.setTea(FoodData.TEA_STRAWBERRY,FoodData.BUBBLE_MANGO);
         this.addCustomerOrder(_loc2_);
      }
   }
}
