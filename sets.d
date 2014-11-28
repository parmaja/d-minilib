module sets;
/**
This file is part of the "minilib"

@license   The MIT License (MIT) Included in this distribution
@author    Zaher Dirkey <zaher at parmaja dot com>

*/
import std.string;
import std.conv;
import std.array;
import std.range;

struct Set(T) {

  private:

    alias SetType = typeof(this);
    alias SetArray = T[];

    bool[T]_set; //Associative Arrays

    void opAssign(T value){
      _set = null;
      include(value);
    }

    void opAssign(SetArray value){
      _set = null;
      foreach(int i, T t; value) {
        include(t);
      }
    }

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
}