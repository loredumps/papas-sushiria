package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerGinoRomano extends CustomerDataFile
   {
       
      
      public function CustomerGinoRomano()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Gino Romano";
         this.customerClipName = "GinoRomano";
         this.thumbColor = "deepred";
         this.flipdeckNumber = 19;
         this.setupOrder();
         this.isHuge = true;
         this.stickers = ["sslouie","crushers","hardshells"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_BROWN);
         _loc1_.addFillings(FoodData.FILLING_SHRIMP,FoodData.FILLING_JALAPENO,FoodData.FILLING_SNOWPEAS);
         _loc1_.addToppings(FoodData.DROP_PRAWN,FoodData.SAUCE_WASABIMAYO);
         _loc1_.setTea(FoodData.TEA_MATCHA,FoodData.BUBBLE_HUCKLEBERRY);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_AUGUST);
         _loc2_.setPaper(FoodData.PAPER_RAUTENFLAGGE);
         _loc2_.setRice(FoodData.RICE_BROWN);
         _loc2_.addFillings(FoodData.FILLING_SHRIMP,FoodData.FILLING_JALAPENO,FoodData.FILLING_SNOWPEAS);
         _loc2_.addToppings(FoodData.DROP_PRAWN,FoodData.SHAKER_SAUERKRAUT,FoodData.SAUCE_WASABIMAYO);
         _loc2_.setTea(FoodData.TEA_BLACKFOREST,FoodData.BUBBLE_HUCKLEBERRY);
         this.addCustomerOrder(_loc2_);
      }
   }
}
