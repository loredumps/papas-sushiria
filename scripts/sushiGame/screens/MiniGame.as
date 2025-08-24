package sushiGame.screens
{
   import flash.display.*;
   import package_2.class_6;
   import sushiGame.data.ClothingData;
   import sushiGame.data.ClothingItem;
   import sushiGame.data.FurniData;
   import sushiGame.data.UserData;
   
   public class MiniGame
   {
      
      public static const TYPE_PUTT:String = "putt";
      
      public static const TYPE_HOMERUN:String = "homerun";
      
      public static const TYPE_HALLWAY:String = "hallway";
      
      public static const TYPE_MESS:String = "mess";
      
      public static const TYPE_GOKART:String = "gokart";
      
      public static const TYPE_SHOT:String = "shot";
      
      public static const TYPE_CHILI:String = "chili";
       
      
      public var screen:MiniGameScreen;
      
      public var clip:MovieClip;
      
      public var container:MovieClip;
      
      public var prizeSKUs:Array;
      
      public var prizeIsClothing:Array;
      
      public var prizeClothingMode:Array;
      
      public var allowedForRandom:Array;
      
      public var type:String;
      
      public var skuToWin:String = null;
      
      public var amountToWin:Number = 0;
      
      public var skuIsClothing:Boolean = false;
      
      public var skuClothingMode:String = "";
      
      public function MiniGame(param1:MiniGameScreen, param2:MovieClip, param3:String)
      {
         this.prizeSKUs = [];
         this.prizeIsClothing = [];
         this.prizeClothingMode = [];
         this.allowedForRandom = [];
         super();
         var _loc4_:MiniGame;
         (_loc4_ = this).screen = param1;
         _loc4_.container = param2;
         _loc4_.type = param3;
         _loc4_.setupScreen();
      }
      
      public function setupScreen() : void
      {
      }
      
      public function updateScreen() : void
      {
      }
      
      public function destroy() : void
      {
      }
      
      public function decidePrize() : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Array = null;
         var _loc6_:Number = NaN;
         var _loc7_:int = 0;
         var _loc8_:Number = NaN;
         var _loc1_:MiniGame = this;
         var _loc2_:Number = _loc1_.screen.possibleGames.indexOf(_loc1_.type);
         var _loc3_:Number = Number(_loc1_.screen.gameObj.var_127.minigamePrizes[_loc2_]);
         if(_loc3_ == 13)
         {
            _loc1_.skuToWin = _loc1_.prizeSKUs[13];
            _loc1_.skuIsClothing = _loc1_.prizeIsClothing[13];
            _loc1_.skuClothingMode = _loc1_.prizeClothingMode[13];
            class_6.method_1("BIG BRONZE PRIZE");
         }
         else if(_loc3_ == 27)
         {
            _loc1_.skuToWin = _loc1_.prizeSKUs[14];
            _loc1_.skuIsClothing = _loc1_.prizeIsClothing[14];
            _loc1_.skuClothingMode = _loc1_.prizeClothingMode[14];
            class_6.method_1("BIG SILVER PRIZE");
         }
         else if(_loc3_ == 41)
         {
            _loc1_.skuToWin = _loc1_.prizeSKUs[15];
            _loc1_.skuIsClothing = _loc1_.prizeIsClothing[15];
            _loc1_.skuClothingMode = _loc1_.prizeClothingMode[15];
            class_6.method_1("BIG GOLD PRIZE");
         }
         else if(_loc3_ < 13)
         {
            _loc1_.skuToWin = _loc1_.prizeSKUs[_loc3_];
            _loc1_.skuIsClothing = _loc1_.prizeIsClothing[_loc3_];
            _loc1_.skuClothingMode = _loc1_.prizeClothingMode[_loc3_];
            class_6.method_1("Regular Prize");
         }
         else if((_loc4_ = _loc3_ % 14) != 13 && _loc4_ < _loc1_.prizeSKUs.length && _loc1_.allowedForRandom[_loc4_] == 1)
         {
            _loc1_.skuToWin = _loc1_.prizeSKUs[_loc4_];
            _loc1_.skuIsClothing = _loc1_.prizeIsClothing[_loc4_];
            _loc1_.skuClothingMode = _loc1_.prizeClothingMode[_loc4_];
            class_6.method_1("Duplicate Prize (#" + _loc4_ + ")");
         }
         else
         {
            _loc5_ = [];
            _loc6_ = 13;
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               if(_loc1_.allowedForRandom[_loc7_] == 1)
               {
                  _loc5_.push(_loc1_.prizeSKUs[_loc7_]);
               }
               _loc7_++;
            }
            _loc8_ = Math.floor(Math.random() * _loc5_.length);
            _loc1_.skuToWin = _loc5_[_loc8_];
            _loc1_.skuIsClothing = _loc1_.prizeIsClothing[_loc1_.prizeSKUs.indexOf(_loc1_.skuToWin)];
            _loc1_.skuClothingMode = _loc1_.prizeClothingMode[_loc1_.prizeSKUs.indexOf(_loc1_.skuToWin)];
            class_6.method_1("Random Prize");
         }
         class_6.method_1("(" + _loc1_.skuToWin + ")");
         _loc1_.amountToWin = 1;
      }
      
      public function getStartingLevel() : Number
      {
         var _loc1_:MiniGame = this;
         var _loc2_:UserData = _loc1_.screen.gameObj.var_127;
         var _loc3_:Number = 0;
         var _loc4_:Number = _loc1_.screen.possibleGames.indexOf(_loc1_.type);
         var _loc5_:Number;
         if((_loc5_ = Number(_loc2_.minigamePrizes[_loc4_])) < 14)
         {
            _loc3_ = _loc5_;
         }
         else
         {
            _loc3_ = 14;
         }
         class_6.method_1("Get starting level: " + _loc3_);
         return _loc3_;
      }
      
      public function tempCheckPrizes(param1:Array, param2:Array, param3:Array) : void
      {
         var _loc7_:int = 0;
         var _loc9_:FurniData = null;
         var _loc10_:String = null;
         var _loc11_:Array = null;
         var _loc12_:ClothingItem = null;
         var _loc4_:MiniGame;
         var _loc5_:UserData = (_loc4_ = this).screen.gameObj.var_127;
         0;
         class_6.method_1("____CHECK PRIZES IN STORE______");
         var _loc8_:int = 0;
         loop0:
         for(; _loc8_ < param1.length; _loc8_++)
         {
            if(param2[_loc8_] != false)
            {
               _loc10_ = String(param1[_loc8_]);
               _loc11_ = [];
               if(param3[_loc8_] == "gender")
               {
                  _loc11_.push(_loc10_ + "_male");
                  _loc11_.push(_loc10_ + "_female");
               }
               else
               {
                  _loc11_.push(_loc10_);
               }
               _loc7_ = 0;
               while(_loc7_ < _loc4_.screen.gameObj.var_134.clothing.length)
               {
                  _loc12_ = _loc4_.screen.gameObj.var_134.clothing[_loc7_];
                  if(_loc11_.indexOf(_loc12_.tag) > -1)
                  {
                     if(_loc12_.inStore == true)
                     {
                        class_6.error("WARNING!!! " + _loc12_.tag + " -- inStore = " + _loc12_.inStore);
                     }
                  }
                  _loc7_++;
               }
               continue;
            }
            _loc7_ = 0;
            while(true)
            {
               if(_loc7_ >= _loc4_.screen.gameObj.var_132.furniItems.length)
               {
                  continue loop0;
               }
               if((_loc9_ = _loc4_.screen.gameObj.var_132.furniItems[_loc7_]).tag == param1[_loc8_])
               {
                  if(_loc9_.inStore == true)
                  {
                     class_6.error("WARNING!!! " + _loc9_.tag + " -- inStore = " + _loc9_.inStore);
                  }
                  continue loop0;
               }
               _loc7_++;
            }
         }
      }
      
      public function setupPrizes(param1:String) : void
      {
         var _loc7_:String = null;
         var _loc8_:FurniData = null;
         var _loc2_:MiniGame = this;
         var _loc3_:ClothingData = _loc2_.screen.gameObj.var_134;
         var _loc4_:String = String(_loc2_.screen.prizeSets[_loc2_.screen.possibleGames.indexOf(param1)]);
         var _loc5_:Array = _loc2_.screen.gameObj.var_132.minigamePrizes[_loc4_];
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_.length)
         {
            _loc7_ = String(_loc5_[_loc6_]);
            if(_loc3_.clothingExists(_loc7_))
            {
               _loc2_.prizeSKUs.push(_loc7_);
               _loc2_.prizeIsClothing.push(true);
               _loc2_.prizeClothingMode.push("");
               _loc2_.allowedForRandom.push(0);
            }
            else if(_loc3_.clothingExists(_loc7_,true))
            {
               class_6.method_1("GENDERED CLOTHING STILL EXISTS?????? " + _loc7_);
               _loc2_.prizeSKUs.push(_loc7_);
               _loc2_.prizeIsClothing.push(true);
               _loc2_.prizeClothingMode.push("gender");
               _loc2_.allowedForRandom.push(0);
            }
            else
            {
               _loc2_.prizeSKUs.push(_loc7_);
               _loc2_.prizeIsClothing.push(false);
               _loc2_.prizeClothingMode.push("");
               if((_loc8_ = _loc2_.screen.gameObj.var_132.getFurniFromTag(_loc7_)) == null)
               {
                  class_6.error("ERROR - UNKNOWN FURNI FOR MINIGAME: " + _loc7_);
               }
               else if(_loc8_.type == FurniData.TYPE_FLOORING || _loc8_.type == FurniData.TYPE_WALLPAPER)
               {
                  _loc2_.allowedForRandom.push(0);
               }
               else
               {
                  _loc2_.allowedForRandom.push(1);
               }
            }
            _loc6_++;
         }
      }
   }
}
