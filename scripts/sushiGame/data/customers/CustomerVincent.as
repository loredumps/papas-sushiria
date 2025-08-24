package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerVincent extends CustomerDataFile
   {
       
      
      public function CustomerVincent()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Vincent";
         this.customerClipName = "Vincent";
         this.thumbColor = "midred";
         this.customerFirstGame = "Papa\'s Sushiria";
         this.houseColor = "yelloworange";
         this.stickers = ["coin","radley","chickenwing"];
         this.setupOrder();
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_SHISO);
         _loc1_.addFillings(FoodData.FILLING_CRABSTICK,FoodData.FILLING_OCTOPUS);
         _loc1_.addToppings(FoodData.DROP_YELLOWTAIL,FoodData.SHAKER_TOBIKO);
         _loc1_.setTea(FoodData.TEA_MOCHA,FoodData.BUBBLE_LYCHEE);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_OCTOBER);
         _loc2_.setPaper(FoodData.PAPER_TARANTULA);
         _loc2_.setRice(FoodData.RICE_SHISO);
         _loc2_.addFillings(FoodData.FILLING_CRABSTICK,FoodData.FILLING_OCTOPUS,FoodData.FILLING_TORIGAI);
         _loc2_.addToppings(FoodData.DROP_UNI,FoodData.SHAKER_IKURA);
         _loc2_.setTea(FoodData.TEA_MOCHA,FoodData.BUBBLE_LYCHEE);
         this.addCustomerOrder(_loc2_);
      }
   }
}
