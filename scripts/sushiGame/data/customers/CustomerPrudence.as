package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerPrudence extends CustomerDataFile
   {
       
      
      public function CustomerPrudence()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Prudence";
         this.customerClipName = "Prudence";
         this.thumbColor = "bluepurple";
         this.customerFirstGame = "Papa Louie";
         this.flipdeckNumber = 86;
         this.livesInApartment = true;
         this.holidayOutfit = GameData.MONTH_AUGUST;
         this.hasHolidayShoes = true;
         this.setupOrder();
         this.stickers = ["pretzel","jellyback","turkeys"];
         this.hasAlternateShoes = true;
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_MOMOIRO);
         _loc1_.setRice(FoodData.RICE_WHITE);
         _loc1_.addFillings(FoodData.FILLING_SHIITAKE,FoodData.FILLING_TOFU,FoodData.FILLING_CUCUMBER);
         _loc1_.addToppings(FoodData.SAUCE_YUMYUM);
         _loc1_.setTea(FoodData.TEA_CHAI,FoodData.BUBBLE_CUCUMBER);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_AUGUST);
         _loc2_.setPaper(FoodData.PAPER_RAUTENFLAGGE);
         _loc2_.setRice(FoodData.RICE_WHITE);
         _loc2_.addFillings(FoodData.FILLING_SHIITAKE,FoodData.FILLING_TOFU,FoodData.FILLING_CUCUMBER);
         _loc2_.addToppings(FoodData.DROP_BREZN,FoodData.SAUCE_MUSTARD);
         _loc2_.setTea(FoodData.TEA_CHAI,FoodData.BUBBLE_CUCUMBER);
         this.addCustomerOrder(_loc2_);
      }
   }
}
