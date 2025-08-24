package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="training_sushislice")]
   public dynamic class training_sushislice extends MovieClip
   {
       
      
      public function training_sushislice()
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
