program ProgAssign;
//Gabe Sorensen
{$mode objfpc}{$H+}

uses
    //#include basically
    {$IFDEF UNIX}{$IFDEF UseCThreads}
    cthreads,
    {$ENDIF}{$ENDIF}
    Classes,
    strutils, testWin
{ you can add units after this };



type //global types
  realarray = array of real;
  intarray = array of integer;
  stringarrayUndef = array of AnsiString; //ansi strings are stored on the heap and have no length
  //stringarray = array [1..3] of string[20]; // these strings max at 20 chars and the array is only 3 staticly

Person = class
private
  class var n: ansistring;
  class var a: longint;
public
  class constructor create;
  class procedure SetNameAge(age: longint; name: AnsiString);
  class function getName: AnsiString;
  class function getAge: longint;
end;

class constructor Person.create;
begin

end;

class procedure Person.SetNameAge(age: longint; name: AnsiString);
begin
  a:= age;
  n:= name;
end;

class function Person.getName: AnsiString;
begin
  Exit(n);
end;

class function Person.getAge: longint;
begin
  Exit(a);
end;

function Hypotenuse(base, height: real): real;
var
   ans: real;
begin
  ans:= sqrt((base*base)+(Height*height));
  Exit(ans);
end;

function SphereVol(radius: real): real;
var
   ans: real;
begin
  ans:= (( 4/3 )*( pi )*( radius * radius * radius ));
  Exit(ans);
end;

procedure StateOfWater(temp: real);
begin
  if temp < 32 then
  begin
    writeln('Water is currently frozen.');
  end
  else if (temp >= 32) and (temp < 113) then
  begin
    writeln('Water is currently a liquid.');
  end
  else if temp >= 113 then
  begin
    writeln('Water is currently a gas');
  end;
end;

function DotProduct(array1, array2: realarray): real;
var
  ans:real;
  i:integer;
begin
  ans:= 0;
  for i:=0 to length(array1) do
    ans:= ans+(array1[i]*array2[i]);
  Exit(ans);
end;

function DoubleSeq(array1: realarray): realarray;
var
  seq: realarray;
  i: integer;
begin
  SetLength(seq, Length(array1));
  for i:=0 to Length(seq) do
    seq[i]:= (array1[i]*2);
  Exit(seq);
end;

function DuplicateSeq(array1: realarray): realarray;
var
  seq: realarray;
  i: integer;
begin
  SetLength(seq, Length(array1)*2);
  for i:= Low(seq) to High(seq) do
    if i < Length(array1) then
      begin
    	 seq[i] := array1[i];
      end
    else
      begin
        seq[i] := array1[i- Length(array1)];
      end;
  Exit(seq);
end;

function RemoveDuplicates(array1: realarray): realarray;
var
  seq: realarray;
  i,j: integer;
  inseq: boolean;
begin
  inseq:= false;
  j := 0;
  SetLength(seq, 1);
  seq[0] := array1[0];
  for i:= (Low(array1)+1) to High(array1) do
    begin
      for j:= Low(seq) to High(seq) do
        begin
	  if seq[j] = array1[i] then
          begin
             inseq:= true;
          end;
        end;
      if not inseq then
        begin
           SetLength(seq, Length(seq)+1);
           seq[Length(seq)-1]:= array1[i];

        end;
      inseq:= false;
    end;
  Exit(seq);
end;

function RemoveDuplicates(array1: stringarrayUndef): stringarrayUndef;
var
  seq: array of string;
  i,j: integer;
  inseq: boolean;
begin
  inseq:= false;
  j := 0;
  SetLength(seq, 1);
  seq[0] := array1[0];
  for i:= (Low(array1)+1) to High(array1) do
    begin
      for j:= Low(seq) to High(seq) do
        begin
	  if seq[j] = array1[i] then
          begin
             inseq:= true;
          end;
        end;
      if not inseq then
        begin
           SetLength(seq, Length(seq)+1);
           seq[Length(seq)-1]:= array1[i];
        end;
      inseq:= false;
    end;
  Exit(seq);
end;

//translation use TFPGMap from the generics (learn how to actually do)

//sum and product is not possible

function CountArticles(sentence: string): integer;
var
  return, i, j : integer;
  articles: array [1..3] of string[3] = ('a', 'an', 'the');
begin
  return := 0;
  for i:= 0 to WordCount(sentence, StdWordDelims) do //StdWordDelims
    begin
      for j:= Low(articles) to High(articles) do
        begin
          if articles[j] =  ExtractWord(i, sentence, StdWordDelims) then
            begin
	      Inc(return);
            end;
        end;
    end;
  Exit(return);
end;

function ListColors(sentence: string): stringarrayUndef;
var
  i, j, k : integer;
  listofcolors: stringarrayUndef;
  colors: array [1..10] of AnsiString = ('black', 'brown', 'blue', 'red', 'yellow', 'orange', 'purple', 'green', 'gray', 'pink');
