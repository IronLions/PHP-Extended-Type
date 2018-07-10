dnl $Id$
dnl config.m4 for extension etype

dnl If your extension references something external, use with:

dnl PHP_ARG_WITH(etype, for etype support,
dnl Make sure that the comment is aligned:
dnl [  --with-etype             Include etype support])

dnl Otherwise use enable:

 PHP_ARG_ENABLE(etype, whether to enable etype support,
 [  --enable-etype           Enable etype support])

if test "$PHP_ETYPE" != "no"; then
  dnl Write more examples of tests here...

  dnl # get library FOO build options from pkg-config output
  dnl AC_PATH_PROG(PKG_CONFIG, pkg-config, no)
  dnl AC_MSG_CHECKING(for libfoo)
  dnl if test -x "$PKG_CONFIG" && $PKG_CONFIG --exists foo; then
  dnl   if $PKG_CONFIG foo --atleast-version 1.2.3; then
  dnl     LIBFOO_CFLAGS=`$PKG_CONFIG foo --cflags`
  dnl     LIBFOO_LIBDIR=`$PKG_CONFIG foo --libs`
  dnl     LIBFOO_VERSON=`$PKG_CONFIG foo --modversion`
  dnl     AC_MSG_RESULT(from pkgconfig: version $LIBFOO_VERSON)
  dnl   else
  dnl     AC_MSG_ERROR(system libfoo is too old: version 1.2.3 required)
  dnl   fi
  dnl else
  dnl   AC_MSG_ERROR(pkg-config not found)
  dnl fi
  dnl PHP_EVAL_LIBLINE($LIBFOO_LIBDIR, ETYPE_SHARED_LIBADD)
  dnl PHP_EVAL_INCLINE($LIBFOO_CFLAGS)

  dnl # --with-etype -> check with-path
  dnl SEARCH_PATH="/usr/local /usr"     # you might want to change this
  dnl SEARCH_FOR="/include/etype.h"  # you most likely want to change this
  dnl if test -r $PHP_ETYPE/$SEARCH_FOR; then # path given as parameter
  dnl   ETYPE_DIR=$PHP_ETYPE
  dnl else # search default path list
  dnl   AC_MSG_CHECKING([for etype files in default path])
  dnl   for i in $SEARCH_PATH ; do
  dnl     if test -r $i/$SEARCH_FOR; then
  dnl       ETYPE_DIR=$i
  dnl       AC_MSG_RESULT(found in $i)
  dnl     fi
  dnl   done
  dnl fi
  dnl
  dnl if test -z "$ETYPE_DIR"; then
  dnl   AC_MSG_RESULT([not found])
  dnl   AC_MSG_ERROR([Please reinstall the etype distribution])
  dnl fi

  dnl # --with-etype -> add include path
  dnl PHP_ADD_INCLUDE($ETYPE_DIR/include)

  dnl # --with-etype -> check for lib and symbol presence
  dnl LIBNAME=etype # you may want to change this
  dnl LIBSYMBOL=etype # you most likely want to change this 

  dnl PHP_CHECK_LIBRARY($LIBNAME,$LIBSYMBOL,
  dnl [
  dnl   PHP_ADD_LIBRARY_WITH_PATH($LIBNAME, $ETYPE_DIR/$PHP_LIBDIR, ETYPE_SHARED_LIBADD)
  AC_DEFINE(HAVE_ETYPELIB,1,[ ])
  dnl ],[
  dnl   AC_MSG_ERROR([wrong etype lib version or lib not found])
  dnl ],[
  dnl   -L$ETYPE_DIR/$PHP_LIBDIR -lm
  dnl ])
  dnl
  dnl PHP_SUBST(ETYPE_SHARED_LIBADD)

  PHP_NEW_EXTENSION(etype, etype.c T.c, $ext_shared,, -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1)
fi
