package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="spoonMC")]
   public dynamic class spoonMC extends MovieClip
   {
       
      
      public var holder:MovieClip;
      
      public var icon:MovieClip;
      
      public var masker:MovieClip;
      
      public var timer:MovieClip;
      
      public var timer_txt:TextField;
      
      public function spoonMC()
      {
         super();
         addFrameScript(0,this.frame1,3,this.frame4,6,this.frame7);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame4() : *
      {
         stop();
      }
      
      internal function frame7() : *
      {
         gotoAndStop(1);
      }
   }
}
