package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   [Embed(source="/_assets/assets.swf", symbol="licenseLogoMC")]
   public dynamic class licenseLogoMC extends MovieClip
   {
       
      
      public var btn:SimpleButton;
      
      public function licenseLogoMC()
      {
         super();
         addFrameScript(102,this.frame103);
      }
      
      internal function frame103() : *
      {
         stop();
      }
   }
}
