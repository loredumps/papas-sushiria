package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="giveorder_countertop")]
   public dynamic class giveorder_countertop extends MovieClip
   {
       
      
      public function giveorder_countertop()
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
