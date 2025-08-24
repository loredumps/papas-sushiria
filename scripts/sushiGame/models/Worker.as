package sushiGame.models
{
   import flash.display.*;
   import flash.events.*;
   import flash.geom.ColorTransform;
   import package_2.class_14;
   import package_2.class_6;
   import package_4.*;
   import sushiGame.data.*;
   
   public class Worker
   {
       
      
      public var gameObj:class_5;
      
      public var workerData:WorkerData;
      
      public var holder:MovieClip;
      
      public var clip:MovieClip;
      
      public var x:Number;
      
      public var y:Number;
      
      public var scale:Number;
      
      public var flipped:Boolean = false;
      
      public var backwards:Boolean = false;
      
      public var skinToneTransform:ColorTransform = null;
      
      public var hairColorTransform:ColorTransform = null;
      
      public var facialHairColorTransform:ColorTransform = null;
      
      public var blinkTimer:Number = 0;
      
      public var blinkTimerMax:Number = 100;
      
      public var eyesOffsetY:Number = -23;
      
      public var eyesOffsetX:Number = -18;
      
      public var mouthOffsetY:Number = -9;
      
      public var mouthOffsetX:Number = -26;
      
      public var beardBackwardsX:Number = -13;
      
      public var mouthClip:MovieClip;
      
      public var eyeLeftClip:MovieClip;
      
      public var eyeRightClip:MovieClip;
      
      public var eyeBaseLeftClip:MovieClip;
      
      public var eyeBaseRightClip:MovieClip;
      
      public var hairClip:MovieClip = null;
      
      public var backHairClip:MovieClip = null;
      
      public var facialHairMouthClip:MovieClip = null;
      
      public var facialHairBaseClip:MovieClip = null;
      
      public var faceAccClip:MovieClip = null;
      
      public var faceAccBackClip:MovieClip = null;
      
      public var hatClip:MovieClip = null;
      
      public var bangsClip:MovieClip = null;
      
      public var backBangsClip:MovieClip = null;
      
      public var lastEyeFrame:Number = 0;
      
      public var lastMouthFrame:Number = 0;
      
      public var lastFrontShoeFrame:Number = 1;
      
      public var lastBackShoeFrame:Number = 1;
      
      public var lastFrontHandFrame:Number = 1;
      
      public var lastBackHandFrame:Number = 1;
      
      public function Worker(param1:class_5, param2:MovieClip, param3:WorkerData, param4:Number, param5:Number, param6:Number, param7:Boolean = false, param8:Boolean = false)
      {
         super();
         var _loc9_:Worker;
         (_loc9_ = this).gameObj = param1;
         _loc9_.holder = param2;
         _loc9_.workerData = param3;
         _loc9_.x = param4;
         _loc9_.y = param5;
         _loc9_.scale = param6;
         _loc9_.flipped = param8;
         _loc9_.backwards = param7;
         _loc9_.createModel();
      }
      
      public function playAnimation(param1:String) : void
      {
         var which:String = param1;
         var ob:Worker = this;
         try
         {
            ob.clip.gotoAndPlay(which);
         }
         catch(err:Error)
         {
            class_6.error("Error playing worker animation \'" + which + "\': " + err.message);
         }
      }
      
      public function createModel() : void
      {
         var _loc1_:Worker = this;
         _loc1_.clip = new workerModel();
         if(_loc1_.workerData.gender == WorkerData.GENDER_MALE)
         {
            _loc1_.clip.body.male_skin.visible = true;
            _loc1_.clip.body.female_skin.visible = false;
         }
         else
         {
            _loc1_.clip.body.male_skin.visible = false;
            _loc1_.clip.body.female_skin.visible = true;
         }
         _loc1_.updateSkinTone();
         _loc1_.updateHairColor();
         _loc1_.updateFacialParts();
         if(_loc1_.backwards)
         {
            _loc1_.lastFrontHandFrame = 3;
            _loc1_.lastBackHandFrame = 4;
         }
         else
         {
            _loc1_.lastFrontHandFrame = 1;
            _loc1_.lastBackHandFrame = 1;
         }
         _loc1_.redoClothing(ClothingItem.TYPE_SHIRT);
         _loc1_.redoClothing(ClothingItem.TYPE_HAIR);
         _loc1_.redoClothing(ClothingItem.TYPE_SHOES);
         if(_loc1_.backwards)
         {
            _loc1_.clip.body.male_skin.gotoAndStop(2);
            _loc1_.clip.body.female_skin.gotoAndStop(2);
            _loc1_.clip.neck.skin.gotoAndStop(2);
            _loc1_.clip.front_hand.skin.gotoAndStop(3);
            _loc1_.clip.back_hand.skin.gotoAndStop(4);
            _loc1_.clip.front_hand.gotoAndStop(3);
            _loc1_.clip.back_hand.gotoAndStop(4);
            _loc1_.clip.gotoAndPlay("turnaround");
         }
         else
         {
            _loc1_.clip.body.male_skin.gotoAndStop(1);
            _loc1_.clip.body.female_skin.gotoAndStop(1);
            _loc1_.clip.neck.skin.gotoAndStop(1);
            _loc1_.clip.front_hand.skin.gotoAndStop(1);
            _loc1_.clip.back_hand.skin.gotoAndStop(1);
            _loc1_.clip.front_hand.gotoAndStop(1);
            _loc1_.clip.back_hand.gotoAndStop(1);
            _loc1_.clip.gotoAndPlay("stand");
         }
         _loc1_.clip.x = _loc1_.x;
         _loc1_.clip.y = _loc1_.y;
         _loc1_.clip.scaleX = _loc1_.scale;
         _loc1_.clip.scaleY = _loc1_.scale;
         if(_loc1_.flipped)
         {
            _loc1_.clip.scaleX *= -1;
         }
         _loc1_.holder.addChild(_loc1_.clip);
         _loc1_.clip.eyeFrame = 0;
         _loc1_.clip.mouthFrame = 0;
         _loc1_.clip.frontShoeFrame = 1;
         _loc1_.clip.backShoeFrame = 1;
         _loc1_.clip.frontHandFrame = _loc1_.lastFrontHandFrame;
         _loc1_.clip.backHandFrame = _loc1_.lastBackHandFrame;
         _loc1_.lastEyeFrame = 0;
         _loc1_.lastMouthFrame = 0;
         _loc1_.lastFrontShoeFrame = 1;
         _loc1_.lastBackShoeFrame = 1;
         _loc1_.gameObj.var_130.api.addEventListener("workerChange",_loc1_.updateModelLook);
      }
      
      public function animateModel(param1:Event = null) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:Worker = this;
         if(_loc2_.clip.eyeFrame != _loc2_.lastEyeFrame)
         {
            _loc2_.lastEyeFrame = _loc2_.clip.eyeFrame;
            if(_loc2_.lastEyeFrame == 0)
            {
               _loc2_.eyeLeftClip.gotoAndStop(_loc2_.workerData.eyeDefaultExpression);
               _loc2_.eyeRightClip.gotoAndStop(_loc2_.workerData.eyeDefaultExpression);
               _loc2_.eyeBaseLeftClip.gotoAndStop(_loc2_.workerData.eyeDefaultExpression);
               _loc2_.eyeBaseRightClip.gotoAndStop(_loc2_.workerData.eyeDefaultExpression);
            }
            else
            {
               _loc2_.eyeLeftClip.gotoAndStop(_loc2_.lastEyeFrame);
               _loc2_.eyeRightClip.gotoAndStop(_loc2_.lastEyeFrame);
               _loc2_.eyeBaseLeftClip.gotoAndStop(_loc2_.lastEyeFrame);
               _loc2_.eyeBaseRightClip.gotoAndStop(_loc2_.lastEyeFrame);
            }
         }
         if(_loc2_.clip.mouthFrame != _loc2_.lastMouthFrame)
         {
            _loc2_.lastMouthFrame = _loc2_.clip.mouthFrame;
            if(_loc2_.lastMouthFrame == 0)
            {
               _loc2_.mouthClip.gotoAndStop(_loc2_.workerData.mouthDefaultExpression);
            }
            else
            {
               _loc2_.mouthClip.gotoAndStop(_loc2_.lastMouthFrame);
            }
            if(_loc2_.facialHairMouthClip != null && !_loc2_.backwards)
            {
               if(_loc2_.lastMouthFrame == 0)
               {
                  _loc2_.facialHairMouthClip.gotoAndStop(_loc2_.workerData.mouthDefaultExpression);
               }
               else
               {
                  _loc2_.facialHairMouthClip.gotoAndStop(_loc2_.lastMouthFrame);
               }
            }
         }
         if(_loc2_.clip.frontHandFrame != _loc2_.lastFrontHandFrame)
         {
            _loc2_.lastFrontHandFrame = _loc2_.clip.frontHandFrame;
            _loc2_.clip.front_hand.gotoAndStop(_loc2_.lastFrontHandFrame);
            _loc2_.clip.front_hand.skin.gotoAndStop(_loc2_.lastFrontHandFrame);
            _loc3_ = 0;
            while(_loc3_ < _loc2_.clip.front_hand.gloveholder.numChildren)
            {
               _loc4_ = 0;
               while(_loc4_ < _loc2_.clip.front_hand.gloveholder.getChildAt(_loc3_).numChildren)
               {
                  if(_loc2_.clip.front_hand.gloveholder.getChildAt(_loc3_).getChildAt(_loc4_) is MovieClip)
                  {
                     _loc2_.clip.front_hand.gloveholder.getChildAt(_loc3_).getChildAt(_loc4_).gotoAndStop(_loc2_.lastFrontHandFrame);
                  }
                  _loc4_++;
               }
               _loc3_++;
            }
         }
         if(_loc2_.clip.backHandFrame != _loc2_.lastBackHandFrame)
         {
            _loc2_.lastBackHandFrame = _loc2_.clip.backHandFrame;
            _loc2_.clip.back_hand.gotoAndStop(_loc2_.lastBackHandFrame);
            _loc2_.clip.back_hand.skin.gotoAndStop(_loc2_.lastBackHandFrame);
            _loc3_ = 0;
            while(_loc3_ < _loc2_.clip.back_hand.gloveholder.numChildren)
            {
               _loc4_ = 0;
               while(_loc4_ < _loc2_.clip.back_hand.gloveholder.getChildAt(_loc3_).numChildren)
               {
                  if(_loc2_.clip.back_hand.gloveholder.getChildAt(_loc3_).getChildAt(_loc4_) is MovieClip)
                  {
                     _loc2_.clip.back_hand.gloveholder.getChildAt(_loc3_).getChildAt(_loc4_).gotoAndStop(_loc2_.lastBackHandFrame);
                  }
                  _loc4_++;
               }
               _loc3_++;
            }
         }
         if(_loc2_.clip.frontShoeFrame != _loc2_.lastFrontShoeFrame && !_loc2_.backwards)
         {
            _loc2_.lastFrontShoeFrame = _loc2_.clip.frontShoeFrame;
            _loc3_ = 0;
            while(_loc3_ < _loc2_.clip.front_foot.numChildren)
            {
               _loc2_.clip.front_foot.getChildAt(_loc3_).gotoAndStop(_loc2_.lastFrontShoeFrame);
               if(_loc3_ > 0)
               {
                  _loc4_ = 0;
                  while(_loc4_ < _loc2_.clip.front_foot.getChildAt(_loc3_).numChildren)
                  {
                     if(_loc2_.clip.front_foot.getChildAt(_loc3_).getChildAt(_loc4_) is MovieClip)
                     {
                        _loc2_.clip.front_foot.getChildAt(_loc3_).getChildAt(_loc4_).gotoAndStop(_loc2_.lastFrontShoeFrame);
                     }
                     _loc4_++;
                  }
               }
               _loc3_++;
            }
         }
         if(_loc2_.clip.backShoeFrame != _loc2_.lastBackShoeFrame && !_loc2_.backwards)
         {
            _loc2_.lastBackShoeFrame = _loc2_.clip.backShoeFrame;
            _loc3_ = 0;
            while(_loc3_ < _loc2_.clip.back_foot.numChildren)
            {
               _loc2_.clip.back_foot.getChildAt(_loc3_).gotoAndStop(_loc2_.lastBackShoeFrame);
               if(_loc3_ > 0)
               {
                  _loc4_ = 0;
                  while(_loc4_ < _loc2_.clip.back_foot.getChildAt(_loc3_).numChildren)
                  {
                     if(_loc2_.clip.front_foot.getChildAt(_loc3_).getChildAt(_loc4_) is MovieClip)
                     {
                        _loc2_.clip.back_foot.getChildAt(_loc3_).getChildAt(_loc4_).gotoAndStop(_loc2_.lastBackShoeFrame);
                     }
                     _loc4_++;
                  }
               }
               _loc3_++;
            }
         }
         if(_loc2_.lastEyeFrame == 0)
         {
            ++_loc2_.blinkTimer;
            if(_loc2_.blinkTimer == _loc2_.blinkTimerMax || _loc2_.blinkTimer == _loc2_.blinkTimerMax + 3)
            {
               _loc2_.eyeLeftClip.gotoAndStop(2);
               _loc2_.eyeRightClip.gotoAndStop(2);
               _loc2_.eyeBaseLeftClip.gotoAndStop(2);
               _loc2_.eyeBaseRightClip.gotoAndStop(2);
            }
            else if(_loc2_.blinkTimer == _loc2_.blinkTimerMax + 1 || _loc2_.blinkTimer == _loc2_.blinkTimerMax + 2)
            {
               _loc2_.eyeLeftClip.gotoAndStop(3);
               _loc2_.eyeRightClip.gotoAndStop(3);
               _loc2_.eyeBaseLeftClip.gotoAndStop(3);
               _loc2_.eyeBaseRightClip.gotoAndStop(3);
            }
            else if(_loc2_.blinkTimer == _loc2_.blinkTimerMax + 4)
            {
               _loc2_.eyeLeftClip.gotoAndStop(_loc2_.workerData.eyeDefaultExpression);
               _loc2_.eyeRightClip.gotoAndStop(_loc2_.workerData.eyeDefaultExpression);
               _loc2_.eyeBaseLeftClip.gotoAndStop(_loc2_.workerData.eyeDefaultExpression);
               _loc2_.eyeBaseRightClip.gotoAndStop(_loc2_.workerData.eyeDefaultExpression);
               _loc2_.blinkTimer = 0;
            }
         }
      }
      
      public function runOwnAnimations() : void
      {
         var _loc1_:Worker = this;
         if(!_loc1_.clip.hasEventListener(Event.ENTER_FRAME))
         {
            _loc1_.clip.addEventListener(Event.ENTER_FRAME,_loc1_.animateModel);
         }
      }
      
      public function updateModelLook(param1:Event = null) : void
      {
         var _loc2_:Worker = this;
         if(_loc2_.workerData.gender == WorkerData.GENDER_MALE)
         {
            _loc2_.clip.body.male_skin.visible = true;
            _loc2_.clip.body.female_skin.visible = false;
         }
         else
         {
            _loc2_.clip.body.male_skin.visible = false;
            _loc2_.clip.body.female_skin.visible = true;
         }
         _loc2_.updateSkinTone();
         _loc2_.updateHairColor();
         _loc2_.updateFacialParts();
         _loc2_.redoClothing(ClothingItem.TYPE_SHIRT);
         _loc2_.redoClothing(ClothingItem.TYPE_HAIR);
         _loc2_.redoClothing(ClothingItem.TYPE_SHOES);
      }
      
      public function destroy() : void
      {
         var _loc1_:Worker = this;
         _loc1_.gameObj.var_130.api.removeEventListener("workerChange",_loc1_.updateModelLook);
         _loc1_.clip.removeEventListener(Event.ENTER_FRAME,_loc1_.animateModel);
         _loc1_.clip.stop();
         _loc1_.removeExistingHeadItems();
         _loc1_.removeExistingClothing(_loc1_.clip.front_foot);
         _loc1_.removeExistingClothing(_loc1_.clip.back_foot);
         _loc1_.removeExistingClothing(_loc1_.clip.body);
         _loc1_.removeExistingClothing(_loc1_.clip.front_bicep);
         _loc1_.removeExistingClothing(_loc1_.clip.front_forearm);
         _loc1_.removeExistingClothing(_loc1_.clip.back_bicep);
         _loc1_.removeExistingClothing(_loc1_.clip.back_forearm);
         _loc1_.removeExistingClothing(_loc1_.clip.neck);
         _loc1_.removeExistingClothing(_loc1_.clip.back_acca);
         _loc1_.removeExistingClothing(_loc1_.clip.front_acca);
         _loc1_.removeExistingClothing(_loc1_.clip.front_hand.cuffholder);
         _loc1_.removeExistingClothing(_loc1_.clip.back_hand.cuffholder);
         if(_loc1_.holder)
         {
            try
            {
               _loc1_.holder.removeChild(_loc1_.clip);
            }
            catch(err:Error)
            {
            }
         }
         _loc1_.clip = null;
      }
      
      public function updateSkinTone() : void
      {
         var _loc1_:Worker = this;
         _loc1_.skinToneTransform = _loc1_.createColorTransform(_loc1_.workerData.skinTone);
         _loc1_.clip.head.inside.skin.transform.colorTransform = _loc1_.skinToneTransform;
         _loc1_.clip.neck.skin.transform.colorTransform = _loc1_.skinToneTransform;
         _loc1_.clip.front_bicep.skin.transform.colorTransform = _loc1_.skinToneTransform;
         _loc1_.clip.back_bicep.skin.transform.colorTransform = _loc1_.skinToneTransform;
         _loc1_.clip.front_forearm.skin.transform.colorTransform = _loc1_.skinToneTransform;
         _loc1_.clip.back_forearm.skin.transform.colorTransform = _loc1_.skinToneTransform;
         _loc1_.clip.front_hand.skin.transform.colorTransform = _loc1_.skinToneTransform;
         _loc1_.clip.back_hand.skin.transform.colorTransform = _loc1_.skinToneTransform;
         _loc1_.clip.body.male_skin.transform.colorTransform = _loc1_.skinToneTransform;
         _loc1_.clip.body.female_skin.transform.colorTransform = _loc1_.skinToneTransform;
         _loc1_.redoClothing(ClothingItem.TYPE_HAIR);
      }
      
      public function updateHairColor() : void
      {
         var _loc1_:Worker = this;
         _loc1_.hairColorTransform = _loc1_.createColorTransform(_loc1_.workerData.getHairColor(),true);
         _loc1_.facialHairColorTransform = _loc1_.createColorTransform(_loc1_.workerData.getFacialHairColor(),true);
         if(_loc1_.hairClip != null)
         {
            try
            {
               _loc1_.hairClip.hair.transform.colorTransform = _loc1_.hairColorTransform;
            }
            catch(err:Error)
            {
            }
         }
         if(_loc1_.backHairClip != null)
         {
            try
            {
               _loc1_.backHairClip.hair.transform.colorTransform = _loc1_.hairColorTransform;
            }
            catch(err:Error)
            {
            }
         }
         if(_loc1_.facialHairBaseClip != null)
         {
            try
            {
               _loc1_.facialHairBaseClip.transform.colorTransform = _loc1_.facialHairColorTransform;
            }
            catch(err:Error)
            {
            }
         }
         if(_loc1_.facialHairMouthClip != null)
         {
            try
            {
               _loc1_.facialHairMouthClip.transform.colorTransform = _loc1_.facialHairColorTransform;
            }
            catch(err:Error)
            {
            }
         }
         if(_loc1_.bangsClip != null)
         {
            try
            {
               _loc1_.bangsClip.hair.transform.colorTransform = _loc1_.hairColorTransform;
            }
            catch(err:Error)
            {
            }
         }
         if(_loc1_.backBangsClip != null)
         {
            try
            {
               _loc1_.backBangsClip.hair.transform.colorTransform = _loc1_.hairColorTransform;
            }
            catch(err:Error)
            {
            }
         }
         try
         {
            _loc1_.eyeLeftClip.hair.inside.transform.colorTransform = _loc1_.facialHairColorTransform;
            _loc1_.eyeRightClip.hair.inside.transform.colorTransform = _loc1_.facialHairColorTransform;
         }
         catch(err:Error)
         {
         }
      }
      
      public function updateFacialParts(param1:Boolean = true, param2:Boolean = true, param3:Boolean = true, param4:Boolean = true, param5:Boolean = true) : void
      {
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:uint = 0;
         var _loc6_:Worker = this;
         var _loc7_:Number = WorkerData.skinToneOptions.indexOf(_loc6_.workerData.skinTone);
         var _loc8_:String = "light";
         var _loc9_:String = "light";
         if(_loc7_ == 3 || _loc7_ == 5 || _loc7_ == 6)
         {
            _loc8_ = "med";
         }
         else if(_loc7_ == 4)
         {
            _loc8_ = "dark";
            _loc9_ = "dark";
         }
         if(_loc6_.workerData.gender == WorkerData.GENDER_FEMALE)
         {
            _loc9_ = "female";
         }
         if(param1)
         {
            if(_loc6_.eyeLeftClip != null)
            {
               _loc6_.eyeLeftClip.parent.removeChild(_loc6_.eyeLeftClip);
               _loc6_.eyeLeftClip = null;
            }
            if(_loc6_.eyeRightClip != null)
            {
               _loc6_.eyeRightClip.parent.removeChild(_loc6_.eyeRightClip);
               _loc6_.eyeRightClip = null;
            }
            if(_loc6_.eyeBaseLeftClip != null)
            {
               _loc6_.eyeBaseLeftClip.parent.removeChild(_loc6_.eyeBaseLeftClip);
               _loc6_.eyeBaseLeftClip = null;
            }
            if(_loc6_.eyeBaseRightClip != null)
            {
               _loc6_.eyeBaseRightClip.parent.removeChild(_loc6_.eyeBaseRightClip);
               _loc6_.eyeBaseRightClip = null;
            }
            _loc10_ = (_loc6_.workerData.eyeStyle - 1) % WorkerData.EYE_STYLE_MAX + 1;
            _loc11_ = Math.ceil(_loc6_.workerData.eyeStyle / WorkerData.EYE_STYLE_MAX) - 1;
            _loc12_ = 0;
            if(_loc8_ == "light")
            {
               _loc12_ = uint(WorkerData.eyeColorOptionsLight[_loc11_]);
            }
            else if(_loc8_ == "med")
            {
               _loc12_ = uint(WorkerData.eyeColorOptionsMedium[_loc11_]);
            }
            else if(_loc8_ == "dark")
            {
               _loc12_ = uint(WorkerData.eyeColorOptionsDark[_loc11_]);
            }
            _loc6_.eyeBaseLeftClip = class_14.method_103("worker_eyes_L_base",false,false);
            _loc6_.eyeBaseRightClip = class_14.method_103("worker_eyes_R_base",false,false);
            _loc6_.eyeBaseLeftClip.transform.colorTransform = _loc6_.createColorTransform(_loc12_);
            _loc6_.eyeBaseRightClip.transform.colorTransform = _loc6_.createColorTransform(_loc12_);
            _loc6_.eyeBaseLeftClip.stop();
            _loc6_.eyeBaseRightClip.stop();
            _loc6_.clip.head.inside.addChild(_loc6_.eyeBaseLeftClip);
            _loc6_.clip.head.inside.addChild(_loc6_.eyeBaseRightClip);
            _loc6_.eyeLeftClip = class_14.method_103("worker_eyes_" + _loc8_ + "_L_" + _loc10_,false,false);
            _loc6_.eyeRightClip = class_14.method_103("worker_eyes_" + _loc8_ + "_R_" + _loc10_,false,false);
            _loc6_.eyeLeftClip.stop();
            _loc6_.eyeRightClip.stop();
            _loc6_.clip.head.inside.addChild(_loc6_.eyeLeftClip);
            _loc6_.clip.head.inside.addChild(_loc6_.eyeRightClip);
         }
         if(param2)
         {
            if(_loc6_.mouthClip != null)
            {
               _loc6_.mouthClip.parent.removeChild(_loc6_.mouthClip);
               _loc6_.mouthClip = null;
            }
            _loc6_.mouthClip = class_14.method_103("worker_mouth_" + _loc9_ + "_" + _loc6_.workerData.mouthStyle);
            _loc6_.mouthClip.stop();
            _loc6_.clip.head.inside.addChild(_loc6_.mouthClip);
         }
         _loc6_.updateFacialLayout();
      }
      
      public function updateFacialLayout() : void
      {
         var _loc1_:Worker = this;
         _loc1_.eyeLeftClip.x = _loc1_.eyesOffsetX - _loc1_.workerData.eyeSpacing;
         _loc1_.eyeLeftClip.y = _loc1_.eyesOffsetY + _loc1_.workerData.eyeHeight;
         _loc1_.eyeBaseLeftClip.x = _loc1_.eyeLeftClip.x;
         _loc1_.eyeBaseLeftClip.y = _loc1_.eyeLeftClip.y;
         _loc1_.eyeRightClip.x = _loc1_.eyesOffsetX + _loc1_.workerData.eyeSpacing;
         _loc1_.eyeRightClip.y = _loc1_.eyesOffsetY + _loc1_.workerData.eyeHeight;
         _loc1_.eyeBaseRightClip.x = _loc1_.eyeRightClip.x;
         _loc1_.eyeBaseRightClip.y = _loc1_.eyeRightClip.y;
         _loc1_.mouthClip.x = _loc1_.mouthOffsetX + _loc1_.workerData.mouthNudge;
         _loc1_.mouthClip.y = _loc1_.mouthOffsetY + _loc1_.workerData.mouthHeight;
         _loc1_.clip.head.inside.y = _loc1_.workerData.headHeight;
         _loc1_.clip.head.inside.x = _loc1_.workerData.headForward;
         _loc1_.clip.head.inside.scaleX = _loc1_.workerData.headScale;
         _loc1_.clip.head.inside.scaleY = _loc1_.workerData.headScale;
         _loc1_.clip.back_hair.inside.y = _loc1_.workerData.headHeight;
         _loc1_.clip.back_hair.inside.x = _loc1_.workerData.headForward;
         _loc1_.clip.back_hair.inside.scaleX = _loc1_.workerData.headScale;
         _loc1_.clip.back_hair.inside.scaleY = _loc1_.workerData.headScale;
         _loc1_.clip.back_beard.inside.y = _loc1_.workerData.headHeight;
         _loc1_.clip.back_beard.inside.x = _loc1_.workerData.headForward;
         _loc1_.clip.back_beard.inside.scaleX = _loc1_.workerData.headScale;
         _loc1_.clip.back_beard.inside.scaleY = _loc1_.workerData.headScale;
         _loc1_.clip.back_hat.inside.y = _loc1_.workerData.headHeight;
         _loc1_.clip.back_hat.inside.x = _loc1_.workerData.headForward;
         _loc1_.clip.back_hat.inside.scaleX = _loc1_.workerData.headScale;
         _loc1_.clip.back_hat.inside.scaleY = _loc1_.workerData.headScale;
         _loc1_.eyeLeftClip.gotoAndStop(_loc1_.workerData.eyeDefaultExpression);
         _loc1_.eyeRightClip.gotoAndStop(_loc1_.workerData.eyeDefaultExpression);
         _loc1_.eyeBaseLeftClip.gotoAndStop(_loc1_.workerData.eyeDefaultExpression);
         _loc1_.eyeBaseRightClip.gotoAndStop(_loc1_.workerData.eyeDefaultExpression);
         _loc1_.mouthClip.gotoAndStop(_loc1_.workerData.mouthDefaultExpression);
         if(_loc1_.facialHairMouthClip != null)
         {
            if(!_loc1_.backwards)
            {
               _loc1_.facialHairMouthClip.gotoAndStop(_loc1_.workerData.mouthDefaultExpression);
            }
            else
            {
               _loc1_.facialHairMouthClip.gotoAndStop(23);
            }
            _loc1_.facialHairMouthClip.x = _loc1_.mouthOffsetX + _loc1_.workerData.mouthNudge;
            _loc1_.facialHairMouthClip.y = _loc1_.mouthOffsetY + _loc1_.workerData.mouthHeight;
         }
         if(_loc1_.faceAccClip != null && _loc1_.gameObj.var_134.clothingHasOption(_loc1_.workerData.accd,ClothingItem.OPTIONS_TRACKEYES))
         {
            _loc1_.faceAccClip.y = _loc1_.workerData.eyeHeight;
            _loc1_.faceAccBackClip.y = _loc1_.workerData.eyeHeight;
         }
         if(_loc1_.backwards)
         {
            _loc1_.eyeLeftClip.visible = false;
            _loc1_.eyeRightClip.visible = false;
            _loc1_.eyeBaseLeftClip.visible = false;
            _loc1_.eyeBaseRightClip.visible = false;
            _loc1_.mouthClip.visible = false;
            _loc1_.clip.head.inside.x = _loc1_.workerData.headForward * -1;
            _loc1_.clip.back_hair.inside.x = _loc1_.workerData.headForward * -1;
            _loc1_.clip.back_beard.inside.x = _loc1_.workerData.headForward * -1;
            _loc1_.clip.back_hat.inside.x = _loc1_.workerData.headForward * -1;
         }
      }
      
      public function updateWeight() : void
      {
         var i:int = 0;
         var useNeckScale:Number = NaN;
         var rangePercent:Number = NaN;
         var ob:Worker = this;
         try
         {
            i = 0;
            while(i < ob.clip.body.numChildren)
            {
               ob.clip.body.getChildAt(i).scaleX = ob.workerData.weightScale;
               i++;
            }
            i = 1;
            while(i < ob.clip.neck.numChildren)
            {
               ob.clip.neck.getChildAt(i).scaleX = ob.workerData.weightScale;
               i++;
            }
            ob.clip.neck.getChildAt(0).scaleX = ob.workerData.neckScale * ob.workerData.weightScale;
            useNeckScale = Number(ob.clip.neck.getChildAt(0).scaleX);
            rangePercent = (useNeckScale - WorkerData.WEIGHT_SCALE_MIN) / (WorkerData.WEIGHT_SCALE_MAX - WorkerData.WEIGHT_SCALE_MIN);
            if(rangePercent < 0)
            {
               rangePercent = 0;
            }
            else if(rangePercent > 1)
            {
               rangePercent = 1;
            }
            ob.clip.neck.getChildAt(0).x = 0 - (-0.7 + rangePercent * 2.8);
         }
         catch(err:Error)
         {
            class_6.error("Error updating body weight: " + err.message);
         }
      }
      
      private function createColorTransform(param1:Number, param2:Boolean = false) : ColorTransform
      {
         var _loc3_:Worker = this;
         return _loc3_.gameObj.var_134.createColorTransform(param1,param2);
      }
      
      public function stripColor(param1:String) : String
      {
         this;
         if(param1.indexOf(":") > -1)
         {
            return param1.split(":")[0];
         }
         return param1;
      }
      
      public function redoClothing(param1:String) : void
      {
         var ob:Worker = null;
         var hatItem:ClothingItem = null;
         var forceFrame:Number = NaN;
         var didUseForearm:Boolean = false;
         var clothingType:String = param1;
         ob = this;
         var data:ClothingData = ob.gameObj.var_134;
         if(clothingType == ClothingItem.TYPE_FACIALHAIR || clothingType == ClothingItem.TYPE_HAIR || clothingType == ClothingItem.TYPE_BANGS || clothingType == ClothingItem.TYPE_ACC_FACE || clothingType == ClothingItem.TYPE_HAT)
         {
            ob.removeExistingHeadItems();
            if(ob.workerData.facialhair != "")
            {
               if(data.clothingHasOption(ob.workerData.facialhair,ClothingItem.OPTIONS_HAS_BASE_FACIALHAIR) && !data.clothingHasOption(ob.workerData.hat,ClothingItem.OPTIONS_HAT_FULLMASK))
               {
                  ob.facialHairBaseClip = class_14.method_103("worker_" + ob.workerData.facialhair + "_base",false,false);
                  ob.clip.head.inside.addChild(ob.facialHairBaseClip);
                  if(ob.backwards)
                  {
                     ob.facialHairBaseClip.gotoAndStop(2);
                  }
                  else
                  {
                     ob.facialHairBaseClip.gotoAndStop(1);
                  }
               }
            }
            ob.updateFacialParts();
            if(ob.workerData.facialhair != "")
            {
               if(data.clothingHasOption(ob.workerData.facialhair,ClothingItem.OPTIONS_HAS_MOUTH_FACIALHAIR) && !data.clothingHasOption(ob.workerData.hat,ClothingItem.OPTIONS_HAT_FULLMASK))
               {
                  ob.facialHairMouthClip = class_14.method_103("worker_" + ob.workerData.facialhair + "_mouth",false,false);
                  if(ob.backwards)
                  {
                     ob.facialHairMouthClip.gotoAndStop(23);
                     ob.clip.back_beard.inside.addChild(ob.facialHairMouthClip);
                  }
                  else
                  {
                     ob.facialHairMouthClip.gotoAndStop(ob.workerData.mouthDefaultExpression);
                     ob.clip.head.inside.addChild(ob.facialHairMouthClip);
                  }
                  ob.facialHairMouthClip.x = ob.mouthOffsetX;
                  ob.facialHairMouthClip.y = ob.mouthOffsetY + ob.workerData.mouthHeight;
               }
            }
            if(ob.workerData.accd != "" && !data.clothingHasOption(ob.workerData.hat,ClothingItem.OPTIONS_HAT_FULLMASK))
            {
               ob.faceAccClip = class_14.method_103("worker_" + data.formatTag(ob.workerData.accd,ob.workerData.gender),false,false);
               ob.clip.head.inside.addChild(ob.faceAccClip);
               ob.faceAccBackClip = class_14.method_103("worker_" + data.formatTag(ob.workerData.accd,ob.workerData.gender) + "_back",false,false);
               ob.clip.head.inside.addChildAt(ob.faceAccBackClip,0);
               if(ob.backwards)
               {
                  ob.faceAccClip.gotoAndStop(2);
                  ob.faceAccBackClip.gotoAndStop(2);
               }
               else
               {
                  ob.faceAccClip.gotoAndStop(1);
                  ob.faceAccBackClip.gotoAndStop(1);
               }
               if(data.clothingHasOption(ob.workerData.accd,ClothingItem.OPTIONS_TRACKEYES))
               {
                  ob.faceAccClip.y = ob.workerData.eyeHeight;
                  ob.faceAccBackClip.y = ob.workerData.eyeHeight;
               }
               if(data.clothingIsTinting(ob.workerData.accd))
               {
                  data.tintThumbnailPart(true,ob.faceAccClip,data.getItemFromSKU(ob.workerData.accd),ob.workerData.accd);
                  data.tintThumbnailPart(true,ob.faceAccBackClip,data.getItemFromSKU(ob.workerData.accd),ob.workerData.accd);
               }
            }
            if(ob.workerData.hair != "")
            {
               ob.hairClip = class_14.method_103("worker_" + ob.workerData.hair + "_fg",false,false);
               ob.clip.head.inside.addChild(ob.hairClip);
               if(ob.backwards)
               {
                  ob.hairClip.gotoAndStop(2);
               }
               else
               {
                  ob.hairClip.gotoAndStop(1);
               }
               try
               {
                  ob.hairClip.hair.gotoAndStop(1);
               }
               catch(err:Error)
               {
               }
               if(data.clothingHasOption(ob.workerData.hair,ClothingItem.OPTIONS_HAS_BACK_HAIR))
               {
                  ob.backHairClip = class_14.method_103("worker_" + ob.workerData.hair + "_bg",false,false);
                  ob.clip.back_hair.inside.addChild(ob.backHairClip);
                  if(ob.backwards)
                  {
                     ob.backHairClip.gotoAndStop(2);
                  }
                  else
                  {
                     ob.backHairClip.gotoAndStop(1);
                  }
                  try
                  {
                     ob.backHairClip.hair.gotoAndStop(1);
                  }
                  catch(err:Error)
                  {
                  }
               }
            }
            if(ob.workerData.bangs != "")
            {
               if(data.clothingHasOption(ob.workerData.hair,ClothingItem.OPTIONS_SUPPORTS_BANGS))
               {
                  ob.bangsClip = class_14.method_103("worker_" + ob.workerData.bangs + "_fg",false,false);
                  ob.clip.head.inside.addChild(ob.bangsClip);
                  if(ob.backwards)
                  {
                     ob.bangsClip.gotoAndStop(2);
                  }
                  else
                  {
                     ob.bangsClip.gotoAndStop(1);
                  }
                  try
                  {
                     ob.bangsClip.hair.gotoAndStop(1);
                  }
                  catch(err:Error)
                  {
                  }
                  if(data.clothingHasOption(ob.workerData.bangs,ClothingItem.OPTIONS_HAS_BACK_HAIR))
                  {
                     ob.backBangsClip = class_14.method_103("worker_" + ob.workerData.bangs + "_bg",false,false);
                     ob.clip.back_hair.inside.addChild(ob.backBangsClip);
                     if(ob.backwards)
                     {
                        ob.backBangsClip.gotoAndStop(2);
                     }
                     else
                     {
                        ob.backBangsClip.gotoAndStop(1);
                     }
                     try
                     {
                        ob.backBangsClip.hair.gotoAndStop(1);
                     }
                     catch(err:Error)
                     {
                     }
                  }
               }
            }
            if(ob.workerData.hat != "")
            {
               ob.hatClip = class_14.method_103("worker_" + data.formatTag(ob.workerData.hat,ob.workerData.gender),false,false);
               if(data.clothingHasOption(ob.workerData.hat,ClothingItem.OPTIONS_HAT_CAP))
               {
                  ob.clip.head.inside.addChild(ob.hatClip);
                  if(ob.backwards)
                  {
                     ob.hatClip.gotoAndStop(2);
                  }
                  else
                  {
                     ob.hatClip.gotoAndStop(1);
                  }
                  try
                  {
                     if(ob.hairClip != null)
                     {
                        ob.hairClip.hair.gotoAndStop(2);
                     }
                  }
                  catch(err:Error)
                  {
                  }
                  try
                  {
                     if(ob.backHairClip != null)
                     {
                        ob.backHairClip.hair.gotoAndStop(2);
                     }
                  }
                  catch(err:Error)
                  {
                  }
                  try
                  {
                     if(ob.bangsClip != null)
                     {
                        ob.bangsClip.hair.gotoAndStop(2);
                     }
                  }
                  catch(err:Error)
                  {
                  }
                  try
                  {
                     if(ob.backBangsClip != null)
                     {
                        ob.backBangsClip.hair.gotoAndStop(2);
                     }
                  }
                  catch(err:Error)
                  {
                  }
               }
               else if(data.clothingHasOption(ob.workerData.hat,ClothingItem.OPTIONS_HAT_HELMET))
               {
                  ob.clip.head.inside.addChild(ob.hatClip);
                  if(ob.backwards)
                  {
                     ob.hatClip.gotoAndStop(2);
                  }
                  else
                  {
                     ob.hatClip.gotoAndStop(1);
                  }
                  try
                  {
                     if(ob.hairClip != null)
                     {
                        ob.hairClip.hair.gotoAndStop(3);
                     }
                  }
                  catch(err:Error)
                  {
                  }
                  try
                  {
                     if(ob.backHairClip != null)
                     {
                        ob.backHairClip.hair.gotoAndStop(3);
                     }
                  }
                  catch(err:Error)
                  {
                  }
                  try
                  {
                     if(ob.bangsClip != null)
                     {
                        ob.bangsClip.hair.gotoAndStop(3);
                     }
                  }
                  catch(err:Error)
                  {
                  }
                  try
                  {
                     if(ob.backBangsClip != null)
                     {
                        ob.backBangsClip.hair.gotoAndStop(3);
                     }
                  }
                  catch(err:Error)
                  {
                  }
               }
               else if(data.clothingHasOption(ob.workerData.hat,ClothingItem.OPTIONS_HAT_FULLMASK))
               {
                  ob.clip.head.inside.addChild(ob.hatClip);
                  if(ob.backwards)
                  {
                     ob.hatClip.gotoAndStop(2);
                  }
                  else
                  {
                     ob.hatClip.gotoAndStop(1);
                  }
                  try
                  {
                     if(ob.hairClip != null)
                     {
                        ob.hairClip.hair.gotoAndStop(3);
                        ob.hairClip.visible = false;
                     }
                  }
                  catch(err:Error)
                  {
                  }
                  try
                  {
                     if(ob.backHairClip != null)
                     {
                        ob.backHairClip.hair.gotoAndStop(3);
                        ob.backHairClip.visible = false;
                     }
                  }
                  catch(err:Error)
                  {
                  }
                  try
                  {
                     if(ob.bangsClip != null)
                     {
                        ob.bangsClip.hair.gotoAndStop(3);
                        ob.bangsClip.visible = false;
                     }
                  }
                  catch(err:Error)
                  {
                  }
                  try
                  {
                     if(ob.backBangsClip != null)
                     {
                        ob.backBangsClip.hair.gotoAndStop(3);
                        ob.backBangsClip.visible = false;
                     }
                  }
                  catch(err:Error)
                  {
                  }
               }
               else if(data.clothingHasOption(ob.workerData.hat,ClothingItem.OPTIONS_HAT_HAIRCLIP))
               {
                  if(ob.backwards == false && data.clothingHasOption(ob.workerData.hat,ClothingItem.OPTIONS_HAT_BEHINDBANGS) && data.clothingHasOption(ob.workerData.hair,ClothingItem.OPTIONS_SUPPORTS_BANGS) && ob.workerData.bangs != "")
                  {
                     try
                     {
                        ob.clip.head.inside.addChildAt(ob.hatClip,ob.clip.head.inside.numChildren - 1);
                     }
                     catch(err:Error)
                     {
                        class_6.error("Error adding hair clip behind bangs: " + err.message);
                        ob.clip.head.inside.addChild(ob.hatClip);
                     }
                  }
                  else
                  {
                     ob.clip.head.inside.addChild(ob.hatClip);
                  }
                  if(ob.backwards)
                  {
                     ob.hatClip.gotoAndStop(2);
                  }
                  else
                  {
                     ob.hatClip.gotoAndStop(1);
                  }
               }
               else
               {
                  if(ob.backwards)
                  {
                     ob.clip.head.inside.addChild(ob.hatClip);
                     ob.hatClip.gotoAndStop(2);
                  }
                  else
                  {
                     ob.clip.back_hat.inside.addChild(ob.hatClip);
                     ob.hatClip.gotoAndStop(1);
                  }
                  try
                  {
                     if(ob.hairClip != null)
                     {
                        if(data.clothingHasOption(ob.workerData.hat,ClothingItem.OPTIONS_HAT_SOMBRERO))
                        {
                           ob.hairClip.hair.gotoAndStop(2);
                        }
                        else
                        {
                           ob.hairClip.hair.gotoAndStop(1);
                        }
                     }
                  }
                  catch(err:Error)
                  {
                  }
                  try
                  {
                     if(ob.backHairClip != null)
                     {
                        if(data.clothingHasOption(ob.workerData.hat,ClothingItem.OPTIONS_HAT_SOMBRERO))
                        {
                           ob.backHairClip.hair.gotoAndStop(2);
                        }
                        else
                        {
                           ob.backHairClip.hair.gotoAndStop(1);
                        }
                     }
                  }
                  catch(err:Error)
                  {
                  }
                  try
                  {
                     if(ob.bangsClip != null)
                     {
                        if(data.clothingHasOption(ob.workerData.hat,ClothingItem.OPTIONS_HAT_SOMBRERO))
                        {
                           ob.bangsClip.hair.gotoAndStop(2);
                        }
                        else
                        {
                           ob.bangsClip.hair.gotoAndStop(1);
                        }
                     }
                  }
                  catch(err:Error)
                  {
                  }
                  try
                  {
                     if(ob.backBangsClip != null)
                     {
                        if(data.clothingHasOption(ob.workerData.hat,ClothingItem.OPTIONS_HAT_SOMBRERO))
                        {
                           ob.backBangsClip.hair.gotoAndStop(2);
                        }
                        else
                        {
                           ob.backBangsClip.hair.gotoAndStop(1);
                        }
                     }
                  }
                  catch(err:Error)
                  {
                  }
               }
               if(data.clothingIsTinting(ob.workerData.hat))
               {
                  data.tintThumbnailPart(true,ob.hatClip,data.getItemFromSKU(ob.workerData.hat),ob.workerData.hat);
               }
               hatItem = data.getItemFromSKU(ob.workerData.hat);
               if(hatItem != null && hatItem.tintDecal != null)
               {
                  data.handleDecal(ob.hatClip,hatItem,ob.workerData.gender,"hat",ob.hatClip.currentFrame,ob.workerData.hat);
               }
               hatItem = null;
            }
            ob.updateHairColor();
         }
         else if(clothingType == ClothingItem.TYPE_SHOES)
         {
            ob.removeExistingClothing(ob.clip.front_foot);
            ob.removeExistingClothing(ob.clip.back_foot);
            if(ob.workerData.shoes != "")
            {
               forceFrame = 1;
               if(ob.backwards)
               {
                  forceFrame = 4;
               }
               ob.addClothing(ob.clip.front_foot,data.formatTag(ob.workerData.shoes,ob.workerData.gender),forceFrame,ob.workerData.shoes);
               ob.addClothing(ob.clip.back_foot,data.formatTag(ob.workerData.shoes,ob.workerData.gender),forceFrame,ob.workerData.shoes);
               ob.clip.front_foot.skin.visible = false;
               ob.clip.back_foot.skin.visible = false;
            }
         }
         else
         {
            ob.removeExistingClothing(ob.clip.body);
            ob.removeExistingClothing(ob.clip.front_bicep);
            ob.removeExistingClothing(ob.clip.front_forearm);
            ob.removeExistingClothing(ob.clip.back_bicep);
            ob.removeExistingClothing(ob.clip.back_forearm);
            ob.removeExistingClothing(ob.clip.neck);
            ob.removeExistingClothing(ob.clip.back_acca);
            ob.removeExistingClothing(ob.clip.front_acca);
            ob.removeExistingClothing(ob.clip.front_hand.cuffholder);
            ob.removeExistingClothing(ob.clip.back_hand.cuffholder);
            ob.removeExistingClothing(ob.clip.front_hand.gloveholder);
            ob.removeExistingClothing(ob.clip.back_hand.gloveholder);
            if(ob.workerData.acca != "")
            {
               if(data.clothingHasOption(ob.workerData.acca,ClothingItem.OPTIONS_HAS_BACKBODY))
               {
                  if(ob.backwards && !data.clothingHasOption(ob.workerData.acca,ClothingItem.OPTIONS_ACCSTAYSBACK))
                  {
                     ob.addClothing(ob.clip.front_acca,data.formatTag(ob.workerData.acca,ob.workerData.gender) + "_back",-1,ob.workerData.acca);
                  }
                  else
                  {
                     ob.addClothing(ob.clip.back_acca,data.formatTag(ob.workerData.acca,ob.workerData.gender) + "_back",-1,ob.workerData.acca);
                  }
               }
            }
            if(!data.clothingExists(ob.workerData.pants))
            {
               ob.workerData.pants = "tint_pants_1:B";
            }
            if(ob.workerData.pants != "" && !data.clothingHasOption(ob.workerData.jacket,ClothingItem.OPTIONS_HIDE_PANTS))
            {
               ob.addClothing(ob.clip.body,data.formatTag(ob.workerData.pants,ob.workerData.gender),-1,ob.workerData.pants);
            }
            if(ob.workerData.accb != "")
            {
               if(!data.clothingHasOption(ob.workerData.acca,ClothingItem.OPTIONS_ACCBEHINDBELT))
               {
                  ob.addClothing(ob.clip.body,data.formatTag(ob.workerData.accb,ob.workerData.gender),-1,ob.workerData.accb);
               }
            }
            if(ob.workerData.acca != "")
            {
               if(data.clothingHasOption(ob.workerData.acca,ClothingItem.OPTIONS_HAS_NECK) && data.clothingHasOption(ob.workerData.acca,ClothingItem.OPTIONS_BEHINDCOLLAR))
               {
                  ob.addClothing(ob.clip.neck,data.formatTag(ob.workerData.acca,ob.workerData.gender) + "_neck",-1,ob.workerData.acca);
               }
            }
            if(ob.workerData.accc != "")
            {
               if(data.clothingHasOption(ob.workerData.accc,ClothingItem.OPTIONS_ACCSTAYSBACK) || ob.hasClothingCondition("gloveflare") || data.clothingHasOption(ob.workerData.shirt,ClothingItem.OPTIONS_HAS_HOCKEYSLEEVES))
               {
                  if(data.clothingHasOption(ob.workerData.accc,ClothingItem.SHIRT_LONG))
                  {
                     ob.addClothing(ob.clip.front_forearm,data.formatTag(ob.workerData.accc,ob.workerData.gender) + "_forearm",-1,ob.workerData.accc);
                     ob.addClothing(ob.clip.front_bicep,data.formatTag(ob.workerData.accc,ob.workerData.gender) + "_upperarm",-1,ob.workerData.accc);
                     if(data.clothingHasOption(ob.workerData.accc,ClothingItem.OPTIONS_HAS_CUFF))
                     {
                        ob.addClothing(ob.clip.front_hand.cuffholder,data.formatTag(ob.workerData.accc,ob.workerData.gender) + "_cuff",-1,ob.workerData.accc);
                     }
                     if(data.clothingHasOption(ob.workerData.accc,ClothingItem.OPTIONS_HAS_HAND))
                     {
                        ob.addClothing(ob.clip.front_hand.gloveholder,data.formatTag(ob.workerData.accc,ob.workerData.gender) + "_hand",ob.lastFrontHandFrame,ob.workerData.accc);
                     }
                     if(!data.clothingHasOption(ob.workerData.accc,ClothingItem.OPTIONS_ONLYONEARM))
                     {
                        ob.addClothing(ob.clip.back_forearm,data.formatTag(ob.workerData.accc,ob.workerData.gender) + "_forearm",-1,ob.workerData.accc);
                        ob.addClothing(ob.clip.back_bicep,data.formatTag(ob.workerData.accc,ob.workerData.gender) + "_upperarm",-1,ob.workerData.accc);
                        if(data.clothingHasOption(ob.workerData.accc,ClothingItem.OPTIONS_HAS_CUFF))
                        {
                           ob.addClothing(ob.clip.back_hand.cuffholder,data.formatTag(ob.workerData.accc,ob.workerData.gender) + "_cuff",-1,ob.workerData.accc);
                        }
                        if(data.clothingHasOption(ob.workerData.accc,ClothingItem.OPTIONS_HAS_HAND))
                        {
                           ob.addClothing(ob.clip.back_hand.gloveholder,data.formatTag(ob.workerData.accc,ob.workerData.gender) + "_hand2",ob.lastBackHandFrame,ob.workerData.accc);
                        }
                     }
                  }
                  else
                  {
                     if(data.clothingHasOption(ob.workerData.accc,ClothingItem.OPTIONS_HAS_ALTERNATEGLOVE))
                     {
                        ob.addClothing(ob.clip.front_forearm,data.formatTag(ob.workerData.accc,ob.workerData.gender) + "_alternate",-1,ob.workerData.accc);
                     }
                     else
                     {
                        ob.addClothing(ob.clip.front_forearm,data.formatTag(ob.workerData.accc,ob.workerData.gender),-1,ob.workerData.accc);
                     }
                     if(data.clothingHasOption(ob.workerData.accc,ClothingItem.OPTIONS_HAS_CUFF))
                     {
                        ob.addClothing(ob.clip.front_hand.cuffholder,data.formatTag(ob.workerData.accc,ob.workerData.gender) + "_cuff",-1,ob.workerData.accc);
                     }
                     if(data.clothingHasOption(ob.workerData.accc,ClothingItem.OPTIONS_HAS_HAND))
                     {
                        ob.addClothing(ob.clip.front_hand.gloveholder,data.formatTag(ob.workerData.accc,ob.workerData.gender) + "_hand",ob.lastFrontHandFrame,ob.workerData.accc);
                     }
                     if(!data.clothingHasOption(ob.workerData.accc,ClothingItem.OPTIONS_ONLYONEARM))
                     {
                        if(data.clothingHasOption(ob.workerData.accc,ClothingItem.OPTIONS_HAS_ALTERNATEGLOVE))
                        {
                           ob.addClothing(ob.clip.back_forearm,data.formatTag(ob.workerData.accc,ob.workerData.gender) + "_alternate",-1,ob.workerData.accc);
                        }
                        else
                        {
                           ob.addClothing(ob.clip.back_forearm,data.formatTag(ob.workerData.accc,ob.workerData.gender),-1,ob.workerData.accc);
                        }
                        if(data.clothingHasOption(ob.workerData.accc,ClothingItem.OPTIONS_HAS_CUFF))
                        {
                           ob.addClothing(ob.clip.back_hand.cuffholder,data.formatTag(ob.workerData.accc,ob.workerData.gender) + "_cuff",-1,ob.workerData.accc);
                        }
                        if(data.clothingHasOption(ob.workerData.accc,ClothingItem.OPTIONS_HAS_HAND))
                        {
                           ob.addClothing(ob.clip.back_hand.gloveholder,data.formatTag(ob.workerData.accc,ob.workerData.gender) + "_hand2",ob.lastBackHandFrame,ob.workerData.accc);
                        }
                     }
                  }
               }
            }
            if(!data.clothingExists(ob.workerData.shirt))
            {
               ob.workerData.shirt = "tint_tshirt_solid_a:W";
            }
            if(ob.workerData.shirt != "")
            {
               if(!data.clothingHasOption(ob.workerData.jacket,ClothingItem.OPTIONS_HIDE_SHIRTBODY))
               {
                  if(data.clothingHasOption(ob.workerData.shirt,ClothingItem.OPTIONS_HAS_ALTERNATEBODY) && (ob.workerData.jacket != "" && data.clothingHasOption(ob.workerData.jacket,ClothingItem.OPTIONS_IS_CROPPED_JACKET) == false || data.clothingHasOption(ob.workerData.acca,ClothingItem.OPTIONS_IS_OVERALLS)))
                  {
                     ob.addClothing(ob.clip.body,data.formatTag(ob.workerData.shirt,ob.workerData.gender) + "_body_alternate",-1,ob.workerData.shirt);
                  }
                  else
                  {
                     ob.addClothing(ob.clip.body,data.formatTag(ob.workerData.shirt,ob.workerData.gender) + "_body",-1,ob.workerData.shirt);
                  }
               }
               if(data.clothingHasOption(ob.workerData.shirt,ClothingItem.OPTIONS_HAS_NECK) && !data.clothingHasOption(ob.workerData.jacket,ClothingItem.OPTIONS_HIDE_SHIRTNECK) && !data.clothingHasOption(ob.workerData.acca,ClothingItem.OPTIONS_HIDE_SHIRTNECK))
               {
                  if(data.clothingHasOption(ob.workerData.jacket,ClothingItem.OPTIONS_HAS_NECK) && data.clothingHasOption(ob.workerData.shirt,ClothingItem.OPTIONS_HAS_ALTERNATECOLLAR))
                  {
                     ob.addClothing(ob.clip.neck,data.formatTag(ob.workerData.shirt,ob.workerData.gender) + "_neck_alternate",-1,ob.workerData.shirt);
                  }
                  else
                  {
                     ob.addClothing(ob.clip.neck,data.formatTag(ob.workerData.shirt,ob.workerData.gender) + "_neck",-1,ob.workerData.shirt);
                  }
               }
               didUseForearm = false;
               if(data.clothingHasOption(ob.workerData.shirt,ClothingItem.OPTIONS_HAS_FOREARM) && !data.clothingHasOption(ob.workerData.jacket,ClothingItem.OPTIONS_HIDE_SHIRTFOREARM) && !data.clothingHasOption(ob.workerData.acca,ClothingItem.OPTIONS_HIDE_SHIRTFOREARM) && (!data.clothingHasOption(ob.workerData.jacket,ClothingItem.OPTIONS_HIDE_IRREGULARFOREARM) || data.clothingHasOption(ob.workerData.shirt,ClothingItem.OPTIONS_HAS_HOCKEYSLEEVES) == false && data.clothingHasOption(ob.workerData.shirt,ClothingItem.OPTIONS_HAS_FLAREDSLEEVES) == false && data.clothingHasOption(ob.workerData.shirt,ClothingItem.OPTIONS_HAS_ROLLEDSLEEVES) == false))
               {
                  ob.addClothing(ob.clip.front_forearm,data.formatTag(ob.workerData.shirt,ob.workerData.gender) + "_forearm",-1,ob.workerData.shirt);
                  ob.addClothing(ob.clip.back_forearm,data.formatTag(ob.workerData.shirt,ob.workerData.gender) + "_forearm",-1,ob.workerData.shirt);
                  didUseForearm = true;
               }
               if(data.clothingHasOption(ob.workerData.shirt,ClothingItem.OPTIONS_HAS_BICEP) && (!data.clothingHasOption(ob.workerData.jacket,ClothingItem.OPTIONS_HIDE_SHIRTBICEP) || didUseForearm && !data.clothingHasOption(ob.workerData.jacket,ClothingItem.OPTIONS_HIDE_IRREGULARFOREARM)) && !data.clothingHasOption(ob.workerData.acca,ClothingItem.OPTIONS_HIDE_SHIRTBICEP))
               {
                  ob.addClothing(ob.clip.front_bicep,data.formatTag(ob.workerData.shirt,ob.workerData.gender) + "_upperarm",-1,ob.workerData.shirt);
                  ob.addClothing(ob.clip.back_bicep,data.formatTag(ob.workerData.shirt,ob.workerData.gender) + "_upperarm",-1,ob.workerData.shirt);
               }
               if(data.clothingHasOption(ob.workerData.shirt,ClothingItem.OPTIONS_HAS_CUFF) && !data.clothingHasOption(ob.workerData.jacket,ClothingItem.OPTIONS_HIDE_SHIRTFOREARM) && !data.clothingHasOption(ob.workerData.acca,ClothingItem.OPTIONS_HIDE_SHIRTFOREARM))
               {
                  ob.addClothing(ob.clip.front_hand.cuffholder,data.formatTag(ob.workerData.shirt,ob.workerData.gender) + "_cuff",-1,ob.workerData.shirt);
                  ob.addClothing(ob.clip.back_hand.cuffholder,data.formatTag(ob.workerData.shirt,ob.workerData.gender) + "_cuff",-1,ob.workerData.shirt);
               }
            }
            if(ob.workerData.accc != "")
            {
               if(data.clothingHasOption(ob.workerData.accc,ClothingItem.OPTIONS_ACCSTAYSBACK) == false && !ob.hasClothingCondition("gloveflare") && data.clothingHasOption(ob.workerData.shirt,ClothingItem.OPTIONS_HAS_HOCKEYSLEEVES) == false)
               {
                  if(data.clothingHasOption(ob.workerData.accc,ClothingItem.SHIRT_LONG))
                  {
                     ob.addClothing(ob.clip.front_forearm,data.formatTag(ob.workerData.accc,ob.workerData.gender) + "_forearm",-1,ob.workerData.accc);
                     ob.addClothing(ob.clip.front_bicep,data.formatTag(ob.workerData.accc,ob.workerData.gender) + "_upperarm",-1,ob.workerData.accc);
                     if(data.clothingHasOption(ob.workerData.accc,ClothingItem.OPTIONS_HAS_CUFF))
                     {
                        ob.addClothing(ob.clip.front_hand.cuffholder,data.formatTag(ob.workerData.accc,ob.workerData.gender) + "_cuff",-1,ob.workerData.accc);
                     }
                     if(data.clothingHasOption(ob.workerData.accc,ClothingItem.OPTIONS_HAS_HAND))
                     {
                        ob.addClothing(ob.clip.front_hand.gloveholder,data.formatTag(ob.workerData.accc,ob.workerData.gender) + "_hand",ob.lastFrontHandFrame,ob.workerData.accc);
                     }
                     if(!data.clothingHasOption(ob.workerData.accc,ClothingItem.OPTIONS_ONLYONEARM))
                     {
                        ob.addClothing(ob.clip.back_forearm,data.formatTag(ob.workerData.accc,ob.workerData.gender) + "_forearm",-1,ob.workerData.accc);
                        ob.addClothing(ob.clip.back_bicep,data.formatTag(ob.workerData.accc,ob.workerData.gender) + "_upperarm",-1,ob.workerData.accc);
                        if(data.clothingHasOption(ob.workerData.accc,ClothingItem.OPTIONS_HAS_CUFF))
                        {
                           ob.addClothing(ob.clip.back_hand.cuffholder,data.formatTag(ob.workerData.accc,ob.workerData.gender) + "_cuff",-1,ob.workerData.accc);
                        }
                        if(data.clothingHasOption(ob.workerData.accc,ClothingItem.OPTIONS_HAS_HAND))
                        {
                           ob.addClothing(ob.clip.back_hand.gloveholder,data.formatTag(ob.workerData.accc,ob.workerData.gender) + "_hand2",ob.lastBackHandFrame,ob.workerData.accc);
                        }
                     }
                  }
                  else
                  {
                     if(data.clothingHasOption(ob.workerData.accc,ClothingItem.OPTIONS_HAS_ALTERNATEGLOVE) && data.clothingHasOption(ob.workerData.jacket,ClothingItem.OPTIONS_HAS_FOREARM))
                     {
                        ob.addClothing(ob.clip.front_forearm,data.formatTag(ob.workerData.accc,ob.workerData.gender) + "_alternate",-1,ob.workerData.accc);
                     }
                     else
                     {
                        ob.addClothing(ob.clip.front_forearm,data.formatTag(ob.workerData.accc,ob.workerData.gender),-1,ob.workerData.accc);
                     }
                     if(data.clothingHasOption(ob.workerData.accc,ClothingItem.OPTIONS_HAS_CUFF))
                     {
                        ob.addClothing(ob.clip.front_hand.cuffholder,data.formatTag(ob.workerData.accc,ob.workerData.gender) + "_cuff",-1,ob.workerData.accc);
                     }
                     if(data.clothingHasOption(ob.workerData.accc,ClothingItem.OPTIONS_HAS_HAND))
                     {
                        ob.addClothing(ob.clip.front_hand.gloveholder,data.formatTag(ob.workerData.accc,ob.workerData.gender) + "_hand",ob.lastFrontHandFrame,ob.workerData.accc);
                     }
                     if(!data.clothingHasOption(ob.workerData.accc,ClothingItem.OPTIONS_ONLYONEARM))
                     {
                        if(data.clothingHasOption(ob.workerData.accc,ClothingItem.OPTIONS_HAS_ALTERNATEGLOVE) && data.clothingHasOption(ob.workerData.jacket,ClothingItem.OPTIONS_HAS_FOREARM))
                        {
                           ob.addClothing(ob.clip.back_forearm,data.formatTag(ob.workerData.accc,ob.workerData.gender) + "_alternate",-1,ob.workerData.accc);
                        }
                        else
                        {
                           ob.addClothing(ob.clip.back_forearm,data.formatTag(ob.workerData.accc,ob.workerData.gender),-1,ob.workerData.accc);
                        }
                        if(data.clothingHasOption(ob.workerData.accc,ClothingItem.OPTIONS_HAS_CUFF))
                        {
                           ob.addClothing(ob.clip.back_hand.cuffholder,data.formatTag(ob.workerData.accc,ob.workerData.gender) + "_cuff",-1,ob.workerData.accc);
                        }
                        if(data.clothingHasOption(ob.workerData.accc,ClothingItem.OPTIONS_HAS_HAND))
                        {
                           ob.addClothing(ob.clip.back_hand.gloveholder,data.formatTag(ob.workerData.accc,ob.workerData.gender) + "_hand2",ob.lastBackHandFrame,ob.workerData.accc);
                        }
                     }
                  }
               }
            }
            if(ob.workerData.acca != "")
            {
               if(data.clothingHasOption(ob.workerData.acca,ClothingItem.OPTIONS_ACC_BEHINDJACKET) == true && (data.clothingHasOption(ob.workerData.acca,ClothingItem.OPTIONS_IS_OVERALLS) == false || data.clothingHasOption(ob.workerData.shirt,ClothingItem.OPTIONS_IS_DRESS) == false))
               {
                  if(data.clothingHasOption(ob.workerData.acca,ClothingItem.OPTIONS_HAS_FRONTBODY))
                  {
                     ob.addClothing(ob.clip.body,data.formatTag(ob.workerData.acca,ob.workerData.gender) + "_front",-1,ob.workerData.acca);
                  }
               }
               if(data.clothingHasOption(ob.workerData.acca,ClothingItem.OPTIONS_HAS_NECK) && !data.clothingHasOption(ob.workerData.acca,ClothingItem.OPTIONS_BEHINDCOLLAR) && data.clothingHasOption(ob.workerData.acca,ClothingItem.OPTIONS_ACC_BEHINDJACKETNECK))
               {
                  ob.addClothing(ob.clip.neck,data.formatTag(ob.workerData.acca,ob.workerData.gender) + "_neck",-1,ob.workerData.acca);
               }
            }
            if(data.clothingHasOption(ob.workerData.acca,ClothingItem.OPTIONS_ACCBEHINDBELT))
            {
               if(ob.workerData.accb != "")
               {
                  ob.addClothing(ob.clip.body,data.formatTag(ob.workerData.accb,ob.workerData.gender),-1,ob.workerData.accb);
               }
            }
            if(ob.workerData.jacket != "")
            {
               ob.addClothing(ob.clip.body,data.formatTag(ob.workerData.jacket,ob.workerData.gender) + "_body",-1,ob.workerData.jacket);
               if(data.clothingHasOption(ob.workerData.jacket,ClothingItem.OPTIONS_HAS_NECK) && !data.clothingHasOption(ob.workerData.shirt,ClothingItem.OPTIONS_HIDE_JACKETNECK) && !data.clothingHasOption(ob.workerData.acca,ClothingItem.OPTIONS_HIDE_JACKETNECK))
               {
                  ob.addClothing(ob.clip.neck,data.formatTag(ob.workerData.jacket,ob.workerData.gender) + "_neck",-1,ob.workerData.jacket);
               }
               if(data.clothingHasOption(ob.workerData.jacket,ClothingItem.OPTIONS_HAS_BICEP))
               {
                  ob.addClothing(ob.clip.front_bicep,data.formatTag(ob.workerData.jacket,ob.workerData.gender) + "_upperarm",-1,ob.workerData.jacket);
                  ob.addClothing(ob.clip.back_bicep,data.formatTag(ob.workerData.jacket,ob.workerData.gender) + "_upperarm",-1,ob.workerData.jacket);
               }
               if(data.clothingHasOption(ob.workerData.jacket,ClothingItem.OPTIONS_HAS_FOREARM))
               {
                  ob.addClothing(ob.clip.front_forearm,data.formatTag(ob.workerData.jacket,ob.workerData.gender) + "_forearm",-1,ob.workerData.jacket);
                  ob.addClothing(ob.clip.back_forearm,data.formatTag(ob.workerData.jacket,ob.workerData.gender) + "_forearm",-1,ob.workerData.jacket);
               }
               if(data.clothingHasOption(ob.workerData.jacket,ClothingItem.OPTIONS_HAS_CUFF))
               {
                  ob.addClothing(ob.clip.front_hand.cuffholder,data.formatTag(ob.workerData.jacket,ob.workerData.gender) + "_cuff",-1,ob.workerData.jacket);
                  ob.addClothing(ob.clip.back_hand.cuffholder,data.formatTag(ob.workerData.jacket,ob.workerData.gender) + "_cuff",-1,ob.workerData.jacket);
               }
            }
            if(ob.workerData.acca != "")
            {
               if(data.clothingHasOption(ob.workerData.acca,ClothingItem.OPTIONS_ACC_BEHINDJACKET) == false)
               {
                  if(data.clothingHasOption(ob.workerData.acca,ClothingItem.OPTIONS_HAS_FRONTBODY))
                  {
                     ob.addClothing(ob.clip.body,data.formatTag(ob.workerData.acca,ob.workerData.gender) + "_front",-1,ob.workerData.acca);
                  }
               }
               if(data.clothingHasOption(ob.workerData.acca,ClothingItem.OPTIONS_HAS_NECK) && !data.clothingHasOption(ob.workerData.acca,ClothingItem.OPTIONS_BEHINDCOLLAR) && !data.clothingHasOption(ob.workerData.acca,ClothingItem.OPTIONS_ACC_BEHINDJACKETNECK))
               {
                  ob.addClothing(ob.clip.neck,data.formatTag(ob.workerData.acca,ob.workerData.gender) + "_neck",-1,ob.workerData.acca);
               }
            }
         }
         ob.clip.neck.getChildAt(0).scaleX = ob.workerData.neckScale;
         if(ob.workerData.neckScale != 1)
         {
            ob.clip.neck.getChildAt(0).x = -2;
         }
         ob.updateWeight();
      }
      
      public function removeExistingHeadItems() : void
      {
         var _loc1_:Worker = this;
         if(_loc1_.hairClip != null)
         {
            _loc1_.clip.head.inside.removeChild(_loc1_.hairClip);
            _loc1_.hairClip = null;
         }
         if(_loc1_.hatClip != null)
         {
            _loc1_.hatClip.parent.removeChild(_loc1_.hatClip);
            _loc1_.hatClip = null;
         }
         if(_loc1_.facialHairBaseClip != null)
         {
            _loc1_.clip.head.inside.removeChild(_loc1_.facialHairBaseClip);
            _loc1_.facialHairBaseClip = null;
         }
         if(_loc1_.facialHairMouthClip != null)
         {
            _loc1_.facialHairMouthClip.parent.removeChild(_loc1_.facialHairMouthClip);
            _loc1_.facialHairMouthClip = null;
         }
         if(_loc1_.faceAccClip != null)
         {
            _loc1_.clip.head.inside.removeChild(_loc1_.faceAccClip);
            _loc1_.faceAccClip = null;
         }
         if(_loc1_.faceAccBackClip != null)
         {
            _loc1_.clip.head.inside.removeChild(_loc1_.faceAccBackClip);
            _loc1_.faceAccBackClip = null;
         }
         if(_loc1_.backHairClip != null)
         {
            _loc1_.clip.back_hair.inside.removeChild(_loc1_.backHairClip);
            _loc1_.backHairClip = null;
         }
         if(_loc1_.bangsClip != null)
         {
            _loc1_.clip.head.inside.removeChild(_loc1_.bangsClip);
            _loc1_.bangsClip = null;
         }
         if(_loc1_.backBangsClip != null)
         {
            _loc1_.clip.back_hair.inside.removeChild(_loc1_.backBangsClip);
            _loc1_.backBangsClip = null;
         }
      }
      
      public function removeExistingClothing(param1:MovieClip) : void
      {
         this;
         var _loc3_:int = param1.numChildren - 1;
         while(_loc3_ >= 0)
         {
            if(param1.getChildAt(_loc3_).name.indexOf("skin") == -1)
            {
               param1.removeChildAt(_loc3_);
            }
            _loc3_--;
         }
      }
      
      public function addClothing(param1:MovieClip, param2:String, param3:Number = -1, param4:String = null) : void
      {
         var part:MovieClip = null;
         var item:ClothingItem = null;
         var clipName:String = null;
         var decal:MovieClip = null;
         var whichClip:MovieClip = param1;
         var tag:String = param2;
         var forceFrame:Number = param3;
         var sku:String = param4;
         var ob:Worker = this;
         var baseSKU:String = ob.gameObj.var_134.getBaseSKU(sku);
         var isTinting:Boolean = ob.gameObj.var_134.clothingIsTinting(baseSKU);
         tag = "worker_" + tag;
         try
         {
            part = class_14.method_103(tag,false,false);
            if(forceFrame > -1)
            {
               part.gotoAndStop(forceFrame);
            }
            else if(ob.backwards)
            {
               part.gotoAndStop(2);
            }
            else
            {
               part.gotoAndStop(1);
            }
            whichClip.addChild(part);
            if(isTinting)
            {
               item = ob.gameObj.var_134.getItemFromSKU(baseSKU);
               if(item.tintColor1 == true && part.getChildByName("color1") != null)
               {
                  part.getChildByName("color1").transform.colorTransform = ob.createColorTransform(ob.gameObj.var_134.getColorFromSKU(sku,1),true);
                  MovieClip(part.getChildByName("color1")).gotoAndStop(part.currentFrame);
               }
               if(item.tintColor2 == true && part.getChildByName("color2") != null)
               {
                  part.getChildByName("color2").transform.colorTransform = ob.createColorTransform(ob.gameObj.var_134.getColorFromSKU(sku,2),true);
                  MovieClip(part.getChildByName("color2")).gotoAndStop(part.currentFrame);
               }
               if(item.tintColor3 == true && part.getChildByName("color3") != null)
               {
                  part.getChildByName("color3").transform.colorTransform = ob.createColorTransform(ob.gameObj.var_134.getColorFromSKU(sku,3),true);
                  MovieClip(part.getChildByName("color3")).gotoAndStop(part.currentFrame);
               }
               if(item.tintDecal != null && (whichClip == ob.clip.body || whichClip == ob.clip.front_bicep || whichClip == ob.clip.back_bicep || whichClip == ob.clip.head))
               {
                  clipName = ob.gameObj.var_134.getDecalToUse(item,sku);
                  if(item.type != ClothingItem.TYPE_HAT)
                  {
                     if(ob.workerData.gender == ClothingItem.GENDER_MALE)
                     {
                        clipName += "_M_";
                     }
                     else
                     {
                        clipName += "_F_";
                     }
                     if(whichClip == ob.clip.body)
                     {
                        clipName += "body";
                     }
                     else
                     {
                        clipName += "upperarm";
                     }
                  }
                  try
                  {
                     decal = class_14.method_103(clipName,false,false);
                     if(decal != null)
                     {
                        decal.gotoAndStop(part.currentFrame);
                        if(item.tintDecalColor == true)
                        {
                           decal.transform.colorTransform = ob.createColorTransform(ob.gameObj.var_134.getColorFromSKU(sku,4),true);
                        }
                        part.addChild(decal);
                     }
                  }
                  catch(err:Error)
                  {
                  }
               }
            }
         }
         catch(err:Error)
         {
            class_6.error("Error adding clothing " + tag + " to " + whichClip + ": Error: " + err.message);
         }
      }
      
      public function addShadow() : void
      {
         var _loc1_:Worker = this;
         if(_loc1_.backwards)
         {
            _loc1_.clip.graphics.beginFill(0,0.2);
            _loc1_.clip.graphics.drawEllipse(25,250,128,69);
            _loc1_.clip.graphics.endFill();
         }
         else
         {
            _loc1_.clip.graphics.beginFill(0,0.3);
            _loc1_.clip.graphics.drawEllipse(15,256,128,69);
            _loc1_.clip.graphics.endFill();
         }
      }
      
      public function hasClothingCondition(param1:String) : Boolean
      {
         var _loc2_:Worker = this;
         var _loc3_:ClothingData = _loc2_.gameObj.var_134;
         var _loc4_:Boolean = false;
         if(param1 == "gloveflare" && _loc3_.clothingHasOption(_loc2_.workerData.accc,ClothingItem.OPTIONS_HAS_ALTERNATEGLOVE) && _loc3_.clothingHasOption(_loc2_.workerData.shirt,ClothingItem.OPTIONS_HAS_FLAREDSLEEVES))
         {
            _loc4_ = true;
         }
         else if(param1 == "glovejacket" && _loc3_.clothingHasOption(_loc2_.workerData.accc,ClothingItem.OPTIONS_HAS_ALTERNATEGLOVE) && _loc3_.clothingHasOption(_loc2_.workerData.jacket,ClothingItem.OPTIONS_HAS_FOREARM))
         {
            _loc4_ = true;
         }
         return _loc4_;
      }
   }
}
