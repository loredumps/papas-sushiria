package sushiGame.screens
{
   import fl.controls.TextInput;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.*;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.net.FileReference;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import flash.ui.Keyboard;
   import flash.utils.ByteArray;
   import flash.utils.getTimer;
   import package_1.class_1;
   import package_2.class_12;
   import package_2.class_13;
   import package_2.class_3;
   import package_2.class_6;
   import package_4.*;
   import sushiGame.data.*;
   import sushiGame.models.Worker;
   
   public class CharacterEditorScreen
   {
       
      
      public var gameObj:class_5;
      
      public var workerData:WorkerData;
      
      public var worker:Worker;
      
      public var workerReverse:Worker;
      
      public var clip:MovieClip;
      
      public var container:MovieClip;
      
      public var params:Object;
      
      public var specialBitmap:Bitmap = null;
      
      public var specialBitmapMC:MovieClip = null;
      
      public var endaction:String = "none";
      
      public var sliderStartX:Number = 8.5;
      
      public var sliderRange:Number = 84;
      
      public var draggingWhichSlider:String = null;
      
      public var workerScale:Number = 0.7;
      
      public var workerX:Number = 185;
      
      public var workerY:Number = 104;
      
      public var workerReverseX:Number = 104;
      
      public var workerReverseY:Number = 73;
      
      public var workerStartOffset:Number = -220;
      
      public var available_pants:Array;
      
      public var available_shirt:Array;
      
      public var available_jacket:Array;
      
      public var available_hair:Array;
      
      public var available_hat:Array;
      
      public var available_shoes:Array;
      
      public var available_facialhair:Array;
      
      public var available_bangs:Array;
      
      public var available_acca:Array;
      
      public var available_accb:Array;
      
      public var available_accc:Array;
      
      public var available_accd:Array;
      
      public var which_pants:Number = 0;
      
      public var which_shirt:Number = 0;
      
      public var which_jacket:Number = 0;
      
      public var which_hair:Number = 0;
      
      public var which_hat:Number = 0;
      
      public var which_shoes:Number = 0;
      
      public var which_facialhair:Number = 0;
      
      public var which_bangs:Number = 0;
      
      public var which_acca:Number = 0;
      
      public var which_accb:Number = 0;
      
      public var which_accc:Number = 0;
      
      public var which_accd:Number = 0;
      
      public var numSkinSwatches:Number = 9;
      
      public var numHairSwatches:Number = 32;
      
      public var firsttime:Boolean = false;
      
      public var firstwaiter:Boolean = false;
      
      public var inMenu:Boolean = false;
      
      public var didChange:Boolean = false;
      
      public var didClickChangeName:Boolean = false;
      
      public var mannequinColor:uint = 14540253;
      
      public var backdropBitmap:Bitmap;
      
      public var mirrorBitmap:Bitmap;
      
      public var photoBitmap:Bitmap = null;
      
      public var whichMode:String = "worker";
      
      public var leavingWorker:Worker = null;
      
      public var leavingWorkerReverse:Worker = null;
      
      public var runSpeed:Number = 8;
      
      public var isRunning:Boolean = false;
      
      public var hairPage:Number = 0;
      
      public var bangsPage:Number = 0;
      
      public var clothingPage:Number = 0;
      
      public var hairPerPage:Number = 8;
      
      public var clothingPerPage:Number = 15;
      
      public var clothingMode:String = "shirt";
      
      public var clothingSectionTypes:Array;
      
      public var clothingSectionNames:Array;
      
      public var randomGuyHair:Array;
      
      public var randomGirlHair:Array;
      
      public var randomGirlBangs:Array;
      
      public var randomHairColors:Array;
      
      public var didOpenHairColor:Boolean = false;
      
      public var shouldUpdateSpecialDisplay:Boolean = false;
      
      public var kernFormat:TextFormat;
      
      public var targetHolidaySpirit:Number = 0;
      
      public function CharacterEditorScreen(param1:class_5, param2:MovieClip, param3:Object = null)
      {
         this.available_pants = [];
         this.available_shirt = [];
         this.available_jacket = [];
         this.available_hair = [];
         this.available_hat = [];
         this.available_shoes = [];
         this.available_facialhair = [];
         this.available_bangs = [];
         this.available_acca = [];
         this.available_accb = [];
         this.available_accc = [];
         this.available_accd = [];
         this.clothingSectionTypes = [ClothingItem.TYPE_SHIRT,ClothingItem.TYPE_PANTS,ClothingItem.TYPE_SHOES,ClothingItem.TYPE_HAT,ClothingItem.TYPE_JACKET,ClothingItem.TYPE_ACC_FACE,ClothingItem.TYPE_ACC_BELT,ClothingItem.TYPE_ACC_ARMS,ClothingItem.TYPE_ACC_BODY];
         this.clothingSectionNames = ["SHIRTS","PANTS","SHOES","HATS","JACKETS","GLASSES","BELTS","ARMS","EXTRAS"];
         this.randomGuyHair = ["altback1","altfront1","short02","messyback2","messyfront1","smoothleft","smoothback2","wavyleft"];
         this.randomGirlHair = ["ponytailM","straightM","waveM","waveL","flipM","curlM","swirlL","pigtailsS","pigtailsL","flock","curlback"];
         this.randomGirlBangs = ["arc","beach","blunt","breeze","cheer","drape","fringe","hotrod","pixie","shy","split","sweep","bettie","clip"];
         this.randomHairColors = [4,7,10,11,12,13,14,15,18,19,20,21,22,23];
         super();
         var _loc4_:CharacterEditorScreen;
         (_loc4_ = this).gameObj = param1;
         _loc4_.container = param2;
         _loc4_.params = param3;
         if(param3 != null)
         {
            if(param3.hasOwnProperty("firsttime"))
            {
               _loc4_.firsttime = param3.firsttime;
            }
            if(param3.hasOwnProperty("firstwaiter"))
            {
               trace("WAITER MODE!");
               _loc4_.firstwaiter = param3.firstwaiter;
            }
            if(param3.hasOwnProperty("inMenu"))
            {
               _loc4_.inMenu = param3.inMenu;
            }
         }
         _loc4_.setupScreen();
      }
      
      public function setupScreen() : void
      {
         var _loc1_:CharacterEditorScreen = this;
         _loc1_.clip = new characterEditorMC();
         _loc1_.kernFormat = new TextFormat();
         _loc1_.kernFormat.kerning = true;
         if(_loc1_.firsttime || _loc1_.firstwaiter)
         {
            _loc1_.clip.menu.customize.genderpanel.visible = true;
            _loc1_.clip.menu.switcher.visible = false;
            _loc1_.clip.menu.tabs.visible = false;
            _loc1_.clip.menu.photo_btn.visible = false;
            _loc1_.clip.menu.customize.accd_panel.visible = true;
            _loc1_.clip.menu.customize.accd_label.visible = true;
         }
         else
         {
            _loc1_.clip.menu.customize.genderpanel.visible = false;
            _loc1_.clip.menu.customize.accd_panel.visible = false;
            _loc1_.clip.menu.customize.accd_label.visible = false;
         }
         if(_loc1_.firstwaiter)
         {
            _loc1_.whichMode = "waiter";
         }
         else
         {
            _loc1_.whichMode = "worker";
         }
         if(_loc1_.whichMode == "worker")
         {
            _loc1_.workerData = _loc1_.gameObj.workerData;
         }
         else if(_loc1_.whichMode == "waiter")
         {
            _loc1_.workerData = _loc1_.gameObj.var_143;
         }
         if(_loc1_.firsttime || _loc1_.firstwaiter)
         {
            _loc1_.workerData.hat = "";
            _loc1_.randomizeHair();
         }
         _loc1_.worker = new Worker(_loc1_.gameObj,_loc1_.clip.holder,_loc1_.workerData,_loc1_.workerX,_loc1_.workerY,_loc1_.workerScale,false,true);
         _loc1_.workerReverse = new Worker(_loc1_.gameObj,_loc1_.clip.mirror_holder,_loc1_.workerData,_loc1_.workerReverseX,_loc1_.workerReverseY,_loc1_.workerScale,true,true);
         _loc1_.worker.addShadow();
         _loc1_.workerReverse.addShadow();
         _loc1_.getAvailableClothing();
         if(_loc1_.firsttime == false && _loc1_.firstwaiter == false)
         {
            _loc1_.setupStats();
            _loc1_.setupClothingMenu();
         }
         _loc1_.setupCustomizeMenu();
         _loc1_.setupInterface();
         _loc1_.createBackdrop();
         _loc1_.checkRandomItems();
         _loc1_.clip.stickertraining.mouseEnabled = false;
         _loc1_.clip.stickertraining.mouseChildren = false;
         if(_loc1_.firsttime == false && _loc1_.firstwaiter == false && _loc1_.inMenu == true)
         {
            if(_loc1_.gameObj.var_127.hasTrained("stickeropencustomers") == false && _loc1_.gameObj.var_131.anyCustomersHaveGiftBox())
            {
               _loc1_.clip.stickertraining.visible = true;
            }
            else
            {
               _loc1_.clip.stickertraining.visible = false;
            }
         }
         else
         {
            _loc1_.clip.stickertraining.visible = false;
         }
         _loc1_.clip.addEventListener(Event.ENTER_FRAME,_loc1_.updateScreen);
         if(_loc1_.firsttime || _loc1_.firstwaiter)
         {
            _loc1_.container.addEventListener("clickBack",_loc1_.clickBack);
            _loc1_.container.addEventListener("clickContinue",_loc1_.clickContinue);
         }
         _loc1_.container.addChild(_loc1_.clip);
         _loc1_.gameObj.var_128.switchMusic("order");
      }
      
      public function addToContainer() : void
      {
         var screen:CharacterEditorScreen = this;
         try
         {
            if(Boolean(screen.container) && Boolean(screen.clip) && !screen.container.contains(screen.clip))
            {
               screen.container.addChild(screen.clip);
            }
         }
         catch(err:Error)
         {
            class_6.error("Error adding subscreen to container: " + err.message);
         }
         if(screen.shouldUpdateSpecialDisplay)
         {
            screen.updateSpecialDisplay();
            screen.shouldUpdateSpecialDisplay = false;
         }
      }
      
      public function removeFromContainer() : void
      {
         var screen:CharacterEditorScreen = this;
         try
         {
            if(Boolean(screen.container) && Boolean(screen.clip) && screen.container.contains(screen.clip))
            {
               screen.container.removeChild(screen.clip);
            }
         }
         catch(err:Error)
         {
            class_6.error("Error adding subscreen to container: " + err.message);
         }
      }
      
      public function checkRandomItems() : void
      {
         var _loc3_:int = 0;
         var _loc1_:CharacterEditorScreen = this;
         var _loc2_:ClothingData = _loc1_.gameObj.var_134;
         _loc3_ = 0;
         while(_loc3_ < _loc1_.randomGuyHair.length)
         {
            if(_loc2_.clothingExists("hair_" + _loc1_.randomGuyHair[_loc3_]) == false)
            {
               class_6.error("ERROR - Could not find hair_" + _loc1_.randomGuyHair[_loc3_] + " for randomizer");
            }
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < _loc1_.randomGirlHair.length)
         {
            if(_loc2_.clothingExists("hair_" + _loc1_.randomGirlHair[_loc3_]) == false)
            {
               class_6.error("ERROR - Could not find hair_" + _loc1_.randomGirlHair[_loc3_] + " for randomizer");
            }
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < _loc1_.randomGirlBangs.length)
         {
            if(_loc2_.clothingExists("hairparts_b_" + _loc1_.randomGirlBangs[_loc3_]) == false)
            {
               class_6.error("ERROR - Could not find hairparts_b_" + _loc1_.randomGirlBangs[_loc3_] + " for randomizer");
            }
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < _loc1_.randomHairColors.length)
         {
            if(WorkerData.hairColorOptions.length < _loc1_.randomHairColors[_loc3_])
            {
               class_6.error("ERROR - There is no Hair Color at Index " + _loc1_.randomHairColors[_loc3_]);
            }
            _loc3_++;
         }
      }
      
      public function randomizeHair(param1:Boolean = true) : void
      {
         var _loc2_:CharacterEditorScreen = this;
         if(_loc2_.workerData.gender == WorkerData.GENDER_FEMALE)
         {
            if(_loc2_.randomGirlHair != null && _loc2_.randomGirlHair.length > 0)
            {
               _loc2_.workerData.hair = "hair_" + _loc2_.randomGirlHair[Math.floor(Math.random() * _loc2_.randomGirlHair.length)];
            }
            if(_loc2_.randomGirlBangs != null && _loc2_.randomGirlBangs.length > 0)
            {
               _loc2_.workerData.bangs = "hairparts_b_" + _loc2_.randomGirlBangs[Math.floor(Math.random() * _loc2_.randomGirlBangs.length)];
            }
            if(param1)
            {
               if(_loc2_.randomHairColors != null && _loc2_.randomHairColors.length > 0)
               {
                  _loc2_.workerData.hairColor = WorkerData.hairColorOptions[_loc2_.randomHairColors[Math.floor(Math.random() * _loc2_.randomHairColors.length)]];
               }
            }
            _loc2_.workerData.facialhair = "";
         }
         else
         {
            if(_loc2_.randomGuyHair != null && _loc2_.randomGuyHair.length > 0)
            {
               _loc2_.workerData.hair = "hair_" + _loc2_.randomGuyHair[Math.floor(Math.random() * _loc2_.randomGuyHair.length)];
            }
            _loc2_.workerData.bangs = "";
            if(param1)
            {
               if(_loc2_.randomHairColors != null && _loc2_.randomHairColors.length > 0)
               {
                  _loc2_.workerData.hairColor = WorkerData.hairColorOptions[_loc2_.randomHairColors[Math.floor(Math.random() * _loc2_.randomHairColors.length)]];
               }
            }
         }
      }
      
      public function getAvailableClothing(param1:Boolean = true) : void
      {
         var _loc2_:CharacterEditorScreen = this;
         var _loc3_:Number = getTimer();
         _loc2_.available_hair = _loc2_.gameObj.var_134.getAvailableClothingTags(ClothingItem.TYPE_HAIR,_loc2_.workerData.gender,false,true);
         _loc2_.which_hair = _loc2_.available_hair.indexOf(_loc2_.workerData.hair);
         _loc2_.available_accd = _loc2_.gameObj.var_134.getAvailableClothingTags(ClothingItem.TYPE_ACC_FACE,_loc2_.workerData.gender,false,_loc2_.firsttime);
         _loc2_.available_accd.unshift("");
         _loc2_.which_accd = _loc2_.available_accd.indexOf(_loc2_.workerData.accd);
         _loc2_.available_facialhair = _loc2_.gameObj.var_134.getAvailableClothingTags(ClothingItem.TYPE_FACIALHAIR,_loc2_.workerData.gender,false,true);
         _loc2_.available_facialhair.unshift("");
         _loc2_.which_facialhair = _loc2_.available_facialhair.indexOf(_loc2_.workerData.facialhair);
         _loc2_.available_bangs = _loc2_.gameObj.var_134.getAvailableClothingTags(ClothingItem.TYPE_BANGS,_loc2_.workerData.gender,false,true);
         _loc2_.available_bangs.unshift("");
         _loc2_.which_bangs = _loc2_.available_bangs.indexOf(_loc2_.workerData.bangs);
         if(_loc2_.firsttime == false)
         {
            _loc2_.available_pants = _loc2_.gameObj.var_134.getAvailableClothingTags(ClothingItem.TYPE_PANTS,_loc2_.workerData.gender,false);
            _loc2_.which_pants = _loc2_.available_pants.indexOf(_loc2_.workerData.pants);
            _loc2_.available_shirt = _loc2_.gameObj.var_134.getAvailableClothingTags(ClothingItem.TYPE_SHIRT,_loc2_.workerData.gender,false);
            _loc2_.which_shirt = _loc2_.available_shirt.indexOf(_loc2_.workerData.shirt);
            _loc2_.available_jacket = _loc2_.gameObj.var_134.getAvailableClothingTags(ClothingItem.TYPE_JACKET,_loc2_.workerData.gender,false);
            _loc2_.available_jacket.unshift("");
            _loc2_.which_jacket = _loc2_.available_jacket.indexOf(_loc2_.workerData.jacket);
            _loc2_.available_shoes = _loc2_.gameObj.var_134.getAvailableClothingTags(ClothingItem.TYPE_SHOES,_loc2_.workerData.gender,false);
            _loc2_.which_shoes = _loc2_.available_shoes.indexOf(_loc2_.workerData.shoes);
            _loc2_.available_acca = _loc2_.gameObj.var_134.getAvailableClothingTags(ClothingItem.TYPE_ACC_BODY,_loc2_.workerData.gender,false);
            _loc2_.available_acca.unshift("");
            _loc2_.which_acca = _loc2_.available_acca.indexOf(_loc2_.workerData.acca);
            _loc2_.available_accb = _loc2_.gameObj.var_134.getAvailableClothingTags(ClothingItem.TYPE_ACC_BELT,_loc2_.workerData.gender,false);
            _loc2_.available_accb.unshift("");
            _loc2_.which_accb = _loc2_.available_accb.indexOf(_loc2_.workerData.accb);
            _loc2_.available_accc = _loc2_.gameObj.var_134.getAvailableClothingTags(ClothingItem.TYPE_ACC_ARMS,_loc2_.workerData.gender,false);
            _loc2_.available_accc.unshift("");
            _loc2_.which_accc = _loc2_.available_accc.indexOf(_loc2_.workerData.accc);
            _loc2_.available_hat = _loc2_.gameObj.var_134.getAvailableClothingTags(ClothingItem.TYPE_HAT,_loc2_.workerData.gender,false);
            _loc2_.available_hat.unshift("");
            _loc2_.which_hat = _loc2_.available_hat.indexOf(_loc2_.workerData.hat);
         }
         var _loc4_:Number = getTimer() - _loc3_;
         class_6.method_1("Time to get clothing inventories: " + _loc4_ + " ms.");
      }
      
      public function updateScreen(param1:Event) : void
      {
         var _loc5_:SimpleButton = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc2_:CharacterEditorScreen = this;
         _loc2_.updateModeToggle();
         var _loc3_:Number = 0;
         0;
         if(_loc2_.draggingWhichSlider != null)
         {
            if(_loc2_.draggingWhichSlider == "eyeheight")
            {
               _loc5_ = _loc2_.clip.menu.customize.eyeheight_panel.slider;
               _loc6_ = Number(_loc2_.clip.menu.customize.eyeheight_panel.mouseX);
               _loc5_.x = Math.min(Math.max(_loc6_,_loc2_.sliderStartX),_loc2_.sliderStartX + _loc2_.sliderRange);
               _loc3_ = Math.round((_loc5_.x - _loc2_.sliderStartX) / _loc2_.sliderRange * (WorkerData.EYE_HEIGHT_MAX - WorkerData.EYE_HEIGHT_MIN)) + WorkerData.EYE_HEIGHT_MIN;
               if(_loc2_.workerData.eyeHeight != _loc3_)
               {
                  _loc2_.workerData.adjustValue("eyeHeight",_loc3_);
                  _loc2_.worker.updateFacialLayout();
                  _loc2_.workerReverse.updateFacialLayout();
               }
            }
            else if(_loc2_.draggingWhichSlider == "eyespacing")
            {
               _loc5_ = _loc2_.clip.menu.customize.eyespacing_panel.slider;
               _loc6_ = Number(_loc2_.clip.menu.customize.eyespacing_panel.mouseX);
               _loc5_.x = Math.min(Math.max(_loc6_,_loc2_.sliderStartX),_loc2_.sliderStartX + _loc2_.sliderRange);
               _loc3_ = Math.round((_loc5_.x - _loc2_.sliderStartX) / _loc2_.sliderRange * (WorkerData.EYE_SPACING_MAX - WorkerData.EYE_SPACING_MIN)) + WorkerData.EYE_SPACING_MIN;
               if(_loc2_.workerData.eyeSpacing != _loc3_)
               {
                  _loc2_.workerData.adjustValue("eyeSpacing",_loc3_);
                  _loc2_.worker.updateFacialLayout();
                  _loc2_.workerReverse.updateFacialLayout();
               }
            }
            else if(_loc2_.draggingWhichSlider == "mouthheight")
            {
               _loc5_ = _loc2_.clip.menu.customize.mouthheight_panel.slider;
               _loc6_ = Number(_loc2_.clip.menu.customize.mouthheight_panel.mouseX);
               _loc5_.x = Math.min(Math.max(_loc6_,_loc2_.sliderStartX),_loc2_.sliderStartX + _loc2_.sliderRange);
               _loc3_ = Math.round((_loc5_.x - _loc2_.sliderStartX) / _loc2_.sliderRange * (WorkerData.MOUTH_HEIGHT_MAX - WorkerData.MOUTH_HEIGHT_MIN)) + WorkerData.MOUTH_HEIGHT_MIN;
               if(_loc2_.workerData.mouthHeight != _loc3_)
               {
                  _loc2_.workerData.adjustValue("mouthHeight",_loc3_);
                  _loc2_.worker.updateFacialLayout();
                  _loc2_.workerReverse.updateFacialLayout();
               }
            }
            else if(_loc2_.draggingWhichSlider == "headforward")
            {
               _loc5_ = _loc2_.clip.menu.customize.headforward_panel.slider;
               _loc6_ = Number(_loc2_.clip.menu.customize.headforward_panel.mouseX);
               _loc5_.x = Math.min(Math.max(_loc6_,_loc2_.sliderStartX),_loc2_.sliderStartX + _loc2_.sliderRange);
               _loc3_ = Math.round((_loc5_.x - _loc2_.sliderStartX) / _loc2_.sliderRange * (WorkerData.HEAD_FORWARD_MAX - WorkerData.HEAD_FORWARD_MIN)) + WorkerData.HEAD_FORWARD_MIN;
               if(_loc2_.workerData.headForward != _loc3_)
               {
                  _loc2_.workerData.adjustValue("headForward",_loc3_);
                  _loc2_.worker.updateFacialLayout();
                  _loc2_.workerReverse.updateFacialLayout();
               }
            }
            else if(_loc2_.draggingWhichSlider == "headscale")
            {
               _loc5_ = _loc2_.clip.menu.customize.headscale_panel.slider;
               _loc6_ = Number(_loc2_.clip.menu.customize.headscale_panel.mouseX);
               _loc5_.x = Math.min(Math.max(_loc6_,_loc2_.sliderStartX),_loc2_.sliderStartX + _loc2_.sliderRange);
               _loc3_ = (_loc5_.x - _loc2_.sliderStartX) / _loc2_.sliderRange * (WorkerData.HEAD_SCALE_MAX - WorkerData.HEAD_SCALE_MIN) + WorkerData.HEAD_SCALE_MIN;
               if(_loc2_.workerData.headScale != _loc3_)
               {
                  _loc2_.workerData.adjustValue("headScale",_loc3_);
                  _loc2_.worker.updateFacialLayout();
                  _loc2_.workerReverse.updateFacialLayout();
               }
            }
            else if(_loc2_.draggingWhichSlider == "weight")
            {
               _loc5_ = _loc2_.clip.menu.customize.weight_panel.slider;
               _loc6_ = Number(_loc2_.clip.menu.customize.weight_panel.mouseX);
               _loc5_.x = Math.min(Math.max(_loc6_,_loc2_.sliderStartX),_loc2_.sliderStartX + _loc2_.sliderRange);
               _loc3_ = (_loc5_.x - _loc2_.sliderStartX) / _loc2_.sliderRange * (WorkerData.WEIGHT_SCALE_MAX - WorkerData.WEIGHT_SCALE_MIN) + WorkerData.WEIGHT_SCALE_MIN;
               if(_loc2_.workerData.weightScale != _loc3_)
               {
                  _loc2_.workerData.adjustValue("weightScale",_loc3_);
                  _loc2_.worker.updateWeight();
                  _loc2_.workerReverse.updateWeight();
               }
            }
            else if(_loc2_.draggingWhichSlider == "headheight")
            {
               _loc5_ = _loc2_.clip.menu.customize.headheight_panel.slider;
               _loc6_ = Number(_loc2_.clip.menu.customize.headheight_panel.mouseX);
               _loc5_.x = Math.min(Math.max(_loc6_,_loc2_.sliderStartX),_loc2_.sliderStartX + _loc2_.sliderRange);
               _loc3_ = Math.round((_loc5_.x - _loc2_.sliderStartX) / _loc2_.sliderRange * (WorkerData.HEAD_HEIGHT_MAX - WorkerData.HEAD_HEIGHT_MIN)) + WorkerData.HEAD_HEIGHT_MIN;
               if(_loc2_.workerData.headHeight != _loc3_)
               {
                  _loc2_.workerData.adjustValue("headHeight",_loc3_);
                  _loc2_.worker.updateFacialLayout();
                  _loc2_.workerReverse.updateFacialLayout();
               }
            }
         }
         if(Boolean(_loc2_.clip) && _loc2_.clip.menu.clothes.holidaybar.bar.x != _loc2_.targetHolidaySpirit)
         {
            _loc2_.clip.menu.clothes.holidaybar.bar.x += (_loc2_.targetHolidaySpirit - _loc2_.clip.menu.clothes.holidaybar.bar.x) / 6;
            if(Math.abs(_loc2_.targetHolidaySpirit - _loc2_.clip.menu.clothes.holidaybar.bar.x) <= 1)
            {
               _loc2_.clip.menu.clothes.holidaybar.bar.x = _loc2_.targetHolidaySpirit;
            }
         }
         if(_loc2_.clip.fader.currentFrame == _loc2_.clip.fader.totalFrames)
         {
            if(_loc2_.endaction == "back")
            {
               _loc2_.gameObj.var_130.api.method_106("SlotSelect");
               _loc2_.gameObj.var_130.api.method_107("CharacterEditor");
            }
            else if(_loc2_.firstwaiter)
            {
               _loc2_.gameObj.method_134(true);
               _loc2_.gameObj.method_179();
            }
            else
            {
               _loc2_.gameObj.method_198();
               _loc2_.gameObj.method_179();
            }
         }
         if(_loc2_.worker)
         {
            _loc2_.worker.animateModel();
            if(this.isRunning)
            {
               _loc2_.worker.clip.x += _loc2_.runSpeed;
               _loc2_.workerReverse.clip.x += _loc2_.runSpeed;
               if(_loc2_.worker.clip.x >= _loc2_.workerX)
               {
                  _loc2_.worker.clip.x = _loc2_.workerX;
                  _loc2_.workerReverse.clip.x = _loc2_.workerReverseX;
                  _loc2_.worker.playAnimation("react1");
                  _loc2_.workerReverse.playAnimation("react1_mirror");
                  _loc2_.isRunning = false;
               }
            }
         }
         if(_loc2_.workerReverse)
         {
            _loc2_.workerReverse.animateModel();
         }
         if(_loc2_.leavingWorker)
         {
            _loc2_.leavingWorker.animateModel();
            _loc2_.leavingWorker.clip.x += _loc2_.runSpeed;
         }
         if(_loc2_.leavingWorkerReverse)
         {
            _loc2_.leavingWorkerReverse.animateModel();
            if(_loc2_.leavingWorker.clip.x <= _loc2_.workerX)
            {
               _loc2_.leavingWorkerReverse.clip.x = _loc2_.leavingWorker.clip.x - 71;
               _loc2_.leavingWorkerReverse.clip.y = _loc2_.leavingWorker.clip.y - 31;
            }
            else
            {
               _loc7_ = _loc2_.leavingWorker.clip.x - _loc2_.workerX;
               _loc2_.leavingWorkerReverse.clip.x = _loc2_.workerReverseX - 0.6 * _loc7_;
               _loc2_.leavingWorkerReverse.clip.y = _loc2_.workerReverseY - 0.125 * _loc7_;
               _loc2_.leavingWorkerReverse.clip.scaleY = _loc2_.workerScale - 0.01 * (_loc7_ / this.runSpeed);
               _loc2_.leavingWorkerReverse.clip.scaleX = _loc2_.leavingWorkerReverse.clip.scaleY * -1;
            }
         }
         if(Boolean(_loc2_.leavingWorker) && Boolean(_loc2_.leavingWorkerReverse))
         {
            if(_loc2_.leavingWorker.clip.x >= 320 && _loc2_.leavingWorkerReverse.clip.x < 0)
            {
               trace("LEAVE GONE");
               _loc2_.leavingWorker.destroy();
               _loc2_.leavingWorker = null;
               _loc2_.leavingWorkerReverse.destroy();
               _loc2_.leavingWorkerReverse = null;
            }
         }
      }
      
      public function clickSectionStats(param1:MouseEvent) : void
      {
         var _loc2_:CharacterEditorScreen = this;
         _loc2_.clip.menu.tabs.gotoAndStop("stats");
         _loc2_.clip.menu.stats.visible = true;
         _loc2_.clip.menu.clothes.visible = false;
         _loc2_.clip.menu.customize.visible = false;
         _loc2_.clip.menu.switcher.visible = false;
         _loc2_.clip.menu.photo_btn.visible = false;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
      }
      
      public function clickSectionClothes(param1:MouseEvent) : void
      {
         var _loc2_:CharacterEditorScreen = this;
         _loc2_.clip.menu.tabs.gotoAndStop("clothes");
         _loc2_.clip.menu.stats.visible = false;
         _loc2_.clip.menu.clothes.visible = true;
         _loc2_.clip.menu.customize.visible = false;
         _loc2_.clip.menu.tabs.newstar.visible = false;
         _loc2_.clip.menu.tabs.newstar.stop();
         _loc2_.gameObj.var_127.hasNewClothing = false;
         _loc2_.clip.menu.clothes.shirt_tab.newstar.visible = false;
         _loc2_.clip.menu.clothes.shirt_tab.newstar.stop();
         _loc2_.gameObj.var_127.removeNewClothingFlag("shirt");
         if(_loc2_.gameObj.var_127.didCreateWaiter)
         {
            _loc2_.clip.menu.switcher.visible = true;
         }
         else
         {
            _loc2_.clip.menu.switcher.visible = false;
         }
         _loc2_.clip.menu.photo_btn.visible = true;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
      }
      
      public function clickSectionCustomize(param1:MouseEvent) : void
      {
         var _loc2_:CharacterEditorScreen = this;
         _loc2_.clip.menu.tabs.gotoAndStop("customize");
         _loc2_.clip.menu.stats.visible = false;
         _loc2_.clip.menu.clothes.visible = false;
         _loc2_.clip.menu.customize.visible = true;
         if(_loc2_.gameObj.var_127.didCreateWaiter)
         {
            _loc2_.clip.menu.switcher.visible = true;
         }
         else
         {
            _loc2_.clip.menu.switcher.visible = false;
         }
         _loc2_.clip.menu.photo_btn.visible = true;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
      }
      
      public function clickSlider(param1:MouseEvent) : void
      {
         var _loc2_:CharacterEditorScreen = this;
         if(param1.currentTarget == _loc2_.clip.menu.customize.eyeheight_panel.slider)
         {
            _loc2_.draggingWhichSlider = "eyeheight";
         }
         else if(param1.currentTarget == _loc2_.clip.menu.customize.eyespacing_panel.slider)
         {
            _loc2_.draggingWhichSlider = "eyespacing";
         }
         else if(param1.currentTarget == _loc2_.clip.menu.customize.mouthheight_panel.slider)
         {
            _loc2_.draggingWhichSlider = "mouthheight";
         }
         else if(param1.currentTarget == _loc2_.clip.menu.customize.headforward_panel.slider)
         {
            _loc2_.draggingWhichSlider = "headforward";
         }
         else if(param1.currentTarget == _loc2_.clip.menu.customize.headscale_panel.slider)
         {
            _loc2_.draggingWhichSlider = "headscale";
         }
         else if(param1.currentTarget == _loc2_.clip.menu.customize.headheight_panel.slider)
         {
            _loc2_.draggingWhichSlider = "headheight";
         }
         else if(param1.currentTarget == _loc2_.clip.menu.customize.weight_panel.slider)
         {
            _loc2_.draggingWhichSlider = "weight";
         }
         _loc2_.gameObj.addEventListener(MouseEvent.MOUSE_UP,_loc2_.releaseSlider);
         _loc2_.gameObj.stage.addEventListener(Event.MOUSE_LEAVE,_loc2_.releaseSlider);
         _loc2_.didChange = true;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
      }
      
      public function releaseSlider(param1:Event) : void
      {
         var _loc2_:CharacterEditorScreen = this;
         _loc2_.gameObj.removeEventListener(MouseEvent.MOUSE_UP,_loc2_.releaseSlider);
         _loc2_.gameObj.stage.removeEventListener(Event.MOUSE_LEAVE,_loc2_.releaseSlider);
         _loc2_.draggingWhichSlider = null;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
      }
      
      public function rolloverGender(param1:MouseEvent) : void
      {
         var _loc2_:CharacterEditorScreen = this;
         if(param1.currentTarget == _loc2_.clip.menu.customize.genderpanel.male_btn && _loc2_.workerData.gender != WorkerData.GENDER_MALE)
         {
            _loc2_.clip.menu.customize.genderpanel.male_btn.gotoAndStop(3);
         }
         else if(param1.currentTarget == _loc2_.clip.menu.customize.genderpanel.female_btn && _loc2_.workerData.gender != WorkerData.GENDER_FEMALE)
         {
            _loc2_.clip.menu.customize.genderpanel.female_btn.gotoAndStop(3);
         }
      }
      
      public function rolloutGender(param1:MouseEvent) : void
      {
         var _loc2_:CharacterEditorScreen = this;
         if(param1.currentTarget == _loc2_.clip.menu.customize.genderpanel.male_btn && _loc2_.workerData.gender != WorkerData.GENDER_MALE)
         {
            _loc2_.clip.menu.customize.genderpanel.male_btn.gotoAndStop(2);
         }
         else if(param1.currentTarget == _loc2_.clip.menu.customize.genderpanel.female_btn && _loc2_.workerData.gender != WorkerData.GENDER_FEMALE)
         {
            _loc2_.clip.menu.customize.genderpanel.female_btn.gotoAndStop(2);
         }
      }
      
      public function clickGender(param1:MouseEvent) : void
      {
         var _loc2_:CharacterEditorScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         if(param1.currentTarget == _loc2_.clip.menu.customize.genderpanel.male_btn)
         {
            _loc2_.workerData.setGender(WorkerData.GENDER_MALE);
            _loc2_.randomizeHair(!_loc2_.didOpenHairColor);
            _loc2_.workerData.bangs = "";
            _loc2_.getAvailableClothing(true);
            _loc2_.which_hair = _loc2_.available_hair.indexOf(_loc2_.workerData.hair);
            _loc2_.which_facialhair = _loc2_.available_facialhair.indexOf(_loc2_.workerData.facialhair);
            _loc2_.which_bangs = 0;
            _loc2_.populateHairPanels(true);
            _loc2_.populateBangsPanels(true);
            _loc2_.clip.menu.customize.haircolor_swatch.transform.colorTransform = _loc2_.createColorTransform(_loc2_.workerData.hairColor);
            _loc2_.updatePaletteSelection();
            _loc2_.worker.updateModelLook();
            _loc2_.workerReverse.updateModelLook();
            _loc2_.didChange = true;
            _loc2_.worker.playAnimation("react1");
            _loc2_.workerReverse.playAnimation("react1_mirror");
         }
         else if(param1.currentTarget == _loc2_.clip.menu.customize.genderpanel.female_btn)
         {
            _loc2_.workerData.setGender(WorkerData.GENDER_FEMALE);
            _loc2_.randomizeHair(!_loc2_.didOpenHairColor);
            _loc2_.workerData.facialhair = "";
            _loc2_.getAvailableClothing(true);
            _loc2_.which_hair = _loc2_.available_hair.indexOf(_loc2_.workerData.hair);
            _loc2_.which_bangs = _loc2_.available_bangs.indexOf(_loc2_.workerData.bangs);
            _loc2_.which_facialhair = 0;
            _loc2_.populateHairPanels(true);
            _loc2_.populateBangsPanels(true);
            _loc2_.clip.menu.customize.haircolor_swatch.transform.colorTransform = _loc2_.createColorTransform(_loc2_.workerData.hairColor);
            _loc2_.updatePaletteSelection();
            _loc2_.worker.updateModelLook();
            _loc2_.workerReverse.updateModelLook();
            _loc2_.didChange = true;
            _loc2_.worker.playAnimation("react1");
            _loc2_.workerReverse.playAnimation("react1_mirror");
         }
         if(_loc2_.workerData.gender == WorkerData.GENDER_MALE)
         {
            _loc2_.clip.menu.customize.genderpanel.male_btn.gotoAndStop(1);
            _loc2_.clip.menu.customize.genderpanel.female_btn.gotoAndStop(2);
         }
         else
         {
            _loc2_.clip.menu.customize.genderpanel.male_btn.gotoAndStop(2);
            _loc2_.clip.menu.customize.genderpanel.female_btn.gotoAndStop(1);
         }
      }
      
      public function clickChangeName(param1:MouseEvent) : void
      {
         var _loc2_:CharacterEditorScreen = this;
         if(!_loc2_.isRunning)
         {
            _loc2_.didClickChangeName = true;
            _loc2_.clip.changeNameMC.visible = true;
            _loc2_.clip.changeNameMC.input_txt.setFocus();
            param1.stopImmediatePropagation();
            _loc2_.gameObj.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickScreenChangingName);
            _loc2_.gameObj.addEventListener(KeyboardEvent.KEY_DOWN,_loc2_.keyListener);
            _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         }
      }
      
      public function keyListener(param1:KeyboardEvent) : void
      {
         var _loc2_:CharacterEditorScreen = this;
         if(param1.keyCode == Keyboard.ENTER)
         {
            _loc2_.clickScreenChangingName(null,true);
         }
      }
      
      public function clickScreenChangingName(param1:MouseEvent = null, param2:Boolean = false) : void
      {
         var _loc3_:CharacterEditorScreen = this;
         if(param2 || param1.target.parent != _loc3_.clip.changeNameMC.input_txt)
         {
            _loc3_.gameObj.stage.focus = _loc3_.gameObj.stage;
            _loc3_.clip.changeNameMC.visible = false;
            _loc3_.clip.name_txt.text = String(_loc3_.clip.changeNameMC.input_txt.text);
            _loc3_.clip.name_txt.setTextFormat(_loc3_.kernFormat);
            _loc3_.gameObj.removeEventListener(MouseEvent.MOUSE_DOWN,_loc3_.clickScreenChangingName);
            _loc3_.gameObj.removeEventListener(KeyboardEvent.KEY_DOWN,_loc3_.keyListener);
         }
      }
      
      public function clickChangeEyeType(param1:MouseEvent) : void
      {
         var _loc5_:Number = NaN;
         var _loc2_:CharacterEditorScreen = this;
         var _loc3_:Array = String(param1.currentTarget.name).split("_");
         var _loc4_:Number = 1;
         if(!_loc2_.isRunning)
         {
            if(_loc3_[0] == "prev")
            {
               _loc4_ = -1;
            }
            if((_loc5_ = _loc2_.workerData.eyeStyle + _loc4_) > WorkerData.EYE_STYLE_MAX * WorkerData.eyeColorOptionsDark.length)
            {
               _loc5_ = 1;
            }
            else if(_loc5_ < 1)
            {
               _loc5_ = WorkerData.EYE_STYLE_MAX * WorkerData.eyeColorOptionsDark.length;
            }
            if(_loc2_.workerData.eyeStyle != _loc5_)
            {
               _loc2_.workerData.adjustValue("eyeStyle",_loc5_);
               _loc2_.worker.redoClothing(ClothingItem.TYPE_HAIR);
               _loc2_.workerReverse.redoClothing(ClothingItem.TYPE_HAIR);
               _loc2_.didChange = true;
            }
            _loc2_.clip.menu.customize.eyetype_panel.amount_txt.text = String(_loc5_ + "/" + WorkerData.EYE_STYLE_MAX * WorkerData.eyeColorOptionsDark.length);
            _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         }
      }
      
      public function clickChangeEyeDefault(param1:MouseEvent) : void
      {
         var _loc5_:Number = NaN;
         var _loc2_:CharacterEditorScreen = this;
         var _loc3_:Array = String(param1.currentTarget.name).split("_");
         var _loc4_:Number = 1;
         if(!_loc2_.isRunning)
         {
            if(_loc3_[0] == "prev")
            {
               _loc4_ = -1;
            }
            if((_loc5_ = WorkerData.eyeDefaultOptions.indexOf(_loc2_.workerData.eyeDefaultExpression) + _loc4_) >= WorkerData.eyeDefaultOptions.length)
            {
               _loc5_ = 0;
            }
            else if(_loc5_ < 0)
            {
               _loc5_ = WorkerData.eyeDefaultOptions.length - 1;
            }
            if(WorkerData.eyeDefaultOptions.length > _loc5_ && _loc2_.workerData.eyeDefaultExpression != WorkerData.eyeDefaultOptions[_loc5_])
            {
               _loc2_.workerData.adjustValue("eyeDefault",_loc5_);
               _loc2_.worker.updateFacialLayout();
               _loc2_.workerReverse.updateFacialLayout();
               _loc2_.didChange = true;
            }
            _loc2_.clip.menu.customize.eyedefault_panel.amount_txt.text = String(_loc5_ + 1 + "/" + WorkerData.eyeDefaultOptions.length);
            _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         }
      }
      
      public function clickChangeMouthDefault(param1:MouseEvent) : void
      {
         var _loc5_:Number = NaN;
         var _loc2_:CharacterEditorScreen = this;
         var _loc3_:Array = String(param1.currentTarget.name).split("_");
         var _loc4_:Number = 1;
         if(!_loc2_.isRunning)
         {
            if(_loc3_[0] == "prev")
            {
               _loc4_ = -1;
            }
            if((_loc5_ = _loc2_.workerData.mouthDefaultExpression + _loc4_) > WorkerData.MOUTH_DEFAULT_MAX)
            {
               _loc5_ = 1;
            }
            else if(_loc5_ < 1)
            {
               _loc5_ = WorkerData.MOUTH_DEFAULT_MAX;
            }
            if(_loc2_.workerData.mouthDefaultExpression != _loc5_)
            {
               _loc2_.workerData.adjustValue("mouthDefault",_loc5_);
               _loc2_.worker.updateFacialLayout();
               _loc2_.workerReverse.updateFacialLayout();
               _loc2_.didChange = true;
            }
            _loc2_.clip.menu.customize.mouthdefault_panel.amount_txt.text = String(_loc5_ + "/" + WorkerData.MOUTH_DEFAULT_MAX);
            _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         }
      }
      
      public function clickChangeAccessory(param1:MouseEvent) : void
      {
         var type:String = null;
         var currentIndex:Number = NaN;
         var targetIndex:Number = NaN;
         var tag:String = null;
         var e:MouseEvent = param1;
         var ob:CharacterEditorScreen = this;
         var splitter:Array = String(e.currentTarget.name).split("_");
         var dir:Number = 1;
         if(!ob.isRunning)
         {
            if(splitter[0] == "prev")
            {
               dir = -1;
            }
            type = "accd";
            currentIndex = Number(ob["which_" + type]);
            targetIndex = currentIndex + dir;
            if(targetIndex < 0 && ob["available_" + type].length > 0)
            {
               targetIndex = ob["available_" + type].length - 1;
            }
            else if(targetIndex >= ob["available_" + type].length && ob["available_" + type].length > 0)
            {
               targetIndex = 0;
            }
            ob["which_" + type] = targetIndex;
            tag = "";
            try
            {
               tag = String(ob["available_" + type][targetIndex]);
            }
            catch(err:Error)
            {
               class_6.error("Could not get new tag: type = " + type + ", index = " + targetIndex + ". Error: " + err.message);
            }
            ob.workerData[type] = tag;
            ob.worker.redoClothing(type);
            ob.workerReverse.redoClothing(type);
            ob.clip.menu.customize.accd_panel.amount_txt.text = String(targetIndex + 1 + "/" + ob["available_" + type].length);
            ob.didChange = true;
            ob.worker.playAnimation("react2");
            ob.workerReverse.playAnimation("react2_mirror");
            ob.gameObj.var_128.playSound("buttonclick.wav");
         }
      }
      
      public function clickBack(param1:Event) : void
      {
         var _loc2_:CharacterEditorScreen = this;
         if(_loc2_.firstwaiter == true)
         {
            _loc2_.gameObj.showNewHireScreen();
            _loc2_.gameObj.var_130.api.method_107("WaiterEditor");
         }
         else
         {
            _loc2_.gameObj.var_130.api.method_106("SlotSelect");
            _loc2_.gameObj.var_130.api.method_107("CharacterEditor");
         }
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
      }
      
      public function clickContinue(param1:Event) : void
      {
         var _loc3_:String = null;
         var _loc2_:CharacterEditorScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         if(_loc2_.endaction == "none")
         {
            _loc3_ = String(_loc2_.clip.menu.customize.genderpanel.input_txt.text);
            if(_loc3_ == "" || _loc3_ == " " || _loc3_ == "  ")
            {
               _loc2_.clip.menu.customize.genderpanel.noname.gotoAndPlay(2);
               _loc2_.clip.menu.customize.genderpanel.input_txt.setFocus();
            }
            else
            {
               _loc2_.workerData.restoreHat();
               _loc2_.endaction = "continue";
               if(_loc2_.firstwaiter == true)
               {
                  _loc2_.gameObj.var_127.setWaiter(_loc3_,"custom",_loc2_.gameObj.var_134.getSKUsForInventory("custom",_loc2_.gameObj.var_143.gender,true,_loc2_.gameObj.var_143.accd));
               }
               else
               {
                  _loc2_.gameObj.var_127.createNewSlot(_loc2_.params.selectedSlot,_loc3_,"custom");
               }
               _loc2_.clip.mouseEnabled = false;
               _loc2_.clip.mouseChildren = false;
               _loc2_.clip.fader.gotoAndPlay("quickfadeout");
            }
         }
      }
      
      public function destroy() : void
      {
         var _loc2_:String = null;
         var _loc1_:CharacterEditorScreen = this;
         _loc1_.kernFormat = null;
         if(_loc1_.firsttime == false && _loc1_.firstwaiter == false)
         {
            _loc1_.setupStats(false);
            _loc1_.setupClothingMenu(false);
         }
         _loc1_.setupInterface(false);
         _loc1_.setupCustomizeMenu(false);
         if(_loc1_.photoBitmap != null)
         {
            _loc1_.photoBitmap.bitmapData.dispose();
            try
            {
               _loc1_.clip.poloroid.holder.removeChild(_loc1_.photoBitmap);
            }
            catch(err:Error)
            {
            }
            _loc1_.photoBitmap = null;
         }
         if(_loc1_.backdropBitmap != null)
         {
            _loc1_.backdropBitmap.bitmapData.dispose();
            try
            {
               _loc1_.clip.bgholder.removeChild(_loc1_.backdropBitmap);
            }
            catch(err:Error)
            {
            }
            _loc1_.backdropBitmap = null;
         }
         if(_loc1_.mirrorBitmap != null)
         {
            _loc1_.mirrorBitmap.bitmapData.dispose();
            try
            {
               _loc1_.clip.mirrorbgholder.removeChild(_loc1_.mirrorBitmap);
            }
            catch(err:Error)
            {
            }
         }
         if(!_loc1_.firsttime && _loc1_.didClickChangeName)
         {
            _loc2_ = String(_loc1_.clip.changeNameMC.input_txt.text);
            if(_loc2_ != "" && _loc2_ != " " && _loc2_ != "  " && _loc2_ != "   ")
            {
               if(_loc1_.whichMode == "worker")
               {
                  _loc1_.gameObj.var_127.myName = _loc2_;
               }
               else if(_loc1_.whichMode == "waiter")
               {
                  _loc1_.gameObj.var_127.waiterName = _loc2_;
               }
               if(!_loc1_.didChange)
               {
                  class_6.info("SAVE NEW NAME");
                  _loc1_.gameObj.var_127.saveCharacterData();
               }
            }
         }
         if(_loc1_.didChange)
         {
            _loc1_.gameObj.var_130.api.method_132("workerChange");
            if(!_loc1_.firsttime)
            {
               class_6.info("SAVE CHANGE");
               _loc1_.gameObj.var_127.saveCharacterData();
            }
         }
         _loc1_.container.removeEventListener("clickBack",_loc1_.clickBack);
         _loc1_.container.removeEventListener("clickContinue",_loc1_.clickContinue);
         _loc1_.clip.removeEventListener(Event.ENTER_FRAME,_loc1_.updateScreen);
         _loc1_.worker.destroy();
         _loc1_.worker = null;
         _loc1_.workerReverse.destroy();
         _loc1_.workerReverse = null;
         if(Boolean(_loc1_.clip) && Boolean(_loc1_.clip.parent))
         {
            _loc1_.clip.parent.removeChild(_loc1_.clip);
         }
         _loc1_.container = null;
         _loc1_.clip = null;
      }
      
      public function clickBonusFacebook(param1:Event) : void
      {
         var _loc2_:CharacterEditorScreen = this;
         var _loc3_:UserData = _loc2_.gameObj.var_127;
         if(_loc3_.didClickFacebook == false)
         {
            _loc2_.gameObj.var_130.api.method_109("http://www.facebook.com/pages/Flipline-Studios/121045844606187");
            _loc3_.didClickFacebook = true;
            _loc3_.totalTips += 5000;
            _loc3_.saveData();
            _loc2_.clip.menu.stats.tipstotal_txt.text = _loc3_.getTipsTotal(true,true);
            _loc2_.clip.menu.stats.tipstotal_txt.setTextFormat(_loc2_.kernFormat);
            _loc2_.clip.menu.stats.bonus.facebook_btn.visible = false;
            _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         }
      }
      
      public function clickBonusTwitter(param1:Event) : void
      {
         var _loc2_:CharacterEditorScreen = this;
         var _loc3_:UserData = _loc2_.gameObj.var_127;
         if(_loc3_.didClickTwitter == false)
         {
            _loc2_.gameObj.var_130.api.method_109("http://www.twitter.com/FliplineStudios");
            _loc3_.didClickTwitter = true;
            _loc3_.totalTips += 5000;
            _loc3_.saveData();
            _loc2_.clip.menu.stats.tipstotal_txt.text = _loc3_.getTipsTotal(true,true);
            _loc2_.clip.menu.stats.tipstotal_txt.setTextFormat(_loc2_.kernFormat);
            _loc2_.clip.menu.stats.bonus.twitter_btn.visible = false;
            _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         }
      }
      
      public function setupCustomizeMenu(param1:Boolean = true) : void
      {
         var _loc3_:int = 0;
         var _loc4_:TextFormat = null;
         var _loc5_:TextInput = null;
         var _loc2_:CharacterEditorScreen = this;
         if(param1)
         {
            _loc2_.clip.menu.customize.eyeheight_panel.slider.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickSlider);
            _loc2_.clip.menu.customize.eyespacing_panel.slider.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickSlider);
            _loc2_.clip.menu.customize.mouthheight_panel.slider.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickSlider);
            _loc2_.clip.menu.customize.headforward_panel.slider.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickSlider);
            _loc2_.clip.menu.customize.headscale_panel.slider.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickSlider);
            _loc2_.clip.menu.customize.headheight_panel.slider.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickSlider);
            _loc2_.clip.menu.customize.weight_panel.slider.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickSlider);
            _loc2_.clip.menu.customize.eyetype_panel.next_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickChangeEyeType);
            _loc2_.clip.menu.customize.eyetype_panel.prev_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickChangeEyeType);
            _loc2_.clip.menu.customize.eyedefault_panel.next_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickChangeEyeDefault);
            _loc2_.clip.menu.customize.eyedefault_panel.prev_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickChangeEyeDefault);
            _loc2_.clip.menu.customize.mouthdefault_panel.next_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickChangeMouthDefault);
            _loc2_.clip.menu.customize.mouthdefault_panel.prev_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickChangeMouthDefault);
            _loc2_.clip.menu.customize.accd_panel.next_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickChangeAccessory);
            _loc2_.clip.menu.customize.accd_panel.prev_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickChangeAccessory);
            _loc2_.clip.menu.customize.haircolor_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.showHairColorPanel);
            _loc2_.clip.menu.customize.skincolor_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.showSkinColorPanel);
            _loc2_.setupPalettes();
            _loc2_.clip.menu.customize.hairpanel.hair_panel.prev_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickHairPage);
            _loc2_.clip.menu.customize.hairpanel.hair_panel.next_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickHairPage);
            _loc2_.clip.menu.customize.hairpanel.hair_panel.notsupported.visible = false;
            _loc2_.clip.menu.customize.hairpanel.bang_panel.prev_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickBangsPage);
            _loc2_.clip.menu.customize.hairpanel.bang_panel.next_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickBangsPage);
            _loc2_.clip.menu.customize.hairpanel.bang_panel.notsupported.visible = false;
            _loc3_ = 0;
            while(_loc3_ < _loc2_.hairPerPage)
            {
               _loc2_.clip.menu.customize.hairpanel.hair_panel["thumb" + _loc3_].buttonMode = true;
               _loc2_.clip.menu.customize.hairpanel.hair_panel["thumb" + _loc3_].useHandCursor = true;
               _loc2_.clip.menu.customize.hairpanel.hair_panel["thumb" + _loc3_].mouseChildren = false;
               _loc2_.clip.menu.customize.hairpanel.hair_panel["thumb" + _loc3_].addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickChangeHair);
               _loc2_.clip.menu.customize.hairpanel.hair_panel["thumb" + _loc3_].addEventListener(MouseEvent.ROLL_OVER,_loc2_.rolloverHair);
               _loc2_.clip.menu.customize.hairpanel.hair_panel["thumb" + _loc3_].addEventListener(MouseEvent.ROLL_OUT,_loc2_.rolloutHair);
               _loc2_.clip.menu.customize.hairpanel.bang_panel["thumb" + _loc3_].buttonMode = true;
               _loc2_.clip.menu.customize.hairpanel.bang_panel["thumb" + _loc3_].useHandCursor = true;
               _loc2_.clip.menu.customize.hairpanel.bang_panel["thumb" + _loc3_].mouseChildren = false;
               _loc2_.clip.menu.customize.hairpanel.bang_panel["thumb" + _loc3_].addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickChangeBangs);
               _loc2_.clip.menu.customize.hairpanel.bang_panel["thumb" + _loc3_].addEventListener(MouseEvent.ROLL_OVER,_loc2_.rolloverBangs);
               _loc2_.clip.menu.customize.hairpanel.bang_panel["thumb" + _loc3_].addEventListener(MouseEvent.ROLL_OUT,_loc2_.rolloutBangs);
               _loc3_++;
            }
            if(_loc2_.workerData.gender == WorkerData.GENDER_MALE)
            {
               _loc2_.clip.menu.customize.genderpanel.male_btn.gotoAndStop(1);
               _loc2_.clip.menu.customize.genderpanel.female_btn.gotoAndStop(2);
            }
            else
            {
               _loc2_.clip.menu.customize.genderpanel.male_btn.gotoAndStop(2);
               _loc2_.clip.menu.customize.genderpanel.female_btn.gotoAndStop(1);
            }
            _loc2_.clip.menu.customize.genderpanel.male_btn.buttonMode = true;
            _loc2_.clip.menu.customize.genderpanel.male_btn.useHandCursor = true;
            _loc2_.clip.menu.customize.genderpanel.male_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickGender);
            _loc2_.clip.menu.customize.genderpanel.male_btn.addEventListener(MouseEvent.MOUSE_OVER,_loc2_.rolloverGender);
            _loc2_.clip.menu.customize.genderpanel.male_btn.addEventListener(MouseEvent.MOUSE_OUT,_loc2_.rolloutGender);
            _loc2_.clip.menu.customize.genderpanel.female_btn.buttonMode = true;
            _loc2_.clip.menu.customize.genderpanel.female_btn.useHandCursor = true;
            _loc2_.clip.menu.customize.genderpanel.female_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickGender);
            _loc2_.clip.menu.customize.genderpanel.female_btn.addEventListener(MouseEvent.MOUSE_OVER,_loc2_.rolloverGender);
            _loc2_.clip.menu.customize.genderpanel.female_btn.addEventListener(MouseEvent.MOUSE_OUT,_loc2_.rolloutGender);
            if(_loc2_.firstwaiter)
            {
               _loc2_.clip.menu.customize.genderpanel.name_label.text = "SERVER\'S NAME:";
            }
            else
            {
               _loc2_.clip.menu.customize.genderpanel.name_label.text = "CHEF\'S NAME:";
            }
            _loc2_.clip.menu.customize.genderpanel.name_label.setTextFormat(_loc2_.kernFormat);
            (_loc4_ = new TextFormat()).font = "Arial";
            _loc4_.size = 24;
            _loc4_.bold = true;
            _loc4_.align = TextFormatAlign.CENTER;
            (_loc5_ = _loc2_.clip.menu.customize.genderpanel.input_txt).setStyle("textFormat",_loc4_);
            _loc5_.maxChars = 16;
            _loc5_.restrict = "0-9A-Za-z \'\\-";
            _loc5_.setStyle("upSkin",TextInput_editor_upSkin);
            _loc5_.setStyle("focusRectSkin",editor_focusRectSkin);
            _loc2_.clip.menu.customize.genderpanel.noname.gotoAndStop(1);
            if(class_3.method_56() && class_1.method_82() == false)
            {
               _loc5_.editable = false;
               if(_loc2_.firstwaiter)
               {
                  _loc5_.text = "Server";
               }
               else
               {
                  _loc5_.text = "You";
               }
               _loc5_.mouseEnabled = false;
               _loc5_.mouseChildren = false;
            }
            _loc2_.populateCustomizePanels();
         }
         else
         {
            _loc2_.clip.menu.customize.eyeheight_panel.slider.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickSlider);
            _loc2_.clip.menu.customize.eyespacing_panel.slider.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickSlider);
            _loc2_.clip.menu.customize.mouthheight_panel.slider.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickSlider);
            _loc2_.clip.menu.customize.headforward_panel.slider.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickSlider);
            _loc2_.clip.menu.customize.headscale_panel.slider.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickSlider);
            _loc2_.clip.menu.customize.headheight_panel.slider.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickSlider);
            _loc2_.clip.menu.customize.weight_panel.slider.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickSlider);
            _loc2_.clip.menu.customize.eyetype_panel.next_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickChangeEyeType);
            _loc2_.clip.menu.customize.eyetype_panel.prev_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickChangeEyeType);
            _loc2_.clip.menu.customize.eyedefault_panel.next_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickChangeEyeDefault);
            _loc2_.clip.menu.customize.eyedefault_panel.prev_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickChangeEyeDefault);
            _loc2_.clip.menu.customize.mouthdefault_panel.next_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickChangeMouthDefault);
            _loc2_.clip.menu.customize.mouthdefault_panel.prev_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickChangeMouthDefault);
            _loc2_.clip.menu.customize.accd_panel.next_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickChangeAccessory);
            _loc2_.clip.menu.customize.accd_panel.prev_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickChangeAccessory);
            _loc2_.clip.menu.customize.haircolor_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.showHairColorPanel);
            _loc2_.clip.menu.customize.skincolor_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.showSkinColorPanel);
            _loc2_.setupPalettes(false);
            _loc2_.clip.menu.customize.hairpanel.hair_panel.prev_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickHairPage);
            _loc2_.clip.menu.customize.hairpanel.hair_panel.next_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickHairPage);
            _loc2_.clip.menu.customize.hairpanel.bang_panel.prev_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickBangsPage);
            _loc2_.clip.menu.customize.hairpanel.bang_panel.next_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickBangsPage);
            _loc3_ = 0;
            while(_loc3_ < _loc2_.hairPerPage)
            {
               _loc2_.clip.menu.customize.hairpanel.hair_panel["thumb" + _loc3_].removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickChangeHair);
               _loc2_.clip.menu.customize.hairpanel.hair_panel["thumb" + _loc3_].removeEventListener(MouseEvent.ROLL_OVER,_loc2_.rolloverHair);
               _loc2_.clip.menu.customize.hairpanel.hair_panel["thumb" + _loc3_].removeEventListener(MouseEvent.ROLL_OUT,_loc2_.rolloutHair);
               _loc2_.clip.menu.customize.hairpanel.bang_panel["thumb" + _loc3_].removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickChangeBangs);
               _loc2_.clip.menu.customize.hairpanel.bang_panel["thumb" + _loc3_].removeEventListener(MouseEvent.ROLL_OVER,_loc2_.rolloverBangs);
               _loc2_.clip.menu.customize.hairpanel.bang_panel["thumb" + _loc3_].removeEventListener(MouseEvent.ROLL_OUT,_loc2_.rolloutBangs);
               _loc3_++;
            }
            _loc2_.clip.menu.customize.genderpanel.male_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickGender);
            _loc2_.clip.menu.customize.genderpanel.male_btn.removeEventListener(MouseEvent.MOUSE_OVER,_loc2_.rolloverGender);
            _loc2_.clip.menu.customize.genderpanel.male_btn.removeEventListener(MouseEvent.MOUSE_OUT,_loc2_.rolloutGender);
            _loc2_.clip.menu.customize.genderpanel.female_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickGender);
            _loc2_.clip.menu.customize.genderpanel.female_btn.removeEventListener(MouseEvent.MOUSE_OVER,_loc2_.rolloverGender);
            _loc2_.clip.menu.customize.genderpanel.female_btn.removeEventListener(MouseEvent.MOUSE_OUT,_loc2_.rolloutGender);
         }
      }
      
      public function updatePaletteSelection() : void
      {
         var _loc2_:MovieClip = null;
         var _loc3_:MovieClip = null;
         var _loc4_:uint = 0;
         var _loc5_:int = 0;
         var _loc1_:CharacterEditorScreen = this;
         _loc2_ = _loc1_.clip.menu.customize.skincolor_palette;
         _loc5_ = 0;
         while(_loc5_ < _loc1_.numSkinSwatches)
         {
            _loc4_ = 1118481;
            if(WorkerData.skinToneOptions.length > _loc5_)
            {
               _loc4_ = uint(WorkerData.skinToneOptions[_loc5_]);
            }
            _loc3_ = _loc2_["skincolor" + _loc5_];
            if(_loc1_.workerData.skinTone == _loc4_)
            {
               _loc3_.gotoAndStop(3);
            }
            else
            {
               _loc3_.gotoAndStop(1);
            }
            _loc5_++;
         }
         _loc2_.visible = false;
         _loc2_ = _loc1_.clip.menu.customize.haircolor_palette;
         _loc5_ = 0;
         while(_loc5_ < _loc1_.numHairSwatches)
         {
            _loc4_ = 1118481;
            if(WorkerData.hairColorOptions.length > _loc5_)
            {
               _loc4_ = uint(WorkerData.hairColorOptions[_loc5_]);
            }
            _loc3_ = _loc2_["haircolor" + _loc5_];
            if(_loc1_.workerData.hairColor == _loc4_)
            {
               _loc3_.gotoAndStop(3);
            }
            else
            {
               _loc3_.gotoAndStop(1);
            }
            _loc5_++;
         }
      }
      
      public function setupPalettes(param1:Boolean = true) : void
      {
         var _loc3_:int = 0;
         var _loc4_:uint = 0;
         null;
         var _loc6_:MovieClip = null;
         var _loc7_:MovieClip = null;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc2_:CharacterEditorScreen = this;
         if(param1)
         {
            _loc6_ = _loc2_.clip.menu.customize.skincolor_palette;
            _loc3_ = 0;
            while(_loc3_ < _loc2_.numSkinSwatches)
            {
               _loc4_ = 1118481;
               if(WorkerData.skinToneOptions.length > _loc3_)
               {
                  _loc4_ = uint(WorkerData.skinToneOptions[_loc3_]);
               }
               _loc6_.swatchholder.graphics.beginFill(_loc4_);
               _loc6_.swatchholder.graphics.drawRect(_loc3_ * 44,0,44,110);
               _loc6_.swatchholder.graphics.endFill();
               (_loc7_ = _loc6_["skincolor" + _loc3_]).mouseChildren = false;
               _loc7_.buttonMode = true;
               _loc7_.useHandCursor = true;
               if(_loc2_.workerData.skinTone == _loc4_)
               {
                  _loc7_.gotoAndStop(3);
               }
               else
               {
                  _loc7_.gotoAndStop(1);
               }
               _loc7_.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickSkinColor);
               _loc7_.addEventListener(MouseEvent.MOUSE_OVER,_loc2_.rolloverSkinColor);
               _loc7_.addEventListener(MouseEvent.MOUSE_OUT,_loc2_.rolloutSkinColor);
               _loc3_++;
            }
            _loc6_.visible = false;
            _loc6_ = _loc2_.clip.menu.customize.haircolor_palette;
            _loc3_ = 0;
            while(_loc3_ < _loc2_.numHairSwatches)
            {
               _loc4_ = 1118481;
               if(WorkerData.hairColorOptions.length > _loc3_)
               {
                  _loc4_ = uint(WorkerData.hairColorOptions[_loc3_]);
               }
               _loc6_.swatchholder.graphics.beginFill(_loc4_);
               _loc8_ = Math.floor(_loc3_ / 8) * 29;
               _loc9_ = _loc3_ % 8 * 49;
               _loc6_.swatchholder.graphics.drawRect(_loc9_,_loc8_,49,26);
               _loc6_.swatchholder.graphics.endFill();
               (_loc7_ = _loc6_["haircolor" + _loc3_]).buttonMode = true;
               _loc7_.mouseChildren = false;
               _loc7_.useHandCursor = true;
               if(_loc2_.workerData.hairColor == _loc4_)
               {
                  _loc7_.gotoAndStop(3);
               }
               else
               {
                  _loc7_.gotoAndStop(1);
               }
               _loc7_.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickHairColor);
               _loc7_.addEventListener(MouseEvent.MOUSE_OVER,_loc2_.rolloverHairColor);
               _loc7_.addEventListener(MouseEvent.MOUSE_OUT,_loc2_.rolloutHairColor);
               _loc3_++;
            }
            _loc6_.visible = false;
         }
         else
         {
            (_loc6_ = _loc2_.clip.menu.customize.skincolor_palette).swatchholder.graphics.clear();
            _loc3_ = 0;
            while(_loc3_ < _loc2_.numSkinSwatches)
            {
               (_loc7_ = _loc6_["skincolor" + _loc3_]).removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickSkinColor);
               _loc7_.removeEventListener(MouseEvent.MOUSE_OVER,_loc2_.rolloverSkinColor);
               _loc7_.removeEventListener(MouseEvent.MOUSE_OUT,_loc2_.rolloutSkinColor);
               _loc3_++;
            }
            (_loc6_ = _loc2_.clip.menu.customize.haircolor_palette).swatchholder.graphics.clear();
            _loc3_ = 0;
            while(_loc3_ < _loc2_.numHairSwatches)
            {
               (_loc7_ = _loc6_["haircolor" + _loc3_]).removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickHairColor);
               _loc7_.removeEventListener(MouseEvent.MOUSE_OVER,_loc2_.rolloverHairColor);
               _loc7_.removeEventListener(MouseEvent.MOUSE_OUT,_loc2_.rolloutHairColor);
               _loc3_++;
            }
         }
      }
      
      public function clickSkinColor(param1:MouseEvent) : void
      {
         var _loc4_:uint = 0;
         var _loc5_:int = 0;
         var _loc2_:CharacterEditorScreen = this;
         var _loc3_:Number = Number(String(param1.currentTarget.name).split("skincolor")[1]);
         if(_loc3_ < WorkerData.skinToneOptions.length && _loc2_.workerData.skinTone != WorkerData.skinToneOptions[_loc3_])
         {
            _loc4_ = uint(WorkerData.skinToneOptions[_loc3_]);
            _loc2_.workerData.skinTone = _loc4_;
            _loc2_.worker.updateSkinTone();
            _loc2_.workerReverse.updateSkinTone();
            _loc2_.didChange = true;
            _loc5_ = 0;
            while(_loc5_ < _loc2_.numSkinSwatches)
            {
               if(_loc5_ < WorkerData.skinToneOptions.length && _loc4_ == WorkerData.skinToneOptions[_loc5_])
               {
                  _loc2_.clip.menu.customize.skincolor_palette["skincolor" + _loc5_].gotoAndStop(3);
               }
               else
               {
                  _loc2_.clip.menu.customize.skincolor_palette["skincolor" + _loc5_].gotoAndStop(1);
               }
               _loc5_++;
            }
            _loc2_.clip.menu.customize.skincolor_swatch.transform.colorTransform = _loc2_.createColorTransform(_loc2_.workerData.skinTone);
         }
         _loc2_.clip.menu.customize.skincolor_palette.visible = false;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
      }
      
      public function rolloverSkinColor(param1:MouseEvent) : void
      {
         var _loc2_:CharacterEditorScreen = this;
         var _loc3_:Number = Number(String(param1.currentTarget.name).split("skincolor")[1]);
         if(_loc3_ < WorkerData.skinToneOptions.length && _loc2_.workerData.skinTone != WorkerData.skinToneOptions[_loc3_])
         {
            MovieClip(param1.currentTarget).gotoAndStop(2);
         }
      }
      
      public function rolloutSkinColor(param1:MouseEvent) : void
      {
         var _loc2_:CharacterEditorScreen = this;
         var _loc3_:Number = Number(String(param1.currentTarget.name).split("skincolor")[1]);
         if(_loc3_ < WorkerData.skinToneOptions.length && _loc2_.workerData.skinTone != WorkerData.skinToneOptions[_loc3_])
         {
            MovieClip(param1.currentTarget).gotoAndStop(1);
         }
      }
      
      public function clickHairColor(param1:MouseEvent) : void
      {
         var _loc4_:uint = 0;
         var _loc5_:int = 0;
         var _loc2_:CharacterEditorScreen = this;
         var _loc3_:Number = Number(String(param1.currentTarget.name).split("haircolor")[1]);
         if(_loc3_ < WorkerData.hairColorOptions.length && _loc2_.workerData.hairColor != WorkerData.hairColorOptions[_loc3_])
         {
            _loc4_ = uint(WorkerData.hairColorOptions[_loc3_]);
            _loc2_.workerData.hairColor = _loc4_;
            _loc2_.worker.updateHairColor();
            _loc2_.workerReverse.updateHairColor();
            _loc2_.didChange = true;
            _loc5_ = 0;
            while(_loc5_ < _loc2_.numHairSwatches)
            {
               if(_loc5_ < WorkerData.hairColorOptions.length && _loc4_ == WorkerData.hairColorOptions[_loc5_])
               {
                  _loc2_.clip.menu.customize.haircolor_palette["haircolor" + _loc5_].gotoAndStop(3);
               }
               else
               {
                  _loc2_.clip.menu.customize.haircolor_palette["haircolor" + _loc5_].gotoAndStop(1);
               }
               _loc5_++;
            }
            _loc2_.populateHairPanels();
            _loc2_.populateBangsPanels();
            _loc2_.clip.menu.customize.haircolor_swatch.transform.colorTransform = _loc2_.createColorTransform(_loc2_.workerData.hairColor);
         }
         _loc2_.clip.menu.customize.haircolor_palette.visible = false;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
      }
      
      public function rolloverHairColor(param1:MouseEvent) : void
      {
         var _loc2_:CharacterEditorScreen = this;
         var _loc3_:Number = Number(String(param1.currentTarget.name).split("haircolor")[1]);
         if(_loc3_ < WorkerData.hairColorOptions.length && _loc2_.workerData.hairColor != WorkerData.hairColorOptions[_loc3_])
         {
            MovieClip(param1.currentTarget).gotoAndStop(2);
         }
      }
      
      public function rolloutHairColor(param1:MouseEvent) : void
      {
         var _loc2_:CharacterEditorScreen = this;
         var _loc3_:Number = Number(String(param1.currentTarget.name).split("haircolor")[1]);
         if(_loc3_ < WorkerData.hairColorOptions.length && _loc2_.workerData.hairColor != WorkerData.hairColorOptions[_loc3_])
         {
            MovieClip(param1.currentTarget).gotoAndStop(1);
         }
      }
      
      public function showHairColorPanel(param1:Event = null) : void
      {
         var _loc2_:CharacterEditorScreen = this;
         _loc2_.clip.menu.customize.haircolor_palette.visible = true;
         _loc2_.clip.menu.customize.skincolor_palette.visible = false;
         _loc2_.didOpenHairColor = true;
      }
      
      public function showSkinColorPanel(param1:Event = null) : void
      {
         var _loc2_:CharacterEditorScreen = this;
         _loc2_.clip.menu.customize.haircolor_palette.visible = false;
         _loc2_.clip.menu.customize.skincolor_palette.visible = true;
      }
      
      public function clickHairPage(param1:MouseEvent) : void
      {
         var _loc2_:CharacterEditorScreen = this;
         var _loc3_:String = String(String(param1.currentTarget.name).split("_btn")[0]);
         var _loc4_:Number = _loc2_.hairPage + 1;
         if(_loc3_ == "prev")
         {
            _loc4_ = _loc2_.hairPage - 1;
         }
         var _loc5_:Number = Math.ceil(_loc2_.available_hair.length / _loc2_.hairPerPage);
         if(_loc4_ >= _loc5_)
         {
            _loc4_ = 0;
         }
         else if(_loc4_ < 0)
         {
            _loc4_ += _loc5_;
         }
         _loc2_.hairPage = _loc4_;
         _loc2_.populateHairPanels();
      }
      
      public function clickBangsPage(param1:MouseEvent) : void
      {
         var _loc5_:Array = null;
         var _loc2_:CharacterEditorScreen = this;
         var _loc3_:String = String(String(param1.currentTarget.name).split("_btn")[0]);
         var _loc4_:Number = _loc2_.bangsPage + 1;
         if(_loc3_ == "prev")
         {
            _loc4_ = _loc2_.bangsPage - 1;
         }
         if(_loc2_.workerData.gender == WorkerData.GENDER_FEMALE)
         {
            _loc5_ = _loc2_.available_bangs;
         }
         else
         {
            _loc5_ = _loc2_.available_facialhair;
         }
         var _loc6_:Number = Math.ceil(_loc5_.length / _loc2_.hairPerPage);
         if(_loc4_ >= _loc6_)
         {
            _loc4_ = 0;
         }
         else if(_loc4_ < 0)
         {
            _loc4_ += _loc6_;
         }
         _loc2_.bangsPage = _loc4_;
         _loc2_.populateBangsPanels();
      }
      
      public function clickChangeHair(param1:MouseEvent) : void
      {
         var tag:String;
         var i:int;
         var idx:Number = NaN;
         var type:String = null;
         var panelIndex:Number = NaN;
         var e:MouseEvent = param1;
         var screen:CharacterEditorScreen = this;
         idx = Number(String(e.currentTarget.name).split("thumb")[1]);
         idx += screen.hairPage * screen.hairPerPage;
         type = "hair";
         screen["which_" + type] = idx;
         tag = "";
         try
         {
            tag = String(screen["available_" + type][idx]);
         }
         catch(err:Error)
         {
            class_6.error("Could not get new tag: type = " + type + ", index = " + idx + ". Error: " + err.message);
         }
         screen.workerData[type] = tag;
         screen.worker.redoClothing(type);
         screen.workerReverse.redoClothing(type);
         screen.didChange = true;
         screen.worker.playAnimation("react2");
         screen.workerReverse.playAnimation("react2_mirror");
         screen.gameObj.var_128.playSound("buttonclick.wav");
         i = 0;
         while(i < screen.hairPerPage)
         {
            panelIndex = screen.hairPage * screen.hairPerPage + i;
            if(panelIndex < screen["available_" + type].length && screen.workerData[type] == screen["available_" + type][panelIndex])
            {
               screen.clip.menu.customize.hairpanel.hair_panel["thumb" + i].gotoAndStop(3);
            }
            else if(panelIndex >= screen["available_" + type].length)
            {
               screen.clip.menu.customize.hairpanel.hair_panel["thumb" + i].gotoAndStop(4);
            }
            else
            {
               screen.clip.menu.customize.hairpanel.hair_panel["thumb" + i].gotoAndStop(1);
            }
            i++;
         }
         if(screen.workerData.gender == WorkerData.GENDER_MALE || screen.gameObj.var_134.clothingHasOption(screen.workerData.hair,ClothingItem.OPTIONS_SUPPORTS_BANGS))
         {
            screen.clip.menu.customize.hairpanel.bang_panel.notsupported.visible = false;
         }
         else
         {
            screen.clip.menu.customize.hairpanel.bang_panel.notsupported.visible = true;
         }
      }
      
      public function clickChangeBangs(param1:MouseEvent) : void
      {
         var tag:String;
         var i:int;
         var idx:Number = NaN;
         var useArray:Array = null;
         var useVar:String = null;
         var type:String = null;
         var panelIndex:Number = NaN;
         var e:MouseEvent = param1;
         var screen:CharacterEditorScreen = this;
         idx = Number(String(e.currentTarget.name).split("thumb")[1]);
         idx += screen.bangsPage * screen.hairPerPage;
         if(screen.workerData.gender == WorkerData.GENDER_MALE)
         {
            useArray = screen.available_facialhair;
            useVar = ClothingItem.TYPE_FACIALHAIR;
         }
         else
         {
            useArray = screen.available_bangs;
            useVar = ClothingItem.TYPE_BANGS;
         }
         type = useVar;
         screen["which_" + type] = idx;
         tag = "";
         try
         {
            tag = String(screen["available_" + type][idx]);
         }
         catch(err:Error)
         {
            class_6.error("Could not get new tag: type = " + type + ", index = " + idx + ". Error: " + err.message);
         }
         screen.workerData[type] = tag;
         screen.worker.redoClothing(type);
         screen.workerReverse.redoClothing(type);
         screen.didChange = true;
         screen.gameObj.var_128.playSound("buttonclick.wav");
         i = 0;
         while(i < screen.hairPerPage)
         {
            panelIndex = screen.bangsPage * screen.hairPerPage + i;
            if(panelIndex < screen["available_" + type].length && screen.workerData[type] == screen["available_" + type][panelIndex])
            {
               screen.clip.menu.customize.hairpanel.bang_panel["thumb" + i].gotoAndStop(3);
            }
            else if(panelIndex >= screen["available_" + type].length)
            {
               screen.clip.menu.customize.hairpanel.bang_panel["thumb" + i].gotoAndStop(4);
            }
            else
            {
               screen.clip.menu.customize.hairpanel.bang_panel["thumb" + i].gotoAndStop(1);
            }
            i++;
         }
      }
      
      public function rolloverHair(param1:MouseEvent) : void
      {
         var _loc2_:CharacterEditorScreen = this;
         var _loc3_:Number = Number(String(param1.currentTarget.name).split("thumb")[1]);
         _loc3_ += _loc2_.hairPage * _loc2_.hairPerPage;
         if(_loc3_ < _loc2_.available_hair.length)
         {
            if(_loc2_.workerData.hair != _loc2_.available_hair[_loc3_])
            {
               MovieClip(param1.currentTarget).gotoAndStop(2);
            }
         }
      }
      
      public function rolloutHair(param1:MouseEvent) : void
      {
         var _loc2_:CharacterEditorScreen = this;
         var _loc3_:Number = Number(String(param1.currentTarget.name).split("thumb")[1]);
         _loc3_ += _loc2_.hairPage * _loc2_.hairPerPage;
         if(_loc3_ < _loc2_.available_hair.length)
         {
            if(_loc2_.workerData.hair != _loc2_.available_hair[_loc3_])
            {
               MovieClip(param1.currentTarget).gotoAndStop(1);
            }
         }
      }
      
      public function rolloverBangs(param1:MouseEvent) : void
      {
         var _loc2_:CharacterEditorScreen = this;
         var _loc3_:Number = Number(String(param1.currentTarget.name).split("thumb")[1]);
         _loc3_ += _loc2_.bangsPage * _loc2_.hairPerPage;
         var _loc4_:Array = _loc2_.available_bangs;
         var _loc5_:String = ClothingItem.TYPE_BANGS;
         if(_loc2_.workerData.gender == WorkerData.GENDER_MALE)
         {
            _loc4_ = _loc2_.available_facialhair;
            _loc5_ = ClothingItem.TYPE_FACIALHAIR;
         }
         if(_loc3_ < _loc4_.length)
         {
            if(_loc2_.workerData[_loc5_] != _loc4_[_loc3_])
            {
               MovieClip(param1.currentTarget).gotoAndStop(2);
            }
         }
      }
      
      public function rolloutBangs(param1:MouseEvent) : void
      {
         var _loc2_:CharacterEditorScreen = this;
         var _loc3_:Number = Number(String(param1.currentTarget.name).split("thumb")[1]);
         _loc3_ += _loc2_.bangsPage * _loc2_.hairPerPage;
         var _loc4_:Array = _loc2_.available_bangs;
         var _loc5_:String = ClothingItem.TYPE_BANGS;
         if(_loc2_.workerData.gender == WorkerData.GENDER_MALE)
         {
            _loc4_ = _loc2_.available_facialhair;
            _loc5_ = ClothingItem.TYPE_FACIALHAIR;
         }
         if(_loc3_ < _loc4_.length)
         {
            if(_loc2_.workerData[_loc5_] != _loc4_[_loc3_])
            {
               MovieClip(param1.currentTarget).gotoAndStop(1);
            }
         }
      }
      
      public function clickClothingPage(param1:MouseEvent) : void
      {
         var _loc2_:CharacterEditorScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         var _loc3_:String = String(String(param1.currentTarget.name).split("_btn")[0]);
         var _loc4_:Number = _loc2_.clothingPage + 1;
         if(_loc3_ == "prev")
         {
            _loc4_ = _loc2_.clothingPage - 1;
         }
         var _loc5_:Array = _loc2_["available_" + _loc2_.clothingMode];
         var _loc6_:Number = Math.ceil(_loc5_.length / _loc2_.clothingPerPage);
         if(_loc4_ >= _loc6_)
         {
            _loc4_ = 0;
         }
         else if(_loc4_ < 0)
         {
            _loc4_ += _loc6_;
         }
         _loc2_.clothingPage = _loc4_;
         _loc2_.populateClothingPanels();
      }
      
      public function clickClothingTab(param1:MouseEvent) : void
      {
         var _loc2_:CharacterEditorScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         var _loc3_:String = String(String(param1.currentTarget.name).split("_tab")[0]);
         MovieClip(param1.currentTarget).newstar.visible = false;
         MovieClip(param1.currentTarget).newstar.stop();
         _loc2_.gameObj.var_127.removeNewClothingFlag(_loc3_);
         _loc2_.clothingMode = _loc3_;
         _loc2_.populateClothingPanels(true);
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.clothingSectionTypes.length)
         {
            if(_loc2_.clothingSectionTypes[_loc4_] == _loc3_)
            {
               _loc2_.clip.menu.clothes[_loc2_.clothingSectionTypes[_loc4_] + "_tab"].gotoAndStop(3);
            }
            else
            {
               _loc2_.clip.menu.clothes[_loc2_.clothingSectionTypes[_loc4_] + "_tab"].gotoAndStop(1);
            }
            _loc4_++;
         }
      }
      
      public function rolloverClothingTab(param1:MouseEvent) : void
      {
         var _loc2_:CharacterEditorScreen = this;
         var _loc3_:String = String(String(param1.currentTarget.name).split("_tab")[0]);
         if(_loc3_ != _loc2_.clothingMode)
         {
            MovieClip(param1.currentTarget).gotoAndStop(2);
         }
      }
      
      public function rolloutClothingTab(param1:MouseEvent) : void
      {
         var _loc2_:CharacterEditorScreen = this;
         var _loc3_:String = String(String(param1.currentTarget.name).split("_tab")[0]);
         if(_loc3_ != _loc2_.clothingMode)
         {
            MovieClip(param1.currentTarget).gotoAndStop(1);
         }
      }
      
      public function setupClothingMenu(param1:Boolean = true) : void
      {
         var _loc3_:int = 0;
         var _loc4_:MovieClip = null;
         var _loc5_:MovieClip = null;
         var _loc2_:CharacterEditorScreen = this;
         if(param1)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc2_.clothingSectionTypes.length)
            {
               (_loc4_ = _loc2_.clip.menu.clothes[_loc2_.clothingSectionTypes[_loc3_] + "_tab"]).buttonMode = true;
               _loc4_.useHandCursor = true;
               _loc4_.mouseChildren = false;
               _loc4_.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickClothingTab);
               _loc4_.addEventListener(MouseEvent.MOUSE_OVER,_loc2_.rolloverClothingTab);
               _loc4_.addEventListener(MouseEvent.MOUSE_OUT,_loc2_.rolloutClothingTab);
               _loc4_.theme.gotoAndStop(_loc2_.gameObj.var_134.getClothingThemeFrame(_loc2_.workerData[_loc2_.clothingSectionTypes[_loc3_]],_loc2_.gameObj.var_127.getHolidayMonth()));
               _loc4_.newstar.visible = _loc2_.gameObj.var_127.hasNewClothingFlag(_loc2_.clothingSectionTypes[_loc3_]);
               if(_loc4_.newstar.visible == false)
               {
                  _loc4_.newstar.stop();
               }
               if(_loc2_.clothingSectionTypes[_loc3_] == _loc2_.clothingMode)
               {
                  _loc4_.gotoAndStop(3);
               }
               else
               {
                  _loc4_.gotoAndStop(1);
               }
               _loc3_++;
            }
            _loc2_.clip.menu.clothes.prev_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickClothingPage);
            _loc2_.clip.menu.clothes.next_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickClothingPage);
            _loc3_ = 0;
            while(_loc3_ < _loc2_.clothingPerPage)
            {
               _loc2_.clip.menu.clothes["thumb" + _loc3_].buttonMode = true;
               _loc2_.clip.menu.clothes["thumb" + _loc3_].useHandCursor = true;
               _loc2_.clip.menu.clothes["thumb" + _loc3_].mouseChildren = false;
               _loc2_.clip.menu.clothes["thumb" + _loc3_].addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickChangeClothes);
               _loc2_.clip.menu.clothes["thumb" + _loc3_].addEventListener(MouseEvent.ROLL_OVER,_loc2_.rolloverClothes);
               _loc2_.clip.menu.clothes["thumb" + _loc3_].addEventListener(MouseEvent.ROLL_OUT,_loc2_.rolloutClothes);
               _loc3_++;
            }
            _loc2_.populateClothingPanels(true);
            _loc2_.clip.menu.clothes.holidaybar.bar.mask = _loc2_.clip.menu.clothes.holidaybar.masker;
            _loc2_.updateHolidaySpirit();
         }
         else
         {
            _loc3_ = 0;
            while(_loc3_ < _loc2_.clothingSectionTypes.length)
            {
               (_loc5_ = _loc2_.clip.menu.clothes[_loc2_.clothingSectionTypes[_loc3_] + "_tab"]).removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickClothingTab);
               _loc5_.removeEventListener(MouseEvent.MOUSE_OVER,_loc2_.rolloverClothingTab);
               _loc5_.removeEventListener(MouseEvent.MOUSE_OUT,_loc2_.rolloutClothingTab);
               _loc3_++;
            }
            _loc2_.clip.menu.clothes.prev_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickClothingPage);
            _loc2_.clip.menu.clothes.next_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickClothingPage);
            _loc3_ = 0;
            while(_loc3_ < _loc2_.clothingPerPage)
            {
               _loc2_.clip.menu.clothes["thumb" + _loc3_].removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickChangeClothes);
               _loc2_.clip.menu.clothes["thumb" + _loc3_].removeEventListener(MouseEvent.ROLL_OVER,_loc2_.rolloverClothes);
               _loc2_.clip.menu.clothes["thumb" + _loc3_].removeEventListener(MouseEvent.ROLL_OUT,_loc2_.rolloutClothes);
               _loc3_++;
            }
            _loc2_.clip.menu.clothes.holidaybar.bar.mask = null;
         }
      }
      
      public function setupInterface(param1:Boolean = true) : void
      {
         var _loc3_:TextFormat = null;
         var _loc4_:TextInput = null;
         var _loc2_:CharacterEditorScreen = this;
         if(param1)
         {
            if(_loc2_.firsttime)
            {
               _loc2_.clip.menu.customize.visible = true;
               _loc2_.clip.menu.stats.visible = false;
               _loc2_.clip.menu.clothes.visible = false;
               _loc2_.clip.menu.tabs.visible = false;
               _loc2_.clip.menu.photo_btn.visible = false;
               _loc2_.clip.menu.switcher.visible = false;
               _loc2_.clip.name_txt.visible = false;
               _loc2_.clip.namerollover_btn.visible = false;
            }
            else
            {
               _loc2_.clip.menu.customize.visible = false;
               _loc2_.clip.menu.clothes.visible = false;
               _loc2_.clip.menu.stats.visible = true;
               _loc2_.clip.menu.tabs.visible = true;
               _loc2_.clip.menu.tabs.gotoAndStop("stats");
               _loc2_.clip.menu.photo_btn.visible = false;
               _loc2_.clip.menu.switcher.visible = false;
               if(_loc2_.gameObj.var_127.hasNewClothingTypes.length > 0)
               {
                  _loc2_.clip.menu.tabs.newstar.visible = true;
               }
               else
               {
                  _loc2_.clip.menu.tabs.newstar.visible = false;
                  _loc2_.clip.menu.tabs.newstar.stop();
               }
               _loc2_.clip.menu.tabs.newstar.mouseEnabled = false;
               _loc2_.clip.menu.tabs.newstar.mouseChildren = false;
               _loc2_.clip.name_txt.visible = true;
               _loc2_.clip.namerollover_btn.visible = true;
               if(_loc2_.gameObj.var_127.whichCharacter == "marty" || _loc2_.gameObj.var_127.whichCharacter == "rita")
               {
                  _loc2_.clip.menu.tabs.body_btn.visible = false;
                  _loc2_.clip.namerollover_btn.visible = false;
               }
               if(class_3.method_56() && class_1.method_82() == false)
               {
                  _loc2_.clip.namerollover_btn.visible = false;
               }
            }
            _loc2_.clip.changeNameMC.visible = false;
            _loc2_.clip.name_txt.mouseEnabled = false;
            _loc2_.clip.namerollover_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickChangeName);
            _loc2_.clip.name_txt.text = String(_loc2_.gameObj.var_127.myName);
            _loc2_.clip.name_txt.setTextFormat(_loc2_.kernFormat);
            _loc3_ = new TextFormat();
            _loc3_.font = "Arial";
            _loc3_.size = 14;
            _loc3_.bold = true;
            _loc3_.align = TextFormatAlign.CENTER;
            _loc4_ = _loc2_.clip.changeNameMC.input_txt;
            _loc2_.clip.changeNameMC.input_txt.setStyle("textFormat",_loc3_);
            _loc2_.clip.changeNameMC.input_txt.maxChars = 16;
            _loc2_.clip.changeNameMC.input_txt.restrict = "0-9A-Za-z \'\\-";
            _loc2_.clip.changeNameMC.input_txt.text = String(_loc2_.gameObj.var_127.myName);
            _loc2_.clip.menu.tabs.stats_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickSectionStats);
            _loc2_.clip.menu.tabs.clothes_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickSectionClothes);
            _loc2_.clip.menu.tabs.body_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickSectionCustomize);
            _loc2_.clip.menu.photo_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickTakePhoto);
            _loc2_.clip.poloroid.visible = false;
            _loc2_.clip.poloroid.holder.mask = _loc2_.clip.poloroid.masker;
            _loc2_.clip.poloroid.flasher.gotoAndStop(1);
            _loc2_.clip.poloroid.save_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickSavePhoto);
            _loc2_.clip.poloroid.close_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickClosePhoto);
            _loc2_.clip.menu.switcher.slider.switch_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickSwitchWorkerMode);
            if(_loc2_.gameObj.var_127.didCreateWaiter == false)
            {
               _loc2_.clip.menu.switcher.visible = false;
            }
         }
         else
         {
            _loc2_.clip.namerollover_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickChangeName);
            _loc2_.gameObj.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickScreenChangingName);
            _loc2_.gameObj.removeEventListener(KeyboardEvent.KEY_DOWN,_loc2_.keyListener);
            _loc2_.clip.menu.tabs.stats_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickSectionStats);
            _loc2_.clip.menu.tabs.clothes_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickSectionClothes);
            _loc2_.clip.menu.tabs.body_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickSectionCustomize);
            _loc2_.clip.menu.photo_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickTakePhoto);
            _loc2_.clip.poloroid.save_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickSavePhoto);
            _loc2_.clip.poloroid.close_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickClosePhoto);
            _loc2_.clip.menu.switcher.slider.switch_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickSwitchWorkerMode);
         }
      }
      
      public function setupStats(param1:Boolean = true) : void
      {
         var _loc4_:int = 0;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Boolean = false;
         var _loc12_:MovieClip = null;
         var _loc2_:CharacterEditorScreen = this;
         var _loc3_:UserData = _loc2_.gameObj.var_127;
         if(param1)
         {
            _loc2_.clip.menu.stats.xpbar.bar.mask = _loc2_.clip.menu.stats.xpbar.masker;
            _loc2_.clip.menu.stats.xpbar.bar.x = _loc3_.getCurrentPointPercentage() * 219;
            if(_loc2_.clip.menu.stats.xpbar.bar.x == 219)
            {
               _loc2_.clip.menu.stats.xpbar.bar.x = 243;
            }
            if((_loc5_ = _loc3_.getMonth()) == GameData.STARTER_MONTH && _loc3_.isNewYear() == false)
            {
               _loc5_ = 13;
            }
            _loc2_.clip.menu.stats.holiday.gotoAndStop(_loc5_);
            _loc7_ = ((_loc6_ = _loc3_.getDay()) - 1) % 7;
            _loc4_ = 0;
            while(_loc4_ <= 6)
            {
               _loc12_ = _loc2_.clip.menu.stats["day" + _loc4_];
               if(_loc4_ == 6)
               {
                  _loc12_.gotoAndStop(2);
                  _loc12_.payday.visible = true;
               }
               else
               {
                  _loc12_.payday.visible = false;
               }
               if(_loc4_ < _loc7_)
               {
                  _loc12_.circle.visible = false;
                  _loc12_.day.visible = false;
                  _loc12_.calx.visible = true;
               }
               else if(_loc4_ == _loc7_)
               {
                  _loc12_.circle.visible = true;
                  _loc12_.day.visible = true;
                  _loc12_.payday.visible = false;
                  _loc12_.calx.visible = false;
                  _loc12_.day.day_txt.text = String(_loc6_);
                  _loc12_.day.day_txt.setTextFormat(_loc2_.kernFormat);
               }
               else if(_loc4_ > _loc7_)
               {
                  _loc12_.circle.visible = false;
                  _loc12_.day.visible = false;
                  _loc12_.calx.visible = false;
               }
               _loc4_++;
            }
            _loc8_ = _loc3_.getTipsToday();
            _loc9_ = _loc3_.getTodayTotalScore();
            _loc2_.clip.menu.stats.tipstoday_txt.text = _loc3_.getTipsToday(true);
            _loc2_.clip.menu.stats.tipstotal_txt.text = _loc3_.getTipsTotal(true,true);
            _loc2_.clip.menu.stats.pointstoday_txt.text = class_12.method_114(_loc3_.getTodayTotalScore());
            _loc2_.clip.menu.stats.pointstotal_txt.text = class_12.method_114(_loc3_.getTotalPoints(true));
            _loc2_.clip.menu.stats.rank_txt.text = _loc3_.getRank();
            _loc2_.clip.menu.stats.rank_title.text = _loc3_.getRankTitle();
            if(_loc8_ == 0)
            {
               _loc2_.clip.menu.stats.tipstoday_txt.text = "--";
            }
            if(_loc9_ == 0)
            {
               _loc2_.clip.menu.stats.pointstoday_txt.text = "--";
            }
            if((_loc10_ = _loc3_.getPointsUntilNextRank(true)) < 0)
            {
               _loc10_ = 0;
            }
            _loc2_.clip.menu.stats.morepoints_txt.htmlText = "<b>" + class_12.method_114(_loc10_) + " more points to Rank " + (_loc3_.getRank() + 1) + "</b>";
            _loc2_.clip.menu.stats.wage_txt.text = _loc3_.getWeeklyWage(true);
            _loc2_.clip.menu.stats.payday_txt.text = _loc3_.getPaydayMessage();
            _loc2_.clip.menu.stats.pointstoday_txt.setTextFormat(_loc2_.kernFormat);
            _loc2_.clip.menu.stats.pointstotal_txt.setTextFormat(_loc2_.kernFormat);
            _loc2_.clip.menu.stats.tipstoday_txt.setTextFormat(_loc2_.kernFormat);
            _loc2_.clip.menu.stats.tipstotal_txt.setTextFormat(_loc2_.kernFormat);
            _loc2_.clip.menu.stats.rank_txt.setTextFormat(_loc2_.kernFormat);
            _loc2_.clip.menu.stats.rank_title.setTextFormat(_loc2_.kernFormat);
            _loc2_.clip.menu.stats.morepoints_txt.setTextFormat(_loc2_.kernFormat);
            _loc2_.clip.menu.stats.wage_txt.setTextFormat(_loc2_.kernFormat);
            _loc2_.clip.menu.stats.payday_txt.setTextFormat(_loc2_.kernFormat);
            _loc11_ = true;
            if(_loc2_.inMenu)
            {
               _loc11_ = false;
            }
            if(class_3.method_56() && class_1.method_92() == false)
            {
               _loc11_ = false;
            }
            if(_loc11_)
            {
               if(_loc3_.didClickFacebook == false)
               {
                  _loc2_.clip.menu.stats.bonus.facebook_btn.visible = true;
                  _loc2_.clip.menu.stats.bonus.twitter_btn.visible = false;
               }
               else if(_loc3_.didClickTwitter == false)
               {
                  _loc2_.clip.menu.stats.bonus.facebook_btn.visible = false;
                  _loc2_.clip.menu.stats.bonus.twitter_btn.visible = true;
               }
               if(_loc3_.didClickFacebook && _loc3_.didClickTwitter)
               {
                  _loc2_.clip.menu.stats.bonus.visible = false;
               }
               else
               {
                  _loc2_.clip.menu.stats.bonus.visible = true;
               }
            }
            else
            {
               _loc2_.clip.menu.stats.bonus.visible = false;
            }
            _loc2_.clip.menu.stats.bonus.facebook_btn.addEventListener(MouseEvent.CLICK,_loc2_.clickBonusFacebook);
            _loc2_.clip.menu.stats.bonus.twitter_btn.addEventListener(MouseEvent.CLICK,_loc2_.clickBonusTwitter);
            _loc2_.clip.menu.stats.changespecial_btn.addEventListener(MouseEvent.CLICK,_loc2_.clickChangeSpecial);
            _loc2_.clip.menu.stats.viewspecial_btn.addEventListener(MouseEvent.CLICK,_loc2_.clickViewSpecial);
            _loc2_.clip.menu.stats.trainspecial.visible = false;
            _loc2_.clip.menu.stats.trainspecial.icon.stop();
            _loc2_.clip.menu.stats.trainspecial.arrow.stop();
            if(_loc2_.gameObj.var_127.currentSpecial != -1)
            {
               _loc2_.clip.menu.stats.nospecial.visible = false;
               _loc2_.specialBitmap = new Bitmap(_loc2_.gameObj.var_132.getSpecialLogo(_loc2_.gameObj.var_127.currentSpecial),"auto",true);
               _loc2_.specialBitmap.scaleX = 0.72;
               _loc2_.specialBitmap.scaleY = 0.72;
               _loc2_.specialBitmapMC = new MovieClip();
               _loc2_.specialBitmapMC.addChild(_loc2_.specialBitmap);
               _loc2_.specialBitmapMC.x = 289;
               _loc2_.specialBitmapMC.y = 45;
               _loc2_.clip.menu.stats.addChild(_loc2_.specialBitmapMC);
               _loc2_.specialBitmapMC.buttonMode = true;
               _loc2_.specialBitmapMC.useHandCursor = true;
               _loc2_.specialBitmapMC.addEventListener(MouseEvent.CLICK,_loc2_.clickViewSpecial);
               if(_loc3_.getSpecialStars(_loc2_.gameObj.var_127.currentSpecial) >= _loc3_.starsToMasterSpecial)
               {
                  _loc2_.clip.menu.stats.masteredspecial.visible = true;
               }
               else
               {
                  _loc2_.clip.menu.stats.masteredspecial.visible = false;
               }
            }
            else
            {
               _loc2_.clip.menu.stats.nospecial.visible = true;
               if(_loc2_.gameObj.var_127.hasAnySpecials() == false)
               {
                  _loc2_.clip.menu.stats.changespecial_btn.visible = false;
                  _loc2_.clip.menu.stats.viewspecial_btn.visible = false;
               }
               else
               {
                  _loc2_.clip.menu.stats.viewspecial_btn.visible = false;
                  _loc2_.clip.menu.stats.changespecial_btn.x = 317;
                  if(_loc2_.inMenu == false && _loc2_.gameObj.var_127.hasTrained("openspecial") == false)
                  {
                     _loc2_.clip.menu.stats.trainspecial.visible = true;
                     _loc2_.clip.menu.stats.trainspecial.icon.play();
                     _loc2_.clip.menu.stats.trainspecial.arrow.play();
                  }
               }
               _loc2_.clip.menu.stats.masteredspecial.visible = false;
            }
            if(_loc2_.inMenu)
            {
               _loc2_.clip.menu.stats.changespecial_btn.visible = false;
               _loc2_.clip.menu.stats.viewspecial_btn.x = 317;
            }
            if(_loc2_.gameObj.var_127.hasNewSpecials() && !_loc2_.inMenu)
            {
               _loc2_.clip.menu.stats.newspecial.visible = true;
               _loc2_.clip.menu.stats.newspecial.mouseEnabled = false;
               _loc2_.clip.menu.stats.newspecial.mouseChildren = false;
            }
            else
            {
               _loc2_.clip.menu.stats.newspecial.stop();
               _loc2_.clip.menu.stats.newspecial.visible = false;
            }
            _loc2_.gameObj.var_130.api.addEventListener("updateSpecial",_loc2_.updateSpecialDisplayListener);
         }
         else
         {
            _loc2_.gameObj.var_130.api.removeEventListener("updateSpecial",_loc2_.updateSpecialDisplayListener);
            _loc2_.clip.menu.stats.bonus.facebook_btn.removeEventListener(MouseEvent.CLICK,_loc2_.clickBonusFacebook);
            _loc2_.clip.menu.stats.bonus.twitter_btn.removeEventListener(MouseEvent.CLICK,_loc2_.clickBonusTwitter);
            _loc2_.clip.menu.stats.changespecial_btn.removeEventListener(MouseEvent.CLICK,_loc2_.clickChangeSpecial);
            _loc2_.clip.menu.stats.viewspecial_btn.removeEventListener(MouseEvent.CLICK,_loc2_.clickViewSpecial);
            if(_loc2_.specialBitmap)
            {
               if(_loc2_.specialBitmap.parent)
               {
                  _loc2_.specialBitmap.parent.removeChild(_loc2_.specialBitmap);
               }
               _loc2_.specialBitmap.bitmapData = null;
               _loc2_.specialBitmap = null;
            }
            if(_loc2_.specialBitmapMC)
            {
               _loc2_.specialBitmapMC.removeEventListener(MouseEvent.CLICK,_loc2_.clickViewSpecial);
               if(_loc2_.specialBitmapMC.parent)
               {
                  _loc2_.specialBitmapMC.parent.removeChild(_loc2_.specialBitmapMC);
               }
               _loc2_.specialBitmapMC = null;
            }
         }
      }
      
      public function updateSpecialDisplayListener(param1:Event) : void
      {
         var _loc2_:CharacterEditorScreen = this;
         class_6.method_1("EDITOR - STATS - SHOULD UPDATE SPECIAL DISPLAY when you return.");
         _loc2_.shouldUpdateSpecialDisplay = true;
      }
      
      public function updateSpecialDisplay() : void
      {
         var _loc1_:CharacterEditorScreen = this;
         var _loc2_:UserData = _loc1_.gameObj.var_127;
         class_6.method_1("EDITOR - STATS - UPDATE SPECIAL DISPLAY");
         _loc1_.clip.menu.stats.changespecial_btn.mouseEnabled = true;
         _loc1_.clip.menu.stats.viewspecial_btn.mouseEnabled = true;
         _loc1_.clip.menu.stats.trainspecial.visible = false;
         _loc1_.clip.menu.stats.trainspecial.icon.stop();
         _loc1_.clip.menu.stats.trainspecial.arrow.stop();
         if(_loc1_.specialBitmap)
         {
            if(_loc1_.specialBitmap.parent)
            {
               _loc1_.specialBitmap.parent.removeChild(_loc1_.specialBitmap);
            }
            _loc1_.specialBitmap.bitmapData = null;
            _loc1_.specialBitmap = null;
         }
         if(_loc1_.specialBitmapMC)
         {
            _loc1_.specialBitmapMC.removeEventListener(MouseEvent.CLICK,_loc1_.clickViewSpecial);
            if(_loc1_.specialBitmapMC.parent)
            {
               _loc1_.specialBitmapMC.parent.removeChild(_loc1_.specialBitmapMC);
            }
            _loc1_.specialBitmapMC = null;
         }
         if(_loc1_.gameObj.var_127.currentSpecial != -1)
         {
            _loc1_.clip.menu.stats.nospecial.visible = false;
            _loc1_.specialBitmap = new Bitmap(_loc1_.gameObj.var_132.getSpecialLogo(_loc1_.gameObj.var_127.currentSpecial),"auto",true);
            _loc1_.specialBitmap.scaleX = 0.72;
            _loc1_.specialBitmap.scaleY = 0.72;
            _loc1_.specialBitmapMC = new MovieClip();
            _loc1_.specialBitmapMC.addChild(_loc1_.specialBitmap);
            _loc1_.specialBitmapMC.x = 289;
            _loc1_.specialBitmapMC.y = 45;
            _loc1_.clip.menu.stats.addChild(_loc1_.specialBitmapMC);
            _loc1_.specialBitmapMC.buttonMode = true;
            _loc1_.specialBitmapMC.useHandCursor = true;
            _loc1_.specialBitmapMC.addEventListener(MouseEvent.CLICK,_loc1_.clickViewSpecial);
            if(_loc2_.getSpecialStars(_loc1_.gameObj.var_127.currentSpecial) >= _loc2_.starsToMasterSpecial)
            {
               _loc1_.clip.menu.stats.masteredspecial.visible = true;
            }
            else
            {
               _loc1_.clip.menu.stats.masteredspecial.visible = false;
            }
            _loc1_.clip.menu.stats.viewspecial_btn.visible = true;
            _loc1_.clip.menu.stats.changespecial_btn.x = 285;
         }
         else
         {
            _loc1_.clip.menu.stats.nospecial.visible = true;
            if(_loc1_.gameObj.var_127.hasAnySpecials() == false)
            {
               _loc1_.clip.menu.stats.changespecial_btn.visible = false;
               _loc1_.clip.menu.stats.viewspecial_btn.visible = false;
            }
            else
            {
               _loc1_.clip.menu.stats.viewspecial_btn.visible = false;
               _loc1_.clip.menu.stats.changespecial_btn.x = 317;
               if(_loc1_.inMenu == false && _loc1_.gameObj.var_127.hasTrained("openspecial") == false)
               {
                  _loc1_.clip.menu.stats.trainspecial.visible = true;
                  _loc1_.clip.menu.stats.trainspecial.icon.play();
                  _loc1_.clip.menu.stats.trainspecial.arrow.play();
               }
            }
            _loc1_.clip.menu.stats.masteredspecial.visible = false;
         }
         if(_loc1_.inMenu)
         {
            _loc1_.clip.menu.stats.changespecial_btn.visible = false;
            _loc1_.clip.menu.stats.viewspecial_btn.x = 317;
         }
         if(_loc1_.gameObj.var_127.hasNewSpecials() && !_loc1_.inMenu)
         {
            _loc1_.clip.menu.stats.newspecial.visible = true;
            _loc1_.clip.menu.stats.newspecial.mouseEnabled = false;
            _loc1_.clip.menu.stats.newspecial.mouseChildren = false;
         }
         else
         {
            _loc1_.clip.menu.stats.newspecial.stop();
            _loc1_.clip.menu.stats.newspecial.visible = false;
         }
      }
      
      public function clickViewSpecial(param1:MouseEvent = null) : void
      {
         var _loc2_:CharacterEditorScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.gameObj.method_195(false);
      }
      
      public function clickChangeSpecial(param1:MouseEvent = null) : void
      {
         var _loc2_:CharacterEditorScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.gameObj.var_130.api.method_132("clickCookbook");
         _loc2_.clip.menu.stats.changespecial_btn.mouseEnabled = false;
         _loc2_.clip.menu.stats.viewspecial_btn.mouseEnabled = false;
         _loc2_.gameObj.var_127.setTrained("openspecial");
      }
      
      private function createColorTransform(param1:Number) : ColorTransform
      {
         var _loc2_:ColorTransform = new ColorTransform();
         _loc2_.redMultiplier = ((param1 & 16711680) >>> 16) / 255;
         _loc2_.greenMultiplier = ((param1 & 65280) >>> 8) / 255;
         _loc2_.blueMultiplier = (param1 & 255) / 255;
         return _loc2_;
      }
      
      private function createLobbyBackdropBitmap() : Bitmap
      {
         var _loc4_:Number = NaN;
         var _loc1_:CharacterEditorScreen = this;
         var _loc2_:UserData = _loc1_.gameObj.var_127;
         var _loc3_:Bitmap = null;
         var _loc5_:MovieClip = new nowindowBackdropMC();
         var _loc6_:Number = 1;
         var _loc7_:Number = 1;
         if(!_loc1_.firsttime || _loc1_.firstwaiter)
         {
            _loc6_ = _loc2_.lobbyWallpaper;
            _loc7_ = _loc2_.lobbyFlooring;
         }
         _loc4_ = 1;
         while(_loc4_ <= 9)
         {
            _loc5_.holder.wallparts["wall" + _loc4_].gotoAndStop(_loc6_);
            _loc4_++;
         }
         _loc4_ = 1;
         while(_loc4_ <= 7)
         {
            _loc5_.holder.floorparts["floor" + _loc4_].gotoAndStop(_loc7_);
            _loc4_++;
         }
         _loc5_.holder.trim.transform.colorTransform = _loc1_.createColorTransform(_loc2_.lobbyTrim);
         _loc5_.holder.wallparts.mask = _loc5_.holder.wallmask;
         _loc5_.holder.floorparts.mask = _loc5_.holder.floormask;
         var _loc8_:BitmapData;
         (_loc8_ = new BitmapData(706,552,true,0)).draw(_loc5_,null,null,null,new Rectangle(0,0,706,552));
         _loc3_ = new Bitmap(_loc8_);
         _loc5_ = null;
         return _loc3_;
      }
      
      public function createBackdrop() : void
      {
         var _loc1_:CharacterEditorScreen = this;
         if(_loc1_.backdropBitmap != null)
         {
            _loc1_.backdropBitmap.bitmapData.dispose();
            try
            {
               _loc1_.clip.bgholder.removeChild(_loc1_.backdropBitmap);
            }
            catch(err:Error)
            {
            }
            _loc1_.backdropBitmap = null;
         }
         _loc1_.backdropBitmap = _loc1_.createLobbyBackdropBitmap();
         _loc1_.clip.bgholder.addChild(_loc1_.backdropBitmap);
         _loc1_.clip.bgholder.mask = _loc1_.clip.bgmask;
         _loc1_.backdropBitmap.x = -3;
         _loc1_.backdropBitmap.y = -20;
         var _loc2_:BitmapData = new BitmapData(100,270,false,4294967295);
         _loc2_.copyPixels(_loc1_.backdropBitmap.bitmapData,new Rectangle(33,80,100,270),new Point(0,0));
         _loc2_.colorTransform(_loc2_.rect,new ColorTransform(1,1,1,1,100,100,100,0));
         _loc1_.mirrorBitmap = new Bitmap(_loc2_);
         _loc1_.mirrorBitmap.smoothing = true;
         var _loc3_:Matrix = new Matrix();
         _loc3_.b = 0.25;
         _loc3_.ty = 25;
         _loc1_.mirrorBitmap.transform.matrix = _loc3_;
         _loc1_.clip.mirrorbgholder.addChild(_loc1_.mirrorBitmap);
      }
      
      public function clickTakePhoto(param1:MouseEvent) : void
      {
         var _loc2_:CharacterEditorScreen = this;
         if(_loc2_.photoBitmap)
         {
            _loc2_.photoBitmap.bitmapData.dispose();
            _loc2_.photoBitmap.parent.removeChild(_loc2_.photoBitmap);
            _loc2_.photoBitmap = null;
         }
         var _loc3_:MovieClip = new MovieClip();
         var _loc4_:BitmapData = _loc2_.backdropBitmap.bitmapData;
         var _loc5_:Bitmap = new Bitmap(_loc4_);
         _loc3_.addChild(_loc5_);
         _loc5_.x = -300;
         var _loc6_:MovieClip;
         (_loc6_ = new MovieClip()).graphics.beginFill(0,0.25);
         _loc6_.graphics.drawCircle(0,0,55);
         _loc6_.graphics.endFill();
         _loc6_.scaleY = 0.55;
         _loc6_.x = 144;
         _loc6_.y = 328;
         _loc3_.addChild(_loc6_);
         var _loc7_:Worker = new Worker(_loc2_.gameObj,_loc3_,_loc2_.workerData,80,60,0.9);
         var _loc8_:BitmapData;
         (_loc8_ = new BitmapData(315,370,false,4278190080)).draw(_loc3_,null,null,null,new Rectangle(0,0,315,370),true);
         _loc2_.photoBitmap = new Bitmap(_loc8_,"auto",true);
         _loc2_.clip.poloroid.holder.addChild(_loc2_.photoBitmap);
         _loc2_.photoBitmap.scaleX = 0.8;
         _loc2_.photoBitmap.scaleY = 0.8;
         _loc2_.photoBitmap.x = -14;
         _loc2_.photoBitmap.y = 0;
         _loc2_.clip.poloroid.visible = true;
         _loc2_.clip.poloroid.flasher.gotoAndPlay(2);
         _loc2_.clip.poloroid.fader.gotoAndPlay(2);
         _loc2_.gameObj.var_128.playSound("takephoto.wav");
      }
      
      public function clickSavePhoto(param1:MouseEvent) : void
      {
         var jpgEncoder:class_13 = null;
         var byteArray:ByteArray = null;
         var useName:String = null;
         var fileReference:FileReference = null;
         var e:MouseEvent = param1;
         var screen:CharacterEditorScreen = this;
         var saveBMP:BitmapData = screen.photoBitmap.bitmapData.clone();
         var logomc:MovieClip = new poloroid_logo();
         var logobmp:BitmapData = new BitmapData(saveBMP.width,saveBMP.height,true,0);
         logobmp.draw(logomc);
         saveBMP.copyPixels(logobmp,logobmp.rect,new Point(0,0),null,null,true);
         logobmp.dispose();
         logobmp = null;
         try
         {
            jpgEncoder = new class_13(90);
            byteArray = jpgEncoder.method_235(saveBMP);
            useName = screen.gameObj.var_127.myName;
            if(screen.whichMode == "waiter")
            {
               useName = screen.gameObj.var_127.waiterName;
            }
            fileReference = new FileReference();
            fileReference.save(byteArray,useName + ".jpg");
         }
         catch(err:Error)
         {
            class_6.error("Error saving photo: " + err.message);
         }
         screen.clip.poloroid.visible = false;
      }
      
      public function clickClosePhoto(param1:MouseEvent) : void
      {
         var _loc2_:CharacterEditorScreen = this;
         _loc2_.clip.poloroid.visible = false;
      }
      
      public function clickSwitchWorkerMode(param1:MouseEvent) : void
      {
         var _loc2_:CharacterEditorScreen = this;
         if(!_loc2_.isRunning)
         {
            if(_loc2_.clip.menu.switcher.slider.currentFrame == 1 || _loc2_.clip.menu.switcher.slider.currentFrame == _loc2_.clip.menu.switcher.slider.totalFrames)
            {
               if(_loc2_.whichMode == "worker")
               {
                  _loc2_.switchWorkerMode("waiter");
               }
               else
               {
                  _loc2_.switchWorkerMode("worker");
               }
               _loc2_.gameObj.var_128.playSound("buttonclick.wav");
            }
         }
      }
      
      public function switchWorkerMode(param1:String) : void
      {
         var _loc4_:String = null;
         var _loc5_:MovieClip = null;
         var _loc2_:CharacterEditorScreen = this;
         if(_loc2_.didClickChangeName)
         {
            if((_loc4_ = String(_loc2_.clip.changeNameMC.input_txt.text)) != "" && _loc4_ != " " && _loc4_ != "  " && _loc4_ != "   ")
            {
               if(_loc2_.whichMode == "worker")
               {
                  _loc2_.gameObj.var_127.myName = _loc4_;
               }
               else if(_loc2_.whichMode == "waiter")
               {
                  _loc2_.gameObj.var_127.waiterName = _loc4_;
               }
            }
         }
         _loc2_.whichMode = param1;
         _loc2_.updateModeToggle();
         if(_loc2_.whichMode == "worker")
         {
            _loc2_.workerData = _loc2_.gameObj.workerData;
         }
         else if(_loc2_.whichMode == "waiter")
         {
            _loc2_.workerData = _loc2_.gameObj.var_143;
         }
         if(_loc2_.whichMode == "worker")
         {
            if(_loc2_.gameObj.var_127.whichCharacter == "marty" || _loc2_.gameObj.var_127.whichCharacter == "rita")
            {
               _loc2_.clip.menu.tabs.body_btn.visible = false;
               _loc2_.clip.namerollover_btn.visible = false;
               if(_loc2_.clip.menu.customize.visible == true)
               {
                  _loc2_.clickSectionClothes(null);
               }
            }
            else
            {
               _loc2_.clip.menu.tabs.body_btn.visible = true;
               _loc2_.clip.namerollover_btn.visible = true;
               if(class_3.method_56() && class_1.method_82() == false)
               {
                  _loc2_.clip.namerollover_btn.visible = false;
               }
            }
         }
         else if(_loc2_.whichMode == "waiter")
         {
            if(_loc2_.gameObj.var_127.whichWaiter == "marty" || _loc2_.gameObj.var_127.whichWaiter == "rita")
            {
               _loc2_.clip.menu.tabs.body_btn.visible = false;
               _loc2_.clip.namerollover_btn.visible = false;
               if(_loc2_.clip.menu.customize.visible == true)
               {
                  _loc2_.clickSectionClothes(null);
               }
            }
            else
            {
               _loc2_.clip.menu.tabs.body_btn.visible = true;
               _loc2_.clip.namerollover_btn.visible = true;
               if(class_3.method_56() && class_1.method_82() == false)
               {
                  _loc2_.clip.namerollover_btn.visible = false;
               }
            }
         }
         _loc2_.getAvailableClothing();
         _loc2_.populateCustomizePanels();
         _loc2_.updatePaletteSelection();
         _loc2_.populateClothingPanels(true);
         _loc2_.updateHolidaySpirit();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.clothingSectionTypes.length)
         {
            (_loc5_ = _loc2_.clip.menu.clothes[_loc2_.clothingSectionTypes[_loc3_] + "_tab"]).theme.gotoAndStop(_loc2_.gameObj.var_134.getClothingThemeFrame(_loc2_.workerData[_loc2_.clothingSectionTypes[_loc3_]],_loc2_.gameObj.var_127.getHolidayMonth()));
            _loc3_++;
         }
         if(_loc2_.whichMode == "worker")
         {
            _loc2_.clip.name_txt.text = _loc2_.gameObj.var_127.myName;
            _loc2_.clip.changeNameMC.input_txt.text = _loc2_.gameObj.var_127.myName;
         }
         else if(_loc2_.whichMode == "waiter")
         {
            _loc2_.clip.name_txt.text = _loc2_.gameObj.var_127.waiterName;
            _loc2_.clip.changeNameMC.input_txt.text = _loc2_.gameObj.var_127.waiterName;
         }
         _loc2_.clip.name_txt.setTextFormat(_loc2_.kernFormat);
         if(_loc2_.worker)
         {
            if(_loc2_.leavingWorker)
            {
               _loc2_.leavingWorker.destroy();
               _loc2_.leavingWorker = null;
            }
            _loc2_.leavingWorker = _loc2_.worker;
            _loc2_.leavingWorker.playAnimation("run");
            _loc2_.worker = null;
         }
         if(_loc2_.workerReverse)
         {
            if(_loc2_.leavingWorkerReverse)
            {
               _loc2_.leavingWorkerReverse.destroy();
               _loc2_.leavingWorkerReverse = null;
            }
            _loc2_.leavingWorkerReverse = _loc2_.workerReverse;
            _loc2_.leavingWorkerReverse.playAnimation("runreverse");
            _loc2_.workerReverse = null;
         }
         _loc2_.worker = new Worker(_loc2_.gameObj,_loc2_.clip.holder,_loc2_.workerData,_loc2_.leavingWorker.clip.x + _loc2_.workerStartOffset,_loc2_.workerY,_loc2_.workerScale,false,true);
         _loc2_.workerReverse = new Worker(_loc2_.gameObj,_loc2_.clip.mirror_holder,_loc2_.workerData,_loc2_.leavingWorkerReverse.clip.x + _loc2_.workerStartOffset,_loc2_.workerReverseY,_loc2_.workerScale,true,true);
         _loc2_.isRunning = true;
         _loc2_.worker.playAnimation("run");
         _loc2_.workerReverse.playAnimation("runreverse");
         _loc2_.worker.addShadow();
         _loc2_.workerReverse.addShadow();
      }
      
      public function updateModeToggle() : void
      {
         var _loc1_:CharacterEditorScreen = this;
         if(_loc1_.whichMode == "worker")
         {
            if(_loc1_.clip.menu.switcher.slider.currentFrame > 1)
            {
               _loc1_.clip.menu.switcher.slider.prevFrame();
            }
         }
         else if(_loc1_.whichMode == "waiter")
         {
            if(_loc1_.clip.menu.switcher.slider.currentFrame < _loc1_.clip.menu.switcher.slider.totalFrames)
            {
               _loc1_.clip.menu.switcher.slider.nextFrame();
            }
         }
      }
      
      public function populateCustomizePanels() : void
      {
         var _loc2_:Number = NaN;
         var _loc1_:CharacterEditorScreen = this;
         _loc1_.clip.menu.customize.eyeheight_panel.slider.x = _loc1_.sliderStartX + (_loc1_.workerData.eyeHeight - WorkerData.EYE_HEIGHT_MIN) / (WorkerData.EYE_HEIGHT_MAX - WorkerData.EYE_HEIGHT_MIN) * _loc1_.sliderRange;
         _loc1_.clip.menu.customize.eyespacing_panel.slider.x = _loc1_.sliderStartX + (_loc1_.workerData.eyeSpacing - WorkerData.EYE_SPACING_MIN) / (WorkerData.EYE_SPACING_MAX - WorkerData.EYE_SPACING_MIN) * _loc1_.sliderRange;
         _loc1_.clip.menu.customize.mouthheight_panel.slider.x = _loc1_.sliderStartX + (_loc1_.workerData.mouthHeight - WorkerData.MOUTH_HEIGHT_MIN) / (WorkerData.MOUTH_HEIGHT_MAX - WorkerData.MOUTH_HEIGHT_MIN) * _loc1_.sliderRange;
         _loc1_.clip.menu.customize.headforward_panel.slider.x = _loc1_.sliderStartX + (_loc1_.workerData.headForward - WorkerData.HEAD_FORWARD_MIN) / (WorkerData.HEAD_FORWARD_MAX - WorkerData.HEAD_FORWARD_MIN) * _loc1_.sliderRange;
         _loc1_.clip.menu.customize.headscale_panel.slider.x = _loc1_.sliderStartX + (_loc1_.workerData.headScale - WorkerData.HEAD_SCALE_MIN) / (WorkerData.HEAD_SCALE_MAX - WorkerData.HEAD_SCALE_MIN) * _loc1_.sliderRange;
         _loc1_.clip.menu.customize.headheight_panel.slider.x = _loc1_.sliderStartX + (_loc1_.workerData.headHeight - WorkerData.HEAD_HEIGHT_MIN) / (WorkerData.HEAD_HEIGHT_MAX - WorkerData.HEAD_HEIGHT_MIN) * _loc1_.sliderRange;
         _loc1_.clip.menu.customize.weight_panel.slider.x = _loc1_.sliderStartX + (_loc1_.workerData.weightScale - WorkerData.WEIGHT_SCALE_MIN) / (WorkerData.WEIGHT_SCALE_MAX - WorkerData.WEIGHT_SCALE_MIN) * _loc1_.sliderRange;
         _loc2_ = _loc1_.workerData.eyeStyle;
         _loc1_.clip.menu.customize.eyetype_panel.amount_txt.text = String(_loc2_ + "/" + WorkerData.EYE_STYLE_MAX * WorkerData.eyeColorOptionsDark.length);
         _loc2_ = WorkerData.eyeDefaultOptions.indexOf(_loc1_.workerData.eyeDefaultExpression);
         _loc1_.clip.menu.customize.eyedefault_panel.amount_txt.text = String(_loc2_ + 1 + "/" + WorkerData.eyeDefaultOptions.length);
         _loc2_ = _loc1_.workerData.mouthDefaultExpression;
         _loc1_.clip.menu.customize.mouthdefault_panel.amount_txt.text = String(_loc2_ + "/" + WorkerData.MOUTH_DEFAULT_MAX);
         _loc2_ = _loc1_.available_accd.indexOf(_loc1_.workerData.accd);
         _loc1_.clip.menu.customize.accd_panel.amount_txt.text = String(_loc2_ + 1 + "/" + _loc1_.available_accd.length);
         _loc1_.clip.menu.customize.haircolor_swatch.transform.colorTransform = _loc1_.createColorTransform(_loc1_.workerData.hairColor);
         _loc1_.clip.menu.customize.skincolor_swatch.transform.colorTransform = _loc1_.createColorTransform(_loc1_.workerData.skinTone);
         _loc1_.populateHairPanels(true);
         _loc1_.populateBangsPanels(true);
      }
      
      public function populateHairPanels(param1:Boolean = false) : void
      {
         var totalPages:Number;
         var maxDots:Number;
         var i:int = 0;
         var currentIndex:Number = NaN;
         var panelIndex:Number = NaN;
         var panel:MovieClip = null;
         var sku:String = null;
         var newThumb:MovieClip = null;
         var reset:Boolean = param1;
         var screen:CharacterEditorScreen = this;
         if(reset)
         {
            currentIndex = screen.available_hair.indexOf(screen.workerData.hair);
            if(currentIndex > -1)
            {
               screen.hairPage = Math.floor(currentIndex / screen.hairPerPage);
            }
         }
         totalPages = Math.ceil(screen.available_hair.length / screen.hairPerPage);
         maxDots = 10;
         i = 0;
         while(i < maxDots)
         {
            if(i == screen.hairPage)
            {
               screen.clip.menu.customize.hairpanel.hair_panel["dot" + i].visible = true;
               screen.clip.menu.customize.hairpanel.hair_panel["dot" + i].gotoAndStop(2);
            }
            else if(i < totalPages)
            {
               screen.clip.menu.customize.hairpanel.hair_panel["dot" + i].visible = true;
               screen.clip.menu.customize.hairpanel.hair_panel["dot" + i].gotoAndStop(1);
            }
            else
            {
               screen.clip.menu.customize.hairpanel.hair_panel["dot" + i].visible = false;
               screen.clip.menu.customize.hairpanel.hair_panel["dot" + i].gotoAndStop(1);
            }
            i++;
         }
         i = 0;
         while(i < screen.hairPerPage)
         {
            panelIndex = screen.hairPage * screen.hairPerPage + i;
            panel = screen.clip.menu.customize.hairpanel.hair_panel["thumb" + i];
            try
            {
               if(panel.thumb.numChildren > 0)
               {
                  panel.thumb.removeChildAt(0);
               }
            }
            catch(err:Error)
            {
               class_6.error("Error removing hair thumb.");
            }
            if(panelIndex < screen.available_hair.length)
            {
               sku = String(screen.available_hair[panelIndex]);
               newThumb = screen.gameObj.var_134.generateClothingThumb(sku,screen.workerData.gender,20,20,36,36,screen.workerData.hairColor);
               panel.thumb.addChild(newThumb);
               panel.mouseEnabled = true;
               newThumb.cacheAsBitmap = true;
               if(screen.workerData.hair == sku)
               {
                  panel.gotoAndStop(3);
               }
               else
               {
                  panel.gotoAndStop(1);
               }
            }
            else
            {
               panel.mouseEnabled = false;
               panel.mouseChildren = false;
               panel.gotoAndStop(4);
            }
            i++;
         }
      }
      
      public function populateBangsPanels(param1:Boolean = false) : void
      {
         var totalPages:Number;
         var maxDots:Number;
         var currentIndex:Number = NaN;
         var i:int = 0;
         var useArray:Array = null;
         var useVar:String = null;
         var panelIndex:Number = NaN;
         var panel:MovieClip = null;
         var sku:String = null;
         var useColor:uint = 0;
         var newThumb:MovieClip = null;
         var reset:Boolean = param1;
         var screen:CharacterEditorScreen = this;
         if(screen.workerData.gender == WorkerData.GENDER_FEMALE)
         {
            useArray = screen.available_bangs;
            useVar = ClothingItem.TYPE_BANGS;
         }
         else
         {
            useArray = screen.available_facialhair;
            useVar = ClothingItem.TYPE_FACIALHAIR;
         }
         if(reset)
         {
            if(screen.workerData.gender == WorkerData.GENDER_FEMALE)
            {
               currentIndex = screen.available_bangs.indexOf(screen.workerData.bangs);
               if(currentIndex > -1)
               {
                  screen.bangsPage = Math.floor(currentIndex / screen.hairPerPage);
               }
               if(screen.gameObj.var_134.clothingHasOption(screen.workerData.hair,ClothingItem.OPTIONS_SUPPORTS_BANGS))
               {
                  screen.clip.menu.customize.hairpanel.bang_panel.notsupported.visible = false;
               }
               else
               {
                  screen.clip.menu.customize.hairpanel.bang_panel.notsupported.visible = true;
               }
            }
            else
            {
               currentIndex = screen.available_facialhair.indexOf(screen.workerData.facialhair);
               if(currentIndex > -1)
               {
                  screen.bangsPage = Math.floor(currentIndex / screen.hairPerPage);
               }
               screen.clip.menu.customize.hairpanel.bang_panel.notsupported.visible = false;
            }
         }
         totalPages = Math.ceil(useArray.length / screen.hairPerPage);
         maxDots = 10;
         i = 0;
         while(i < maxDots)
         {
            if(i == screen.bangsPage)
            {
               screen.clip.menu.customize.hairpanel.bang_panel["dot" + i].visible = true;
               screen.clip.menu.customize.hairpanel.bang_panel["dot" + i].gotoAndStop(2);
            }
            else if(i < totalPages)
            {
               screen.clip.menu.customize.hairpanel.bang_panel["dot" + i].visible = true;
               screen.clip.menu.customize.hairpanel.bang_panel["dot" + i].gotoAndStop(1);
            }
            else
            {
               screen.clip.menu.customize.hairpanel.bang_panel["dot" + i].visible = false;
               screen.clip.menu.customize.hairpanel.bang_panel["dot" + i].gotoAndStop(1);
            }
            i++;
         }
         i = 0;
         while(i < screen.hairPerPage)
         {
            panelIndex = screen.bangsPage * screen.hairPerPage + i;
            panel = screen.clip.menu.customize.hairpanel.bang_panel["thumb" + i];
            try
            {
               if(panel.thumb.numChildren > 0)
               {
                  panel.thumb.removeChildAt(0);
               }
            }
            catch(err:Error)
            {
               class_6.error("Error removing hair thumb.");
            }
            if(panelIndex < useArray.length)
            {
               sku = String(useArray[panelIndex]);
               useColor = screen.workerData.getHairColor();
               if(screen.workerData.gender == WorkerData.GENDER_MALE)
               {
                  useColor = screen.workerData.getFacialHairColor();
               }
               newThumb = screen.gameObj.var_134.generateClothingThumb(sku,screen.workerData.gender,20,20,36,36,useColor);
               panel.thumb.addChild(newThumb);
               panel.mouseEnabled = true;
               newThumb.cacheAsBitmap = true;
               if(screen.workerData[useVar] == sku)
               {
                  panel.gotoAndStop(3);
               }
               else
               {
                  panel.gotoAndStop(1);
               }
            }
            else
            {
               panel.mouseEnabled = false;
               panel.mouseChildren = false;
               panel.gotoAndStop(4);
            }
            i++;
         }
         if(screen.workerData.gender == WorkerData.GENDER_FEMALE)
         {
            screen.clip.menu.customize.hairpanel.label_txt.text = "BANG STYLE";
         }
         else
         {
            screen.clip.menu.customize.hairpanel.label_txt.text = "FACIAL HAIR";
         }
      }
      
      public function populateClothingPanels(param1:Boolean = false) : void
      {
         var totalPages:Number;
         var i:int = 0;
         var currentIndex:Number = NaN;
         var panelIndex:Number = NaN;
         var panel:MovieClip = null;
         var sku:String = null;
         var newThumb:MovieClip = null;
         var reset:Boolean = param1;
         var screen:CharacterEditorScreen = this;
         var useArray:Array = screen["available_" + screen.clothingMode];
         var useVar:String = screen.clothingMode;
         if(reset)
         {
            currentIndex = useArray.indexOf(screen.workerData[useVar]);
            if(currentIndex > -1)
            {
               screen.clothingPage = Math.floor(currentIndex / screen.clothingPerPage);
            }
         }
         i = 0;
         while(i < screen.clothingPerPage)
         {
            panelIndex = screen.clothingPage * screen.clothingPerPage + i;
            panel = screen.clip.menu.clothes["thumb" + i];
            try
            {
               if(panel.thumb.numChildren > 0)
               {
                  panel.thumb.removeChildAt(0);
               }
            }
            catch(err:Error)
            {
               class_6.error("Error removing hair thumb.");
            }
            if(panelIndex < useArray.length)
            {
               sku = String(useArray[panelIndex]);
               newThumb = screen.gameObj.var_134.generateClothingThumb(sku,screen.workerData.gender,28,28,52,52,screen.workerData.hairColor);
               panel.thumb.addChild(newThumb);
               panel.mouseEnabled = true;
               newThumb.cacheAsBitmap = true;
               if(screen.workerData[useVar] == sku)
               {
                  panel.gotoAndStop(3);
               }
               else
               {
                  panel.gotoAndStop(1);
               }
               panel.theme.gotoAndStop(screen.gameObj.var_134.getClothingThemeFrame(sku,screen.gameObj.var_127.getHolidayMonth()));
               if(panel.theme.currentFrameLabel != "g")
               {
                  panel.theme_edge.visible = true;
                  if(screen.workerData[useVar] == sku)
                  {
                     panel.theme_edge.gotoAndStop(2);
                  }
                  else
                  {
                     panel.theme_edge.gotoAndStop(1);
                  }
               }
               else
               {
                  panel.theme_edge.visible = false;
               }
            }
            else
            {
               panel.mouseEnabled = false;
               panel.mouseChildren = false;
               panel.gotoAndStop(4);
               panel.theme.gotoAndStop("g");
               panel.theme_edge.gotoAndStop(1);
               panel.theme_edge.visible = false;
            }
            i++;
         }
         screen.clip.menu.clothes.label_txt.text = screen.clothingSectionNames[screen.clothingSectionTypes.indexOf(screen.clothingMode)];
         totalPages = Math.ceil(useArray.length / screen.clothingPerPage);
         screen.clip.menu.clothes.amount_txt.text = String(screen.clothingPage + 1 + "/" + totalPages);
      }
      
      public function clickChangeClothes(param1:MouseEvent) : void
      {
         var tag:String;
         var didEarn:Boolean;
         var holiday:Number;
         var holidayMatching:Boolean;
         var workersMatching:Boolean;
         var i:int;
         var idx:Number = NaN;
         var type:String = null;
         var didEarn1:Boolean = false;
         var didEarn2:Boolean = false;
         var didEarn3:Boolean = false;
         var panelIndex:Number = NaN;
         var e:MouseEvent = param1;
         var screen:CharacterEditorScreen = this;
         idx = Number(String(e.currentTarget.name).split("thumb")[1]);
         idx += screen.clothingPage * screen.clothingPerPage;
         type = screen.clothingMode;
         screen["which_" + type] = idx;
         tag = "";
         try
         {
            tag = String(screen["available_" + type][idx]);
         }
         catch(err:Error)
         {
            class_6.error("Could not get new tag: type = " + type + ", index = " + idx + ". Error: " + err.message);
         }
         screen.workerData[type] = tag;
         screen.worker.redoClothing(type);
         screen.workerReverse.redoClothing(type);
         screen.clip.menu.clothes[screen.clothingMode + "_tab"].theme.gotoAndStop(screen.gameObj.var_134.getClothingThemeFrame(tag,screen.gameObj.var_127.getHolidayMonth()));
         screen.didChange = true;
         if(!screen.isRunning)
         {
            if(type == "hair" || type == "accd" || type == "acca" || type == "hat")
            {
               screen.worker.playAnimation("react2");
               screen.workerReverse.playAnimation("react2_mirror");
            }
            else
            {
               screen.worker.playAnimation("react1");
               screen.workerReverse.playAnimation("react1_mirror");
            }
         }
         didEarn = false;
         if(screen.workerData.shirt != "tint_chefshirt:K-FG-SA" && screen.workerData.shoes != "tint_shoes1:K-GR-FG" && screen.workerData.pants != "tint_pants_1:SA" && screen.workerData.pants != "tint_skirt_1:SA" && screen.workerData.hat != "" && screen.workerData.hat != "tint_sushi_headband:W" && screen.workerData.hat != "tint_sushi_hairband:W")
         {
            didEarn1 = screen.gameObj.var_136.recordTagged("changeclothes");
            if(didEarn1)
            {
               didEarn = true;
            }
         }
         holiday = screen.gameObj.var_127.getHolidayMonth();
         holidayMatching = screen.checkForHolidayClothes(screen.workerData,holiday);
         if(holidayMatching)
         {
            didEarn2 = screen.gameObj.var_136.recordTagged("holidayclothes");
            if(didEarn2)
            {
               didEarn = true;
            }
         }
         workersMatching = screen.checkForMatchingWorkers();
         if(workersMatching)
         {
            didEarn3 = screen.gameObj.var_136.recordTagged("coordinated");
            if(didEarn3)
            {
               didEarn = true;
            }
         }
         if(didEarn && screen.inMenu == false)
         {
            class_6.method_1(" --- NOT IN MENU, SHOULD SAVE");
            screen.gameObj.var_127.saveData();
         }
         else if(screen.inMenu)
         {
         }
         screen.gameObj.var_128.playSound("buttonclick.wav");
         i = 0;
         while(i < screen.clothingPerPage)
         {
            panelIndex = screen.clothingPage * screen.clothingPerPage + i;
            if(panelIndex < screen["available_" + type].length && screen.workerData[type] == screen["available_" + type][panelIndex])
            {
               screen.clip.menu.clothes["thumb" + i].gotoAndStop(3);
               if(screen.clip.menu.clothes["thumb" + i].theme_edge.visible)
               {
                  screen.clip.menu.clothes["thumb" + i].theme_edge.gotoAndStop(2);
               }
            }
            else if(panelIndex >= screen["available_" + type].length)
            {
               screen.clip.menu.clothes["thumb" + i].gotoAndStop(4);
            }
            else
            {
               screen.clip.menu.clothes["thumb" + i].gotoAndStop(1);
               if(screen.clip.menu.clothes["thumb" + i].theme_edge.visible)
               {
                  screen.clip.menu.clothes["thumb" + i].theme_edge.gotoAndStop(1);
               }
            }
            i++;
         }
         screen.updateHolidaySpirit();
      }
      
      public function rolloverClothes(param1:MouseEvent) : void
      {
         var _loc2_:CharacterEditorScreen = this;
         var _loc3_:Number = Number(String(param1.currentTarget.name).split("thumb")[1]);
         _loc3_ += _loc2_.clothingPage * _loc2_.clothingPerPage;
         var _loc4_:Array = _loc2_["available_" + _loc2_.clothingMode];
         if(_loc3_ < _loc4_.length)
         {
            if(_loc2_.workerData[_loc2_.clothingMode] != _loc4_[_loc3_])
            {
               MovieClip(param1.currentTarget).gotoAndStop(2);
            }
         }
      }
      
      public function rolloutClothes(param1:MouseEvent) : void
      {
         var _loc2_:CharacterEditorScreen = this;
         var _loc3_:Number = Number(String(param1.currentTarget.name).split("thumb")[1]);
         _loc3_ += _loc2_.clothingPage * _loc2_.clothingPerPage;
         var _loc4_:Array = _loc2_["available_" + _loc2_.clothingMode];
         if(_loc3_ < _loc4_.length)
         {
            if(_loc2_.workerData[_loc2_.clothingMode] != _loc4_[_loc3_])
            {
               MovieClip(param1.currentTarget).gotoAndStop(1);
            }
         }
      }
      
      public function checkForHolidayClothes(param1:WorkerData, param2:Number) : Boolean
      {
         var _loc3_:CharacterEditorScreen = this;
         var _loc4_:ClothingData = _loc3_.gameObj.var_134;
         var _loc5_:Boolean = false;
         if(param2 > 0)
         {
            if(param1.jacket != "" && param1.hat != "" && param1.accb != "")
            {
               class_6.method_1("Checking Holiday Clothes...");
               if(_loc4_.getClothingMatchingTheme(param1.shirt,param2) == param2 && _loc4_.getClothingMatchingTheme(param1.pants,param2) == param2 && _loc4_.getClothingMatchingTheme(param1.jacket,param2) == param2 && _loc4_.getClothingMatchingTheme(param1.hat,param2) == param2 && _loc4_.getClothingMatchingTheme(param1.accb,param2) == param2 && _loc4_.getClothingMatchingTheme(param1.shoes,param2) == param2)
               {
                  _loc5_ = true;
               }
            }
         }
         return _loc5_;
      }
      
      public function checkForMatchingWorkers() : Boolean
      {
         var _loc4_:Boolean = false;
         var _loc1_:CharacterEditorScreen = this;
         var _loc2_:ClothingData = _loc1_.gameObj.var_134;
         var _loc3_:Boolean = false;
         if(_loc1_.gameObj.var_127.didCreateWaiter)
         {
            _loc4_ = true;
            if(_loc1_.itemsMatchWithDifferentColors(_loc1_.gameObj.workerData.shirt,_loc1_.gameObj.var_143.shirt))
            {
               if(_loc1_.itemsMatchWithDifferentColors(_loc1_.gameObj.workerData.pants,_loc1_.gameObj.var_143.pants))
               {
                  if(_loc1_.itemsMatchWithDifferentColors(_loc1_.gameObj.workerData.shoes,_loc1_.gameObj.var_143.shoes))
                  {
                     if(_loc1_.itemsMatchWithDifferentColors(_loc1_.gameObj.workerData.hat,_loc1_.gameObj.var_143.hat,true))
                     {
                        if(_loc1_.itemsMatchWithDifferentColors(_loc1_.gameObj.workerData.jacket,_loc1_.gameObj.var_143.jacket,true))
                        {
                           if(_loc1_.itemsMatchWithDifferentColors(_loc1_.gameObj.workerData.acca,_loc1_.gameObj.var_143.acca,true))
                           {
                              if(_loc1_.itemsMatchWithDifferentColors(_loc1_.gameObj.workerData.accb,_loc1_.gameObj.var_143.accb,true))
                              {
                                 if(_loc1_.itemsMatchWithDifferentColors(_loc1_.gameObj.workerData.accc,_loc1_.gameObj.var_143.accc,true))
                                 {
                                    if(_loc1_.itemsMatchWithDifferentColors(_loc1_.gameObj.workerData.accd,_loc1_.gameObj.var_143.accd,true))
                                    {
                                       _loc3_ = _loc1_.gameObj.var_136.recordTagged("coordinated");
                                    }
                                 }
                              }
                           }
                        }
                     }
                  }
               }
            }
         }
         return _loc3_;
      }
      
      private function itemsMatchWithDifferentColors(param1:String, param2:String, param3:Boolean = false) : Boolean
      {
         this;
         var _loc5_:ClothingData = this.gameObj.var_134;
         if(param3 && param1 == "" && param2 == "")
         {
            return true;
         }
         if(param1 != param2 && _loc5_.getBaseSKU(param1) == _loc5_.getBaseSKU(param2))
         {
            return true;
         }
         return false;
      }
      
      public function updateHolidaySpirit() : void
      {
         var _loc2_:Number = NaN;
         var _loc1_:CharacterEditorScreen = this;
         if(_loc1_.gameObj.var_127.getHolidayMonth() > 0)
         {
            _loc1_.clip.menu.clothes.holidaybar.visible = true;
            _loc2_ = _loc1_.gameObj.var_127.getHolidayMonth();
            if(_loc2_ == 0)
            {
               _loc2_ = 13;
            }
            _loc1_.clip.menu.clothes.holidaybar.theme_icon.gotoAndStop(_loc2_);
            if(_loc1_.whichMode == "waiter")
            {
               _loc1_.targetHolidaySpirit = _loc1_.gameObj.var_127.getClothingHolidaySpirit(true) * 306;
            }
            else
            {
               _loc1_.targetHolidaySpirit = _loc1_.gameObj.var_127.getClothingHolidaySpirit() * 306;
            }
         }
         else
         {
            _loc1_.clip.menu.clothes.holidaybar.visible = false;
         }
      }
   }
}
