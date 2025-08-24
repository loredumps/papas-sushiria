package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerLittleEdoardo extends CustomerDataFile
   {
       
      
      public function CustomerLittleEdoardo()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Little Edoardo";
         this.customerClipName = "LittleEdoardo";
         this.thumbColor = "deepred";
         this.flipdeckNumber = 14;
         this.setupOrder();
         this.stickers = ["daruma","strawbuzzy","stache"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_BROWN);
         _loc1_.addFillings(FoodData.FILLING_RADISHSPROUTS,FoodData.FILLING_JALAPENO);
         _loc1_.addToppings(FoodData.DROP_SAYORI,FoodData.SHAKER_TOBIKO,FoodData.SAUCE_WASABIMAYO);
         _loc1_.setTea(FoodData.TEA_MOCHA,FoodData.BUBBLE_SUGARPLUM);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_JANUARY);
         _loc2_.setPaper(FoodData.PAPER_NORI);
         _loc2_.setRice(FoodData.RICE_BROWN);
         _loc2_.addFillings(FoodData.FILLING_JALAPENO,FoodData.FILLING_EGGPLANT);
         _loc2_.addToppings(FoodData.DROP_SAYORI,FoodData.SHAKER_RAINBOW,FoodData.SAUCE_WASABIMAYO);
         _loc2_.setTea(FoodData.TEA_MOCHA,FoodData.BUBBLE_SUGARPLUM);
         this.addCustomerOrder(_loc2_);
      }
   }
}