begin
  SetLength(listofcolors, 1);
  k := 1;
  for i:= 0 to WordCount(sentence, StdWordDelims) do //StdWordDelims
    begin
      for j:= Low(colors) to High(colors) do
        begin
          if colors[j] =  ExtractWord(i, sentence, StdWordDelims) then
            begin
	      SetLength(listofcolors, Length(listofcolors)+1);
	      listofcolors[k] := colors[j];
              Inc(k);
            end;
        end;
    end;
  listofcolors := RemoveDuplicates(listofcolors);
  Exit(listofcolors);
end;

function ListPositives(array1: realarray): realarray;
var
  seq: realarray;
  i, j: integer;
begin
  SetLength(seq, 0);
  j:= 0;
  for i:= Low(array1) to High(array1) do
    if array1[i] >= 0 then
      begin
        SetLength(seq, Length(seq)+1);
        seq[j] := array1[i];
	Inc(j);
      end;
  Exit(seq);
end;

function Max(array1: realarray): real;
var
  currMax: real;
  i: integer;
begin
  i:= Low(array1);
  currMax:=array1[i];
  for i:= Low(array1) to High(array1) do
    begin
      if array1[i] > currMax then
        begin
          currMax:= array1[i];
        end;
    end;
  Exit(currMax);
end;

//nest level (do-able but wayy too much work)/ no one cares about this problem

function FirstNSquare(n: integer): intarray;
var
  nums: intarray;
  i: integer;
begin
  SetLength(nums, n+1);
  for i:=0 to (n+1) do
    begin
      nums[i] := i*i;
    end;

  Exit(nums);
end;

//youngest person



var
  //globals
  array1, array2, duparray, returnArray, posNeg: realarray;
  i: integer;
  returnArrayi: intarray;
  returnedColors: stringarrayUndef;
begin
     writeln();
     writeln('hypot of triangle with 3, 4: ', Hypotenuse(3, 4):6:3);
     writeln();
//
     writeln('vol of sphere with radius 4: ', SphereVol(4):6:3);
     writeln();
//
     // state of water begin
     StateOfWater(0);
     StateOfWater(50);
     StateOfWater(500);
     writeln();
     //state of water end
//
     SetLength(array1, 3);
     SetLength(array2, 3);
     array1[0]:= 1;
     array1[1]:= 2;
     array1[2]:= 3;
     array2[0]:= 1;
     array2[1]:= 2;
     array2[2]:= 3;
     writeln('dot product of 1,2,3 by itself is: ', DotProduct(array1, array2):6:6);
     writeln();
//
     writeln('sequence 1, 2, 3 doubled: ');
     returnArray:= DoubleSeq(array1);
     SetLength(returnArray, Length(array1));
     for i:= Low(returnArray) to High(returnArray) do
     	 write(returnArray[i]:6:0, ' ');
     WriteLn();
     writeln();
//
     WriteLn('duplicating sequence 1, 2, 3: ');
     returnArray:= DuplicateSeq(array1);
     for i:= Low(returnArray) to High(returnArray) do
         write(returnArray[i]:6:0, ' ');
     writeln();
     writeln();
//
     WriteLn('removing duplicates in 1, 2, 2, 3, 3, 3');
     SetLength(duparray, 6);
     duparray[0] := 1;
     duparray[1] := 2;
     duparray[2] := 2;
     duparray[3] := 3;
     duparray[4] := 3;
     duparray[5] := 3;
     returnArray:= RemoveDuplicates(duparray);
     for i:= Low(returnArray) to High(returnArray) do
         write(returnArray[i]:6:0, ' ');
     writeln();
     writeln();
//
     WriteLn('words in this sentence: ', WordCount('words in this sentence: ', StdWordDelims));
     writeln();
//
     WriteLn('Number of articles in: "the quick brown fox jumped over a lazy dog" is : ', CountArticles('the quick brown fox jumped over a lazy dog'));
     writeln();
//
     WriteLn('listing colors in above sentence: ');
     returnedColors:= ListColors('the quick brown fox jumped over a lazy dog');
     for i:= Low(returnedColors) to High(returnedColors) do
              write(returnedColors[i], ' ');
     writeln();
     writeln();
//
     WriteLn('listing positives in -1, 0, 1, -9, 5, -6, -7: ');
     SetLength(posNeg, 7);
     posNeg[0] := -1;
     posNeg[1] := 0;
     posNeg[2] := 1;
     posNeg[3] := -9;
     posNeg[4] := 5;
     posNeg[5] := -6;
     posNeg[6] := -7;
     returnArray:= ListPositives(posNeg);
     for i:= Low(returnArray) to High(returnArray) do
         write(returnArray[i]:6:0, ' ');
     writeln();
     writeln();
//
     WriteLn('Max of same numbers is: ', Max(posNeg):6:0);
     writeln();
//
     WriteLn('first 10 numbers squared is:');
     returnArrayi:= FirstNSquare(10);
     for i:= Low(returnArrayi) to High(returnArrayi) do
         write(returnArrayi[i], ' ');
     writeln();
     writeln();

     writeln('Press [ENTER] to quit.'); // hold our program until ready to exit.
     readln();
end.

