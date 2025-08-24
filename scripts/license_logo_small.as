package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="license_logo_small")]
   public dynamic class license_logo_small extends MovieClip
   {
       
      
      public function license_logo_small()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}
