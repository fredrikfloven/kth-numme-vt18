clear
%se till att ha matlabfilen minidigits.mat
load minidigits.mat
%best?r av testdata, C och testdatad
%testadata ?r 1000 kolumner d?r varje element i kolumnen ?r en pixel p? en
%16x16(=256) bild som visar en siffra

%testadatad ?r en cheat sheet som s?ger vilken siffra kolumnen visar

%C ?r s.k. centroider, 50 kolumner med 256 rader som visar ett genomsnitt av 
%m?nga handskrivna siffror, i detta fall f?r siffran 2. D? alla centroider ser ut som en tv? ska en 
%summa av dem ocks? att g?ra det.
%C = [c1,c2,...,ck] en m?ngd vektorer

%vi ska f?rs?ka k?nna igen alla tv?or i testdata
%vi g?r detta genom att hitta en linj?rkombination av centroider som
%passar till testdatavektorn (xv).
%linj?rkombinationen = x1c1+x2c2+...+xkck, vi vill hitta x1,x2..,xk s? att 
%x1c1+x2c2+...+xkck ~ t1+t2+..+tk som ?r testadatan, 50 konstanter

%k = 50

% en lista f?r alla linj?rkombinationer (anv?nds inte ut?ver att kunna se
% dem)
AllX = [];
%en lista f?r alla normer, hur bra linj?rkombinationen passar till en
%siffra i testdata
nv = [];
%
for i = 1:1000
    % xv ?r x1,x2...,x50 f?r valda testkolumnen
    %Cxv = testdata(:,i)
xv = C\testdata(:,i);
    % l?gg till i listan
AllX = [AllX xv];
    % spara normen av differensen mellan de v?rden vi f?tt fram j?mf?rt med de faktiska v?rdena 
n = norm(C*xv-testdata(:,i));
    % l?gg till i listan nv
nv = [nv n];
%nv(j) = norm(C*x-testdata(:,j));
end

%Ni har nu en vektor nv som ?r ett m?tt p? hur bra linj?rkombinationen passar till testsiffran. 
%Om nv(j) ?r litet s? borde testdata(:,j) se ut som en tv?a. 

%Vi s?ger nu att om nv(j)<p f?r ett fixerat v?rde p klassificeras siffran som en tv?a. 
%V?lj p som medelv?rdet mellan mean(nv) och min(nv). 

meannv = mean(nv);
minnv = min(nv);
p = mean([meannv minnv]);

%p ~ 4.63

%Den korrekta klassificering av siffran testdata(:,j) lagras i testdatad(j). 

%Analysera hur bra er klassificeringsmetod fungerar.
wrong = 0;
amountOfTwos = 0;
missed = 0;
for j = 1:1000
    %r?kna m?ngden tv?or genom att kolla i testdatad
   if(testdatad(j) == 2)
       amountOfTwos = amountOfTwos + 1;
   end
   %om v?rdet i v?r nv ?r mindre ?n valda p, plotta
   if(nv(j)<p)
       plotdigit(testdata(:,j))
       pause(0.2)
       % och om det inte ?r en tv?a, l?gg till att det har blivit fel
       if testdatad(j) ~= 2
           wrong = wrong+1;
       end
   %om det inte ?r mindre ?n p
   else
       %och testdatad s?ger att det ?r en tv?, l?gg till att vi missade den
       if testdatad(j) == 2
           missed = missed+1;
       end
   end
   
end



%Hur m?nga procent av (alla) siffror klassificeras felaktigt som en tv?a? 
percentageWrong = wrong/amountOfTwos
%percentageWrong = 0.2277

%Hur m?nga procent tv?or missar ni?
percentageMissed = missed/amountOfTwos
%percentageMissed = 0.2970



