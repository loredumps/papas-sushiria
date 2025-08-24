package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="fliplinead_fader")]
   public dynamic class fliplinead_fader extends MovieClip
   {
       
      
      public function fliplinead_fader()
      {
         super();
         addFrameScript(0,this.frame1,6,this.frame7);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame7() : *
      {
         stop();
      }
   }
}
