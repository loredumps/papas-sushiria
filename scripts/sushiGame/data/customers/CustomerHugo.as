package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerHugo extends CustomerDataFile
   {
       
      
      public function CustomerHugo()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Hugo";
         this.customerClipName = "Hugo";
         this.thumbColor = "fire";
         this.flipdeckNumber = 59;
         this.setupOrder();
         this.hasAlternateShoes = true;
         this.hasAlternateEyes = true;
         this.stickers = ["onion","discoplumm","woollies"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_BROWN,true);
         _loc1_.addFillings(FoodData.FILLING_TUNA,FoodData.FILLING_SNOWPEAS,FoodData.FILLING_CARROTS);
         _loc1_.addToppings(FoodData.DROP_AVOCADO,FoodData.SAUCE_YUMYUM);
         _loc1_.setTea(FoodData.TEA_ALMOND,FoodData.BUBBLE_TAPIOCA);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_AUGUST);
         _loc2_.setPaper(FoodData.PAPER_NORI);
         _loc2_.setRice(FoodData.RICE_BROWN,true);
         _loc2_.addFillings(FoodData.FILLING_BRATWURST,FoodData.FILLING_SNOWPEAS,FoodData.FILLING_CARROTS);
         _loc2_.addToppings(FoodData.DROP_BREZN,FoodData.SHAKER_SAUERKRAUT,FoodData.SAUCE_YUMYUM);
         _loc2_.setTea(FoodData.TEA_ALMOND,FoodData.BUBBLE_TAPIOCA);
         this.addCustomerOrder(_loc2_);
      }
   }
}
