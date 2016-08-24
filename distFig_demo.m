%A demo for using the distribute figures function from the matlab file
%exchange distFig

x = 0:pi/100:2*pi;
y1 = x+1;
y2 = sin(x);
y3 = sin(x+1);
y4 = cos(x);

%generating a few figures to re-arrange
figure(1);
plot(x,y1, 'r');

figure(2);
plot(x,y2, 'b');

figure(3);
plot(x,y3, 'k');

figure(4);
plot(x,y4, 'm');

%rearranging the figures using distFig. You specify the number of rows and
%columns as shown below and it arranges everything for you when you run the
%script.

distFig('Rows',2,'Columns',2);
%distFig('Rows',1,'Columns',4);
