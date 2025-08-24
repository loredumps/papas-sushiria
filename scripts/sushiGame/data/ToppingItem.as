package sushiGame.data
{
   public class ToppingItem
   {
       
      
      public var type:String = "topping";
      
      public var pieceName:String = "movieclipname";
      
      public var collisionPaddingX:Number = 10;
      
      public var collisionPaddingY:Number = 7;
      
      public var rotationMin:Number = 0;
      
      public var rotationMax:Number = 360;
      
      public var nudgeAmount:Number = 5;
      
      public var dropRate:Number = 1;
      
      public var maxSpeed:Number = 12;
      
      public var isSauce:Boolean = false;
      
      public var isSandwich:Boolean = false;
      
      public var sauceColors:Array;
      
      public var sauceGlowColor:uint = 0;
      
      public var sauceThicknessDone:Array;
      
      public var sauceThicknessFall:Array;
      
      public var capacity:Number = 20;
      
      public var month:Number = 0;
      
      public var inbetweens:Boolean = false;
      
      public var partHeight:Number = 0;
      
      public function ToppingItem(param1:String, param2:String, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number, param10:Boolean = false, param11:Array = null, param12:uint = 0, param13:Number = 0, param14:Number = 360, param15:Boolean = false)
      {
         this.sauceColors = [];
         this.sauceThicknessDone = [3,3,4,4,5,5];
         this.sauceThicknessFall = [2,2,3,3,4,4];
         super();
         this.type = param1;
         this.pieceName = param2;
         this.capacity = param4;
         this.collisionPaddingX = param5;
         this.collisionPaddingY = param6;
         this.nudgeAmount = param7;
         this.dropRate = param8;
         this.maxSpeed = param9;
         this.isSauce = param10;
         this.month = param3;
         this.partHeight = param7;
         this.isSandwich = param15;
         if(param11 != null)
         {
            this.sauceColors = param11;
         }
         if(param12 != 0)
         {
            this.sauceGlowColor = param12;
         }
         if(param10 == true)
         {
            this.inbetweens = true;
         }
         this.rotationMin = param13;
         this.rotationMax = param14;
      }
   }
}
