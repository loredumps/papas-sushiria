package sushiGame.screens
{
   import flash.display.*;
   import flash.events.*;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import package_4.class_5;
   
   public class class_8
   {
       
      
      public var gameObj:class_5;
      
      public var clip:MovieClip;
      
      public function class_8(param1:class_5)
      {
         super();
         var _loc2_:class_8 = this;
         _loc2_.gameObj = param1;
         _loc2_.setupScreen();
      }
      
      public function setupScreen() : void
      {
         var _loc1_:class_8 = this;
         _loc1_.clip = new lockScreenMC();
         _loc1_.gameObj.addChild(_loc1_.clip);
         _loc1_.clip.btn.addEventListener(MouseEvent.CLICK,_loc1_.clickScreen);
         _loc1_.clip.license_btn.addEventListener(MouseEvent.CLICK,_loc1_.method_244);
      }
      
      public function clickScreen(param1:MouseEvent) : void
      {
         this;
         navigateToURL(new URLRequest("http://www.flipline.com"),"_blank");
      }
      
      public function method_244(param1:MouseEvent) : void
      {
         this;
         navigateToURL(new URLRequest("http://www.flipline.com/papasushiria_licenseredirect.html"),"_blank");
      }
   }
}
