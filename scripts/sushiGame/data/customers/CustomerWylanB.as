package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerWylanB extends CustomerDataFile
   {
       
      
      public function CustomerWylanB()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Wylan B";
         this.customerClipName = "WylanB";
         this.thumbColor = "purple";
         this.customerFirstGame = "Papa\'s Sushiria";
         this.stickers = ["rocky","daruma","pepperjack"];
         this.setupOrder();
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_MOMOIRO);
         _loc1_.setRice(FoodData.RICE_BLACK);
         _loc1_.addFillings(FoodData.FILLING_OCTOPUS,FoodData.FILLING_CALAMARI);
         _loc1_.addToppings(FoodData.SAUCE_GENERALTSO);
         _loc1_.setTea(FoodData.TEA_TARO,FoodData.BUBBLE_SUGARPLUM);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_JANUARY);
         _loc2_.setPaper(FoodData.PAPER_MOMOIRO);
         _loc2_.setRice(FoodData.RICE_BLACK);
         _loc2_.addFillings(FoodData.FILLING_EGGPLANT,FoodData.FILLING_OCTOPUS,FoodData.FILLING_CALAMARI);
         _loc2_.addToppings(FoodData.SAUCE_FLAVORX);
         _loc2_.setTea(FoodData.TEA_TARO,FoodData.BUBBLE_SUGARPLUM);
         this.addCustomerOrder(_loc2_);
      }
   }
}
