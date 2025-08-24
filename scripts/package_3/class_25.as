package package_3
{
   import flash.display.*;
   import flash.events.*;
   import flash.geom.*;
   import flash.text.*;
   import flipline.api.class_18;
   import package_2.class_6;
   import package_5.*;
   
   public class class_25
   {
       
      
      private var api:class_18;
      
      private var data:class_19;
      
      private var var_292:Object = null;
      
      private var clip:MovieClip;
      
      private var var_142:MovieClip;
      
      private var var_146:MovieClip;
      
      private var var_157:MovieClip;
      
      private var var_260:Number = 4;
      
      private var var_356:Number = 0;
      
      private var var_355:Number = 45;
      
      private var var_375:Number = 11;
      
      private var var_345:Number = 6;
      
      private var var_322:Number = -15;
      
      private var var_358:Number = 45;
      
      private var var_360:Number = 7;
      
      private var var_302:Number = 6;
      
      private var var_321:Number = 10;
      
      private var var_297:Number = 10;
      
      private var var_219:Number = 5;
      
      private var var_381:Number = 7;
      
      private var var_393:Number = 10;
      
      private var var_350:Number = 78;
      
      private var var_338:Number = 3;
      
      private var var_384:Number = 6;
      
      private var var_343:Number = 8;
      
      private var var_382:Number = 6;
      
      private var var_336:Number = 8;
      
      private var var_176:class_17 = null;
      
      private var var_197:class_17;
      
      private var var_147:MovieClip;
      
      private var var_148:MovieClip;
      
      private var var_158:MovieClip;
      
      private var var_144:SimpleButton;
      
      private var var_174:SimpleButton;
      
      private var var_156:SimpleButton;
      
      private var var_175:SimpleButton;
      
      private var var_168:MovieClip;
      
      private var var_367:MovieClip;
      
      private var var_328:Boolean = false;
      
      private var var_364:String = "api_menu_top_panel";
      
      private var var_337:String = "api_menu_bottom_panel";
      
      private var var_362:String = "startgame_bg";
      
      private var var_357:Number = -13;
      
      private var var_330:Number = -5;
      
      private var var_387:String = "flip_logo_large";
      
      private var var_342:String = "flip_logo_small";
      
      private var var_372:String = "sponsor_logo_large";
      
      private var var_368:String = "sponsor_logo_small";
      
      private var var_386:String = "license_logo_large";
      
      private var var_339:String = "license_logo_small";
      
      private var var_370:String = "developedby_tag";
      
      private var var_365:String = "sponsoredby_tag";
      
      private var var_373:String = "api_mute_btn";
      
      private var var_374:String = "api_unmute_btn";
      
      private var var_380:String = "api_mute_music_btn";
      
      private var var_349:String = "api_unmute_music_btn";
      
      private var var_348:String = "api_getthisgame_button";
      
      private var var_366:String = "api_getthisgame_bigbutton";
      
      private var var_371:String = "api_promopanel_license";
      
      private var var_353:String = "api_promopanel_sponsor";
      
      private var var_163:MovieClip;
      
      private var var_379:Number = 46;
      
      private var var_204:Number = 12;
      
      private var var_285:Number = 15;
      
      private var var_273:Number = 10;
      
      private var var_394:Number = 2;
      
      private var var_347:Number = 73;
      
      private var var_341:Number = 120;
      
      private var var_369:Number = 43;
      
      private var var_390:Number = 101;
      
      private var var_363:Number = 43;
      
      private var var_359:Number = 60;
      
      private var var_352:Number = 0;
      
      private var var_377:Number = 60;
      
      private var var_385:Number = 73;
      
      private var var_346:Number = 137;
      
      private var var_376:Number = 3;
      
      private var var_378:Number = 3;
      
      private var var_167:Number = 0;
      
      private var var_160:Number = 0;
      
      private var var_323:Number = 4;
      
      private var var_389:Number = 0;
      
      private var var_255:Number = 0;
      
      private var var_296:Boolean = false;
      
      private var var_162:TextField;
      
      private var var_248:*;
      
      public function class_25(param1:class_18, param2:class_19, param3:Object = null)
      {
         super();
         this.api = param1;
         this.data = param2;
         this.var_292 = param3;
         this.setupScreen();
      }
      
      public function setupScreen() : void
      {
         var _loc2_:Array = null;
         var _loc3_:Number = NaN;
         var _loc4_:class_22 = null;
         var _loc5_:class_17 = null;
         var _loc6_:MovieClip = null;
         var _loc7_:Array = null;
         var _loc8_:TextField = null;
         var _loc9_:TextField = null;
         var _loc10_:MovieClip = null;
         var _loc11_:MovieClip = null;
         var _loc12_:int = 0;
         var _loc13_:MovieClip = null;
         var _loc1_:class_25 = this;
         _loc1_.clip = new MovieClip();
         _loc1_.var_142 = this.api.var_153.method_103(this.var_364);
         _loc1_.var_146 = this.api.var_153.method_103(this.var_337);
         if(this.data.var_247)
         {
            _loc1_.var_167 = 0 - (_loc1_.var_142.height - this.var_347);
            _loc1_.var_160 = this.api.var_155 - this.var_341;
            _loc1_.var_142.y = 0 - _loc1_.var_142.height + this.api.var_155 / 2 - 30;
            _loc1_.var_146.y = this.api.var_155 - this.api.var_155 / 2 + 30;
         }
         else if(this.data.var_180)
         {
            _loc1_.var_167 = 0 - (_loc1_.var_142.height - this.var_385);
            _loc1_.var_160 = this.api.var_155 - this.var_346;
            _loc1_.var_142.y = 0 - _loc1_.var_142.height + this.api.var_155 / 2 - 30;
            _loc1_.var_146.y = this.api.var_155 - this.api.var_155 / 2 + 30;
         }
         else if(this.data.var_271)
         {
            _loc1_.var_167 = 0 - (_loc1_.var_142.height - this.var_363);
            _loc1_.var_160 = this.api.var_155 - this.var_359;
            _loc1_.var_142.y = 0 - _loc1_.var_142.height;
            _loc1_.var_146.y = this.api.var_155;
         }
         else if(this.data.var_284)
         {
            _loc1_.var_167 = 0 - (_loc1_.var_142.height - this.var_352);
            _loc1_.var_160 = this.api.var_155 - this.var_377;
            _loc1_.var_142.y = 0 - _loc1_.var_142.height;
            _loc1_.var_146.y = this.api.var_155;
         }
         else
         {
            _loc1_.var_167 = 0 - (_loc1_.var_142.height - this.var_369);
            _loc1_.var_160 = this.api.var_155 - this.var_390;
            _loc1_.var_142.y = 0 - _loc1_.var_142.height;
            _loc1_.var_146.y = this.api.var_155;
         }
         _loc1_.var_162 = new TextField();
         _loc1_.var_162.embedFonts = true;
         _loc1_.var_162.antiAliasType = AntiAliasType.ADVANCED;
         _loc1_.var_162.gridFitType = GridFitType.SUBPIXEL;
         _loc1_.var_162.wordWrap = false;
         _loc1_.var_162.multiline = false;
         _loc1_.var_162.defaultTextFormat = _loc1_.getTextFormat();
         _loc1_.var_162.text = "";
         _loc1_.var_162.mouseEnabled = false;
         _loc1_.var_162.y = 0 - _loc1_.var_167 + _loc1_.var_356;
         if(_loc1_.data.var_309)
         {
            _loc1_.var_162.text = _loc1_.data.var_319;
         }
         _loc1_.var_162.height = _loc1_.var_162.textHeight + 4;
         _loc1_.var_162.width = _loc1_.api.var_161;
         _loc1_.var_142.addChild(_loc1_.var_162);
         _loc1_.var_157 = new MovieClip();
         if(this.data.var_247)
         {
            _loc1_.var_157.y = _loc1_.var_355;
         }
         else if(this.data.var_180)
         {
            _loc1_.var_157.y = _loc1_.var_345;
         }
         else
         {
            _loc1_.var_157.y = _loc1_.var_375;
         }
         if(_loc1_.data.var_185.length > 0)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc1_.data.var_185.length)
            {
               _loc4_ = _loc1_.data.var_185[_loc3_];
               _loc5_ = new class_17(_loc4_);
               if(_loc4_.var_290)
               {
                  _loc5_.x = _loc1_.var_204;
                  _loc5_.y = 0 - _loc1_.var_167 + _loc1_.var_381;
                  _loc1_.var_142.addChild(_loc5_);
                  _loc1_.var_197 = _loc5_;
               }
               else if(_loc4_.size == "large")
               {
                  _loc5_.x = Math.floor((_loc1_.api.var_161 - _loc5_.width) / 2);
                  if(_loc4_.var_240)
                  {
                     _loc5_.y = _loc1_.var_322;
                  }
                  else if(this.data.var_271 || this.data.var_284)
                  {
                     _loc5_.y = _loc1_.var_360;
                  }
                  else
                  {
                     _loc5_.y = _loc1_.var_358;
                  }
                  if(_loc4_.var_240)
                  {
                     (_loc6_ = this.api.var_153.method_103(_loc1_.var_362)).x = _loc5_.x + _loc1_.var_357;
                     _loc6_.y = _loc5_.y + _loc1_.var_330;
                     _loc1_.var_146.addChild(_loc6_);
                     _loc1_.var_367 = _loc6_;
                     _loc1_.var_328 = true;
                  }
                  _loc1_.var_146.addChild(_loc5_);
                  _loc1_.var_176 = _loc5_;
                  if(this.data.var_180)
                  {
                     _loc1_.var_157.graphics.lineStyle(0,0,0);
                     _loc1_.var_157.graphics.beginFill(0,0);
                     _loc1_.var_157.graphics.drawRect(0,0,1,1);
                     _loc1_.var_157.graphics.drawRect(this.api.var_161 - 1,0,1,1);
                  }
               }
               else
               {
                  _loc5_.x = _loc1_.var_157.width + _loc1_.var_260;
                  if(_loc1_.var_157.width == 0)
                  {
                     _loc5_.x = 0;
                  }
                  if(this.data.var_180 && _loc1_.var_176 != null)
                  {
                     if(_loc3_ == 1)
                     {
                        _loc5_.x = _loc1_.var_176.x - _loc1_.var_260 - _loc5_.width;
                     }
                     else if(_loc3_ == 0)
                     {
                        class_6.error("API ERROR: You must define the Large Button first for a Promo screen.");
                     }
                     else if(_loc3_ == 2)
                     {
                        _loc5_.x = _loc1_.var_176.x + _loc1_.var_176.width + _loc1_.var_260;
                     }
                     else
                     {
                        class_6.error("API ERROR: Too many extra buttons for a Promo screen.");
                        _loc5_.x = 0;
                     }
                  }
                  _loc1_.var_157.addChild(_loc5_);
               }
               _loc3_++;
            }
         }
         _loc1_.var_146.addChild(_loc1_.var_157);
         _loc1_.var_157.x = Math.floor((_loc1_.api.var_161 - _loc1_.var_157.width) / 2);
         if(this.data.var_305)
         {
            _loc7_ = this.data.var_278.split(" ");
            _loc1_.var_144 = _loc1_.api.var_153.method_135(_loc1_.var_373);
            _loc1_.var_174 = _loc1_.api.var_153.method_135(_loc1_.var_374);
            _loc1_.var_144.addEventListener(MouseEvent.CLICK,_loc1_.method_168);
            _loc1_.var_174.addEventListener(MouseEvent.CLICK,_loc1_.method_170);
            if(_loc1_.api.var_233)
            {
               _loc1_.var_144.visible = false;
               _loc1_.var_174.visible = true;
            }
            else
            {
               _loc1_.var_144.visible = true;
               _loc1_.var_174.visible = false;
            }
            if(_loc7_.indexOf("top") > -1)
            {
               _loc1_.var_144.y = 0 - _loc1_.var_167 + _loc1_.var_302;
            }
            else if(_loc7_.indexOf("bottom") > -1)
            {
               _loc1_.var_144.y = _loc1_.api.var_155 - _loc1_.var_160 - _loc1_.var_144.height - _loc1_.var_321;
               if(this.data.var_180)
               {
                  _loc1_.var_144.y = _loc1_.var_336;
               }
            }
            if(_loc7_.indexOf("left") > -1)
            {
               _loc1_.var_144.x = _loc1_.var_297;
            }
            else if(_loc7_.indexOf("right") > -1)
            {
               _loc1_.var_144.x = _loc1_.api.var_161 - _loc1_.var_297 - _loc1_.var_144.width;
               if(this.data.var_180)
               {
                  _loc1_.var_144.x = _loc1_.api.var_161 - _loc1_.var_382 - _loc1_.var_144.width;
               }
            }
            else if(_loc7_.indexOf("center") > -1)
            {
               _loc1_.var_144.x = (_loc1_.api.var_161 - _loc1_.var_144.width) / 2;
            }
            _loc1_.var_174.x = _loc1_.var_144.x;
            _loc1_.var_174.y = _loc1_.var_144.y;
            if(_loc7_.indexOf("top") > -1)
            {
               _loc1_.var_142.addChild(_loc1_.var_174);
               _loc1_.var_142.addChild(_loc1_.var_144);
            }
            else if(_loc7_.indexOf("bottom") > -1)
            {
               _loc1_.var_146.addChild(_loc1_.var_174);
               _loc1_.var_146.addChild(_loc1_.var_144);
            }
            if(this.data.var_270)
            {
               _loc1_.var_156 = _loc1_.api.var_153.method_135(_loc1_.var_380);
               _loc1_.var_175 = _loc1_.api.var_153.method_135(_loc1_.var_349);
               _loc1_.var_156.addEventListener(MouseEvent.CLICK,_loc1_.method_183);
               _loc1_.var_175.addEventListener(MouseEvent.CLICK,_loc1_.method_185);
               if(_loc1_.api.var_230)
               {
                  _loc1_.var_156.visible = false;
                  _loc1_.var_175.visible = true;
               }
               else
               {
                  _loc1_.var_156.visible = true;
                  _loc1_.var_175.visible = false;
               }
               if(_loc7_.indexOf("top") > -1)
               {
                  _loc1_.var_156.y = 0 - _loc1_.var_167 + _loc1_.var_302;
               }
               else if(_loc7_.indexOf("bottom") > -1)
               {
                  _loc1_.var_156.y = _loc1_.api.var_155 - _loc1_.var_160 - _loc1_.var_144.height - _loc1_.var_321;
                  if(this.data.var_180)
                  {
                     _loc1_.var_156.y = _loc1_.var_336;
                  }
               }
               if(_loc7_.indexOf("left") > -1)
               {
                  _loc1_.var_156.x = _loc1_.var_144.x + _loc1_.var_219;
               }
               else if(_loc7_.indexOf("right") > -1)
               {
                  _loc1_.var_156.x = _loc1_.var_144.x - _loc1_.var_219 - _loc1_.var_156.width;
               }
               else if(_loc7_.indexOf("center") > -1)
               {
                  _loc1_.var_156.x = _loc1_.var_144.x + _loc1_.var_219;
               }
               _loc1_.var_175.x = _loc1_.var_156.x;
               _loc1_.var_175.y = _loc1_.var_156.y;
               if(_loc7_.indexOf("top") > -1)
               {
                  _loc1_.var_142.addChild(_loc1_.var_175);
                  _loc1_.var_142.addChild(_loc1_.var_156);
               }
               else if(_loc7_.indexOf("bottom") > -1)
               {
                  _loc1_.var_146.addChild(_loc1_.var_175);
                  _loc1_.var_146.addChild(_loc1_.var_156);
               }
            }
         }
         if(this.data.var_331)
         {
            if(this.data.var_180)
            {
               _loc1_.var_168 = _loc1_.api.var_153.method_103(_loc1_.var_366);
            }
            else
            {
               _loc1_.var_168 = _loc1_.api.var_153.method_103(_loc1_.var_348);
            }
            _loc1_.var_168.buttonMode = true;
            _loc1_.var_168.mouseEnabled = true;
            _loc1_.var_168.mouseChildren = false;
            _loc1_.var_168.useHandCursor = true;
            _loc1_.var_168.addEventListener(MouseEvent.CLICK,_loc1_.method_200);
            _loc1_.var_168.y = _loc1_.var_350;
            _loc1_.var_168.x = (_loc1_.api.var_161 - _loc1_.var_168.width) / 2;
            if(this.data.var_180)
            {
               _loc1_.var_168.y = _loc1_.var_343;
               _loc1_.var_168.x = _loc1_.var_384;
            }
            _loc1_.var_146.addChild(_loc1_.var_168);
         }
         if(this.data.var_335)
         {
            (_loc8_ = new TextField()).embedFonts = true;
            _loc8_.antiAliasType = AntiAliasType.ADVANCED;
            _loc8_.gridFitType = GridFitType.PIXEL;
            _loc8_.wordWrap = false;
            _loc8_.multiline = false;
            _loc8_.defaultTextFormat = _loc1_.method_202();
            _loc8_.text = this.data.var_301;
            _loc8_.mouseEnabled = false;
            _loc8_.tabEnabled = false;
            _loc8_.height = _loc8_.textHeight + 4;
            _loc8_.width = _loc8_.textWidth + 6;
            _loc8_.y = _loc1_.api.var_155 - _loc1_.var_160 - _loc8_.height - _loc1_.var_338;
            _loc8_.x = (_loc1_.api.var_161 - _loc8_.width) / 2;
            _loc1_.var_146.addChild(_loc8_);
         }
         if(this.data.var_327)
         {
            (_loc9_ = new TextField()).embedFonts = true;
            _loc9_.antiAliasType = AntiAliasType.ADVANCED;
            _loc9_.gridFitType = GridFitType.PIXEL;
            _loc9_.wordWrap = false;
            _loc9_.multiline = false;
            _loc9_.defaultTextFormat = _loc1_.method_202();
            _loc9_.text = this.data.var_329;
            _loc9_.mouseEnabled = false;
            _loc9_.tabEnabled = false;
            _loc9_.height = _loc9_.textHeight + 4;
            _loc9_.width = _loc9_.textWidth + 6;
            _loc9_.y = _loc1_.api.var_155 - _loc1_.var_160 - _loc9_.height - _loc1_.var_378;
            _loc9_.x = _loc1_.var_376;
            _loc1_.var_146.addChild(_loc9_);
         }
         if(this.data.var_293)
         {
            if(this.data.var_311 == "small")
            {
               _loc1_.var_147 = _loc1_.api.var_153.method_103(_loc1_.var_342);
            }
            else
            {
               _loc1_.var_147 = _loc1_.api.var_153.method_103(_loc1_.var_387);
            }
            _loc2_ = this.data.var_333.split(" ");
            if(_loc2_.indexOf("top") > -1)
            {
               _loc1_.var_147.y = _loc1_.var_285 - _loc1_.var_167;
            }
            else if(_loc2_.indexOf("bottom") > -1)
            {
               _loc1_.var_147.y = _loc1_.api.var_155 - _loc1_.var_160 - _loc1_.var_147.height - _loc1_.var_273;
            }
            if(_loc2_.indexOf("left") > -1)
            {
               _loc1_.var_147.x = _loc1_.var_204;
            }
            else if(_loc2_.indexOf("right") > -1)
            {
               _loc1_.var_147.x = _loc1_.api.var_161 - _loc1_.var_147.width - _loc1_.var_204;
            }
            else if(_loc2_.indexOf("center") > -1)
            {
               _loc1_.var_147.x = (_loc1_.api.var_161 - _loc1_.var_147.width) / 2;
            }
            if(this.data.var_211 != null && this.data.var_211 != "")
            {
               _loc1_.var_147.buttonMode = true;
               _loc1_.var_147.mouseEnabled = true;
               _loc1_.var_147.mouseChildren = false;
               _loc1_.var_147.useHandCursor = true;
               _loc1_.var_147.addEventListener(MouseEvent.CLICK,_loc1_.method_186);
            }
            if(this.data.var_316)
            {
               (_loc10_ = _loc1_.api.var_153.method_103(_loc1_.var_370)).y = this.var_147.y - _loc10_.height;
               if(_loc2_.indexOf("left") > -1)
               {
                  _loc10_.x = this.var_147.x;
               }
               else if(_loc2_.indexOf("center") > -1)
               {
                  _loc10_.x = this.var_147.x + (this.var_147.width - _loc10_.width) / 2;
               }
               else if(_loc2_.indexOf("right") > -1)
               {
                  _loc10_.x = this.var_147.x + this.var_147.width - _loc10_.width;
               }
               if(_loc2_.indexOf("top") > -1)
               {
                  _loc1_.var_142.addChild(_loc10_);
               }
               else if(_loc2_.indexOf("bottom") > -1)
               {
                  _loc1_.var_146.addChild(_loc10_);
               }
            }
            if(_loc2_.indexOf("top") > -1)
            {
               _loc1_.var_142.addChild(_loc1_.var_147);
            }
            else if(_loc2_.indexOf("bottom") > -1)
            {
               _loc1_.var_146.addChild(_loc1_.var_147);
            }
         }
         if(this.data.var_294)
         {
            if(this.data.var_303 == "small")
            {
               _loc1_.var_148 = _loc1_.api.var_153.method_103(_loc1_.var_368);
            }
            else
            {
               _loc1_.var_148 = _loc1_.api.var_153.method_103(_loc1_.var_372);
            }
            _loc2_ = this.data.var_306.split(" ");
            if(_loc2_.indexOf("top") > -1)
            {
               _loc1_.var_148.y = _loc1_.var_285 - _loc1_.var_167;
            }
            else if(_loc2_.indexOf("bottom") > -1)
            {
               _loc1_.var_148.y = _loc1_.api.var_155 - _loc1_.var_160 - _loc1_.var_148.height - _loc1_.var_273;
            }
            if(_loc2_.indexOf("left") > -1)
            {
               _loc1_.var_148.x = _loc1_.var_204;
            }
            else if(_loc2_.indexOf("right") > -1)
            {
               _loc1_.var_148.x = _loc1_.api.var_161 - _loc1_.var_148.width - _loc1_.var_204;
            }
            else if(_loc2_.indexOf("center") > -1)
            {
               _loc1_.var_148.x = (_loc1_.api.var_161 - _loc1_.var_148.width) / 2;
            }
            if(this.data.var_207 != null && this.data.var_207 != "")
            {
               _loc1_.var_148.buttonMode = true;
               _loc1_.var_148.mouseEnabled = true;
               _loc1_.var_148.mouseChildren = false;
               _loc1_.var_148.useHandCursor = true;
               _loc1_.var_148.addEventListener(MouseEvent.CLICK,_loc1_.method_187);
            }
            if(this.data.var_334)
            {
               (_loc11_ = _loc1_.api.var_153.method_103(_loc1_.var_365)).y = this.var_148.y - _loc11_.height;
               if(_loc2_.indexOf("left") > -1)
               {
                  _loc11_.x = this.var_148.x;
               }
               else if(_loc2_.indexOf("center") > -1)
               {
                  _loc11_.x = this.var_148.x + (this.var_148.width - _loc11_.width) / 2;
               }
               else if(_loc2_.indexOf("right") > -1)
               {
                  _loc11_.x = this.var_148.x + this.var_148.width - _loc11_.width;
               }
               if(_loc2_.indexOf("top") > -1)
               {
                  _loc1_.var_142.addChild(_loc11_);
               }
               else if(_loc2_.indexOf("bottom") > -1)
               {
                  _loc1_.var_146.addChild(_loc11_);
               }
            }
            if(_loc2_.indexOf("top") > -1)
            {
               _loc1_.var_142.addChild(_loc1_.var_148);
            }
            else if(_loc2_.indexOf("bottom") > -1)
            {
               _loc1_.var_146.addChild(_loc1_.var_148);
            }
         }
         if(this.data.var_295)
         {
            if(this.data.var_299 == "small")
            {
               _loc1_.var_158 = _loc1_.api.var_153.method_103(_loc1_.var_339);
            }
            else
            {
               _loc1_.var_158 = _loc1_.api.var_153.method_103(_loc1_.var_386);
            }
            _loc2_ = this.data.var_300.split(" ");
            if(_loc2_.indexOf("top") > -1)
            {
               _loc1_.var_158.y = _loc1_.var_285 - _loc1_.var_167;
            }
            else if(_loc2_.indexOf("bottom") > -1)
            {
               _loc1_.var_158.y = _loc1_.api.var_155 - _loc1_.var_160 - _loc1_.var_158.height - _loc1_.var_273;
            }
            if(_loc2_.indexOf("left") > -1)
            {
               _loc1_.var_158.x = _loc1_.var_204;
            }
            else if(_loc2_.indexOf("right") > -1)
            {
               _loc1_.var_158.x = _loc1_.api.var_161 - _loc1_.var_158.width - _loc1_.var_204;
            }
            else if(_loc2_.indexOf("center") > -1)
            {
               _loc1_.var_158.x = (_loc1_.api.var_161 - _loc1_.var_158.width) / 2;
            }
            if(this.data.var_209 != null && this.data.var_209 != "")
            {
               _loc1_.var_158.buttonMode = true;
               _loc1_.var_158.mouseEnabled = true;
               _loc1_.var_158.mouseChildren = false;
               _loc1_.var_158.useHandCursor = true;
               _loc1_.var_158.addEventListener(MouseEvent.CLICK,_loc1_.method_189);
            }
            if(_loc2_.indexOf("top") > -1)
            {
               _loc1_.var_142.addChild(_loc1_.var_158);
            }
            else if(_loc2_.indexOf("bottom") > -1)
            {
               _loc1_.var_146.addChild(_loc1_.var_158);
            }
         }
         if(this.data.var_180 && this.data.var_149 != null)
         {
            if(this.data.var_149.var_238)
            {
               _loc1_.var_163 = _loc1_.api.var_153.method_103(_loc1_.var_371);
            }
            else
            {
               _loc1_.var_163 = _loc1_.api.var_153.method_103(_loc1_.var_353);
            }
            _loc1_.var_163.facebook_btn.addEventListener(MouseEvent.CLICK,_loc1_.method_190);
            _loc1_.var_163.twitter_btn.addEventListener(MouseEvent.CLICK,_loc1_.method_205);
            if(this.data.var_149.var_275 == false)
            {
               _loc1_.var_163.facebook_btn.visible = false;
               _loc1_.var_163.twitter_btn.y = 0;
            }
            if(this.data.var_149.var_268 == false)
            {
               _loc1_.var_163.twitter_btn.visible = false;
            }
            if(this.data.var_149.var_275 == false && this.data.var_149.var_268 == false)
            {
               _loc1_.var_163.inside.x = 0;
            }
            _loc12_ = 0;
            while(_loc12_ < this.data.var_149.var_237.length)
            {
               (_loc13_ = _loc1_.var_163.inside["gamepanel" + (_loc12_ + 1)]).buttonMode = true;
               _loc13_.mouseEnabled = true;
               _loc13_.mouseChildren = false;
               _loc13_.useHandCursor = true;
               _loc13_.addEventListener(MouseEvent.CLICK,_loc1_.method_193);
               _loc12_++;
            }
            _loc1_.var_163.y = _loc1_.var_379;
            _loc1_.var_163.x = Math.floor((_loc1_.api.var_161 - _loc1_.var_163.width) / 2);
            _loc1_.var_146.addChild(_loc1_.var_163);
         }
         if(this.data.var_248 != null && this.data.var_248 != "")
         {
            _loc1_.var_248 = _loc1_.api.var_153.method_247(this.data.var_248,_loc1_.api.var_256,_loc1_.clip,_loc1_.var_292);
         }
         _loc1_.clip.addChild(_loc1_.var_142);
         _loc1_.clip.addChild(_loc1_.var_146);
         _loc1_.var_142.addEventListener(Event.ENTER_FRAME,_loc1_.method_149);
         _loc1_.api.container.addChild(_loc1_.clip);
      }
      
      public function startTransitionOut() : void
      {
         var _loc1_:class_25 = this;
         _loc1_.var_296 = true;
         _loc1_.disableButtons();
         _loc1_.var_167 = 0 - _loc1_.var_142.height - 5;
         _loc1_.var_160 = this.api.var_155 + 5;
         if(_loc1_.var_328)
         {
            _loc1_.var_160 += (_loc1_.var_322 + _loc1_.var_330) * -1;
         }
         if(!_loc1_.var_142.hasEventListener(Event.ENTER_FRAME))
         {
            _loc1_.var_142.addEventListener(Event.ENTER_FRAME,_loc1_.method_149);
         }
      }
      
      public function method_149(param1:Event) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc2_:class_25 = this;
         ++_loc2_.var_255;
         if(_loc2_.var_255 > _loc2_.var_389 || _loc2_.var_296)
         {
            _loc3_ = _loc2_.var_167 - _loc2_.var_142.y;
            _loc4_ = _loc2_.var_160 - _loc2_.var_146.y;
            if(Math.abs(_loc3_) > 1)
            {
               _loc2_.var_142.y += _loc3_ / _loc2_.var_323;
            }
            else
            {
               _loc2_.var_142.y = _loc2_.var_167;
            }
            if(Math.abs(_loc4_) > 1)
            {
               _loc2_.var_146.y += _loc4_ / _loc2_.var_323;
            }
            else
            {
               _loc2_.var_146.y = _loc2_.var_160;
            }
            if(_loc2_.var_142.y == _loc2_.var_167 && _loc2_.var_146.y == _loc2_.var_160)
            {
               _loc2_.var_142.removeEventListener(Event.ENTER_FRAME,_loc2_.method_149);
            }
         }
      }
      
      public function method_186(param1:MouseEvent) : void
      {
         var _loc2_:class_25 = this;
         if(Boolean(_loc2_.data.var_211) && _loc2_.data.var_211 != "")
         {
            _loc2_.api.method_109(_loc2_.data.var_211);
         }
      }
      
      public function method_187(param1:MouseEvent) : void
      {
         var _loc2_:class_25 = this;
         if(Boolean(_loc2_.data.var_207) && _loc2_.data.var_207 != "")
         {
            _loc2_.api.method_109(_loc2_.data.var_207);
         }
      }
      
      public function method_189(param1:MouseEvent) : void
      {
         var _loc2_:class_25 = this;
         if(Boolean(_loc2_.data.var_209) && _loc2_.data.var_209 != "")
         {
            _loc2_.api.method_109(_loc2_.data.var_209);
         }
      }
      
      public function method_200(param1:MouseEvent) : void
      {
         var _loc2_:class_25 = this;
         if(Boolean(_loc2_.data.var_253) && _loc2_.data.var_253 != "")
         {
            _loc2_.api.method_109(_loc2_.data.var_253);
         }
      }
      
      public function method_168(param1:MouseEvent) : void
      {
         var _loc2_:class_25 = this;
         _loc2_.api.method_276();
         _loc2_.var_144.visible = false;
         _loc2_.var_174.visible = true;
      }
      
      public function method_170(param1:MouseEvent) : void
      {
         var _loc2_:class_25 = this;
         _loc2_.api.method_271();
         _loc2_.var_144.visible = true;
         _loc2_.var_174.visible = false;
      }
      
      public function method_183(param1:MouseEvent) : void
      {
         var _loc2_:class_25 = this;
         _loc2_.api.method_238();
         _loc2_.var_156.visible = false;
         _loc2_.var_175.visible = true;
      }
      
      public function method_185(param1:MouseEvent) : void
      {
         var _loc2_:class_25 = this;
         _loc2_.api.method_274();
         _loc2_.var_156.visible = true;
         _loc2_.var_175.visible = false;
      }
      
      public function method_190(param1:MouseEvent) : void
      {
         var _loc3_:String = null;
         var _loc2_:class_25 = this;
         if(_loc2_.data.var_149 && _loc2_.data.var_149.var_239 && _loc2_.data.var_149.var_239 != "")
         {
            _loc3_ = "PromoFacebook";
            if(_loc2_.data.var_149.var_238)
            {
               _loc3_ = "PromoFacebookLicense";
            }
            _loc2_.api.method_109(_loc2_.data.var_149.var_239);
         }
      }
      
      public function method_205(param1:MouseEvent) : void
      {
         var _loc3_:String = null;
         var _loc2_:class_25 = this;
         if(_loc2_.data.var_149 && _loc2_.data.var_149.var_246 && _loc2_.data.var_149.var_246 != "")
         {
            _loc3_ = "PromoTwitter";
            if(_loc2_.data.var_149.var_238)
            {
               _loc3_ = "PromoTwitterLicense";
            }
            _loc2_.api.method_109(_loc2_.data.var_149.var_246);
         }
      }
      
      public function method_193(param1:MouseEvent) : void
      {
         var _loc5_:String = null;
         var _loc2_:class_25 = this;
         var _loc3_:Number = -1;
         var _loc4_:Array;
         if((_loc4_ = String(param1.currentTarget.name).split("gamepanel")).length > 1)
         {
            _loc3_ = Number(_loc4_[1]);
         }
         if(_loc3_ > -1)
         {
            if(Boolean(_loc2_.data.var_149) && _loc2_.data.var_149.var_237.length >= _loc3_)
            {
               if((_loc5_ = String(_loc2_.data.var_149.var_237[_loc3_ - 1])) != null && _loc5_ != "")
               {
                  _loc2_.api.method_109(_loc5_);
               }
            }
         }
      }
      
      public function destroy() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:int = 0;
         var _loc4_:class_17 = null;
         var _loc1_:class_25 = this;
         if(_loc1_.var_248)
         {
            _loc1_.var_248.destroy();
            _loc1_.var_248 = null;
         }
         if(_loc1_.var_163)
         {
            try
            {
               _loc1_.var_163.facebook_btn.removeEventListener(MouseEvent.CLICK,_loc1_.method_190);
               _loc1_.var_163.twitter_btn.removeEventListener(MouseEvent.CLICK,_loc1_.method_205);
            }
            catch(err:Error)
            {
            }
            try
            {
               _loc3_ = 0;
               while(_loc3_ < _loc1_.var_163.inside.numChildren)
               {
                  _loc1_.var_163.inside["gamepanel" + (_loc3_ + 1)].removeEventListener(MouseEvent.CLICK,_loc1_.method_193);
                  _loc3_++;
               }
            }
            catch(err:Error)
            {
            }
         }
         _loc2_ = 0;
         while(_loc2_ < _loc1_.var_157.numChildren)
         {
            (_loc4_ = _loc1_.var_157.getChildAt(_loc2_) as class_17).destroy();
            _loc4_ = null;
            _loc2_++;
         }
         if(_loc1_.var_176)
         {
            _loc1_.var_176.destroy();
            _loc1_.var_176 = null;
         }
         if(_loc1_.var_197)
         {
            _loc1_.var_197.destroy();
            _loc1_.var_197 = null;
         }
         if(Boolean(_loc1_.var_147) && _loc1_.var_147.hasEventListener(MouseEvent.CLICK))
         {
            _loc1_.var_147.removeEventListener(MouseEvent.CLICK,_loc1_.method_186);
         }
         if(Boolean(_loc1_.var_148) && _loc1_.var_148.hasEventListener(MouseEvent.CLICK))
         {
            _loc1_.var_148.removeEventListener(MouseEvent.CLICK,_loc1_.method_187);
         }
         if(Boolean(_loc1_.var_158) && _loc1_.var_158.hasEventListener(MouseEvent.CLICK))
         {
            _loc1_.var_158.removeEventListener(MouseEvent.CLICK,_loc1_.method_189);
         }
         if(Boolean(_loc1_.var_144) && _loc1_.var_144.hasEventListener(MouseEvent.CLICK))
         {
            _loc1_.var_144.removeEventListener(MouseEvent.CLICK,_loc1_.method_168);
         }
         if(Boolean(_loc1_.var_174) && _loc1_.var_174.hasEventListener(MouseEvent.CLICK))
         {
            _loc1_.var_174.removeEventListener(MouseEvent.CLICK,_loc1_.method_170);
         }
         if(Boolean(_loc1_.var_156) && _loc1_.var_156.hasEventListener(MouseEvent.CLICK))
         {
            _loc1_.var_156.removeEventListener(MouseEvent.CLICK,_loc1_.method_183);
         }
         if(Boolean(_loc1_.var_175) && _loc1_.var_175.hasEventListener(MouseEvent.CLICK))
         {
            _loc1_.var_175.removeEventListener(MouseEvent.CLICK,_loc1_.method_185);
         }
         if(Boolean(_loc1_.var_168) && _loc1_.var_168.hasEventListener(MouseEvent.CLICK))
         {
            _loc1_.var_168.removeEventListener(MouseEvent.CLICK,_loc1_.method_200);
         }
         _loc1_.api.container.removeChild(_loc1_.clip);
      }
      
      public function getLabel() : String
      {
         var _loc1_:class_25 = this;
         return _loc1_.data.label;
      }
      
      public function disableButtons(param1:Array = null, param2:Boolean = true, param3:Boolean = true) : void
      {
         var _loc6_:class_17 = null;
         var _loc4_:class_25;
         if(Boolean((_loc4_ = this).var_176) && param2)
         {
            _loc4_.var_176.method_150();
         }
         if(Boolean(_loc4_.var_197) && param3)
         {
            _loc4_.var_197.method_150();
         }
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.var_157.numChildren)
         {
            _loc6_ = _loc4_.var_157.getChildAt(_loc5_) as class_17;
            if(param1 == null || param1.indexOf(_loc6_.getLabel()) > -1)
            {
               _loc6_.method_150();
            }
            _loc5_++;
         }
      }
      
      public function enableButtons(param1:Array = null) : void
      {
         var _loc4_:class_17 = null;
         var _loc2_:class_25 = this;
         if(_loc2_.var_176)
         {
            _loc2_.var_176.method_155();
         }
         if(_loc2_.var_197)
         {
            _loc2_.var_197.method_155();
         }
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.var_157.numChildren)
         {
            _loc4_ = _loc2_.var_157.getChildAt(_loc3_) as class_17;
            if(param1 == null || param1.indexOf(_loc4_.getLabel()) > -1)
            {
               _loc4_.method_155();
            }
            _loc3_++;
         }
      }
      
      public function setButtonIcon(param1:String, param2:String, param3:Boolean) : void
      {
         var _loc6_:class_17 = null;
         var _loc4_:class_25 = this;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.var_157.numChildren)
         {
            if((_loc6_ = _loc4_.var_157.getChildAt(_loc5_) as class_17).getLabel() == param1)
            {
               _loc6_.method_231(param2,param3);
            }
            _loc5_++;
         }
      }
      
      public function setTitle(param1:String) : void
      {
         var _loc2_:class_25 = this;
         _loc2_.var_162.text = param1;
         _loc2_.var_162.height = _loc2_.var_162.textHeight + 4;
      }
      
      private function getTextFormat() : TextFormat
      {
         this;
         var _loc2_:TextFormat = new TextFormat();
         _loc2_.font = class_18.const_9;
         _loc2_.color = 11447982;
         _loc2_.size = 30;
         _loc2_.align = TextFormatAlign.CENTER;
         _loc2_.kerning = true;
         _loc2_.letterSpacing = -0.5;
         return _loc2_;
      }
      
      private function method_202() : TextFormat
      {
         this;
         var _loc2_:TextFormat = new TextFormat();
         _loc2_.font = class_18.const_23;
         _loc2_.color = class_18.const_17;
         _loc2_.size = class_18.const_16;
         _loc2_.bold = class_18.const_25;
         _loc2_.align = TextFormatAlign.CENTER;
         _loc2_.kerning = true;
         _loc2_.letterSpacing = 0;
         return _loc2_;
      }
      
      public function attachButtonNextToMute(param1:DisplayObject) : void
      {
         var targetX:Number = NaN;
         var targetY:Number = NaN;
         var splitMute:Array = null;
         var button:DisplayObject = param1;
         var screen:class_25 = this;
         try
         {
            targetX = 0;
            targetY = 0;
            if(this.data.var_270)
            {
               targetX = screen.var_156.x - button.width - screen.var_219;
               targetY = screen.var_156.y;
            }
            else
            {
               targetX = screen.var_144.x - button.width - screen.var_219;
               targetY = screen.var_144.y;
            }
            button.x = targetX;
            button.y = targetY;
            splitMute = this.data.var_278.split(" ");
            if(splitMute.indexOf("top") > -1)
            {
               screen.var_142.addChild(button);
            }
            else if(splitMute.indexOf("bottom") > -1)
            {
               screen.var_146.addChild(button);
            }
         }
         catch(err:Error)
         {
            class_6.error("Error attaching button next to mute: " + err.message);
         }
      }
   }
}
