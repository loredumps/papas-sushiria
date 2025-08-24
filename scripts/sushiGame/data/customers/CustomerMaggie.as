package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerMaggie extends CustomerDataFile
   {
       
      
      public function CustomerMaggie()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Maggie";
         this.customerClipName = "Maggie";
         this.thumbColor = "yelloworange";
         this.customerFirstGame = "Papa Louie";
         this.flipdeckNumber = 104;
         this.holidayOutfit = GameData.MONTH_MAY;
         this.hasHolidayShoes = true;
         this.hasAlternateShoes = true;
         this.setupOrder();
         this.stickers = ["partysubs","peachbuzzy","nuttybutter"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_UKONIRO);
         _loc1_.setRice(FoodData.RICE_WHITE);
         _loc1_.addFillings(FoodData.FILLING_JALAPENO,FoodData.FILLING_CREAMCHEESE);
         _loc1_.addToppings(FoodData.DROP_SALMON,FoodData.SAUCE_TERIYAKI);
         _loc1_.setTea(FoodData.TEA_CHOCOLATE,FoodData.BUBBLE_TAPIOCA);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_MAY);
         _loc2_.setPaper(FoodData.PAPER_TORTILLA);
         _loc2_.setRice(FoodData.RICE_WHITE);
         _loc2_.addFillings(FoodData.FILLING_CHORIZO,FoodData.FILLING_JALAPENO,FoodData.FILLING_CREAMCHEESE);
         _loc2_.addToppings(FoodData.DROP_CHORIZO,FoodData.SAUCE_TERIYAKI);
         _loc2_.setTea(FoodData.TEA_HORCHATA,FoodData.BUBBLE_TAPIOCA);
         this.addCustomerOrder(_loc2_);
      }
   }
}
