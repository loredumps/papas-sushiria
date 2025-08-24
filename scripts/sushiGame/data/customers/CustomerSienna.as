package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerSienna extends CustomerDataFile
   {
       
      
      public function CustomerSienna()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Sienna";
         this.customerClipName = "Sienna";
         this.thumbColor = "yelloworange";
         this.customerFirstGame = "Papa\'s Pastaria";
         this.flipdeckNumber = 172;
         this.holidayOutfit = GameData.MONTH_NOVEMBER;
         this.hasHolidayShoes = true;
         this.hasAlternateShoes = true;
         this.setupOrder();
         this.stickers = ["xmastree","buffaloes","flipline"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_UKONIRO);
         _loc1_.setRice(FoodData.RICE_BROWN);
         _loc1_.addFillings(FoodData.FILLING_YELLOWTAIL);
         _loc1_.addToppings(FoodData.DROP_YELLOWTAIL,FoodData.SAUCE_TONKATSU);
         _loc1_.setTea(FoodData.TEA_CHOCOLATE,FoodData.BUBBLE_LYCHEE);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_NOVEMBER);
         _loc2_.setPaper(FoodData.PAPER_CHAIRO);
         _loc2_.setRice(FoodData.RICE_BROWN);
         _loc2_.addFillings(FoodData.FILLING_SWEETPOTATOES,FoodData.FILLING_YELLOWTAIL);
         _loc2_.addToppings(FoodData.DROP_SWEETPOTATOES,FoodData.SAUCE_GRAVY);
         _loc2_.setTea(FoodData.TEA_PUMPKINSPICE,FoodData.BUBBLE_LYCHEE);
         this.addCustomerOrder(_loc2_);
      }
   }
}
