package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerMitch extends CustomerDataFile
   {
       
      
      public function CustomerMitch()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Mitch";
         this.customerClipName = "Mitch";
         this.thumbColor = "bluepurple";
         this.customerFirstGame = "Papa Louie";
         this.flipdeckNumber = 67;
         this.livesInApartment = true;
         this.setupOrder();
         this.hasAlternateShoes = true;
         this.stickers = ["flapjacks","newyear","jillberry"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_BROWN);
         _loc1_.addFillings(FoodData.FILLING_CUCUMBER,FoodData.FILLING_SHRIMP);
         _loc1_.addToppings(FoodData.DROP_MANGO,FoodData.SHAKER_TOBIKO,FoodData.SAUCE_PONZU);
         _loc1_.setTea(FoodData.TEA_PINACOLADA,FoodData.BUBBLE_PAWPAW);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_DECEMBER);
         _loc2_.setPaper(FoodData.PAPER_ELF);
         _loc2_.setRice(FoodData.RICE_BROWN);
         _loc2_.addFillings(FoodData.FILLING_CUCUMBER,FoodData.FILLING_SHRIMP);
         _loc2_.addToppings(FoodData.DROP_TAI,FoodData.SHAKER_YULEMASAGO,FoodData.SAUCE_PONZU);
         _loc2_.setTea(FoodData.TEA_PINACOLADA,FoodData.BUBBLE_PAWPAW);
         this.addCustomerOrder(_loc2_);
      }
   }
}
