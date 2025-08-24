package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerTaylor extends CustomerDataFile
   {
       
      
      public function CustomerTaylor()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Taylor";
         this.customerClipName = "Taylor";
         this.thumbColor = "midred";
         this.customerFirstGame = "Papa Louie";
         this.flipdeckNumber = 92;
         this.livesInApartment = true;
         this.setupOrder();
         this.stickers = ["flipper","pasta","buffaloes"];
         this.hasAlternateShoes = true;
         this.hasAlternateHands = true;
         this.secretSpecialIndex = 11;
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_UKONIRO);
         _loc1_.setRice(FoodData.RICE_WHITE);
         _loc1_.addFillings(FoodData.FILLING_SHRIMP,FoodData.FILLING_SHIITAKE,FoodData.FILLING_ASAPARAGUS);
         _loc1_.addToppings(FoodData.SAUCE_DUCK);
         _loc1_.setTea(FoodData.TEA_MOCHA,FoodData.BUBBLE_BUTTERSCOTCH);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_NOVEMBER);
         _loc2_.setPaper(FoodData.PAPER_UKONIRO);
         _loc2_.setRice(FoodData.RICE_WHITE);
         _loc2_.addFillings(FoodData.FILLING_TURKEY,FoodData.FILLING_SHIITAKE,FoodData.FILLING_ASAPARAGUS);
         _loc2_.addToppings(FoodData.SAUCE_GRAVY);
         _loc2_.setTea(FoodData.TEA_MOCHA,FoodData.BUBBLE_BUTTERSCOTCH);
         this.addCustomerOrder(_loc2_);
      }
   }
}
