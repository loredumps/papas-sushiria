package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="handextra_omamori")]
   public dynamic class handextra_omamori extends MovieClip
   {
       
      
      public function handextra_omamori()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         gotoAndStop(Math.ceil(Math.random() * 3));
      }
   }
}
