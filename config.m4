dnl
dnl $Id: config.m4,v 1.4 2009/04/19 13:13:50 rasmus Exp $
dnl

PHP_ARG_WITH(oauth, for oauth support,
[  --with-oauth		Include oauth support])

if test "$PHP_OAUTH" != "no"; then
  PHP_SUBST(OAUTH_SHARED_LIBADD)

  PHP_ADD_LIBRARY(curl,,OAUTH_SHARED_LIBADD)

  PHP_NEW_EXTENSION(oauth, oauth.c, $ext_shared)
  CFLAGS="$CFLAGS -Wall -g"

  PHP_ADD_EXTENSION_DEP(oauth, curl)
  PHP_ADD_EXTENSION_DEP(oauth, hash)
fi
