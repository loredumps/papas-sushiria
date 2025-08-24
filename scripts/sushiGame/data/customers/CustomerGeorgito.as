package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerGeorgito extends CustomerDataFile
   {
       
      
      public function CustomerGeorgito()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Georgito";
         this.customerClipName = "Georgito";
         this.customerFirstGame = "Papa\'s Taco Mia!";
         this.thumbColor = "emerald";
         this.flipdeckNumber = 40;
         this.hasAlternateShoes = true;
         this.setupOrder();
         this.stickers = ["taco","crushers","chilifeather"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_BROWN);
         _loc1_.addFillings(FoodData.FILLING_OCTOPUS,FoodData.FILLING_SNOWPEAS,FoodData.FILLING_CALAMARI);
         _loc1_.addToppings(FoodData.SHAKER_TOBIKO,FoodData.SAUCE_YUZAKOSHO);
         _loc1_.setTea(FoodData.TEA_CHAI,FoodData.BUBBLE_SUGARPLUM);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_OCTOBER);
         _loc2_.setPaper(FoodData.PAPER_NORI);
         _loc2_.setRice(FoodData.RICE_BROWN);
         _loc2_.addFillings(FoodData.FILLING_OCTOPUS,FoodData.FILLING_SNOWPEAS,FoodData.FILLING_UNI);
         _loc2_.addToppings(FoodData.SHAKER_IKURA,FoodData.SAUCE_YUZAKOSHO);
         _loc2_.setTea(FoodData.TEA_WITCHSBREW,FoodData.BUBBLE_SUGARPLUM);
         this.addCustomerOrder(_loc2_);
      }
   }
}
