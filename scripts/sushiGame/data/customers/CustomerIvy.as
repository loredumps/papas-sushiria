package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerIvy extends CustomerDataFile
   {
       
      
      public function CustomerIvy()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Ivy";
         this.customerClipName = "Ivy";
         this.customerFirstGame = "Papa\'s Freezeria";
         this.thumbColor = "yelloworange";
         this.flipdeckNumber = 129;
         this.setupOrder();
         this.stickers = ["strawbuzzy","cheesecake","nuttybutter"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_WHITE);
         _loc1_.addFillings(FoodData.FILLING_TOFU,FoodData.FILLING_CRABSTICK);
         _loc1_.addToppings(FoodData.DROP_SAYORI,FoodData.SAUCE_TERIYAKI);
         _loc1_.setTea(FoodData.TEA_STRAWBERRY,FoodData.BUBBLE_SUGARPLUM);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_JANUARY);
         _loc2_.setPaper(FoodData.PAPER_NORI);
         _loc2_.setRice(FoodData.RICE_WHITE);
         _loc2_.addFillings(FoodData.FILLING_EGGPLANT,FoodData.FILLING_RAINBOWYOKAN);
         _loc2_.addToppings(FoodData.DROP_SAYORI,FoodData.SAUCE_FLAVORX);
         _loc2_.setTea(FoodData.TEA_TUTTIFRUTTI,FoodData.BUBBLE_SUGARPLUM);
         this.addCustomerOrder(_loc2_);
      }
   }
}
