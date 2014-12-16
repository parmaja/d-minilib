module metaclasses;
/**
This file is part of the "minilib"

@license   The MIT License (MIT) Included in this distribution
@author    Zaher Dirkey <zaher at parmaja dot com>

*/

/**
  @describe:
    Manage creating objects from variable classes
  @ref:
  @example:
    alias MyMetaClass = MetaClass!BaseClass mc;
    
*/

struct MetaClass(T){
  ClassInfo _info;
  this(ClassInfo cf){
    _info = cf;
    //here we need to check if that class dirived from base class T
  }

  T create(){
    return cast(T)_info.create();
  }
}
