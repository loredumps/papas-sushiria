package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerBrunaRomano extends CustomerDataFile
   {
       
      
      public function CustomerBrunaRomano()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Bruna Romano";
         this.customerClipName = "BrunaRomano";
         this.thumbColor = "deepred";
         this.flipdeckNumber = 48;
         this.setupOrder();
         this.stickers = ["slider","woollies","jillberry"];
         this.secretSpecialIndex = 17;
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_BROWN,true);
         _loc1_.addFillings(FoodData.FILLING_SHIITAKE,FoodData.FILLING_CUCUMBER,FoodData.FILLING_CARROTS);
         _loc1_.addToppings(FoodData.SHAKER_SESAMESEEDS,FoodData.SAUCE_GENERALTSO);
         _loc1_.setTea(FoodData.TEA_MOCHA,FoodData.BUBBLE_BUTTERSCOTCH);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_SEPTEMBER);
         _loc2_.setPaper(FoodData.PAPER_KIIROI);
         _loc2_.setRice(FoodData.RICE_BROWN,true);
         _loc2_.addFillings(FoodData.FILLING_SHIITAKE,FoodData.FILLING_HASHBROWN,FoodData.FILLING_CARROTS);
         _loc2_.addToppings(FoodData.SHAKER_SESAMESEEDS,FoodData.SAUCE_MAPLE);
         _loc2_.setTea(FoodData.TEA_MOCHA,FoodData.BUBBLE_BUTTERSCOTCH);
         this.addCustomerOrder(_loc2_);
      }
   }
}
