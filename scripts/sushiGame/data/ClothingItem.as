package sushiGame.data
{
   public class ClothingItem
   {
      
      public static const GENDER_MALE:String = "male";
      
      public static const GENDER_FEMALE:String = "female";
      
      public static const GENDER_ALL:String = "all";
      
      public static const GENDER_SWAP:String = "swap";
      
      public static const GENDER_PREMADE:String = "premade";
      
      public static const TYPE_SHIRT:String = "shirt";
      
      public static const TYPE_PANTS:String = "pants";
      
      public static const TYPE_JACKET:String = "jacket";
      
      public static const TYPE_SHOES:String = "shoes";
      
      public static const TYPE_HAIR:String = "hair";
      
      public static const TYPE_FACIALHAIR:String = "facialhair";
      
      public static const TYPE_BANGS:String = "bangs";
      
      public static const TYPE_ACC_BODY:String = "acca";
      
      public static const TYPE_ACC_BELT:String = "accb";
      
      public static const TYPE_ACC_ARMS:String = "accc";
      
      public static const TYPE_ACC_FACE:String = "accd";
      
      public static const TYPE_HAT:String = "hat";
      
      public static const OPTIONS_HIDE_SHIRTNECK:uint = 1;
      
      public static const OPTIONS_HIDE_SHIRTBICEP:uint = 2;
      
      public static const OPTIONS_HIDE_JACKETNECK:uint = 4;
      
      public static const OPTIONS_HAS_BICEP:uint = 8;
      
      public static const OPTIONS_HAS_FOREARM:uint = 16;
      
      public static const OPTIONS_HAS_NECK:uint = 32;
      
      public static const OPTIONS_HAS_FRONTBODY:uint = 64;
      
      public static const OPTIONS_HAS_BACKBODY:uint = 128;
      
      public static const OPTIONS_HAS_BACK_HAIR:uint = 256;
      
      public static const OPTIONS_HAS_MOUTH_FACIALHAIR:uint = 512;
      
      public static const OPTIONS_HAS_BASE_FACIALHAIR:uint = 1024;
      
      public static const OPTIONS_TRACKEYES:uint = 2048;
      
      public static const OPTIONS_ONLYONEARM:uint = 4096;
      
      public static const OPTIONS_HIDE_SHIRTFOREARM:uint = 8192;
      
      public static const OPTIONS_IS_NECKLACE:uint = 16384;
      
      public static const OPTIONS_BEHINDCOLLAR:uint = 32768;
      
      public static const OPTIONS_ACCSTAYSBACK:uint = 65536;
      
      public static const OPTIONS_HAT_CAP:uint = 131072;
      
      public static const OPTIONS_HAT_HELMET:uint = 262144;
      
      public static const OPTIONS_HAT_SOMBRERO:uint = 524288;
      
      public static const OPTIONS_HAT_HAIRCLIP:uint = 1048576;
      
      public static const OPTIONS_SUPPORTS_BANGS:uint = 2097152;
      
      public static const OPTIONS_HAT_FULLMASK:uint = 4194304;
      
      public static const OPTIONS_HAS_CUFF:uint = 8388608;
      
      public static const OPTIONS_ACC_BEHINDJACKET:uint = 2097152;
      
      public static const OPTIONS_ACC_BEHINDJACKETNECK:uint = 524288;
      
      public static const OPTIONS_HAS_HAND:uint = 16777216;
      
      public static const OPTIONS_HAS_FLAREDSLEEVES:uint = 33554432;
      
      public static const OPTIONS_HAS_ALTERNATEGLOVE:uint = 131072;
      
      public static const OPTIONS_ACCBEHINDBELT:uint = 256;
      
      public static const OPTIONS_HAS_HOCKEYSLEEVES:uint = 512;
      
      public static const OPTIONS_HAS_ALTERNATECOLLAR:uint = 131072;
      
      public static const OPTIONS_HAS_ALTERNATEBODY:uint = 2048;
      
      public static const OPTIONS_IS_OVERALLS:uint = 1024;
      
      public static const OPTIONS_IS_CROPPED_JACKET:uint = 1048576;
      
      public static const OPTIONS_HIDE_IRREGULARFOREARM:uint = 4194304;
      
      public static const OPTIONS_HAS_ROLLEDSLEEVES:uint = 262144;
      
      public static const OPTIONS_IS_DRESS:uint = 67108864;
      
      public static const OPTIONS_HIDE_SHIRTBODY:uint = 16384;
      
      public static const OPTIONS_HIDE_PANTS:uint = 134217728;
      
      public static const OPTIONS_HAT_BEHINDBANGS:uint = 16777216;
      
      public static const SHIRT_SHORT:uint = ClothingItem.OPTIONS_HAS_BICEP;
      
      public static const SHIRT_LONG:uint = ClothingItem.OPTIONS_HAS_BICEP | ClothingItem.OPTIONS_HAS_FOREARM;
      
      public static const SHIRT_SLEEVELESS:uint = 0;
      
      public static const SHIRT_SHORT_COLLAR:uint = ClothingItem.OPTIONS_HAS_BICEP | ClothingItem.OPTIONS_HAS_NECK;
      
      public static const SHIRT_LONG_COLLAR:uint = ClothingItem.OPTIONS_HAS_BICEP | ClothingItem.OPTIONS_HAS_FOREARM | ClothingItem.OPTIONS_HAS_NECK;
      
      public static const FACIALHAIR_FULL:uint = ClothingItem.OPTIONS_HAS_BASE_FACIALHAIR | ClothingItem.OPTIONS_HAS_MOUTH_FACIALHAIR;
      
      public static const FACIALHAIR_JUSTMOUTH:uint = ClothingItem.OPTIONS_HAS_MOUTH_FACIALHAIR;
      
      public static const FACIALHAIR_JUSTBASE:uint = ClothingItem.OPTIONS_HAS_BASE_FACIALHAIR;
      
      public static const BODYACC_FULL:uint = ClothingItem.OPTIONS_HAS_BACKBODY | ClothingItem.OPTIONS_HAS_FRONTBODY;
      
      public static const BODYACC_FULL_NECK:uint = ClothingItem.OPTIONS_HAS_BACKBODY | ClothingItem.OPTIONS_HAS_FRONTBODY | ClothingItem.OPTIONS_HAS_NECK;
      
      public static const BODYACC_FRONT:uint = ClothingItem.OPTIONS_HAS_FRONTBODY;
      
      public static const BODYACC_BACK:uint = ClothingItem.OPTIONS_HAS_BACKBODY;
      
      public static const JACKET_COLLAR_COVERARMS:uint = ClothingItem.OPTIONS_HAS_NECK | ClothingItem.OPTIONS_HAS_BICEP | ClothingItem.OPTIONS_HAS_FOREARM | ClothingItem.OPTIONS_HIDE_SHIRTBICEP | ClothingItem.OPTIONS_HIDE_SHIRTFOREARM;
      
      public static const JACKET_COLLAR_COVERARMSANDNECK:uint = ClothingItem.OPTIONS_HAS_NECK | ClothingItem.OPTIONS_HAS_BICEP | ClothingItem.OPTIONS_HAS_FOREARM | ClothingItem.OPTIONS_HIDE_SHIRTBICEP | ClothingItem.OPTIONS_HIDE_SHIRTFOREARM | ClothingItem.OPTIONS_HIDE_SHIRTNECK;
      
      public static const JACKET_COVERARMS:uint = ClothingItem.OPTIONS_HAS_BICEP | ClothingItem.OPTIONS_HAS_FOREARM | ClothingItem.OPTIONS_HIDE_SHIRTBICEP | ClothingItem.OPTIONS_HIDE_SHIRTFOREARM;
      
      public static const JACKET_COLLAR_SHORTSLEEVE:uint = ClothingItem.OPTIONS_HAS_NECK | ClothingItem.OPTIONS_HAS_BICEP | ClothingItem.OPTIONS_HIDE_SHIRTBICEP;
      
      public static const JACKET_COLLAR_SLEEVELESS:uint = ClothingItem.OPTIONS_HAS_NECK;
      
      public static const GLOVE_FOREARM:uint = ClothingItem.OPTIONS_HAS_HAND | ClothingItem.OPTIONS_HAS_FOREARM;
      
      public static const GLOVE_SHORT:uint = ClothingItem.OPTIONS_HAS_HAND;
      
      public static const GLOVE_LONG:uint = ClothingItem.OPTIONS_HAS_HAND | ClothingItem.OPTIONS_HAS_FOREARM | ClothingItem.OPTIONS_HAS_BICEP;
      
      public static const TINT_RED:uint = 16727614;
      
      public static const TINT_ORANGE:uint = 16737536;
      
      public static const TINT_YELLOW:uint = 16776960;
      
      public static const TINT_GREEN:uint = 1162257;
      
      public static const TINT_BLUE:uint = 26316;
      
      public static const TINT_PURPLE:uint = 7749269;
      
      public static const TINT_PINK:uint = 16744396;
      
      public static const TINT_WHITE:uint = 16777215;
      
      public static const TINT_BLACK:uint = 2236962;
      
      public static const TINT_GRAY:uint = 13421772;
      
      public static const TINT_DARKGRAY:uint = 8355711;
      
      public static const TINT_ARMYGREEN:uint = 7379003;
      
      public static const TINT_KHAKI:uint = 12492402;
      
      public static const TINT_BRASS:uint = 13018488;
      
      public static const TINT_BROWN:uint = 10506286;
      
      public static const TINT_GOLD:uint = 16763904;
      
      public static const TINT_TEAL:uint = 442079;
      
      public static const TINT_LIGHTBLUE:uint = 6069180;
      
      public static const TINT_SEAFOAM:uint = 3669971;
      
      public static const TINT_LIGHTGREEN:uint = 12383570;
      
      public static const TINT_PALEBLUE:uint = 13428223;
      
      public static const TINT_MAROON:uint = 13516648;
      
      public static const TINT_MOCHA:uint = 6637878;
      
      public static const TINT_LIGHTBROWN:uint = 10382670;
      
      public static const TINT_DARKBROWN:uint = 7619113;
      
      public static const TINT_BURNTUMBER:uint = 11684864;
      
      public static const TINT_DARKRED:uint = 12255232;
      
      public static const TINT_DENIM:uint = 2709362;
      
      public static const TINT_STONEWASH:uint = 5595780;
      
      public static const TINT_NAVYBLUE:uint = 1321814;
      
      public static const TINT_DEEPBLACK:uint = 0;
      
      public static const TINT_LAVENDER:uint = 14469112;
      
      public static const TINT_STRAW:uint = 14800816;
      
      public static const TINT_CREAM:uint = 15724007;
      
      public static const TINT_DARKLAVENDER:uint = 11112384;
      
      public static const TINT_LIGHTORANGE:uint = 16688164;
      
      public static const TINT_LIGHTTEAL:uint = 13041663;
      
      public static const TINT_LIGHTPINK:uint = 16764159;
      
      public static const TINT_DUSTYBLUE:uint = 3234439;
      
      public static const TINT_BEIGE:uint = 13221816;
      
      public static const TINT_BRIGHTGOLD:uint = 16768256;
      
      public static const TINT_LIMEGREEN:uint = 12109338;
      
      public static const TINT_BRONZE:uint = 13672772;
      
      public static const TINT_MINTGREEN:uint = 4307842;
      
      public static const TINT_LIGHTMINTGREEN:uint = 5631891;
      
      public static const TINT_PALEBRIGHTBLUE:uint = 9098495;
      
      public static const TINT_DARKKHAKI:uint = 11833420;
      
      public static const TINT_NEONGREEN:uint = 8453939;
      
      public static const TINT_FORESTGREEN:uint = 2909267;
      
      public static const TINT_SALMON:uint = 16745583;
       
      
      public var gender:String;
      
      public var type:String;
      
      public var tag:String;
      
      public var title:String;
      
      public var description:String;
      
      public var options:uint;
      
      public var price:Number = 0;
      
      public var inStore:Boolean = true;
      
      public var addToDefaultInventory:Boolean = false;
      
      public var holidayBonus:Number = 0;
      
      public var tintSKU:String = null;
      
      public var tintColor1:Boolean = false;
      
      public var tintColor2:Boolean = false;
      
      public var tintColor3:Boolean = false;
      
      public var tintDecal:String = null;
      
      public var tintDecalColor:Boolean = false;
      
      public var limitColor1:Array = null;
      
      public var limitColor2:Array = null;
      
      public var limitColor3:Array = null;
      
      public var limitDecalColor:Array = null;
      
      public var decalSwap:Array = null;
      
      public var decalMatchColor:Number = -1;
      
      public var colorForceMatch:Array = null;
      
      public var minorColors:Array = null;
      
      public var tintHolidayBonus:Number = 0;
      
      public function ClothingItem(param1:String, param2:String, param3:String, param4:String, param5:Number = 0, param6:String = "all", param7:uint = 0, param8:Boolean = true, param9:Boolean = false, param10:Number = 0, param11:String = null, param12:Boolean = false, param13:Boolean = false, param14:Boolean = false, param15:String = null, param16:Boolean = false, param17:Array = null, param18:Array = null, param19:Array = null, param20:Array = null, param21:Array = null, param22:Number = -1, param23:Number = 0, param24:Array = null, param25:Array = null)
      {
         super();
         this.tag = param1;
         this.title = param2;
         this.description = param3;
         this.type = param4;
         this.price = param5;
         this.gender = param6;
         this.options = param7;
         this.inStore = param8;
         this.addToDefaultInventory = param9;
         this.holidayBonus = param10;
         this.tintSKU = param11;
         this.tintColor1 = param12;
         this.tintColor2 = param13;
         this.tintColor3 = param14;
         this.tintDecal = param15;
         this.tintDecalColor = param16;
         this.limitColor1 = param17;
         this.limitColor2 = param18;
         this.limitColor3 = param19;
         this.limitDecalColor = param20;
         this.decalSwap = param21;
         this.decalMatchColor = param22;
         this.tintHolidayBonus = param23;
         this.colorForceMatch = param24;
         this.minorColors = param25;
      }
      
      public function isForcingColor(param1:Number) : Boolean
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         if(this.colorForceMatch != null)
         {
            _loc2_ = false;
            _loc3_ = 0;
            while(_loc3_ < this.colorForceMatch.length)
            {
               if(this.colorForceMatch[_loc3_][2] == param1)
               {
                  _loc2_ = true;
                  break;
               }
               _loc3_++;
            }
            return _loc2_;
         }
         return false;
      }
      
      public function getForceColor(param1:Number, param2:uint, param3:uint, param4:uint) : uint
      {
         var _loc6_:int = 0;
         var _loc5_:uint = 0;
         if(this.colorForceMatch != null)
         {
            _loc6_ = 0;
            while(_loc6_ < this.colorForceMatch.length)
            {
               if(this.colorForceMatch[_loc6_][2] == param1)
               {
                  if(this.colorForceMatch[_loc6_][0] == 1 && param2 == this.colorForceMatch[_loc6_][1])
                  {
                     _loc5_ = uint(this.colorForceMatch[_loc6_][3]);
                     break;
                  }
                  if(this.colorForceMatch[_loc6_][0] == 2 && param3 == this.colorForceMatch[_loc6_][1])
                  {
                     _loc5_ = uint(this.colorForceMatch[_loc6_][3]);
                     break;
                  }
                  if(this.colorForceMatch[_loc6_][0] == 3 && param4 == this.colorForceMatch[_loc6_][1])
                  {
                     _loc5_ = uint(this.colorForceMatch[_loc6_][3]);
                     break;
                  }
               }
               _loc6_++;
            }
         }
         return _loc5_;
      }
      
      public function hasOption(param1:uint) : Boolean
      {
         return (this.options & param1) == param1;
      }
      
      public function isTinting() : Boolean
      {
         if(this.tintSKU == null)
         {
            return false;
         }
         return true;
      }
      
      public function isMinorColor(param1:int) : Boolean
      {
         if(this.minorColors == null)
         {
            return false;
         }
         if(this.minorColors.indexOf(param1) > -1)
         {
            return true;
         }
         return false;
      }
      
      public function traceAllOptions() : void
      {
         trace("THIS SKU: " + this.tag);
         trace("Hide Shirt Neck: " + this.hasOption(ClothingItem.OPTIONS_HIDE_SHIRTNECK));
         trace("Hide Shirt Bicep: " + this.hasOption(ClothingItem.OPTIONS_HIDE_SHIRTBICEP));
         trace("Hide Jacket Neck: " + this.hasOption(ClothingItem.OPTIONS_HIDE_JACKETNECK));
         trace("Has Bicep: " + this.hasOption(ClothingItem.OPTIONS_HAS_BICEP));
         trace("Has Forearm: " + this.hasOption(ClothingItem.OPTIONS_HAS_FOREARM));
         trace("Has Neck: " + this.hasOption(ClothingItem.OPTIONS_HAS_NECK));
         trace("Has Frontbody: " + this.hasOption(ClothingItem.OPTIONS_HAS_FRONTBODY));
         trace("Has Backbody: " + this.hasOption(ClothingItem.OPTIONS_HAS_BACKBODY));
         trace("Has Back Hair: " + this.hasOption(ClothingItem.OPTIONS_HAS_BACK_HAIR));
         trace("Mouth Facial Hair: " + this.hasOption(ClothingItem.OPTIONS_HAS_MOUTH_FACIALHAIR));
         trace("Base Facial Hair: " + this.hasOption(ClothingItem.OPTIONS_HAS_BASE_FACIALHAIR));
         trace("Track Eyes: " + this.hasOption(ClothingItem.OPTIONS_TRACKEYES));
         trace("Only One Arm: " + this.hasOption(ClothingItem.OPTIONS_ONLYONEARM));
         trace("Hide Shirt Forearm: " + this.hasOption(ClothingItem.OPTIONS_HIDE_SHIRTFOREARM));
         trace("Is Necklace: " + this.hasOption(ClothingItem.OPTIONS_IS_NECKLACE));
         trace("Behind Collar: " + this.hasOption(ClothingItem.OPTIONS_BEHINDCOLLAR));
         trace("Acc Stays Back: " + this.hasOption(ClothingItem.OPTIONS_ACCSTAYSBACK));
         trace("Cap: " + this.hasOption(ClothingItem.OPTIONS_HAT_CAP));
         trace("Helmet: " + this.hasOption(ClothingItem.OPTIONS_HAT_HELMET));
         trace("Sombrero: " + this.hasOption(ClothingItem.OPTIONS_HAT_SOMBRERO));
         trace("Hair Clip: " + this.hasOption(ClothingItem.OPTIONS_HAT_HAIRCLIP));
         trace("Supports Bangs: " + this.hasOption(ClothingItem.OPTIONS_SUPPORTS_BANGS));
         trace("Full Mask: " + this.hasOption(ClothingItem.OPTIONS_HAT_FULLMASK));
         trace("Has Cuff: " + this.hasOption(ClothingItem.OPTIONS_HAS_CUFF));
         trace("*Acc Behind Jacket: " + this.hasOption(ClothingItem.OPTIONS_ACC_BEHINDJACKET));
         trace("*Acc Behind Jacket Neck: " + this.hasOption(ClothingItem.OPTIONS_ACC_BEHINDJACKETNECK));
         trace("Has Hand: " + this.hasOption(ClothingItem.OPTIONS_HAS_HAND));
         trace("Has Flared Sleeves: " + this.hasOption(ClothingItem.OPTIONS_HAS_FLAREDSLEEVES));
         trace("*Has Alternate Glove: " + this.hasOption(ClothingItem.OPTIONS_HAS_ALTERNATEGLOVE));
         trace("*Acc Behind Belt: " + this.hasOption(ClothingItem.OPTIONS_ACCBEHINDBELT));
         trace("*Has Hockey Sleeves: " + this.hasOption(ClothingItem.OPTIONS_HAS_HOCKEYSLEEVES));
         trace("*Has Alternate Collar: " + this.hasOption(ClothingItem.OPTIONS_HAS_ALTERNATECOLLAR));
         trace("*Has Alternate Body: " + this.hasOption(ClothingItem.OPTIONS_HAS_ALTERNATEBODY));
         trace("*Is Overalls: " + this.hasOption(ClothingItem.OPTIONS_IS_OVERALLS));
         trace("*Is Cropped Jacket: " + this.hasOption(ClothingItem.OPTIONS_IS_CROPPED_JACKET));
         trace("*Hide Irregular Forearm: " + this.hasOption(ClothingItem.OPTIONS_HIDE_IRREGULARFOREARM));
         trace("*Has Rolled Sleeves: " + this.hasOption(ClothingItem.OPTIONS_HAS_ROLLEDSLEEVES));
         trace("Is Dress: " + this.hasOption(ClothingItem.OPTIONS_IS_DRESS));
         trace("*Hide Shirt Body: " + this.hasOption(ClothingItem.OPTIONS_HIDE_SHIRTBODY));
         trace("Hide Pants: " + this.hasOption(ClothingItem.OPTIONS_HIDE_PANTS));
      }
   }
}
