package sushiGame.data
{
   public class FurniData
   {
      
      public static const TYPE_FURNI:String = "furni";
      
      public static const TYPE_POSTER:String = "poster";
      
      public static const TYPE_WALLPAPER:String = "wallpaper";
      
      public static const TYPE_FLOORING:String = "flooring";
      
      public static const SPECIAL_ARCADE:String = "arcade";
      
      public static const SPECIAL_COFFEE:String = "coffee";
      
      public static const SPECIAL_SODA:String = "soda";
      
      public static const SPECIAL_PUNCH:String = "punch";
      
      public static const SPECIAL_BUBBLEGUM:String = "bubblegum";
      
      public static const SPECIAL_NEWSPAPER:String = "newspaper";
      
      public static const SPECIAL_BOOK:String = "book";
      
      public static const SPECIAL_COMICS:String = "comics";
      
      public static const SPECIAL_MUSIC:String = "music";
      
      public static const SPECIAL_SCORE:String = "score";
      
      public static const SPECIAL_SCOREBUBBLEGUM:String = "scorebubblegum";
      
      public static const SCORE_MONTH_MULTI:Number = 2;
       
      
      public var tag:String;
      
      public var title:String;
      
      public var price:Number;
      
      public var effect:String;
      
      public var description:String;
      
      public var waitingOffset:Number = 0;
      
      public var type:String;
      
      public var width:Number;
      
      public var depth:Number;
      
      public var special:String;
      
      public var scoreType:String;
      
      public var toppingType:String;
      
      public var inStore:Boolean = true;
      
      public var theme:String;
      
      public function FurniData(param1:String, param2:String, param3:String, param4:Number, param5:String, param6:String, param7:String, param8:Number = 1, param9:Number = 1, param10:Number = 0, param11:String = "none", param12:String = "none", param13:String = "none", param14:Boolean = true)
      {
         super();
         this.tag = param2;
         this.title = param3;
         this.price = param4;
         this.effect = param5;
         this.description = param6;
         this.waitingOffset = param10;
         this.type = param7;
         this.width = param8;
         this.depth = param9;
         this.special = param11;
         this.scoreType = param12;
         this.toppingType = param13;
         this.inStore = param14;
         this.theme = param1;
      }
      
      public function getMaxPoints(param1:String = "") : Number
      {
         if(this.theme == param1)
         {
            return this.waitingOffset * 10 * FurniData.SCORE_MONTH_MULTI;
         }
         return this.waitingOffset * 10;
      }
   }
}
