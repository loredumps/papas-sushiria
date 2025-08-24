package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="customer_Greg_body")]
   public dynamic class customer_Greg_body extends MovieClip
   {
       
      
      public function customer_Greg_body()
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
