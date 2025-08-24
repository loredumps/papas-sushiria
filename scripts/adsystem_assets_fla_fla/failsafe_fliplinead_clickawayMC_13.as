package adsystem_assets_fla_fla
{
   import adobe.utils.*;
   import flash.accessibility.*;
   import flash.desktop.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filters.*;
   import flash.geom.*;
   import flash.globalization.*;
   import flash.media.*;
   import flash.net.*;
   import flash.net.drm.*;
   import flash.printing.*;
   import flash.profiler.*;
   import flash.sampler.*;
   import flash.sensors.*;
   import flash.system.*;
   import flash.text.*;
   import flash.text.engine.*;
   import flash.text.ime.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   
   [Embed(source="/_assets/assets.swf", symbol="adsystem_assets_fla_fla.failsafe_fliplinead_clickawayMC_13")]
   public dynamic class failsafe_fliplinead_clickawayMC_13 extends MovieClip
   {
       
      
      public var app_1_btn:SimpleButton;
      
      public var app_2_btn:SimpleButton;
      
      public var app_3_btn:SimpleButton;
      
      public var app_4_btn:SimpleButton;
      
      public var appstore_btn:SimpleButton;
      
      public var googleplay_btn:SimpleButton;
      
      public var kindlefire_btn:SimpleButton;
      
      public var moreinfo_btn:SimpleButton;
      
      public var itunesPromoURL:String;
      
      public var googlePromoURL:String;
      
      public var amazonPromoURL:String;
      
      public var moreInfoURL:String;
      
      public var otherAppURLs:Array;
      
      public var i:int;
      
      public function failsafe_fliplinead_clickawayMC_13()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function clickPromoAd(param1:MouseEvent = null) : void
      {
         navigateToURL(new URLRequest(this.itunesPromoURL),"_blank");
      }
      
      public function clickPromoGoogle(param1:MouseEvent = null) : void
      {
         navigateToURL(new URLRequest(this.googlePromoURL),"_blank");
      }
      
      public function clickPromoKindle(param1:MouseEvent = null) : void
      {
         navigateToURL(new URLRequest(this.amazonPromoURL),"_blank");
      }
      
      public function clickPromoMoreInfo(param1:MouseEvent = null) : void
      {
         navigateToURL(new URLRequest(this.moreInfoURL),"_blank");
      }
      
      public function clickPromoApp(param1:MouseEvent = null) : void
      {
         var _loc2_:String = String(String(param1.currentTarget.name).split("_")[1]);
         var _loc3_:Number = Number(_loc2_) - 1;
         if(_loc3_ >= 0 && _loc3_ < this.otherAppURLs.length)
         {
            navigateToURL(new URLRequest(this.otherAppURLs[_loc3_]),"_blank");
         }
      }
      
      internal function frame1() : *
      {
         this.itunesPromoURL = "https://itunes.apple.com/us/app/papas-freezeria-to-go!/id824305459?ls=1&mt=8";
         this.googlePromoURL = "https://play.google.com/store/apps/details?id=air.com.flipline.papasfreezeriatogo";
         this.amazonPromoURL = "http://www.amazon.com/gp/product/B00IO1VCTK/ref=mas_pm_Papas_Freezeria_To_Go";
         this.moreInfoURL = "http://www.flipline.com/apps/papasfreezeriatogo/";
         this.otherAppURLs = ["https://itunes.apple.com/us/app/papas-freezeria-to-go!/id824305459?ls=1&mt=8","https://itunes.apple.com/us/app/papas-freezeria-hd/id715822238?ls=1&mt=8","https://itunes.apple.com/us/app/papas-burgeria-to-go!/id600626116?ls=1&mt=8","http://itunes.apple.com/us/app/papas-burgeria/id514634235?ls=1&mt=8"];
         stop();
         this.moreinfo_btn.addEventListener(MouseEvent.MOUSE_DOWN,this.clickPromoMoreInfo);
         this.googleplay_btn.addEventListener(MouseEvent.MOUSE_DOWN,this.clickPromoGoogle);
         this.kindlefire_btn.addEventListener(MouseEvent.MOUSE_DOWN,this.clickPromoKindle);
         this.appstore_btn.addEventListener(MouseEvent.MOUSE_DOWN,this.clickPromoAd);
         try
         {
            this.i = 1;
            while(this.i <= this.otherAppURLs.length)
            {
               this["app_" + this.i + "_btn"].addEventListener(MouseEvent.MOUSE_DOWN,this.clickPromoApp);
               ++this.i;
            }
         }
         catch(err:Error)
         {
         }
      }
   }
}
