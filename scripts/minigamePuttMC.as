package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="minigamePuttMC")]
   public dynamic class minigamePuttMC extends MovieClip
   {
       
      
      public var ball:MovieClip;
      
      public var club:MovieClip;
      
      public var holder:MovieClip;
      
      public var hole:MovieClip;
      
      public var par_txt:TextField;
      
      public var score:MovieClip;
      
      public var starter:MovieClip;
      
      public var stroke_txt:TextField;
      
      public function minigamePuttMC()
      {
         super();
      }
   }
}
