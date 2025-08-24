package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerTohru extends CustomerDataFile
   {
       
      
      public function CustomerTohru()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Tohru";
         this.customerClipName = "Tohru";
         this.thumbColor = "pink";
         this.flipdeckNumber = 147;
         this.holidayOutfit = GameData.MONTH_APRIL;
         this.hasHolidayHands = true;
         this.hasHolidayShoes = true;
         this.holidayHandExtra = "sakurafan";
         this.setupOrder();
         this.stickers = ["tomato","bacobites","batters"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_MOMOIRO);
         _loc1_.setRice(FoodData.RICE_BROWN);
         _loc1_.addFillings(FoodData.FILLING_UNAGI,FoodData.FILLING_CREAMCHEESE);
         _loc1_.addToppings(FoodData.DROP_SABA,FoodData.SAUCE_YUMYUM);
         _loc1_.setTea(FoodData.TEA_MATCHA,FoodData.BUBBLE_COTTONCANDY);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_APRIL);
         _loc2_.setPaper(FoodData.PAPER_SHIROI);
         _loc2_.setRice(FoodData.RICE_BROWN);
         _loc2_.addFillings(FoodData.FILLING_UNAGI,FoodData.FILLING_CREAMCHEESE);
         _loc2_.addToppings(FoodData.DROP_NARUTOMAKI,FoodData.SAUCE_YUMYUM);
         _loc2_.setTea(FoodData.TEA_HAKUTO,FoodData.BUBBLE_COTTONCANDY);
         this.addCustomerOrder(_loc2_);
      }
   }
}
