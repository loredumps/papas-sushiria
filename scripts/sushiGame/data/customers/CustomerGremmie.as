package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerGremmie extends CustomerDataFile
   {
       
      
      public function CustomerGremmie()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Gremmie";
         this.customerClipName = "Gremmie";
         this.customerFirstGame = "Papa\'s Freezeria";
         this.thumbColor = "yelloworange";
         this.flipdeckNumber = 123;
         this.setupOrder();
         this.hasAlternateShoes = true;
         this.stickers = ["pizza","discoplumm","taco"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_SHISO);
         _loc1_.addFillings(FoodData.FILLING_LOBSTER,FoodData.FILLING_CREAMCHEESE);
         _loc1_.addToppings(FoodData.DROP_PRAWN,FoodData.SAUCE_WASABIMAYO);
         _loc1_.setTea(FoodData.TEA_MATCHA,FoodData.BUBBLE_KIWI);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_MARCH);
         _loc2_.setPaper(FoodData.PAPER_NORI);
         _loc2_.setRice(FoodData.RICE_SHISO);
         _loc2_.addFillings(FoodData.FILLING_LOBSTER,FoodData.FILLING_KANPYO);
         _loc2_.addToppings(FoodData.DROP_PRAWN,FoodData.SHAKER_LUCKYDUST,FoodData.SAUCE_WASABIMAYO);
         _loc2_.setTea(FoodData.TEA_MATCHA,FoodData.BUBBLE_KIWI);
         this.addCustomerOrder(_loc2_);
      }
   }
}
