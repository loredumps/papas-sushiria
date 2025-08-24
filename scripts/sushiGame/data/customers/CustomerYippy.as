package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerYippy extends CustomerDataFile
   {
       
      
      public function CustomerYippy()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Yippy";
         this.customerClipName = "Yippy";
         this.thumbColor = "lime";
         this.customerFirstGame = "Papa\'s Pancakeria";
         this.flipdeckNumber = 34;
         this.setupOrder();
         this.stickers = ["papalouie","pancakes","stache"];
         this.hasAlternateShoes = true;
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_MOMOIRO);
         _loc1_.setRice(FoodData.RICE_WHITE,true);
         _loc1_.addFillings(FoodData.FILLING_CREAMCHEESE,FoodData.FILLING_TAMAGO);
         _loc1_.addToppings(FoodData.SAUCE_DUCK);
         _loc1_.setTea(FoodData.TEA_CHOCOLATE,FoodData.BUBBLE_CHERRY);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_FEBRUARY);
         _loc2_.setPaper(FoodData.PAPER_MOMOIRO);
         _loc2_.setRice(FoodData.RICE_WHITE,true);
         _loc2_.addFillings(FoodData.FILLING_CREAMCHEESE,FoodData.FILLING_TAMAGO);
         _loc2_.addToppings(FoodData.SAUCE_AZUKI);
         _loc2_.setTea(FoodData.TEA_CHOCOLATE,FoodData.BUBBLE_CHERRY);
         this.addCustomerOrder(_loc2_);
      }
   }
}
