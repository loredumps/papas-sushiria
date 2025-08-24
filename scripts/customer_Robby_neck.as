package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="customer_Robby_neck")]
   public dynamic class customer_Robby_neck extends MovieClip
   {
       
      
      public function customer_Robby_neck()
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
