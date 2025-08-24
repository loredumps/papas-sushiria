package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerCletus extends CustomerDataFile
   {
       
      
      public function CustomerCletus()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Cletus";
         this.customerClipName = "Cletus";
         this.customerFirstGame = "Papa\'s Burgeria";
         this.thumbColor = "brown";
         this.flipdeckNumber = 118;
         this.hasAlternateHands = true;
         this.hasAlternateShoes = true;
         this.setupOrder();
         this.stickers = ["cheddarmac","dillwheel","lepunch"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_BROWN);
         _loc1_.addFillings(FoodData.FILLING_GREENONIONS,FoodData.FILLING_CARROTS,FoodData.FILLING_CREAMCHEESE);
         _loc1_.addToppings(FoodData.SHAKER_TEMPURACRUNCH,FoodData.SAUCE_YUZAKOSHO);
         _loc1_.setTea(FoodData.TEA_BLUEBERRY,FoodData.BUBBLE_COTTONCANDY);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_MAY);
         _loc2_.setPaper(FoodData.PAPER_TORTILLA);
         _loc2_.setRice(FoodData.RICE_BROWN);
         _loc2_.addFillings(FoodData.FILLING_GREENONIONS,FoodData.FILLING_CARROTS,FoodData.FILLING_CHORIZO);
         _loc2_.addToppings(FoodData.SHAKER_RECADOROJO,FoodData.SAUCE_YUZAKOSHO);
         _loc2_.setTea(FoodData.TEA_PINACOLADA,FoodData.BUBBLE_MANGO);
         this.addCustomerOrder(_loc2_);
      }
   }
}
