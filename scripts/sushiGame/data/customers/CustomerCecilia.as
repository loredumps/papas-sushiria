package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerCecilia extends CustomerDataFile
   {
       
      
      public function CustomerCecilia()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Cecilia";
         this.customerClipName = "Cecilia";
         this.thumbColor = "midred";
         this.flipdeckNumber = 166;
         this.hasAlternateShoes = true;
         this.stickers = ["lettucelark","flapjacks","anchovy"];
         this.setupOrder();
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_BROWN,true);
         _loc1_.addFillings(FoodData.FILLING_TOFU,FoodData.FILLING_CUCUMBER);
         _loc1_.addToppings(FoodData.SHAKER_BONITOFLAKES);
         _loc1_.setTea(FoodData.TEA_CHOCOLATE,FoodData.BUBBLE_CHERRY);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_AUGUST);
         _loc2_.setPaper(FoodData.PAPER_NORI);
         _loc2_.setRice(FoodData.RICE_BROWN,true);
         _loc2_.addFillings(FoodData.FILLING_TOFU,FoodData.FILLING_BREZN);
         _loc2_.addToppings(FoodData.SHAKER_SAUERKRAUT);
         _loc2_.setTea(FoodData.TEA_BLACKFOREST,FoodData.BUBBLE_CHERRY);
         this.addCustomerOrder(_loc2_);
      }
   }
}
