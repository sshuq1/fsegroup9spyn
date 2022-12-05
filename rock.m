%brick = ConnectBrick('CAT1');
%DisconnectBrick(brick)
global key;
%clrs3, 2tch, 1ultsn, C-arm
%white = 6, red = 5, yellow = 4, green = 3;

brick.SetColorMode(3, 2);
brick.GyroCalibrate(4);
dist = brick.UltrasonicDist(1);
%disp(finaldist);
while 1
    pause(0.1);
    color = brick.ColorCode(3);
    %angle = brick.GyroAngle(4);
    switch color
        case 5
            % Stop for two seconds
            fprintf("red")
            brick.StopAllMotors();
            pause(2);
            brick.MoveMotor('D', 47);
            brick.MoveMotor('A', 50);
            pause(0.5);
            brick.StopMotor('D');
            brick.StopMotor('A');
            color = brick.ColorCode(3);
        case 1
            color = brick.ColorCode(3);
            disp(color)
            fprintf("black")
            temp = brick.UltrasonicDist(1);
            wall = (brick.UltrasonicDist(1) <50);
            touch = brick.TouchPressed(2);
            if wall
                color = brick.ColorCode(3);
                disp(color)
                    brick.MoveMotor('D', 47);
                    brick.MoveMotor('A', 50);
                    pause(0.5);
                    brick.StopMotor('D');
                    brick.StopMotor('A');
                    angle = brick.GyroAngle(4);
                    display(angle);
                    if(temp < dist-5)
                        fprintf("adjust")
                        brick.StopMotor('D');
                        brick.StopMotor('A');
                        pause(0.5)
                        brick.MoveMotor('A', 40);
                        pause(0.2)
                        brick.StopMotor('D');
                        brick.StopMotor('A');
                        color = brick.ColorCode(3);
                        disp(color)
                    elseif(temp > dist+5)
                        fprintf("adjust")
                        brick.StopMotor('D');
                        brick.StopMotor('A');
                        pause(0.5)
                        brick.MoveMotor('D', 50);
                        pause(0.3);
                        angle = brick.GyroAngle(4);
                        brick.StopMotor('D');
                        brick.StopMotor('A');
                        color = brick.ColorCode(3);
                        disp(color)
                    end
                    color = brick.ColorCode(3);
                    disp(color);
                    wall = (brick.UltrasonicDist(1) < 50);
                    touch = brick.TouchPressed(2);
                    if(touch == 1)
                        color = brick.ColorCode(3);
                        disp(color);
                        fprintf("toch")
                        brick.StopAllMotors();
                        brick.MoveMotor('D', -47);
                        brick.MoveMotor('A', -50);
                        pause(0.3);
                        angle = brick.GyroAngle(4);
                        %run("anglertouch.m");
                        brick.MoveMotor('D', -53);
                        brick.MoveMotor('A', 47);
                        pause(1.08);
                        brick.StopMotor('D');
                        brick.StopMotor('A');
                        brick.GyroCalibrate(4);
                        brick.StopMotor('D');
                        brick.StopMotor('A');
                        wall = (brick.UltrasonicDist(1) < 55);
                        touch = brick.TouchPressed(2);
                        color = brick.ColorCode(3);
                        disp(color);
                    end
               
            elseif (~wall)
                %% while(~wall)
                %if(color ~= 1 || color ~= 4)
                color = brick.ColorCode(3);
                disp(color);
                pause(2);
                brick.MoveMotor('D', 47);
                brick.MoveMotor('A', 50);
                pause(0.5)
                brick.GyroCalibrate(4);
                run('angler.m')
                brick.GyroCalibrate(4);
                brick.GyroCalibrate(4);
                angle = brick.GyroAngle(4);
                brick.MoveMotor('D', 47);
                brick.MoveMotor('A', 50);
                pause(3);
                brick.StopMotor('D');
                brick.StopMotor('A');
                wall = (brick.UltrasonicDist(1) > 50);
                angle = brick.GyroAngle(4);
                display(angle);
                brick.GyroCalibrate(4);
                color = brick.ColorCode(3);
                disp(color);
                %%end
            end
        case 4
            color = brick.ColorCode(3);
            disp(color)
            fprintf("black")
            temp = brick.UltrasonicDist(1);
            wall = (brick.UltrasonicDist(1) <50);
            touch = brick.TouchPressed(2);
            if wall
                color = brick.ColorCode(3);
                disp(color)
                    brick.MoveMotor('D', 47);
                    brick.MoveMotor('A', 50);
                    pause(0.5);
                    brick.StopMotor('D');
                    brick.StopMotor('A');
                    angle = brick.GyroAngle(4);
                    display(angle);
                    if(temp < dist)
                        fprintf("adjust")
                        brick.StopMotor('D');
                        brick.StopMotor('A');
                        pause(0.5)
                        brick.MoveMotor('A', 30);
                        pause(0.2)
                        brick.StopMotor('D');
                        brick.StopMotor('A');
                        color = brick.ColorCode(3);
                        disp(color)
                    elseif(temp > dist)
                        fprintf("adjust")
                        brick.StopMotor('D');
                        brick.StopMotor('A');
                        pause(0.5)
                        brick.MoveMotor('D', 30);
                        pause(0.2);
                        angle = brick.GyroAngle(4);
                        brick.StopMotor('D');
                        brick.StopMotor('A');
                        color = brick.ColorCode(3);
                        disp(color)
                    end
                    color = brick.ColorCode(3);
                    disp(color);
                    wall = (brick.UltrasonicDist(1) < 50);
                    touch = brick.TouchPressed(2);
                    if(touch == 1)
                        color = brick.ColorCode(3);
                        disp(color);
                        fprintf("toch")
                        brick.StopAllMotors();
                        brick.MoveMotor('D', -47);
                        brick.MoveMotor('A', -50);
                        pause(0.3);
                        angle = brick.GyroAngle(4);
                        %run("anglertouch.m");
                        brick.MoveMotor('D', -53);
                        brick.MoveMotor('A', 47);
                        pause(1.08);
                        brick.StopMotor('D');
                        brick.StopMotor('A');
                        brick.GyroCalibrate(4);
                        brick.StopMotor('D');
                        brick.StopMotor('A');
                        wall = (brick.UltrasonicDist(1) < 55);
                        touch = brick.TouchPressed(2);
                        color = brick.ColorCode(3);
                        disp(color);
                    end
               
            elseif (~wall)
                %% while(~wall)
                %if(color ~= 1 || color ~= 4)
                color = brick.ColorCode(3);
                disp(color);
                pause(2);
                brick.MoveMotor('D', 47);
                brick.MoveMotor('A', 50);
                pause(0.5)
                brick.GyroCalibrate(4);
                run('angler.m')
                brick.GyroCalibrate(4);
                brick.GyroCalibrate(4);
                angle = brick.GyroAngle(4);
                brick.MoveMotor('D', 47);
                brick.MoveMotor('A', 50);
                pause(3);
                brick.StopMotor('D');
                brick.StopMotor('A');
                wall = (brick.UltrasonicDist(1) > 50);
                angle = brick.GyroAngle(4);
                display(angle);
                brick.GyroCalibrate(4);
                color = brick.ColorCode(3);
                disp(color);
                %%end
            end
        case 2
            fprintf("blue")
            InitKeyboard();
            yellow = true;
            %%%%%%
            while (yellow)
                pause(0.1);
                switch key
                    case'w'
                        brick.MoveMotor('D', 47);
                        brick.MoveMotor('A', 50);
                        pause(0.2);
                        brick.StopMotor('D');
                        brick.StopMotor('A');
                        disp('move forward');
                    case 's'
                        brick.MoveMotor('D', -47);
                        brick.MoveMotor('A', -50);
                        pause(0.2);
                        brick.StopMotor('D');
                        brick.StopMotor('A');
                        disp('move back');
                    case 'a'
                        brick.MoveMotor('D', 53);
                        brick.MoveMotor('A', -47);
                        pause(0.2);
                        brick.StopMotor('D');
                        brick.StopMotor('A');
                        disp('turn left');
                    case 'd'
                        brick.MoveMotor('D', -50);
                        brick.MoveMotor('A', 47);
                        pause(0.2);
                        brick.StopMotor('D');
                        brick.StopMotor('A');
                        disp('turn right');
                    case 'i'
                        brick.MoveMotor('C', 30);
                        pause(0.1);
                        brick.StopMotor('C', 'Brake')
                    case 'o'
                        brick.MoveMotor('C', -20)
                        pause(0.1)
                        brick.StopMotor('C', 'Brake')
                    case 'q'
                        yellow = false;
                        break;
                end
            end
            CloseKeyboard();
            %%%%%%%
        case 3
            fprintf("green");
            brick.StopAllMotors();
            pause(1);
            InitKeyboard();
            pause(1);
            green = true;
            %%%%%%%
            while (green)
                pause(0.1);
                switch key
                    case'w'
                        brick.MoveMotor('D', 47);
                        brick.MoveMotor('A', 50);
                        pause(0.2);
                        brick.StopMotor('D');
                        brick.StopMotor('A');
                        disp('move forward');
                    case 's'
                        brick.MoveMotor('D', -47);
                        brick.MoveMotor('A', -50);
                        pause(0.2);
                        brick.StopMotor('D');
                        brick.StopMotor('A');
                        disp('move back');
                    case 'a'
                        brick.MoveMotor('D', 53);
                        brick.MoveMotor('A', -47);
                        pause(0.2);
                        brick.StopMotor('D');
                        brick.StopMotor('A');
                        disp('turn left');
                    case 'd'
                        brick.MoveMotor('D', -50);
                        brick.MoveMotor('A', 47);
                        pause(0.2);
                        brick.StopMotor('D');
                        brick.StopMotor('A');
                        disp('turn right');
                    case 'i'
                        brick.MoveMotor('C', 30)
                        pause(0.2)
                        brick.StopMotor('C', 'Brake')
                    case 'o'
                        brick.MoveMotor('C', -20)
                        pause(0.1)
                        brick.StopMotor('C', 'Brake')
                    case 'q'
                        yellow = false;
                        break;
                end
            end
            CloseKeyboard();
            %%%%%%%%%
    end
end
CloseKeyboard();
brick.StopAllMotors();
%%%%%%%%%%