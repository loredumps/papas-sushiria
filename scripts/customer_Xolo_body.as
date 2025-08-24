package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="customer_Xolo_body")]
   public dynamic class customer_Xolo_body extends MovieClip
   {
       
      
      public function customer_Xolo_body()
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
