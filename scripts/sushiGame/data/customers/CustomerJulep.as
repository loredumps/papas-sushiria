package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerJulep extends CustomerDataFile
   {
       
      
      public function CustomerJulep()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Julep";
         this.customerClipName = "Julep";
         this.customerFirstGame = "Papa\'s Donuteria";
         this.thumbColor = "seafoam";
         this.flipdeckNumber = 162;
         this.setupOrder();
         this.stickers = ["musicnote","honeydew","heart"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_UKONIRO);
         _loc1_.setRice(FoodData.RICE_SHISO,true);
         _loc1_.addFillings(FoodData.FILLING_ASAPARAGUS,FoodData.FILLING_SNOWPEAS,FoodData.FILLING_CUCUMBER);
         _loc1_.addToppings(FoodData.DROP_KIWI,FoodData.SAUCE_HIBACHI);
         _loc1_.setTea(FoodData.TEA_MATCHA,FoodData.BUBBLE_CUCUMBER);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_DECEMBER);
         _loc2_.setPaper(FoodData.PAPER_ELF);
         _loc2_.setRice(FoodData.RICE_SHISO,true);
         _loc2_.addFillings(FoodData.FILLING_ASAPARAGUS,FoodData.FILLING_SNOWPEAS,FoodData.FILLING_SPRUCETIPS);
         _loc2_.addToppings(FoodData.DROP_KIWI,FoodData.SAUCE_HIBACHI);
         _loc2_.setTea(FoodData.TEA_MATCHA,FoodData.BUBBLE_CUCUMBER);
         this.addCustomerOrder(_loc2_);
      }
   }
}
