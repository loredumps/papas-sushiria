package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="handextra_jubizela")]
   public dynamic class handextra_jubizela extends MovieClip
   {
       
      
      public function handextra_jubizela()
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
