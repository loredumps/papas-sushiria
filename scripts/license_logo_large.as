package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="license_logo_large")]
   public dynamic class license_logo_large extends MovieClip
   {
       
      
      public function license_logo_large()
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
