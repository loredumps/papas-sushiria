package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerSasha extends CustomerDataFile
   {
       
      
      public function CustomerSasha()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Sasha";
         this.customerClipName = "Sasha";
         this.thumbColor = "yelloworange";
         this.flipdeckNumber = 158;
         this.stickers = ["lettucelark","crushers","shrooms"];
         this.hasAlternateShoes = true;
         this.setupOrder();
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_UKONIRO);
         _loc1_.setRice(FoodData.RICE_WHITE);
         _loc1_.addFillings(FoodData.FILLING_CRABSTICK,FoodData.FILLING_CREAMCHEESE);
         _loc1_.addToppings(FoodData.SAUCE_DUCK,FoodData.SHAKER_SESAMESEEDS);
         _loc1_.setTea(FoodData.TEA_CHAI,FoodData.BUBBLE_BUTTERSCOTCH);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_MAY);
         _loc2_.setPaper(FoodData.PAPER_TORTILLA);
         _loc2_.setRice(FoodData.RICE_WHITE);
         _loc2_.addFillings(FoodData.FILLING_CHIPOTLECHEDDAR,FoodData.FILLING_CRABSTICK,FoodData.FILLING_CREAMCHEESE);
         _loc2_.addToppings(FoodData.SAUCE_NACHOCHEESE,FoodData.SHAKER_SESAMESEEDS);
         _loc2_.setTea(FoodData.TEA_CHAI,FoodData.BUBBLE_BUTTERSCOTCH);
         this.addCustomerOrder(_loc2_);
      }
   }
}
