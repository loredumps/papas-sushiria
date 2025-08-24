package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerMary extends CustomerDataFile
   {
       
      
      public function CustomerMary()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Mary";
         this.customerClipName = "Mary";
         this.thumbColor = "seafoam";
         this.customerFirstGame = "Papa Louie";
         this.flipdeckNumber = 131;
         this.livesInApartment = true;
         this.stickers = ["discoplumm","skull","anchovy"];
         this.hasAlternateShoes = true;
         this.setupOrder();
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_MOMOIRO);
         _loc1_.setRice(FoodData.RICE_WHITE);
         _loc1_.addFillings(FoodData.FILLING_SHRIMP,FoodData.FILLING_OCTOPUS);
         _loc1_.addToppings(FoodData.SHAKER_TEMPURACRUNCH,FoodData.SAUCE_TONKATSU);
         _loc1_.setTea(FoodData.TEA_TANGERINE,FoodData.BUBBLE_CUCUMBER);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_JANUARY);
         _loc2_.setPaper(FoodData.PAPER_MOMOIRO);
         _loc2_.setRice(FoodData.RICE_WHITE);
         _loc2_.addFillings(FoodData.FILLING_SHRIMP,FoodData.FILLING_OCTOPUS);
         _loc2_.addToppings(FoodData.SHAKER_TEMPURACRUNCH,FoodData.SAUCE_FLAVORX);
         _loc2_.setTea(FoodData.TEA_TUTTIFRUTTI,FoodData.BUBBLE_CUCUMBER);
         this.addCustomerOrder(_loc2_);
      }
   }
}
