package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerChuck extends CustomerDataFile
   {
       
      
      public function CustomerChuck()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Chuck";
         this.customerClipName = "Chuck";
         this.thumbColor = "yellow";
         this.customerFirstGame = "Papa Louie";
         this.flipdeckNumber = 112;
         this.livesInApartment = true;
         this.houseColor = "midred";
         this.hasAlternateShoes = true;
         this.setupOrder();
         this.stickers = ["fizzo","samurais","pizza"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_UKONIRO);
         _loc1_.setRice(FoodData.RICE_WHITE,true);
         _loc1_.addFillings(FoodData.FILLING_SALMON,FoodData.FILLING_CREAMCHEESE,FoodData.FILLING_CARROTS);
         _loc1_.addToppings(FoodData.DROP_MANGO);
         _loc1_.setTea(FoodData.TEA_PINACOLADA,FoodData.BUBBLE_MANGO);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_JUNE);
         _loc2_.setPaper(FoodData.PAPER_UKONIRO);
         _loc2_.setRice(FoodData.RICE_WHITE,true);
         _loc2_.addFillings(FoodData.FILLING_PINEAPPLE,FoodData.FILLING_CREAMCHEESE,FoodData.FILLING_CARROTS);
         _loc2_.addToppings(FoodData.DROP_MANGO);
         _loc2_.setTea(FoodData.TEA_PINACOLADA,FoodData.BUBBLE_MANGO);
         this.addCustomerOrder(_loc2_);
      }
   }
}
