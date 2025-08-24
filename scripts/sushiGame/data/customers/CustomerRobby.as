package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerRobby extends CustomerDataFile
   {
       
      
      public function CustomerRobby()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Robby";
         this.customerClipName = "Robby";
         this.thumbColor = "seafoam";
         this.customerFirstGame = "Papa Louie";
         this.flipdeckNumber = 73;
         this.setupOrder();
         this.stickers = ["hardshells","barryblue","firework"];
         this.hasAlternateEyes = true;
         this.hasAlternateMouth = true;
         this.hasAlternateShoes = true;
         this.secretSpecialIndex = 6;
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_NORI);
         _loc1_.setRice(FoodData.RICE_WHITE);
         _loc1_.addFillings(FoodData.FILLING_YELLOWTAIL,FoodData.FILLING_CREAMCHEESE,FoodData.FILLING_GREENONIONS);
         _loc1_.addToppings(FoodData.DROP_KIWI,FoodData.SHAKER_SESAMESEEDS);
         _loc1_.setTea(FoodData.TEA_HONEYDEW,FoodData.BUBBLE_KIWI);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_JUNE);
         _loc2_.setPaper(FoodData.PAPER_MIZUIRO);
         _loc2_.setRice(FoodData.RICE_WHITE);
         _loc2_.addFillings(FoodData.FILLING_CANNEDHAM,FoodData.FILLING_CREAMCHEESE,FoodData.FILLING_GREENONIONS);
         _loc2_.addToppings(FoodData.DROP_KIWI,FoodData.SHAKER_LEMONHERB);
         _loc2_.setTea(FoodData.TEA_LUAUPUNCH,FoodData.BUBBLE_KIWI);
         this.addCustomerOrder(_loc2_);
      }
   }
}
