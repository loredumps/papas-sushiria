package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerLisa extends CustomerDataFile
   {
       
      
      public function CustomerLisa()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Lisa";
         this.customerClipName = "Lisa";
         this.customerFirstGame = "Papa\'s Burgeria";
         this.thumbColor = "purple";
         this.flipdeckNumber = 125;
         this.setupOrder();
         this.stickers = ["awesomesaucer","taco","cheesecake"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_WHITE);
         _loc1_.addFillings(FoodData.FILLING_CREAMCHEESE,FoodData.FILLING_SNOWPEAS,FoodData.FILLING_TOFU);
         _loc1_.addToppings(FoodData.SAUCE_GENERALTSO,FoodData.SHAKER_SESAMESEEDS);
         _loc1_.setTea(FoodData.TEA_BLUEBERRY,FoodData.BUBBLE_CUCUMBER);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_JULY);
         _loc2_.setPaper(FoodData.PAPER_DELI);
         _loc2_.setRice(FoodData.RICE_WHITE);
         _loc2_.addFillings(FoodData.FILLING_CREAMCHEESE,FoodData.FILLING_SNOWPEAS,FoodData.FILLING_TOFU);
         _loc2_.addToppings(FoodData.SAUCE_LONESTARPIT,FoodData.SHAKER_BBQRUB);
         _loc2_.setTea(FoodData.TEA_BLUEBERRY,FoodData.BUBBLE_CUCUMBER);
         this.addCustomerOrder(_loc2_);
      }
   }
}
