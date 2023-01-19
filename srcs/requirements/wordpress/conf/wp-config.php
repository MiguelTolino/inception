<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'wpuser' );

/** Database password */
define( 'DB_PASSWORD', 'password' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'KNd=Y.:eDyGKz]9&[Y}(&-(#UFc7mP%Q!MT]`9uuaxhh7`?-1cekRyJM%P.i^J3v');
define('SECURE_AUTH_KEY',  'W6%Ew^!r)j-^[WL3.TrzDYl6tK#LS<1e6=Slui<HajAZ#&+.5L+e@:ahzc8Mc{sv');
define('LOGGED_IN_KEY',    'm{_=<[ZP-$FO$4W90Csqx)7-aqy{dFx%>W#Ni.gt6+HT,Ggj9[{)uk/Ps}lb;&za');
define('NONCE_KEY',        'fs_+z[]:Z[TrGe[i.^B3?YlB=jADB$]| [OsDbJ#NK+G.>bLXaIC(F?]FR+V;+mg');
define('AUTH_SALT',        '=mjs4xGctxQmL:9N)-pmkc8Y1wD=ie0`M;R%zv0jeHakm2uh>E@rnV&M@u~vv~*v');
define('SECURE_AUTH_SALT', '+q;*dLl$kpA[,T[!&3K|2%mWS78NI|&8+vgeQY~!5<vN>:9$.eh2~(RaUMUW:*_G');
define('LOGGED_IN_SALT',   ']y|StK%&zPwTEv]Fl+8hh`1h_u#^YSZ(4Roe3pChF%%WH_~m^Eh*B=i4tx;+$%5z');
define('NONCE_SALT',       '^Faowz]InNMRES9C5yOQkm6oRLX_b|!2&+z uXYH+jB04x3g&%|~JlE/Q$w4V-s.');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
