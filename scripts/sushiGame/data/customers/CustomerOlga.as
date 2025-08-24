package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerOlga extends CustomerDataFile
   {
       
      
      public function CustomerOlga()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Olga";
         this.customerClipName = "Olga";
         this.thumbColor = "lime";
         this.flipdeckNumber = 38;
         this.houseColor = "deepred";
         this.setupOrder();
         this.isHuge = true;
         this.stickers = ["grilledcheese","mangoby","partysubs"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_MOMOIRO);
         _loc1_.setRice(FoodData.RICE_BROWN);
         _loc1_.addFillings(FoodData.FILLING_SHIITAKE,FoodData.FILLING_CARROTS,FoodData.FILLING_GREENONIONS);
         _loc1_.addToppings(FoodData.SHAKER_SESAMESEEDS,FoodData.SAUCE_YUZAKOSHO);
         _loc1_.setTea(FoodData.TEA_CHAI,FoodData.BUBBLE_HUCKLEBERRY);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_AUGUST);
         _loc2_.setPaper(FoodData.PAPER_RAUTENFLAGGE);
         _loc2_.setRice(FoodData.RICE_BROWN);
         _loc2_.addFillings(FoodData.FILLING_SHIITAKE,FoodData.FILLING_BRATWURST,FoodData.FILLING_CARROTS);
         _loc2_.addToppings(FoodData.SHAKER_SESAMESEEDS,FoodData.SHAKER_SAUERKRAUT,FoodData.SAUCE_YUZAKOSHO);
         _loc2_.setTea(FoodData.TEA_CHAI,FoodData.BUBBLE_HUCKLEBERRY);
         this.addCustomerOrder(_loc2_);
      }
   }
}
