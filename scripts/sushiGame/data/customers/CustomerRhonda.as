package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerRhonda extends CustomerDataFile
   {
       
      
      public function CustomerRhonda()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Rhonda";
         this.customerClipName = "Rhonda";
         this.customerFirstGame = "Papa\'s Cheeseria";
         this.thumbColor = "dustyblue";
         this.flipdeckNumber = 154;
         this.isHuge = true;
         this.setupOrder();
         this.stickers = ["cherryblossom","awesomesaucer","fizzo"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_UKONIRO);
         _loc1_.setRice(FoodData.RICE_BROWN,true);
         _loc1_.addFillings(FoodData.FILLING_CREAMCHEESE,FoodData.FILLING_AVOCADO);
         _loc1_.addToppings(FoodData.DROP_AVOCADO,FoodData.SHAKER_SESAMESEEDS);
         _loc1_.setTea(FoodData.TEA_MOCHA,FoodData.BUBBLE_TAPIOCA);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_MAY);
         _loc2_.setPaper(FoodData.PAPER_TORTILLA);
         _loc2_.setRice(FoodData.RICE_BROWN,true);
         _loc2_.addFillings(FoodData.FILLING_CHIPOTLECHEDDAR,FoodData.FILLING_AVOCADO);
         _loc2_.addToppings(FoodData.DROP_AVOCADO,FoodData.SHAKER_RECADOROJO);
         _loc2_.setTea(FoodData.TEA_HORCHATA,FoodData.BUBBLE_TAPIOCA);
         this.addCustomerOrder(_loc2_);
      }
   }
}
