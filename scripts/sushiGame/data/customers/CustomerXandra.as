package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerXandra extends CustomerDataFile
   {
       
      
      public function CustomerXandra()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Xandra";
         this.customerClipName = "Xandra";
         this.customerFirstGame = "Papa\'s Taco Mia!";
         this.thumbColor = "pink";
         this.flipdeckNumber = 150;
         this.houseColor = "yelloworange";
         this.holidayOutfit = GameData.MONTH_JANUARY;
         this.hasHolidayShoes = true;
         this.holidayHandExtra = "xwand";
         this.setupOrder();
         this.stickers = ["strawbuzzy","heart","musicnote"];
         this.hasAlternateShoes = true;
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_UKONIRO);
         _loc1_.setRice(FoodData.RICE_BLACK);
         _loc1_.addFillings(FoodData.FILLING_SALMON,FoodData.FILLING_ASAPARAGUS,FoodData.FILLING_RADISHSPROUTS);
         _loc1_.addToppings(FoodData.SHAKER_SESAMESEEDS,FoodData.SAUCE_WASABIMAYO);
         _loc1_.setTea(FoodData.TEA_HONEYDEW,FoodData.BUBBLE_WATERMELON);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_JANUARY);
         _loc2_.setPaper(FoodData.PAPER_RAINBOW);
         _loc2_.setRice(FoodData.RICE_BLACK);
         _loc2_.addFillings(FoodData.FILLING_RAINBOWYOKAN,FoodData.FILLING_ASAPARAGUS,FoodData.FILLING_RADISHSPROUTS);
         _loc2_.addToppings(FoodData.SHAKER_RAINBOW,FoodData.SAUCE_FLAVORX);
         _loc2_.setTea(FoodData.TEA_TUTTIFRUTTI,FoodData.BUBBLE_WATERMELON);
         this.addCustomerOrder(_loc2_);
      }
   }
}
