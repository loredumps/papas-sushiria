package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerUtah extends CustomerDataFile
   {
       
      
      public function CustomerUtah()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Utah";
         this.customerClipName = "Utah";
         this.customerFirstGame = "Papa\'s Freezeria";
         this.thumbColor = "yelloworange";
         this.flipdeckNumber = 71;
         this.setupOrder();
         this.stickers = ["nuttybutter","lepunch","cheddarmac"];
         this.hasAlternateShoes = true;
         this.hasAlternateEyes = true;
         this.holidayOutfit = GameData.MONTH_JUNE;
         this.hasHolidayEyes = true;
         this.hasHolidayShoes = true;
         this.secretSpecialIndex = 0;
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_MOMOIRO);
         _loc1_.setRice(FoodData.RICE_WHITE);
         _loc1_.addFillings(FoodData.FILLING_TUNA,FoodData.FILLING_LOBSTER,FoodData.FILLING_CREAMCHEESE);
         _loc1_.addToppings(FoodData.DROP_TUNA,FoodData.SAUCE_GINGERMISO);
         _loc1_.setTea(FoodData.TEA_PINACOLADA,FoodData.BUBBLE_MANGO);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_JUNE);
         _loc2_.setPaper(FoodData.PAPER_MIZUIRO);
         _loc2_.setRice(FoodData.RICE_WHITE);
         _loc2_.addFillings(FoodData.FILLING_TUNA,FoodData.FILLING_LOBSTER,FoodData.FILLING_PINEAPPLE);
         _loc2_.addToppings(FoodData.DROP_TUNA,FoodData.SAUCE_CALYPSO);
         _loc2_.setTea(FoodData.TEA_PINACOLADA,FoodData.BUBBLE_MANGO);
         this.addCustomerOrder(_loc2_);
      }
   }
}
