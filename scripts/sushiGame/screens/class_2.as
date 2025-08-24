package sushiGame.screens
{
   import flash.display.*;
   import flash.events.*;
   import package_2.class_3;
   import package_3.class_4;
   
   public dynamic class class_2
   {
       
      
      public var container:MovieClip;
      
      public var clip:MovieClip;
      
      public var maxSpeed:Number = 50;
      
      public var var_73:Number = 26;
      
      public var var_42:Number = 544;
      
      public var var_125:Boolean = true;
      
      public var var_124:Boolean = true;
      
      public var var_126:Boolean = true;
      
      public var var_75:Boolean = false;
      
      public var var_27:MovieClip;
      
      public var var_120:Boolean = false;
      
      public var completeFunction:Function = null;
      
      public function class_2(param1:MovieClip, param2:Function)
      {
         super();
         var _loc3_:class_2 = this;
         _loc3_.container = param1;
         _loc3_.completeFunction = param2;
         class_4.method_55(_loc3_.container.loaderInfo,"papassushiria","1.0.1",640,480,_loc3_.container);
         class_4.method_22(class_4.const_6,"https://itunes.apple.com/us/app/papas-freezeria-to-go!/id824305459?ls=1&mt=8");
         class_4.method_22(class_4.const_4,"https://itunes.apple.com/us/app/papas-freezeria-hd/id715822238?ls=1&mt=8");
         class_4.method_22(class_4.const_5,"https://itunes.apple.com/us/app/papas-freezeria-hd/id715822238?ls=1&mt=8");
         if(class_3.method_42())
         {
            _loc3_.setupScreen();
         }
         else
         {
            class_4.method_57(_loc3_.container,_loc3_.setupScreen);
         }
      }
      
      private function method_36() : LoaderInfo
      {
         return this.container.loaderInfo;
      }
      
      public function method_93(param1:Event = null) : void
      {
      }
      
      public function method_63(param1:Event = null) : void
      {
      }
      
      public function setupScreen(param1:Event = null) : void
      {
         var _loc2_:class_2 = this;
         _loc2_.clip = new loadingMC();
         _loc2_.container.addChild(_loc2_.clip);
         _loc2_.clip.addEventListener(Event.ENTER_FRAME,_loc2_.updateScreen);
         _loc2_.clip.loader_bar.percent_txt.text = "0%";
         _loc2_.var_27 = new MovieClip();
         _loc2_.var_27.x = 252;
         _loc2_.var_27.y = 379;
         _loc2_.clip.addChild(_loc2_.var_27);
         _loc2_.var_27.visible = false;
         _loc2_.var_27.addEventListener("clickPlayBtn",_loc2_.method_33);
         if(class_3.method_53())
         {
            _loc2_.var_75 = this.var_124;
         }
         else if(class_3.method_56())
         {
            _loc2_.var_75 = this.var_125;
         }
         else
         {
            _loc2_.var_75 = this.var_126;
         }
         if(class_3.method_42() == false)
         {
            class_4.method_41();
         }
      }
      
      public function method_51() : void
      {
         var _loc1_:class_2 = this;
         if(!_loc1_.var_120)
         {
            _loc1_.var_120 = true;
            if(_loc1_.var_75)
            {
               if(_loc1_.completeFunction != null)
               {
                  _loc1_.completeFunction();
               }
            }
            else
            {
               _loc1_.var_27.visible = true;
            }
         }
      }
      
      public function method_33(param1:Event = null) : void
      {
         var _loc2_:class_2 = this;
         if(_loc2_.completeFunction != null)
         {
            _loc2_.completeFunction();
         }
      }
      
      public function method_72(param1:Event = null) : void
      {
         var _loc2_:class_2 = this;
         _loc2_.setupScreen();
      }
      
      public function updateScreen(param1:Event) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc2_:class_2 = this;
         if(_loc2_.clip.currentFrame == 28)
         {
            _loc3_ = _loc2_.method_36().bytesLoaded / _loc2_.method_36().bytesTotal;
            _loc4_ = (_loc2_.clip.loader_bar.x - _loc2_.var_73) / _loc2_.var_42;
            _loc5_ = 0;
            if(_loc3_ * _loc2_.var_42 - _loc4_ * _loc2_.var_42 <= _loc2_.maxSpeed)
            {
               _loc2_.clip.loader_bar.x = _loc2_.var_73 + _loc3_ * _loc2_.var_42;
               _loc5_ = _loc3_;
            }
            else
            {
               _loc2_.clip.loader_bar.x += _loc2_.maxSpeed;
               _loc5_ = (_loc2_.clip.loader_bar.x - _loc2_.var_73) / _loc2_.var_42;
            }
            _loc2_.clip.loader_bar.percent_txt.text = String(Math.round(_loc5_ * 100)) + "%";
            if(_loc2_.clip.loader_bar.x >= _loc2_.var_73 + _loc2_.var_42)
            {
               _loc2_.clip.loader_bar.x = 2000;
               _loc2_.clip.gotoAndPlay("animout");
            }
         }
         else if(_loc2_.clip.currentFrame == _loc2_.clip.totalFrames)
         {
            _loc2_.method_51();
         }
      }
      
      public function destroy() : void
      {
         var _loc1_:class_2 = this;
         _loc1_.var_27.removeEventListener("clickPlayBtn",_loc1_.method_33);
         _loc1_.var_27 = null;
         _loc1_.clip.removeEventListener(Event.ENTER_FRAME,_loc1_.updateScreen);
         _loc1_.container.removeChild(_loc1_.clip);
         _loc1_.clip = null;
      }
   }
}
