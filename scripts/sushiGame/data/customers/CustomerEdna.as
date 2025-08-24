package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerEdna extends CustomerDataFile
   {
       
      
      public function CustomerEdna()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Edna";
         this.customerClipName = "Edna";
         this.customerFirstGame = "Papa\'s Burgeria";
         this.thumbColor = "fire";
         this.flipdeckNumber = 100;
         this.houseColor = "yelloworange";
         this.setupOrder();
         this.stickers = ["tomatoes","pasta","armyonion"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_WHITE);
         _loc1_.addFillings(FoodData.FILLING_YELLOWTAIL,FoodData.FILLING_CREAMCHEESE);
         _loc1_.addToppings(FoodData.DROP_KIWI,FoodData.SAUCE_YUMYUM);
         _loc1_.setTea(FoodData.TEA_ALMOND,FoodData.BUBBLE_PAWPAW);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_NOVEMBER);
         _loc2_.setPaper(FoodData.PAPER_NORI);
         _loc2_.setRice(FoodData.RICE_WHITE);
         _loc2_.addFillings(FoodData.FILLING_YELLOWTAIL,FoodData.FILLING_CREAMCHEESE);
         _loc2_.addToppings(FoodData.DROP_SWEETPOTATOES,FoodData.SAUCE_GRAVY);
         _loc2_.setTea(FoodData.TEA_ALMOND,FoodData.BUBBLE_PAWPAW);
         this.addCustomerOrder(_loc2_);
      }
   }
}
