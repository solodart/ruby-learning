  #Подумайте над любой задачей из реального мира, определите сущности и попробуйте представить их с помощью типов данных Ruby.

сLass LightHead
  attr_reader :x, :y, :color

  require HardWareOfHead #methods: start_move(x,y, speed), setnewcolor(color)
  # CONST from HardWareOfHead:
  # COLORS=[:white, :red, :green, :blue, :strobo, :off]
  # XMAX=100;XMIN=-100
  # YMAX=100;YMIN=-100
  # SPEEDMAX=5

  def initialize x=0, y=0, color=:white
    @x=x
    @y=y
    @color=color
  end

  def set_color color
    if color_valid
      setnewcolor(color)
      @color=color
    end
  end

  def move_head x, y, speed=0
    speed=0 unless valid_speed(speed)
    if valid_xy(x,y)
      start_move (x,y,speed)
      @x=x; @y=y
    end
  end

  def start
    move_head(@x, @y)
    set_color(@color)
  end

  def off
    move_head(0, 0)
    set_color(:off)
  end

end
