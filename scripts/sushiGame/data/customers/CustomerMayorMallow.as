package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerMayorMallow extends CustomerDataFile
   {
       
      
      public function CustomerMayorMallow()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Mayor Mallow";
         this.customerClipName = "MayorMallow";
         this.customerFirstGame = "Papa\'s Cupcakeria";
         this.thumbColor = "seafoam";
         this.flipdeckNumber = 133;
         this.isHuge = true;
         this.setupOrder();
         this.secretSpecialIndex = 3;
         this.stickers = ["rocky","papalouie","pancakes"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_SHISO);
         _loc1_.addFillings(FoodData.FILLING_CUCUMBER,FoodData.FILLING_ASAPARAGUS,FoodData.FILLING_RADISHSPROUTS);
         _loc1_.addToppings(FoodData.SAUCE_GINGERMISO);
         _loc1_.setTea(FoodData.TEA_HONEYDEW,FoodData.BUBBLE_KIWI);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_MARCH);
         _loc2_.setPaper(FoodData.PAPER_NORI);
         _loc2_.setRice(FoodData.RICE_SHISO);
         _loc2_.addFillings(FoodData.FILLING_KANPYO,FoodData.FILLING_CUCUMBER,FoodData.FILLING_ASAPARAGUS);
         _loc2_.addToppings(FoodData.SAUCE_KURIKINTON);
         _loc2_.setTea(FoodData.TEA_HONEYDEW,FoodData.BUBBLE_KIWI);
         this.addCustomerOrder(_loc2_);
      }
   }
}
