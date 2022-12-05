brick.GyroCalibrate(4);
angle = brick.GyroAngle(4);
brick.MoveMotor('D', 53);
brick.MoveMotor('A', -47);
pause(1);
brick.StopMotor('D');
brick.StopMotor('A');
pause(1)
angle = brick.GyroAngle(4);
disp(angle);
count = 0;
while(abs(angle) <88 || abs(angle) >91)
    count = count + 1;
    fprintf("adjust");
    if(count > 5)
        %brick.MoveMotor('D', -53);
        %brick.MoveMotor('A', -47);
        pause(0.5);
        brick.StopAllMotors();
        break;
    end
    if(abs(angle) > 91)
    brick.MoveMotor('A', 20);
    pause(0.1)
    angle = brick.GyroAngle(4);
    brick.StopAllMotors();
    elseif(abs(angle) < 88)
    brick.MoveMotor('D', 20);
    pause(0.1)
    angle = brick.GyroAngle(4);
    brick.StopAllMotors();

    end
end
angle = brick.GyroAngle(4);
disp(angle);
brick.GyroCalibrate(4);