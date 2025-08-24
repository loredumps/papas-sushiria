package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="customer_Clair_neck")]
   public dynamic class customer_Clair_neck extends MovieClip
   {
       
      
      public function customer_Clair_neck()
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
