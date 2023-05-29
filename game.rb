require 'ruby2d'

def draw_line(x1,y1,x2,y2)
    Line.new(
        x1: x1, y1: y1,
        x2: x2, y2: y2,
        width: 1,
        color: 'white',
        z: 20
      )
      Circle.new(
        x: x1, y: y1,
        radius: 3,
        sectors: 32,
        color: 'white',
        z: 10
      )
      Circle.new(
        x: x2, y: y2,
        radius: 3,
        sectors: 32,
        color: 'white',
        z: 10
      )
end

def graph(yals)
    yals.each{|xy| draw_line(xy[0],xy[1],xy[2],xy[3])}
end

def uniq_kon(array)
    uniq_array =[]
    while !(array.size == 0)
        temp= array.delete_at(0)
        mini_uniq=[]
        array.each do |yal|
            unless temp == yal or( temp[0] == yal[2] and temp[1] == yal[3] and temp[2] == yal[0] and temp[3] == yal[0])
                mini_uniq << yal
            end
        end
        array = mini_uniq
        uniq_array << temp
    end
    
    uniq_array
end

def d_graph(yals)
    yals_2=[]
    yals.each do |i|
        x0=(i[0]+i[2])/2
        y0=(i[1]+i[3])/2

        yals.each do |j|
                if((i[0]==j[0] and i[1]==j[1])||(i[0]==j[2] and i[1]==j[3])||(i[2]==j[0] and i[3]==j[1])||(i[2]==j[2] and i[3]==j[3]))
                    x1  = (j[0]+j[2])/2 
                    y1  = (j[1]+j[3])/2
                    unless x0 == x1 and y0 == y1
                        yals_2 << [x0,y0,x1,y1]
                    end
                end
        end
     end
    # tajanos
    # graph(yals_2.uniq)
    return uniq_kon(yals_2)
end

def clear 
    Square.new(
        x: 0, y: 0,
        size: 600,
        color: 'black',
        z: 10
      )
end

while true
#  Run Time : 
    # yals = [[300,200,300,50],[300,200,200,400],[300,200,400,400],[200,400,400,400],[500,200,400,400],[200,400,100,200]]
    yals = [[100,100,300,100],[300,100,300,300],[300,300,100,300],[100,300,100,100],[300,300,400,400]]
    # yals = [[100,100,100,300],[100,100,300,300],[300,100,300,300],[300,100,100,300]]
    flag = false
    while(flag)
        on :mouse_down do |event|
            # puts event.x,event.y
            case event.button
            when :left
                flag = false
              # Left mouse button pressed down
            when :middle
                flag=false
              # Middle mouse button pressed down
            when :right
                flag = false
              # Right mouse button pressed down
            end
        end
        show
    end
    history=[]
    history << yals
    index = 0
    graph(history[index])
    on:key_down do |event|
        case event.key
        when 'left'
            index=index -1
            graph(history[index])
        when 'right'
            # puts event.key
            index=index +1
            if index+1 > history.size
                yals=d_graph(yals)
                history << yals
            end
            graph(history[index])
        when 'up'
            clear
        when 'down'
            yals = [[200,200,100,300],[200,200,300,300],[100,300,300,300]]
        end
    end
    show
end

# class Salam
#     x1=0,x2=100
#     y1=0,y2=100
#     s=draw_line(x1,y1,x2,y2)
# end



# draw_line(125,100,350,400)
# show
# sleep(10,'sec')
# draw_line(0,0,125,100)

# show 

# graph = Sprite.new(clip_width=84,time=200,loop=true)

# graph.play

# on :key do |e|
#     puts e.key
# end

