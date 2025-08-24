package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="fliplinead_promobutton_clip")]
   public dynamic class fliplinead_promobutton_clip extends MovieClip
   {
       
      
      public var inside:MovieClip;
      
      public function fliplinead_promobutton_clip()
      {
         super();
         addFrameScript(26,this.frame27);
      }
      
      internal function frame27() : *
      {
         stop();
      }
   }
}
