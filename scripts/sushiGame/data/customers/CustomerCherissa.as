package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerCherissa extends CustomerDataFile
   {
       
      
      public function CustomerCherissa()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Cherissa";
         this.customerClipName = "Cherissa";
         this.customerFirstGame = "Papa\'s Bakeria";
         this.thumbColor = "midblue";
         this.setupOrder();
         this.stickers = ["flipper","buffaloes","pie"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_WHITE,true);
         _loc1_.addFillings(FoodData.FILLING_WAGYU,FoodData.FILLING_CUCUMBER,FoodData.FILLING_ASAPARAGUS);
         _loc1_.addToppings(FoodData.SAUCE_PONZU);
         _loc1_.setTea(FoodData.TEA_TARO,FoodData.BUBBLE_CHERRY);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_DECEMBER);
         _loc2_.setPaper(FoodData.PAPER_NORI);
         _loc2_.setRice(FoodData.RICE_WHITE,true);
         _loc2_.addFillings(FoodData.FILLING_WAGYU,FoodData.FILLING_CUCUMBER,FoodData.FILLING_SPRUCETIPS);
         _loc2_.addToppings(FoodData.SAUCE_CRANBERRY);
         _loc2_.setTea(FoodData.TEA_TARO,FoodData.BUBBLE_CHERRY);
         this.addCustomerOrder(_loc2_);
      }
   }
}
