package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerGreg extends CustomerDataFile
   {
       
      
      public function CustomerGreg()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Greg";
         this.customerClipName = "Greg";
         this.customerFirstGame = "Papa Louie";
         this.thumbColor = "lime";
         this.flipdeckNumber = 23;
         this.livesInApartment = true;
         this.houseColor = "bluepurple";
         this.setupOrder();
         this.hasAlternateShoes = true;
         this.stickers = ["burgerzilla","pepperjack","papalouie"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_BLACK,true);
         _loc1_.addFillings(FoodData.FILLING_TUNA,FoodData.FILLING_CREAMCHEESE);
         _loc1_.addToppings(FoodData.DROP_TUNA,FoodData.SAUCE_PONZU);
         _loc1_.setTea(FoodData.TEA_CHOCOLATE,FoodData.BUBBLE_CHERRY);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_FEBRUARY);
         _loc2_.setPaper(FoodData.PAPER_NORI);
         _loc2_.setRice(FoodData.RICE_BLACK,true);
         _loc2_.addFillings(FoodData.FILLING_TUNA,FoodData.FILLING_HOKKIGAI,FoodData.FILLING_CREAMCHEESE);
         _loc2_.addToppings(FoodData.DROP_TUNA,FoodData.SAUCE_AZUKI);
         _loc2_.setTea(FoodData.TEA_CHOCOLATE,FoodData.BUBBLE_CHERRY);
         this.addCustomerOrder(_loc2_);
      }
   }
}
