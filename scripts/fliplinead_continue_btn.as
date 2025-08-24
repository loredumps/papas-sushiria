package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   [Embed(source="/_assets/assets.swf", symbol="fliplinead_continue_btn")]
   public dynamic class fliplinead_continue_btn extends MovieClip
   {
       
      
      public var roll:SimpleButton;
      
      public function fliplinead_continue_btn()
      {
         super();
         addFrameScript(22,this.frame23);
      }
      
      internal function frame23() : *
      {
         stop();
      }
   }
}
