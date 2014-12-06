/**
This file is part of the "minilib"

@license   The MIT License (MIT) Included in this distribution
@author    Zaher Dirkey <zaher at parmaja dot com>

*/
import std.stdio;
import std.string;
import minilib.sets;

enum MyEnum {A, B, C, D};

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

  if (MyEnum.C in set2) {
    writeln("C in set2");
  }

  readln(); 
  return 0;
}
