package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerConnor extends CustomerDataFile
   {
       
      
      public function CustomerConnor()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Connor";
         this.customerClipName = "Connor";
         this.customerFirstGame = "Papa\'s Burgeria";
         this.thumbColor = "skyblue";
         this.flipdeckNumber = 69;
         this.hasAlternateShoes = true;
         this.setupOrder();
         this.stickers = ["tomato","bacobites","fizzo"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_UKONIRO);
         _loc1_.setRice(FoodData.RICE_WHITE);
         _loc1_.addFillings(FoodData.FILLING_CRABSTICK,FoodData.FILLING_JALAPENO);
         _loc1_.addToppings(FoodData.DROP_PRAWN,FoodData.SAUCE_DUCK);
         _loc1_.setTea(FoodData.TEA_STRAWBERRY,FoodData.BUBBLE_HUCKLEBERRY);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_MAY);
         _loc2_.setPaper(FoodData.PAPER_TORTILLA);
         _loc2_.setRice(FoodData.RICE_WHITE);
         _loc2_.addFillings(FoodData.FILLING_CRABSTICK,FoodData.FILLING_JALAPENO);
         _loc2_.addToppings(FoodData.DROP_PRAWN,FoodData.SAUCE_DUCK);
         _loc2_.setTea(FoodData.TEA_STRAWBERRY,FoodData.BUBBLE_HUCKLEBERRY);
         this.addCustomerOrder(_loc2_);
      }
   }
}
