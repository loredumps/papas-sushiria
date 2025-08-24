package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="customer_Cletus_neck")]
   public dynamic class customer_Cletus_neck extends MovieClip
   {
       
      
      public function customer_Cletus_neck()
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
