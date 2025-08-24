package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   
   public class CustomerBigPauly extends CustomerDataFile
   {
       
      
      public function CustomerBigPauly()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Big Pauly";
         this.customerClipName = "BigPauly";
         this.thumbColor = "skyblue";
         this.customerFirstGame = "Papa Louie";
         this.flipdeckNumber = 21;
         this.isHuge = true;
         this.setupOrder();
         this.stickers = ["jellyback","mallowmen","sundaesaurus"];
      }
      
      override public function setupOrder() : void
      {
         var _loc1_:CustomerOrder = new CustomerOrder();
         _loc1_.setPaper(FoodData.PAPER_MOMOIRO);
         _loc1_.setRice(FoodData.RICE_BLACK,true);
         _loc1_.addFillings(FoodData.FILLING_YELLOWTAIL,FoodData.FILLING_UNAGI,FoodData.FILLING_LOBSTER);
         _loc1_.addToppings(FoodData.DROP_YELLOWTAIL,FoodData.SHAKER_FURIKAKE,FoodData.SAUCE_PONZU);
         _loc1_.setTea(FoodData.TEA_BLUEBERRY,FoodData.BUBBLE_KIWI);
         this.addCustomerOrder(_loc1_);
         var _loc2_:CustomerOrder = new CustomerOrder(GameData.MONTH_JANUARY);
         _loc2_.setPaper(FoodData.PAPER_RAINBOW);
         _loc2_.setRice(FoodData.RICE_BLACK,true);
         _loc2_.addFillings(FoodData.FILLING_RAINBOWYOKAN,FoodData.FILLING_UNAGI,FoodData.FILLING_LOBSTER);
         _loc2_.addToppings(FoodData.DROP_RAINBOWYOKAN,FoodData.SHAKER_RAINBOW,FoodData.SAUCE_PONZU);
         _loc2_.setTea(FoodData.TEA_TUTTIFRUTTI,FoodData.BUBBLE_KIWI);
         this.addCustomerOrder(_loc2_);
      }
   }
}
