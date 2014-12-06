/**
This file is part of the "minilib"

@license   The MIT License (MIT) Included in this distribution
@author    Zaher Dirkey <zaher at parmaja dot com>

*/
import std.stdio;
import std.string;
import minilib.sets;

enum MyEnum {A, B, C, D, F};

alias MySet = Set!MyEnum;

int main(string[] argv)
{
  MySet set1;
  MySet set2;

  set1 = [MyEnum.A];
  writeln(set1);
  set2 = MyEnum.B;
  writeln(set2);
  writeln();

  set2 = set2 + set1;
  writeln("set2 = set2 + set1");
  writeln(set2);
  writeln();

  set2 = set2 - set1;
  writeln("set2 = set2 - set1");
  writeln(set2);
  writeln();

  set2 = set2 + MyEnum.C;
  writeln(set2);
  set2 = set2 - MyEnum.D;
  writeln(set2);

  if (MyEnum.C in set2) 
    writeln("C in set2");
  else
	 writeln("C is not in set2");

  if ([MyEnum.D] in set2) 
	  writeln("D in set2");  
  else
	  writeln("D is not in set2");

  if ([MyEnum.A, MyEnum.B] in set2) 
	  writeln("A,B in set2");  
  else
	  writeln("A,B is not in set2");

  set1 = [MyEnum.B];
  if (set1 in set2) 
	  writeln("set1 in set2");  
  else
	  writeln("set1 is not in set2");

  if ([MyEnum.B, MyEnum.C] in set2) 
	  writeln("B,C in set2");  
  else
	  writeln("B,C is not in set2");

  if ([MyEnum.B, MyEnum.C, MyEnum.F] == set2) 
	  writeln("B,C,F in set2");  
  else
	  writeln("B,C,F is not in set2");

/+
  if (set2 < [MyEnum.B, MyEnum.C]) 
	  writeln("[B,C] < set2");  
  else
	  writeln("[B,C] is not < set2");
+/
  readln(); 
  return 0;
}
