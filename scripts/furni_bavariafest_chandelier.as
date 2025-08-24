package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="furni_bavariafest_chandelier")]
   public dynamic class furni_bavariafest_chandelier extends MovieClip
   {
       
      
      public function furni_bavariafest_chandelier()
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
