package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerHank extends CustomerDataFile
   {
       
      
      public function CustomerHank()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Hank";
         this.customerClipName = "Hank";
         this.customerFirstGame = "Papa\'s Pancakeria";
         this.thumbColor = "yelloworange";
         this.flipdeckNumber = 27;
         this.setupOrder();
         this.stickers = ["flipper","warpcoin","skull"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_BROWN);
         _loc1_.addFillings(FoodData.FILLING_SHIITAKE,FoodData.FILLING_WAGYU);
         _loc1_.addToppings(FoodData.SAUCE_TONKATSU,FoodData.SHAKER_SESAMESEEDS);
         _loc1_.setTea(FoodData.TEA_MOCHA,FoodData.BUBBLE_BUTTERSCOTCH);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_SEPTEMBER);
         _loc2_.setPaper(FoodData.PAPER_NORI);
         _loc2_.setRice(FoodData.RICE_BROWN);
         _loc2_.addFillings(FoodData.FILLING_SHIITAKE,FoodData.FILLING_WAGYU,FoodData.FILLING_HASHBROWN);
         _loc2_.addToppings(FoodData.SAUCE_MAPLE,FoodData.SHAKER_SESAMESEEDS);
         _loc2_.setTea(FoodData.TEA_MOCHA,FoodData.BUBBLE_BUTTERSCOTCH);
         this.addCustomerOrder(_loc2_);
      }
   }
}
