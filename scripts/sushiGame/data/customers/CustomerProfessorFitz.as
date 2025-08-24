package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerProfessorFitz extends CustomerDataFile
   {
       
      
      public function CustomerProfessorFitz()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Professor Fitz";
         this.customerClipName = "ProfessorFitz";
         this.customerFirstGame = "Papa\'s Wingeria";
         this.thumbColor = "deepred";
         this.flipdeckNumber = 96;
         this.setupOrder();
         this.stickers = ["anchovy","sundaesaurus","leaf"];
         this.hasAlternateHands = true;
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_SHISO,true);
         _loc1_.addFillings(FoodData.FILLING_SHRIMP);
         _loc1_.addToppings(FoodData.DROP_KIWI,FoodData.SHAKER_TOBIKO);
         _loc1_.setTea(FoodData.TEA_MATCHA,FoodData.BUBBLE_KIWI);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_OCTOBER);
         _loc2_.setPaper(FoodData.PAPER_NORI);
         _loc2_.setRice(FoodData.RICE_SHISO,true);
         _loc2_.addFillings(FoodData.FILLING_SHRIMP);
         _loc2_.addToppings(FoodData.DROP_KIWI,FoodData.SAUCE_SQUID,FoodData.SHAKER_IKURA);
         _loc2_.setTea(FoodData.TEA_WITCHSBREW,FoodData.BUBBLE_KIWI);
         this.addCustomerOrder(_loc2_);
      }
   }
}
