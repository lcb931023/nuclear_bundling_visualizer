class Grid
{
  float gWidth = 30;
  float gHeight = 30;
  int rowAmount;
  int colAmount;
  public Grid()
  {
    rowAmount = int(width / gWidth);
    colAmount = int(height / gHeight);
  }

  // Gets called each draw();
  public void update()
  {
    noFill();
    stroke(111, 195, 223, 130);
    for (int col = 0; col < colAmount; col ++ )
    {
      for (int row = 0; row < rowAmount; row ++)
      {
        point(row * gWidth, (col + 1) * gHeight);
      }
    }
  }
}

