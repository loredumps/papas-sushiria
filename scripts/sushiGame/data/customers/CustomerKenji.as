package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerKenji extends CustomerDataFile
   {
       
      
      public function CustomerKenji()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Kenji";
         this.customerClipName = "Kenji";
         this.customerFirstGame = "Papa\'s Hot Doggeria";
         this.thumbColor = "fire";
         this.flipdeckNumber = 79;
         this.livesInApartment = true;
         this.stickers = ["sarge","cupcake","lepunch"];
         this.setupOrder();
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_UKONIRO);
         _loc1_.setRice(FoodData.RICE_BROWN,true);
         _loc1_.addFillings(FoodData.FILLING_TOFU,FoodData.FILLING_CUCUMBER,FoodData.FILLING_GREENONIONS);
         _loc1_.addToppings(FoodData.SHAKER_FURIKAKE,FoodData.SAUCE_TERIYAKI);
         _loc1_.setTea(FoodData.TEA_TANGERINE,FoodData.BUBBLE_KIWI);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_MAY);
         _loc2_.setPaper(FoodData.PAPER_UKONIRO);
         _loc2_.setRice(FoodData.RICE_BROWN,true);
         _loc2_.addFillings(FoodData.FILLING_CHORIZO,FoodData.FILLING_CUCUMBER,FoodData.FILLING_GREENONIONS);
         _loc2_.addToppings(FoodData.SHAKER_RECADOROJO,FoodData.SAUCE_NACHOCHEESE);
         _loc2_.setTea(FoodData.TEA_HORCHATA,FoodData.BUBBLE_KIWI);
         this.addCustomerOrder(_loc2_);
      }
   }
}
