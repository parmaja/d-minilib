module minilib.sets;
/**
This file is part of the "minilib"

@license   The MIT License (MIT) Included in this distribution
@author    Zaher Dirkey <zaher at parmaja dot com>

*/

/**
  @describe:
    Set of enumeration based on associative arrays
  @ref
    http://rosettacode.org/wiki/Set
    http://rosettacode.org/wiki/Associative_array
*/

import std.string;
import std.array;
import std.range;

struct Set(T) {

  private:

    alias SetType = typeof(this);
    alias SetArray = T[];

    bool[T]_set; //Associative Arrays

  public:
    void opAssign(T value){
      _set = null;
      include(value);
    }

    void opAssign(SetArray value){
      _set = null;
      foreach(int i, T t; value){
        include(t);
      }
    }
/+
    //A = B equality; true if every element of set A is in set B and vice-versa.
    //A < B equality; true if every element of set A is in set B but the count less is diff
    //A > B equality; true if every element of set B is in set A but the count less is diff
    int opCmp(SetType other){
      return opCmp(other._set);
    }

    int opCmp(SetArray other){
      foreach(int i, T t; other) {
        //todo
      }
      return this;
    }
+/
    //A in B subset; true if every element in set A is also in set B.
    //opBinary(string op : "in")

    //A + B union; a set of all elements either in set A or in set B.

    SetType opBinary(string op)(T other) if (op == "+") {
      include(other);
      return this;
    }

    SetType opBinary(string op)(SetArray other) if (op == "+") {
      foreach(int i, T t; other) {
        include(t);
      }
      return this;
    }

    SetType opBinary(string op)(SetType other) if (op == "+") {
      foreach(T t, bool b; other._set) {
        if (b)
          include(t);
      }
      return this;
    }

    //A * B intersection; a set of all elements in both set A and set B.

    //A - B difference; a set of all elements in set A, except those in set B.
    SetType opBinary(string op)(T other) if (op == "-") {
      exclude(other);
      return this;
    }

    SetType opBinary(string op)(SetArray other) if (op == "-") {
      foreach(int i, T t; other) {
        exclude(t);
      }
      return this;
    }

    SetType opBinary(string op)(SetType other) if (op == "-") {
      foreach(T t, bool b; other._set) {
        if (b)
          exclude(t);
      }
      return this;
    }

  public:
    void include(T t) {
      _set[t] = true;
    }

    void exclude(T t) {
      _set[t] = false;
    }

    void clear(){
      _set = null;
    }
}
