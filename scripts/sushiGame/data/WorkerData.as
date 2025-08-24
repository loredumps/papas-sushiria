package sushiGame.data
{
   import package_2.class_6;
   
   public class WorkerData
   {
      
      public static const PREMADE_MALE_NAME:String = "Matt";
      
      public static const PREMADE_FEMALE_NAME:String = "Clover";
      
      public static const GENDER_MALE:String = "male";
      
      public static const GENDER_FEMALE:String = "female";
      
      public static var skinToneOptions:Array = [15977899,15511933,15783334,13537877,9592897,14523505,14132337,16299636,16768959];
      
      public static var hairColorOptions:Array = [16777215,13092031,5723220,2500134,3024417,3881799,4658972,6693929,5184525,3678487,4663562,5718574,6897701,8534812,9391895,11890734,13590832,16746278,16227863,11571504,16239685,16574546,16776299,16776332,16748497,3368499,2730119,16767273,14576399,12330269,5842521,2707340];
      
      public static var facialHairColorsToOverride:Array = [24,25,26,27,28,29,30,31];
      
      public static var facialHairAlternate:uint = 9391895;
      
      public static var facialHairAlternateDarker:uint = 4663562;
      
      public static var eyeDefaultOptions:Array = [1,13,16,15,14,4,5,6,9,10,11,12];
      
      public static var eyeColorOptionsLight:Array = [14392420,11787745,12898096,16028582];
      
      public static var eyeColorOptionsMedium:Array = [10972216,9611671,12757822,14054813];
      
      public static var eyeColorOptionsDark:Array = [8147254,7309447,9864751,11491976];
      
      public static const HEAD_HEIGHT_MIN:Number = -10;
      
      public static const HEAD_HEIGHT_MAX:Number = 20;
      
      public static const HEAD_FORWARD_MIN:Number = -10;
      
      public static const HEAD_FORWARD_MAX:Number = 10;
      
      public static const HEAD_SCALE_MIN:Number = 0.9;
      
      public static const HEAD_SCALE_MAX:Number = 1.1;
      
      public static const EYE_SPACING_MIN:Number = -1;
      
      public static const EYE_SPACING_MAX:Number = 3;
      
      public static const EYE_HEIGHT_MIN:Number = -4;
      
      public static const EYE_HEIGHT_MAX:Number = 4;
      
      public static const MOUTH_HEIGHT_MIN:Number = -3;
      
      public static const MOUTH_HEIGHT_MAX:Number = 3;
      
      public static const WEIGHT_SCALE_MIN:Number = 0.9;
      
      public static const WEIGHT_SCALE_MAX:Number = 1.35;
      
      public static const EYE_STYLE_MAX:Number = 11;
      
      public static const MOUTH_STYLE_MAX:Number = 1;
      
      public static const MOUTH_DEFAULT_MAX:Number = 21;
       
      
      public var gender:String = "male";
      
      public var skinTone:uint = 15977899;
      
      public var hairColor:uint = 4663562;
      
      public var forceFacialHairColor:Number = -1;
      
      public var eyeStyle:Number = 1;
      
      public var eyeDefaultExpression:Number = 1;
      
      public var eyeHeight:Number = 0;
      
      public var eyeSpacing:Number = 0;
      
      public var mouthStyle:Number = 1;
      
      public var mouthDefaultExpression:Number = 1;
      
      public var mouthHeight:Number = 0;
      
      public var headHeight:Number = 0;
      
      public var headScale:Number = 1;
      
      public var headForward:Number = 0;
      
      public var weightScale:Number = 1;
      
      public var neckScale:Number = 1;
      
      public var mouthNudge:Number = 0;
      
      public var shirt:String = "";
      
      public var jacket:String = "";
      
      public var pants:String = "";
      
      public var hair:String = "";
      
      public var hat:String = "";
      
      public var shoes:String = "";
      
      public var facialhair:String = "";
      
      public var bangs:String = "";
      
      public var acca:String = "";
      
      public var accb:String = "";
      
      public var accc:String = "";
      
      public var accd:String = "";
      
      public function WorkerData(param1:Object = null)
      {
         super();
         var _loc2_:WorkerData = this;
         if(param1 != null)
         {
            _loc2_.setupDefaults();
            _loc2_.populateWorkerData(param1);
         }
         else
         {
            _loc2_.setupDefaults();
         }
      }
      
      public function populateWorkerData(param1:Object) : void
      {
         var _loc2_:WorkerData = this;
         if(param1.hasOwnProperty("gender"))
         {
            _loc2_.gender = param1.gender;
         }
         if(param1.hasOwnProperty("skinTone"))
         {
            _loc2_.skinTone = param1.skinTone;
         }
         if(param1.hasOwnProperty("hairColor"))
         {
            _loc2_.hairColor = param1.hairColor;
         }
         if(param1.hasOwnProperty("forceFacialHairColor"))
         {
            _loc2_.forceFacialHairColor = param1.forceFacialHairColor;
         }
         if(param1.hasOwnProperty("eyeStyle"))
         {
            _loc2_.eyeStyle = param1.eyeStyle;
         }
         if(param1.hasOwnProperty("eyeDefaultExpression"))
         {
            _loc2_.eyeDefaultExpression = param1.eyeDefaultExpression;
         }
         if(param1.hasOwnProperty("eyeHeight"))
         {
            _loc2_.eyeHeight = param1.eyeHeight;
         }
         if(param1.hasOwnProperty("eyeSpacing"))
         {
            _loc2_.eyeSpacing = param1.eyeSpacing;
         }
         if(param1.hasOwnProperty("mouthDefaultExpression"))
         {
            _loc2_.mouthDefaultExpression = param1.mouthDefaultExpression;
         }
         if(param1.hasOwnProperty("mouthHeight"))
         {
            _loc2_.mouthHeight = param1.mouthHeight;
         }
         if(param1.hasOwnProperty("mouthNudge"))
         {
            _loc2_.mouthNudge = param1.mouthNudge;
         }
         if(param1.hasOwnProperty("headHeight"))
         {
            _loc2_.headHeight = param1.headHeight;
         }
         if(param1.hasOwnProperty("headScale"))
         {
            _loc2_.headScale = param1.headScale;
         }
         if(param1.hasOwnProperty("headForward"))
         {
            _loc2_.headForward = param1.headForward;
         }
         if(param1.hasOwnProperty("neckScale"))
         {
            _loc2_.neckScale = param1.neckScale;
         }
         if(param1.hasOwnProperty("weightScale"))
         {
            _loc2_.weightScale = param1.weightScale;
         }
         if(param1.hasOwnProperty("shirt"))
         {
            _loc2_.shirt = param1.shirt;
         }
         if(param1.hasOwnProperty("jacket"))
         {
            _loc2_.jacket = param1.jacket;
         }
         if(param1.hasOwnProperty("pants"))
         {
            _loc2_.pants = param1.pants;
         }
         if(param1.hasOwnProperty("hair"))
         {
            _loc2_.hair = param1.hair;
         }
         if(param1.hasOwnProperty("shoes"))
         {
            _loc2_.shoes = param1.shoes;
         }
         if(param1.hasOwnProperty("facialhair"))
         {
            _loc2_.facialhair = param1.facialhair;
         }
         if(param1.hasOwnProperty("bangs"))
         {
            _loc2_.bangs = param1.bangs;
         }
         if(param1.hasOwnProperty("acca"))
         {
            _loc2_.acca = param1.acca;
         }
         if(param1.hasOwnProperty("accb"))
         {
            _loc2_.accb = param1.accb;
         }
         if(param1.hasOwnProperty("accc"))
         {
            _loc2_.accc = param1.accc;
         }
         if(param1.hasOwnProperty("accd"))
         {
            _loc2_.accd = param1.accd;
         }
         if(param1.hasOwnProperty("hat"))
         {
            _loc2_.hat = param1.hat;
         }
      }
      
      public function getDataToSave() : Object
      {
         var _loc1_:WorkerData = this;
         var _loc2_:Object = new Object();
         _loc2_.gender = _loc1_.gender;
         _loc2_.skinTone = _loc1_.skinTone;
         _loc2_.hairColor = _loc1_.hairColor;
         _loc2_.forceFacialHairColor = _loc1_.forceFacialHairColor;
         _loc2_.eyeStyle = _loc1_.eyeStyle;
         _loc2_.eyeDefaultExpression = _loc1_.eyeDefaultExpression;
         _loc2_.eyeHeight = _loc1_.eyeHeight;
         _loc2_.eyeSpacing = _loc1_.eyeSpacing;
         _loc2_.mouthStyle = _loc1_.mouthStyle;
         _loc2_.mouthDefaultExpression = _loc1_.mouthDefaultExpression;
         _loc2_.mouthHeight = _loc1_.mouthHeight;
         _loc2_.mouthNudge = _loc1_.mouthNudge;
         _loc2_.headHeight = _loc1_.headHeight;
         _loc2_.headScale = _loc1_.headScale;
         _loc2_.headForward = _loc1_.headForward;
         _loc2_.neckScale = _loc1_.neckScale;
         _loc2_.weightScale = _loc1_.weightScale;
         _loc2_.shirt = _loc1_.shirt;
         _loc2_.jacket = _loc1_.jacket;
         _loc2_.pants = _loc1_.pants;
         _loc2_.hair = _loc1_.hair;
         _loc2_.hat = _loc1_.hat;
         _loc2_.shoes = _loc1_.shoes;
         _loc2_.facialhair = _loc1_.facialhair;
         _loc2_.bangs = _loc1_.bangs;
         _loc2_.acca = _loc1_.acca;
         _loc2_.accb = _loc1_.accb;
         _loc2_.accc = _loc1_.accc;
         _loc2_.accd = _loc1_.accd;
         return _loc2_;
      }
      
      public function outputDataText() : String
      {
         var _loc4_:Object = null;
         var _loc1_:WorkerData = this;
         var _loc2_:String = "";
         var _loc3_:Object = _loc1_.getDataToSave();
         for(_loc4_ in _loc3_)
         {
            _loc2_ += _loc4_ + ": " + _loc3_[_loc4_] + "\r";
         }
         return _loc2_;
      }
      
      public function getClothingTags() : Array
      {
         var _loc1_:WorkerData = this;
         var _loc2_:Array = [];
         _loc2_.push(_loc1_.shirt);
         _loc2_.push(_loc1_.jacket);
         _loc2_.push(_loc1_.pants);
         _loc2_.push(_loc1_.hat);
         _loc2_.push(_loc1_.shoes);
         _loc2_.push(_loc1_.acca);
         _loc2_.push(_loc1_.accb);
         _loc2_.push(_loc1_.accc);
         _loc2_.push(_loc1_.accd);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            if(String(_loc2_[_loc3_]).indexOf("_M") > -1)
            {
               _loc2_[_loc3_] = String(_loc2_[_loc3_]).substring(0,String(_loc2_[_loc3_]).indexOf("_M"));
            }
            else if(String(_loc2_[_loc3_]).indexOf("_F") > -1)
            {
               _loc2_[_loc3_] = String(_loc2_[_loc3_]).substring(0,String(_loc2_[_loc3_]).indexOf("_F"));
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function setupPremadeMale() : void
      {
         var _loc1_:WorkerData = this;
         _loc1_.gender = WorkerData.GENDER_MALE;
         _loc1_.skinTone = 16107677;
         _loc1_.hairColor = 6108944;
         _loc1_.forceFacialHairColor = 7949873;
         _loc1_.eyeStyle = 9;
         _loc1_.eyeDefaultExpression = 1;
         _loc1_.eyeHeight = 2;
         _loc1_.eyeSpacing = 1;
         _loc1_.mouthStyle = 1;
         _loc1_.mouthDefaultExpression = 1;
         _loc1_.mouthHeight = 2;
         _loc1_.headHeight = 7;
         _loc1_.headScale = 0.98;
         _loc1_.headForward = -6;
         _loc1_.neckScale = 1.05;
         _loc1_.weightScale = 1.1169;
         _loc1_.mouthNudge = 0;
         _loc1_.shirt = "tint_chefshirt:K-FG-SA";
         _loc1_.jacket = "";
         _loc1_.pants = "tint_pants_1:SA";
         _loc1_.hair = "hair_matt";
         _loc1_.hat = "tint_sushi_headband:W";
         _loc1_.shoes = "tint_shoes1:K-GR-FG";
         _loc1_.facialhair = "mattbeardalt";
         _loc1_.bangs = "";
         _loc1_.acca = "tint_shortapron:FG";
         _loc1_.accb = "";
         _loc1_.accc = "";
         _loc1_.accd = "tint_glasses12:DG";
      }
      
      public function setupPremadeFemale() : void
      {
         var _loc1_:WorkerData = this;
         _loc1_.gender = WorkerData.GENDER_FEMALE;
         _loc1_.skinTone = 16107677;
         _loc1_.hairColor = 16227863;
         _loc1_.forceFacialHairColor = -1;
         _loc1_.eyeStyle = 1;
         _loc1_.eyeDefaultExpression = 1;
         _loc1_.eyeHeight = 0;
         _loc1_.eyeSpacing = 2;
         _loc1_.mouthStyle = 1;
         _loc1_.mouthDefaultExpression = 1;
         _loc1_.mouthHeight = 3;
         _loc1_.headHeight = 3;
         _loc1_.headScale = 0.9964;
         _loc1_.headForward = 1;
         _loc1_.mouthNudge = 0;
         _loc1_.neckScale = 1;
         _loc1_.weightScale = 0.983;
         _loc1_.shirt = "tint_chefshirt:K-FG-SA";
         _loc1_.jacket = "";
         _loc1_.pants = "tint_skirt_1:SA";
         _loc1_.hair = "hair_clover";
         _loc1_.hat = "tint_sushi_hairband:W";
         _loc1_.shoes = "tint_shoes1:K-GR-FG";
         _loc1_.facialhair = "";
         _loc1_.bangs = "";
         _loc1_.acca = "tint_shortapron:FG";
         _loc1_.accb = "";
         _loc1_.accc = "";
         _loc1_.accd = "";
      }
      
      public function setupDefaults() : void
      {
         var _loc1_:WorkerData = this;
         _loc1_.gender = WorkerData.GENDER_MALE;
         _loc1_.skinTone = 15977899;
         _loc1_.hairColor = 4663562;
         _loc1_.forceFacialHairColor = -1;
         _loc1_.eyeStyle = 1;
         _loc1_.eyeDefaultExpression = 1;
         _loc1_.eyeHeight = 0;
         _loc1_.eyeSpacing = 0;
         _loc1_.mouthStyle = 1;
         _loc1_.mouthDefaultExpression = 1;
         _loc1_.mouthHeight = 0;
         _loc1_.headHeight = 0;
         _loc1_.headScale = 1;
         _loc1_.headForward = 0;
         _loc1_.mouthNudge = 0;
         _loc1_.neckScale = 1;
         _loc1_.weightScale = 1;
         _loc1_.shirt = "tint_chefshirt:K-FG-SA";
         _loc1_.jacket = "";
         _loc1_.pants = "tint_pants_1:SA";
         _loc1_.hair = "hair_short02";
         _loc1_.hat = "tint_sushi_headband:W";
         _loc1_.shoes = "tint_shoes1:K-GR-FG";
         _loc1_.facialhair = "";
         _loc1_.bangs = "";
         _loc1_.acca = "tint_shortapron:FG";
         _loc1_.accb = "";
         _loc1_.accc = "";
         _loc1_.accd = "";
      }
      
      public function restoreHat() : void
      {
         var _loc1_:WorkerData = this;
         _loc1_.hat = "tint_sushi_headband:W";
      }
      
      public function setGender(param1:String) : void
      {
         var _loc2_:WorkerData = this;
         _loc2_.gender = param1;
         if(_loc2_.gender == WorkerData.GENDER_MALE)
         {
            _loc2_.hair = "hair_short02";
            _loc2_.pants = "tint_pants_1:SA";
         }
         else if(_loc2_.gender == WorkerData.GENDER_FEMALE)
         {
            _loc2_.hair = "hair_ponytailM";
            _loc2_.pants = "tint_skirt_1:SA";
         }
      }
      
      public function randomizeFace() : void
      {
         var _loc1_:WorkerData = this;
         _loc1_.eyeStyle = Math.ceil(Math.random() * WorkerData.EYE_STYLE_MAX);
         _loc1_.eyeDefaultExpression = WorkerData.eyeDefaultOptions[Math.floor(Math.random() * WorkerData.eyeDefaultOptions.length)];
         _loc1_.mouthStyle = 1;
         _loc1_.mouthDefaultExpression = Math.ceil(Math.random() * WorkerData.MOUTH_DEFAULT_MAX);
         _loc1_.hairColor = WorkerData.hairColorOptions[Math.floor(Math.random() * WorkerData.hairColorOptions.length)];
         _loc1_.skinTone = WorkerData.skinToneOptions[Math.floor(Math.random() * WorkerData.skinToneOptions.length)];
         _loc1_.headHeight = WorkerData.HEAD_HEIGHT_MIN + Math.floor(Math.random() * (WorkerData.HEAD_HEIGHT_MAX - WorkerData.HEAD_HEIGHT_MIN));
         _loc1_.headForward = WorkerData.HEAD_FORWARD_MIN + Math.floor(Math.random() * (WorkerData.HEAD_FORWARD_MAX - WorkerData.HEAD_FORWARD_MIN));
         _loc1_.headScale = WorkerData.HEAD_SCALE_MIN + Math.floor(Math.random() * (WorkerData.HEAD_SCALE_MAX - WorkerData.HEAD_SCALE_MIN));
         _loc1_.eyeSpacing = WorkerData.EYE_SPACING_MIN + Math.floor(Math.random() * (WorkerData.EYE_SPACING_MAX - WorkerData.EYE_SPACING_MIN));
         _loc1_.eyeHeight = WorkerData.EYE_HEIGHT_MIN + Math.floor(Math.random() * (WorkerData.EYE_HEIGHT_MAX - WorkerData.EYE_HEIGHT_MIN));
         _loc1_.mouthHeight = WorkerData.MOUTH_HEIGHT_MIN + Math.floor(Math.random() * (WorkerData.MOUTH_HEIGHT_MAX - WorkerData.MOUTH_HEIGHT_MIN));
      }
      
      public function adjustValue(param1:String, param2:Number) : void
      {
         var _loc3_:WorkerData = this;
         if(param1 == "eyeHeight")
         {
            if(param2 >= WorkerData.EYE_HEIGHT_MIN && param2 <= WorkerData.EYE_HEIGHT_MAX)
            {
               _loc3_.eyeHeight = param2;
            }
            else if(param2 < WorkerData.EYE_HEIGHT_MIN)
            {
               _loc3_.eyeHeight = WorkerData.EYE_HEIGHT_MIN;
            }
            else if(param2 > WorkerData.EYE_HEIGHT_MAX)
            {
               _loc3_.eyeHeight = WorkerData.EYE_HEIGHT_MAX;
            }
         }
         else if(param1 == "eyeSpacing")
         {
            if(param2 >= WorkerData.EYE_SPACING_MIN && param2 <= WorkerData.EYE_SPACING_MAX)
            {
               _loc3_.eyeSpacing = param2;
            }
            else if(param2 < WorkerData.EYE_SPACING_MIN)
            {
               _loc3_.eyeSpacing = WorkerData.EYE_SPACING_MIN;
            }
            else if(param2 > WorkerData.EYE_SPACING_MAX)
            {
               _loc3_.eyeSpacing = WorkerData.EYE_SPACING_MAX;
            }
         }
         else if(param1 == "mouthHeight")
         {
            if(param2 >= WorkerData.MOUTH_HEIGHT_MIN && param2 <= WorkerData.MOUTH_HEIGHT_MAX)
            {
               _loc3_.mouthHeight = param2;
            }
            else if(param2 < WorkerData.MOUTH_HEIGHT_MIN)
            {
               _loc3_.mouthHeight = WorkerData.MOUTH_HEIGHT_MIN;
            }
            else if(param2 > WorkerData.MOUTH_HEIGHT_MAX)
            {
               _loc3_.mouthHeight = WorkerData.MOUTH_HEIGHT_MAX;
            }
         }
         else if(param1 == "headHeight")
         {
            if(param2 >= WorkerData.HEAD_HEIGHT_MIN && param2 <= WorkerData.HEAD_HEIGHT_MAX)
            {
               _loc3_.headHeight = param2;
            }
            else if(param2 < WorkerData.HEAD_HEIGHT_MIN)
            {
               _loc3_.headHeight = WorkerData.HEAD_HEIGHT_MIN;
            }
            else if(param2 > WorkerData.HEAD_HEIGHT_MAX)
            {
               _loc3_.headHeight = WorkerData.HEAD_HEIGHT_MAX;
            }
         }
         else if(param1 == "headForward")
         {
            if(param2 >= WorkerData.HEAD_FORWARD_MIN && param2 <= WorkerData.HEAD_FORWARD_MAX)
            {
               _loc3_.headForward = param2;
            }
            else if(param2 < WorkerData.HEAD_FORWARD_MIN)
            {
               _loc3_.headForward = WorkerData.HEAD_FORWARD_MIN;
            }
            else if(param2 > WorkerData.HEAD_FORWARD_MAX)
            {
               _loc3_.headForward = WorkerData.HEAD_FORWARD_MAX;
            }
         }
         else if(param1 == "headScale")
         {
            if(param2 >= WorkerData.HEAD_SCALE_MIN && param2 <= WorkerData.HEAD_SCALE_MAX)
            {
               _loc3_.headScale = param2;
            }
            else if(param2 < WorkerData.HEAD_SCALE_MIN)
            {
               _loc3_.headScale = WorkerData.HEAD_SCALE_MIN;
            }
            else if(param2 > WorkerData.HEAD_SCALE_MAX)
            {
               _loc3_.headScale = WorkerData.HEAD_SCALE_MAX;
            }
         }
         else if(param1 == "weightScale")
         {
            if(param2 >= WorkerData.WEIGHT_SCALE_MIN && param2 <= WorkerData.WEIGHT_SCALE_MAX)
            {
               _loc3_.weightScale = param2;
            }
            else if(param2 < WorkerData.WEIGHT_SCALE_MIN)
            {
               _loc3_.weightScale = WorkerData.WEIGHT_SCALE_MIN;
            }
            else if(param2 > WorkerData.WEIGHT_SCALE_MAX)
            {
               _loc3_.weightScale = WorkerData.WEIGHT_SCALE_MAX;
            }
         }
         else if(param1 == "eyeStyle")
         {
            if(param2 > 0 && param2 <= WorkerData.EYE_STYLE_MAX * WorkerData.eyeColorOptionsDark.length)
            {
               _loc3_.eyeStyle = param2;
            }
            else if(param2 < 1)
            {
               _loc3_.eyeStyle = 1;
            }
            else if(param2 > WorkerData.EYE_STYLE_MAX * WorkerData.eyeColorOptionsDark.length)
            {
               _loc3_.eyeStyle = WorkerData.EYE_STYLE_MAX * WorkerData.eyeColorOptionsDark.length;
            }
         }
         else if(param1 == "eyeDefault")
         {
            if(param2 >= 0 && param2 < WorkerData.eyeDefaultOptions.length)
            {
               _loc3_.eyeDefaultExpression = WorkerData.eyeDefaultOptions[param2];
            }
            else if(param2 < 0)
            {
               _loc3_.eyeDefaultExpression = WorkerData.eyeDefaultOptions[0];
            }
            else if(param2 >= WorkerData.eyeDefaultOptions.length)
            {
               _loc3_.eyeDefaultExpression = WorkerData.eyeDefaultOptions[WorkerData.eyeDefaultOptions.length - 1];
            }
         }
         else if(param1 == "mouthDefault")
         {
            if(param2 > 0 && param2 <= WorkerData.MOUTH_DEFAULT_MAX)
            {
               _loc3_.mouthDefaultExpression = param2;
            }
            else if(param2 < 1)
            {
               _loc3_.mouthDefaultExpression = 1;
            }
            else if(param2 > WorkerData.MOUTH_DEFAULT_MAX)
            {
               _loc3_.mouthDefaultExpression = WorkerData.MOUTH_DEFAULT_MAX;
            }
         }
         else
         {
            class_6.error("No such type: " + param1 + " (Value " + param2 + ")");
         }
      }
      
      public function getHairColor() : uint
      {
         var _loc1_:WorkerData = this;
         return _loc1_.hairColor;
      }
      
      public function getFacialHairColor() : uint
      {
         var _loc1_:WorkerData = this;
         var _loc2_:Number = WorkerData.hairColorOptions.indexOf(_loc1_.hairColor);
         if(_loc1_.forceFacialHairColor > -1)
         {
            return _loc1_.forceFacialHairColor;
         }
         if(WorkerData.facialHairColorsToOverride.indexOf(_loc2_) > -1)
         {
            if(_loc1_.skinTone == 9592897)
            {
               return WorkerData.facialHairAlternateDarker;
            }
            return WorkerData.facialHairAlternate;
         }
         return _loc1_.hairColor;
      }
   }
}
