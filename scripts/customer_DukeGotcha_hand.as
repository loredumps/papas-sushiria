package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="customer_DukeGotcha_hand")]
   public dynamic class customer_DukeGotcha_hand extends MovieClip
   {
       
      
      public function customer_DukeGotcha_hand()
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
