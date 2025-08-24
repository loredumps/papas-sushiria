package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerTony extends CustomerDataFile
   {
       
      
      public function CustomerTony()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Tony";
         this.customerClipName = "Tony";
         this.customerFirstGame = "Papa\'s Burgeria";
         this.thumbColor = "flipline";
         this.houseColor = "brown";
         this.setupOrder();
         this.stickers = ["sundaesaurus","chipmcmint","xmastree"];
         this.hasAlternateShoes = true;
         this.hasAlternateHands = true;
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_BLACK,true);
         _loc1_.addFillings(FoodData.FILLING_SALMON,FoodData.FILLING_UNAGI);
         _loc1_.addToppings(FoodData.SAUCE_SRIRACHA,FoodData.SHAKER_TOBIKO);
         _loc1_.setTea(FoodData.TEA_TANGERINE,FoodData.BUBBLE_PAWPAW);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_DECEMBER);
         _loc2_.setPaper(FoodData.PAPER_ELF);
         _loc2_.setRice(FoodData.RICE_BLACK,true);
         _loc2_.addFillings(FoodData.FILLING_TAI,FoodData.FILLING_UNAGI);
         _loc2_.addToppings(FoodData.SAUCE_SRIRACHA,FoodData.SHAKER_YULEMASAGO);
         _loc2_.setTea(FoodData.TEA_TANGERINE,FoodData.BUBBLE_PAWPAW);
         this.addCustomerOrder(_loc2_);
      }
   }
}
