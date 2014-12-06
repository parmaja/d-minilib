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

//struct Set(T) {
struct Set(T) if(is(T == enum)) {

  private:

    alias SetType = typeof(this);
    alias SetArray = T[];

    bool[T]_set; //Associative Arrays

  public:
    void opAssign(T value){
      clear();
      include(value);
    }

    void opAssign(SetArray value){
      _set = null;
      foreach(int i, T t; value){
        include(t);
      }
    }

    //A = B equality; true if every element of set A is in set B and vice-versa.
    //A < B equality; true if every element of set A is in set B but the count less is diff
    //A > B equality; true if every element of set B is in set A but the count less is diff
    int opCmp(SetType other){
      return compare(other._set);
    }

    int opCmp(SetArray other){
      int c1 = 0;
      int c2 = 0;
      foreach(int i, T t; other) {
        if (other[t])
          c1++;
        //todo
      }
      return 0;
    }

    //A in B subset; true if every element in set A is also in set B.
    bool opBinary(string op)(T other) if (op == "in") {
      return exists(other);
    }

    bool opBinary(string op)(SetType other) if (op == "in") {
      return exists(other._set);
    }
      
    bool opBinary(string op)(SetArray other) if (op == "in") {
      return exists(other);
    }

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
    SetType opBinary(string op)(T other) if (op == "*") {
      //todo
      return this;
    }

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
    void include(T value) {
      _set[value] = true;
    }

    void exclude(T value) {
      _set[value] = false;
      //or _set.remove(value);//TODO
    }

    void exists(T value) {
      foreach(T t, bool b; _set) {
        if (b && element == t) {
          return true;
        }
      }
      return false;
    }

    void exists(SetArray value) {
      if (value.length == 0)
        return false;//todo not sure if we must return false?
      foreach(int i, T t; value) {
        if (!exists(t))
          return false;
      }
      return true;
    }

/+
    int compare(SetArray value){
      int c1 = countOf(_set);
      int c2 = countOf(value);
      if (c1 < c2) {
        if (exists(_set, value))
          return 1;
        else
          return 2;
      }
      else if (c1 < c2) {
        if (exists(value, _set))
          return 1;
        else
          return 2;
      }
      else {
        if (exists(_set, value))
          return 0;
        else
          return WHAT!!!;

      }
    }
+/

    protected int countOf(SetArray value) {
      int c = 0;
      foreach(T t, bool b; value) {
        if (b)
          c++;
      }
      return c;
    }

    ///We count only true elements
    int count() {
      int c = 0;
      foreach(T t, bool b; _set) {
        if (b)
          c++;
      }
      return c;
    }

    void clear(){
      _set = null;
    }
}