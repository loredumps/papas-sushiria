package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerSue extends CustomerDataFile
   {
       
      
      public function CustomerSue()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Sue";
         this.customerClipName = "Sue";
         this.thumbColor = "dustyblue";
         this.customerFirstGame = "Papa Louie";
         this.livesInApartment = true;
         this.flipdeckNumber = 141;
         this.setupOrder();
         this.stickers = ["tomatoes","pie","armyonion"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_BLACK);
         _loc1_.addFillings(FoodData.FILLING_SHIITAKE,FoodData.FILLING_CREAMCHEESE);
         _loc1_.addToppings(FoodData.DROP_MANGO,FoodData.SAUCE_HIBACHI);
         _loc1_.setTea(FoodData.TEA_STRAWBERRY,FoodData.BUBBLE_WATERMELON);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_FEBRUARY);
         _loc2_.setPaper(FoodData.PAPER_AKAI);
         _loc2_.setRice(FoodData.RICE_BLACK);
         _loc2_.addFillings(FoodData.FILLING_SHIITAKE,FoodData.FILLING_CREAMCHEESE);
         _loc2_.addToppings(FoodData.DROP_STRAWBERRY,FoodData.SAUCE_HIBACHI);
         _loc2_.setTea(FoodData.TEA_RASPBERRY,FoodData.BUBBLE_WATERMELON);
         this.addCustomerOrder(_loc2_);
      }
   }
}
