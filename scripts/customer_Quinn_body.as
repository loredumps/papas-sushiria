package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="customer_Quinn_body")]
   public dynamic class customer_Quinn_body extends MovieClip
   {
       
      
      public function customer_Quinn_body()
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
