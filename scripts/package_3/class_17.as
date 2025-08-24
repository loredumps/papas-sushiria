package package_3
{
   import flash.display.*;
   import flash.events.*;
   import flash.filters.ColorMatrixFilter;
   import flash.filters.GlowFilter;
   import flash.geom.*;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.text.*;
   import flash.utils.getDefinitionByName;
   import flipline.api.*;
   import flipline.api.events.*;
   import package_2.class_14;
   import package_5.class_22;
   
   public class class_17 extends MovieClip
   {
      
      private static var var_218:Array = ["api_smallbutton_left","api_smallbutton_middle","api_smallbutton_right"];
      
      private static var var_215:Array = ["api_largebutton_left","api_largebutton_middle","api_largebutton_right"];
      
      private static var var_214:Array = ["api_redbutton_left","api_redbutton_middle","api_redbutton_right"];
      
      private static var var_192:Array = ["api_smallbutton_left_overlay","api_smallbutton_middle_overlay","api_smallbutton_right_overlay"];
      
      private static var var_234:Array = ["api_largebutton_left_overlay","api_largebutton_middle_overlay","api_largebutton_right_overlay"];
      
      private static var var_324:Array = ["api_smallbutton_left_overlay","api_smallbutton_middle_overlay","api_smallbutton_right_overlay"];
       
      
      private var label:String;
      
      private var size:String;
      
      private var type:String;
      
      private var linkURL:String = null;
      
      private var var_320:*;
      
      private var var_170:Boolean = false;
      
      private var var_221:Boolean = false;
      
      private var var_240:Boolean = false;
      
      private var var_290:Boolean = false;
      
      private var var_232:Number = 0;
      
      private var var_283:String;
      
      private var var_224:String = null;
      
      private var icon:DisplayObject = null;
      
      private var var_183:Number = 16;
      
      private var var_212:Number = 23;
      
      private var var_351:Number = 3;
      
      private var var_388:Number = 3;
      
      private var var_340:Number = 8;
      
      private var var_361:Number = 15;
      
      private var var_200:Number = 3;
      
      private var var_165:MovieClip;
      
      private var var_159:MovieClip;
      
      private var var_138:TextField;
      
      private var var_203:Boolean = true;
      
      private var var_189:Boolean = false;
      
      private var var_171:MovieClip = null;
      
      public function class_17(param1:class_22 = null, param2:String = null, param3:String = null, param4:String = "button", param5:String = null, param6:String = null, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:* = null, param11:Boolean = false, param12:Number = 0, param13:Boolean = false, param14:String = null)
      {
         super();
         var _loc15_:class_17 = this;
         if(param1 != null)
         {
            _loc15_.label = param1.label;
            _loc15_.size = param1.size;
            _loc15_.type = param1.var_314;
            _loc15_.var_283 = param1.var_283;
            _loc15_.linkURL = param1.linkURL;
            _loc15_.var_221 = param1.var_221;
            _loc15_.var_240 = param1.var_240;
            _loc15_.var_290 = param1.var_290;
            _loc15_.var_320 = param1.var_320;
            _loc15_.var_170 = param1.var_170;
            _loc15_.var_203 = !_loc15_.var_170;
            _loc15_.var_232 = param1.var_232;
            _loc15_.var_189 = param1.var_189;
            _loc15_.var_224 = param1.var_224;
         }
         else
         {
            _loc15_.label = param2;
            _loc15_.size = param3;
            _loc15_.type = param4;
            _loc15_.var_283 = param5;
            _loc15_.linkURL = param6;
            _loc15_.var_221 = param7;
            _loc15_.var_240 = param8;
            _loc15_.var_290 = param9;
            _loc15_.var_320 = param10;
            _loc15_.var_170 = param11;
            _loc15_.var_203 = !param11;
            _loc15_.var_232 = param12;
            _loc15_.var_189 = param13;
            _loc15_.var_224 = param14;
         }
         _loc15_.method_233();
      }
      
      private function method_233() : void
      {
         var _loc2_:Number = NaN;
         var _loc8_:Class = null;
         var _loc9_:Class = null;
         var _loc10_:Class = null;
         var _loc11_:MovieClip = null;
         var _loc12_:MovieClip = null;
         var _loc13_:MovieClip = null;
         var _loc14_:Class = null;
         var _loc15_:Class = null;
         var _loc16_:Class = null;
         var _loc17_:MovieClip = null;
         var _loc18_:MovieClip = null;
         var _loc19_:MovieClip = null;
         var _loc20_:MovieClip = null;
         var _loc21_:MovieClip = null;
         var _loc22_:MovieClip = null;
         var _loc1_:class_17 = this;
         if(_loc1_.var_240)
         {
            _loc1_.var_232 = 184;
         }
         _loc1_.buttonMode = true;
         _loc1_.useHandCursor = true;
         _loc1_.mouseEnabled = true;
         _loc1_.mouseChildren = false;
         _loc1_.tabEnabled = false;
         _loc1_.addEventListener(MouseEvent.CLICK,_loc1_.method_169);
         _loc1_.addEventListener(MouseEvent.ROLL_OVER,_loc1_.method_207);
         _loc1_.addEventListener(MouseEvent.ROLL_OUT,_loc1_.method_175);
         _loc1_.var_138 = new TextField();
         _loc1_.var_138.embedFonts = true;
         _loc1_.var_138.antiAliasType = AntiAliasType.ADVANCED;
         _loc1_.var_138.gridFitType = GridFitType.SUBPIXEL;
         _loc1_.var_138.wordWrap = false;
         _loc1_.var_138.multiline = false;
         _loc1_.var_138.text = _loc1_.label;
         _loc1_.var_138.setTextFormat(_loc1_.getTextFormat(_loc1_.var_170));
         _loc1_.var_138.height = _loc1_.var_138.textHeight + 4;
         _loc1_.method_159(_loc1_.var_170);
         if(_loc1_.var_224 != null)
         {
            _loc1_.icon = class_14.method_197(_loc1_.var_224,false,false);
         }
         var _loc3_:Boolean = false;
         if(_loc1_.label == "" || _loc1_.label == " " || _loc1_.label.indexOf("(") == 0)
         {
            _loc3_ = true;
         }
         var _loc4_:Number = _loc1_.var_138.textWidth + 4 + _loc1_.var_340 * 2;
         if(_loc1_.size == "large")
         {
            _loc4_ = _loc1_.var_138.textWidth + 4 + _loc1_.var_361 * 2;
         }
         if(_loc1_.icon != null)
         {
            _loc4_ += _loc1_.icon.width + _loc1_.var_200;
         }
         if(_loc1_.var_232 > 0)
         {
            _loc4_ = _loc1_.var_232;
         }
         if(_loc1_.size == "small")
         {
            _loc1_.var_138.width = _loc4_;
            _loc1_.var_138.x = 0;
            _loc1_.var_138.y = _loc1_.var_351;
         }
         else if(_loc1_.size == "large")
         {
            _loc1_.var_138.width = _loc4_;
            _loc1_.var_138.x = 0;
            _loc1_.var_138.y = _loc1_.var_388;
         }
         var _loc5_:Number = _loc1_.var_138.width;
         if(_loc1_.icon != null)
         {
            if(_loc1_.size == "large")
            {
               _loc1_.var_138.width -= _loc1_.icon.width + _loc1_.var_200;
               _loc1_.icon.y = _loc1_.var_138.y + _loc1_.var_138.height / 2 - _loc1_.icon.height / 2;
               _loc1_.icon.x = _loc1_.var_138.x + _loc1_.var_138.width / 2 + _loc1_.var_138.textWidth / 2 + _loc1_.var_200;
            }
            else
            {
               _loc1_.var_138.width -= _loc1_.icon.width + _loc1_.var_200;
               _loc1_.var_138.x += _loc1_.icon.width + _loc1_.var_200;
               _loc1_.icon.y = _loc1_.var_138.y + _loc1_.var_138.height / 2 - _loc1_.icon.height / 2;
               _loc1_.icon.x = _loc1_.var_138.x + _loc1_.var_138.width / 2 - _loc1_.var_138.textWidth / 2 - _loc1_.var_200 - _loc1_.icon.width;
               if(_loc3_)
               {
                  _loc1_.icon.y = 13.5 - _loc1_.icon.height / 2;
                  _loc1_.icon.x = 14 - _loc1_.icon.width / 2;
                  _loc1_.var_138.width = 1;
                  _loc1_.var_138.x = _loc1_.icon.x;
               }
            }
         }
         _loc1_.var_165 = new MovieClip();
         _loc1_.var_159 = new MovieClip();
         _loc1_.var_159.blendMode = "overlay";
         _loc1_.var_159.alpha = 0.5;
         _loc1_.var_159.visible = false;
         _loc1_.addChild(_loc1_.var_165);
         _loc1_.addChild(_loc1_.var_138);
         if(_loc1_.icon)
         {
            _loc1_.addChild(_loc1_.icon);
            if(_loc1_.var_170)
            {
               _loc1_.method_165();
            }
         }
         _loc1_.addChild(_loc1_.var_159);
         if(_loc1_.var_189)
         {
            _loc1_.var_171 = new api_button_flasher();
            _loc1_.var_171.blendMode = "overlay";
            _loc1_.var_171.alpha = 0.4;
            _loc1_.var_171.visible = true;
            _loc1_.addChild(_loc1_.var_171);
         }
         var _loc6_:Number = 1;
         var _loc7_:Number = 0;
         if(_loc1_.var_221)
         {
            _loc6_ = Math.ceil(_loc5_ / this.var_183) - 2;
            _loc7_ = Math.ceil(_loc5_ - this.var_183 * 2);
            _loc11_ = new (_loc8_ = getDefinitionByName(class_17.var_214[0]) as Class)();
            _loc17_ = new (_loc14_ = getDefinitionByName(class_17.var_192[0]) as Class)();
            _loc1_.var_165.addChild(_loc11_);
            _loc1_.var_159.addChild(_loc17_);
            if(_loc1_.var_170)
            {
               _loc11_.gotoAndStop("disabled");
            }
            else
            {
               _loc11_.gotoAndStop("up");
            }
            _loc9_ = getDefinitionByName(class_17.var_214[1]) as Class;
            (_loc18_ = new (_loc16_ = getDefinitionByName(class_17.var_192[1]) as Class)()).x = _loc1_.var_183;
            _loc18_.width = _loc7_;
            _loc1_.var_159.addChild(_loc18_);
            (_loc12_ = new _loc9_()).x = _loc1_.var_183 - 1;
            _loc12_.width = _loc7_ + 2;
            _loc1_.var_165.addChild(_loc12_);
            if(_loc1_.var_170)
            {
               _loc12_.gotoAndStop("disabled");
            }
            else
            {
               _loc12_.gotoAndStop("up");
            }
            _loc13_ = new (_loc10_ = getDefinitionByName(class_17.var_214[2]) as Class)();
            _loc19_ = new (_loc15_ = getDefinitionByName(class_17.var_192[2]) as Class)();
            _loc13_.x = _loc1_.var_183 + _loc7_;
            _loc19_.x = _loc13_.x;
            _loc1_.var_165.addChild(_loc13_);
            _loc1_.var_159.addChild(_loc19_);
            if(_loc1_.var_170)
            {
               _loc13_.gotoAndStop("disabled");
            }
            else
            {
               _loc13_.gotoAndStop("up");
            }
         }
         else if(_loc1_.size == "small")
         {
            _loc6_ = Math.ceil(_loc5_ / this.var_183) - 2;
            _loc7_ = Math.ceil(_loc5_ - this.var_183 * 2);
            _loc11_ = new (_loc8_ = getDefinitionByName(class_17.var_218[0]) as Class)();
            _loc17_ = new (_loc14_ = getDefinitionByName(class_17.var_192[0]) as Class)();
            _loc1_.var_165.addChild(_loc11_);
            _loc1_.var_159.addChild(_loc17_);
            if(_loc1_.var_170)
            {
               _loc11_.gotoAndStop("disabled");
            }
            else
            {
               _loc11_.gotoAndStop("up");
            }
            _loc9_ = getDefinitionByName(class_17.var_218[1]) as Class;
            (_loc18_ = new (_loc16_ = getDefinitionByName(class_17.var_192[1]) as Class)()).x = _loc1_.var_183;
            _loc18_.width = _loc7_;
            _loc1_.var_159.addChild(_loc18_);
            (_loc12_ = new _loc9_()).x = _loc1_.var_183 - 1;
            _loc12_.width = _loc7_ + 2;
            _loc1_.var_165.addChild(_loc12_);
            if(_loc1_.var_170)
            {
               _loc12_.gotoAndStop("disabled");
            }
            else
            {
               _loc12_.gotoAndStop("up");
            }
            if(_loc3_)
            {
               _loc12_.visible = false;
               _loc12_.width = 1;
               _loc18_.visible = false;
               _loc18_.width = 1;
            }
            _loc13_ = new (_loc10_ = getDefinitionByName(class_17.var_218[2]) as Class)();
            _loc19_ = new (_loc15_ = getDefinitionByName(class_17.var_192[2]) as Class)();
            _loc13_.x = _loc1_.var_183 + _loc7_;
            if(_loc3_)
            {
               _loc13_.x = 12;
            }
            _loc19_.x = _loc13_.x;
            _loc1_.var_165.addChild(_loc13_);
            _loc1_.var_159.addChild(_loc19_);
            if(_loc1_.var_170)
            {
               _loc13_.gotoAndStop("disabled");
            }
            else
            {
               _loc13_.gotoAndStop("up");
            }
         }
         else if(_loc1_.size == "large")
         {
            _loc6_ = Math.ceil(_loc5_ / this.var_212) - 2;
            _loc7_ = Math.ceil(_loc5_ - this.var_212 * 2);
            _loc11_ = new (_loc8_ = getDefinitionByName(class_17.var_215[0]) as Class)();
            _loc17_ = new (_loc14_ = getDefinitionByName(class_17.var_234[0]) as Class)();
            _loc1_.var_165.addChild(_loc11_);
            _loc1_.var_159.addChild(_loc17_);
            if(_loc1_.var_189)
            {
               _loc20_ = new _loc14_();
               _loc1_.var_171.inside.addChild(_loc20_);
            }
            if(_loc1_.var_170)
            {
               _loc11_.gotoAndStop("disabled");
            }
            else
            {
               _loc11_.gotoAndStop("up");
            }
            _loc9_ = getDefinitionByName(class_17.var_215[1]) as Class;
            (_loc18_ = new (_loc16_ = getDefinitionByName(class_17.var_234[1]) as Class)()).x = _loc1_.var_212;
            _loc18_.width = _loc7_;
            _loc1_.var_159.addChild(_loc18_);
            if(_loc1_.var_189)
            {
               (_loc21_ = new _loc16_()).x = _loc1_.var_212;
               _loc21_.width = _loc7_;
               _loc1_.var_171.inside.addChild(_loc21_);
            }
            (_loc12_ = new _loc9_()).x = _loc1_.var_212 - 1;
            _loc12_.width = _loc7_ + 2;
            _loc1_.var_165.addChild(_loc12_);
            if(_loc1_.var_170)
            {
               _loc12_.gotoAndStop("disabled");
            }
            else
            {
               _loc12_.gotoAndStop("up");
            }
            _loc13_ = new (_loc10_ = getDefinitionByName(class_17.var_215[2]) as Class)();
            _loc19_ = new (_loc15_ = getDefinitionByName(class_17.var_234[2]) as Class)();
            _loc13_.x = _loc1_.var_212 + _loc7_;
            _loc19_.x = _loc13_.x;
            _loc1_.var_165.addChild(_loc13_);
            _loc1_.var_159.addChild(_loc19_);
            if(_loc1_.var_170)
            {
               _loc13_.gotoAndStop("disabled");
            }
            else
            {
               _loc13_.gotoAndStop("up");
            }
            if(_loc1_.var_189)
            {
               (_loc22_ = new _loc15_()).x = _loc13_.x;
               _loc1_.var_171.inside.addChild(_loc22_);
            }
         }
         if(_loc1_.var_189)
         {
         }
      }
      
      private function method_159(param1:Boolean = false) : void
      {
         var _loc3_:GlowFilter = null;
         var _loc2_:class_17 = this;
         if(param1)
         {
            _loc2_.var_138.filters = [];
         }
         else
         {
            _loc3_ = new GlowFilter(16774818,1,2,2,5);
            if(_loc2_.var_221)
            {
               _loc3_.color = 6684672;
            }
            else if(_loc2_.size == "large")
            {
               _loc3_.color = 1118481;
            }
            _loc2_.var_138.filters = [_loc3_];
         }
      }
      
      private function getTextFormat(param1:Boolean = false) : TextFormat
      {
         var _loc2_:class_17 = this;
         var _loc3_:TextFormat = new TextFormat();
         _loc3_.font = class_18.const_9;
         if(param1)
         {
            if(_loc2_.size == "large")
            {
               _loc3_.color = class_18.const_12;
            }
            else
            {
               _loc3_.color = class_18.const_19;
            }
         }
         else if(_loc2_.var_221)
         {
            _loc3_.color = class_18.const_22;
         }
         else if(_loc2_.size == "large")
         {
            _loc3_.color = class_18.const_11;
         }
         else
         {
            _loc3_.color = class_18.const_15;
         }
         if(_loc2_.size == "large")
         {
            _loc3_.size = class_18.const_24;
         }
         else
         {
            _loc3_.size = class_18.const_18;
         }
         _loc3_.bold = class_18.const_20;
         _loc3_.align = TextFormatAlign.CENTER;
         _loc3_.kerning = true;
         _loc3_.letterSpacing = -0.5;
         return _loc3_;
      }
      
      public function destroy() : void
      {
         var _loc1_:class_17 = this;
         if(Boolean(_loc1_.parent) && _loc1_.parent.contains(_loc1_))
         {
            _loc1_.parent.removeChild(_loc1_);
         }
         if(_loc1_.icon)
         {
            try
            {
               MovieClip(_loc1_.icon).stop();
            }
            catch(err:Error)
            {
            }
            _loc1_.removeChild(_loc1_.icon);
         }
         _loc1_.removeChild(_loc1_.var_165);
         _loc1_.removeChild(_loc1_.var_159);
         _loc1_.removeChild(_loc1_.var_138);
         if(_loc1_.var_171 != null)
         {
            _loc1_.removeChild(_loc1_.var_171);
            _loc1_.var_171 = null;
         }
         _loc1_.var_165 = null;
         _loc1_.var_159 = null;
         _loc1_.icon = null;
         _loc1_.removeEventListener(MouseEvent.ROLL_OVER,_loc1_.method_207);
         _loc1_.removeEventListener(MouseEvent.ROLL_OUT,_loc1_.method_175);
         _loc1_.removeEventListener(MouseEvent.CLICK,_loc1_.method_169);
      }
      
      private function method_169(param1:MouseEvent) : void
      {
         var _loc2_:class_17 = this;
         if(_loc2_.var_203)
         {
            if(_loc2_.type == "link")
            {
               try
               {
                  navigateToURL(new URLRequest(_loc2_.linkURL),"_blank");
               }
               catch(err:Error)
               {
               }
            }
            else if(_loc2_.type == "button")
            {
               dispatchEvent(new MenuButtonEvent(_loc2_.var_283,true));
            }
            else if(_loc2_.type == "custom")
            {
            }
         }
      }
      
      private function method_207(param1:MouseEvent) : void
      {
         var _loc2_:class_17 = this;
         if(_loc2_.var_203)
         {
            _loc2_.var_159.visible = true;
            if(_loc2_.var_189 && _loc2_.var_171 != null)
            {
               _loc2_.var_171.visible = false;
            }
         }
      }
      
      private function method_175(param1:MouseEvent) : void
      {
         var _loc2_:class_17 = this;
         if(_loc2_.var_203)
         {
            _loc2_.var_159.visible = false;
            if(_loc2_.var_189 && _loc2_.var_171 != null)
            {
               _loc2_.var_171.visible = true;
            }
         }
      }
      
      public function method_155() : void
      {
         var _loc1_:class_17 = this;
         _loc1_.var_203 = true;
         _loc1_.var_138.setTextFormat(_loc1_.getTextFormat());
         _loc1_.method_159();
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.var_165.numChildren)
         {
            MovieClip(_loc1_.var_165.getChildAt(_loc2_)).gotoAndStop("up");
            _loc2_++;
         }
         if(_loc1_.icon)
         {
            _loc1_.icon.filters = [];
         }
      }
      
      public function method_150() : void
      {
         var _loc1_:class_17 = this;
         _loc1_.var_203 = false;
         _loc1_.var_159.visible = false;
         _loc1_.var_138.setTextFormat(_loc1_.getTextFormat(true));
         _loc1_.method_159(true);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.var_165.numChildren)
         {
            MovieClip(_loc1_.var_165.getChildAt(_loc2_)).gotoAndStop("disabled");
            _loc2_++;
         }
         _loc1_.method_165();
      }
      
      public function method_165() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:ColorMatrixFilter = null;
         var _loc1_:class_17 = this;
         if(_loc1_.icon != null)
         {
            _loc2_ = 30;
            _loc3_ = 0.6;
            _loc4_ = 0.212671 * _loc3_;
            _loc5_ = 0.71516 * _loc3_;
            _loc6_ = 0.072169 * _loc3_;
            _loc7_ = new ColorMatrixFilter([_loc4_,_loc5_,_loc6_,0,_loc2_,_loc4_,_loc5_,_loc6_,0,_loc2_,_loc4_,_loc5_,_loc6_,0,_loc2_,0,0,0,1,0]);
            _loc1_.icon.filters = [_loc7_];
         }
      }
      
      public function getLabel() : String
      {
         var _loc1_:class_17 = this;
         return _loc1_.label;
      }
      
      public function method_231(param1:String, param2:Boolean = false) : void
      {
         var _loc4_:Boolean = false;
         var _loc3_:class_17 = this;
         if(_loc3_.icon)
         {
            try
            {
               MovieClip(_loc3_.icon).stop();
            }
            catch(err:Error)
            {
            }
            _loc3_.removeChild(_loc3_.icon);
         }
         _loc3_.icon = null;
         if(param2)
         {
            param1 = _loc3_.var_224;
         }
         if(param1 != null)
         {
            _loc3_.icon = class_14.method_197(param1,false,false);
            _loc3_.icon.y = _loc3_.var_138.y + _loc3_.var_138.height / 2 - _loc3_.icon.height / 2;
            _loc3_.icon.x = _loc3_.var_138.x + _loc3_.var_138.width / 2 - _loc3_.var_138.textWidth / 2 - _loc3_.var_200 - _loc3_.icon.width;
            if(_loc3_.size == "large")
            {
               _loc3_.icon.x = _loc3_.var_138.x + _loc3_.var_138.width / 2 + _loc3_.var_138.textWidth / 2 + _loc3_.var_200;
            }
            _loc4_ = false;
            if(_loc3_.label == "" || _loc3_.label == " " || _loc3_.label.indexOf("(") == 0)
            {
               _loc4_ = true;
            }
            if(_loc4_)
            {
               _loc3_.icon.y = 13.5 - _loc3_.icon.height / 2;
               _loc3_.icon.x = 14 - _loc3_.icon.width / 2;
               _loc3_.var_138.width = 1;
               _loc3_.var_138.x = _loc3_.icon.x;
            }
            _loc3_.addChild(_loc3_.icon);
         }
      }
   }
}
