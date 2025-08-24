package sushiGame.data.customers
{
   import sushiGame.data.CustomerDataFile;
   import sushiGame.data.GameData;
   
   public class CustomerJojo extends CustomerDataFile
   {
       
      
      public function CustomerJojo()
      {
         super();
      }
      
      override public function initCustomerData() : void
      {
         this.customerName = "Jojo";
         this.customerClipName = "Jojo";
         this.isCloser = true;
         this.customerFirstGame = "Papa\'s Taco Mia!";
         this.thumbColor = "emerald";
         this.flipdeckNumber = 4;
         this.hasAlternateShoes = true;
         this.stickers = ["batters","pizza","jillberry"];
         this.holidayOutfit = GameData.MONTH_OCTOBER;
         this.hasHolidayEyes = true;
         this.setupOrder();
      }
   }
}
