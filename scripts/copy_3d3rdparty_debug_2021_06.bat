@echo off

set SCRIPT_DIR=%~dp0

set DIR_3D3RDPARTY=%SCRIPT_DIR%..\..\3d3rdparty_new
set RELEASE_DIR=..\release
set DEBUG_DIR=..\debug

:: ------------------------------------------------------------------------------------------------------------------------------------------------------
:: Debug
:: ------------------------------------------------------------------------------------------------------------------------------------------------------

:: --------------------------------------------------
:: PROJ and GDAL data
:: --------------------------------------------------
    echo --------- PROJ and GDAL data ---------
    set GDAL_DATA_DIR=%DEBUG_DIR%\data_osg\gdal_data\
    if not exist "%GDAL_DATA_DIR%" mkdir %GDAL_DATA_DIR%
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\gdal\debug\data\* %GDAL_DATA_DIR%

    set PROJ_DATA_DIR=%DEBUG_DIR%\data_osg\proj_data\
    if not exist "%PROJ_DATA_DIR%" mkdir %PROJ_DATA_DIR%
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\proj\debug\share\proj\* %PROJ_DATA_DIR%

:: --------------------------------------------------
:: Small libs
:: --------------------------------------------------
    echo --------- pnageo ---------
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\pnageo\debug\bin\*.dll %DEBUG_DIR%
    :: No spotify-json dll
    echo --------- geos ---------
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\geos\debug\bin\*.dll %DEBUG_DIR%
    echo --------- zlib ---------
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\zlib\debug\bin\*.dll %DEBUG_DIR%
    echo --------- protobuf ---------
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\protobuf\debug\bin\*.dll %DEBUG_DIR%
    echo --------- libpng ---------
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\libpng\debug\bin\*.dll %DEBUG_DIR%
    echo --------- libjpeg ---------
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\libjpeg\debug\bin\*.dll %DEBUG_DIR%
    echo --------- libraw ---------
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\libraw\debug\bin\rawd.dll %DEBUG_DIR%
    echo --------- libtiff ---------
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\libtiff\debug\bin\*.dll %DEBUG_DIR%
    echo --------- libcurl ---------
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\libcurl\debug\bin\*.dll %DEBUG_DIR%
    echo --------- freetype ---------
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\freetype\debug\bin\*.dll %DEBUG_DIR%
    echo --------- proj ---------
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\proj\debug\bin\*.dll %DEBUG_DIR%
    :: No libgeotiff dll
    echo --------- expat ---------
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\expat\debug\bin\*.dll %DEBUG_DIR%
    echo --------- gdal ---------
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\gdal\debug\bin\*.dll %DEBUG_DIR%
    echo --------- expat ---------
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\expat\debug\bin\*.dll %DEBUG_DIR%
    :: No LevelDB dll
    echo --------- exiv2 ---------
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\exiv2\debug\bin\*.dll %DEBUG_DIR%

    echo --------- sqlite3 ---------
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\sqlite3\debug\bin\*.dll %DEBUG_DIR%
    echo --------- ECW ---------
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\ecw\bin\vc141\x64\NCSEcw.dll %DEBUG_DIR%
    echo --------- OpenSSL ---------
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\openssl\bin\libcryptoMDd.dll %DEBUG_DIR%
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\openssl\bin\libsslMDd.dll %DEBUG_DIR%


:: --------------------------------------------------
:: OpenSceneGraph
:: --------------------------------------------------
    echo --------- OpenSceneGraph ---------
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\ot21-OpenThreadsd.dll %DEBUG_DIR%
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osg162-osgd.dll %DEBUG_DIR%
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osg162-osgAnimationd.dll %DEBUG_DIR%
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osg162-osgDBd.dll %DEBUG_DIR%
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osg162-osgFXd.dll %DEBUG_DIR%
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osg162-osgGAd.dll %DEBUG_DIR%
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osg162-osgManipulatord.dll %DEBUG_DIR%
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osg162-osgParticled.dll %DEBUG_DIR%
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osg162-osgPresentationd.dll %DEBUG_DIR%
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osg162-osgShadowd.dll %DEBUG_DIR%
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osg162-osgSimd.dll %DEBUG_DIR%
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osg162-osgTerraind.dll %DEBUG_DIR%
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osg162-osgTextd.dll %DEBUG_DIR%
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osg162-osgUId.dll %DEBUG_DIR%
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osg162-osgUtild.dll %DEBUG_DIR%
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osg162-osgViewerd.dll %DEBUG_DIR%
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osg162-osgVolumed.dll %DEBUG_DIR%
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osg162-osgWidgetd.dll %DEBUG_DIR%

    if not exist %DEBUG_DIR%\osgPlugins-3.6.5 mkdir %DEBUG_DIR%\osgPlugins-3.6.5
      
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_3dcd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_3dsd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_acd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_bmpd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_bspd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_bvhd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_cfgd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_curld.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_ddsd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_deprecated_osgd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_deprecated_osganimationd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_deprecated_osgfxd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_deprecated_osgparticled.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_deprecated_osgshadowd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_deprecated_osgsimd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_deprecated_osgterraind.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_deprecated_osgtextd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_deprecated_osgviewerd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_deprecated_osgvolumed.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_deprecated_osgwidgetd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_dotd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_dxfd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_freetyped.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_gdald.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_glesd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_glsld.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_gzd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_hdrd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_ived.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_jpegd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_ktxd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_logod.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_luad.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_lwod.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_lwsd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_md2d.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_mdld.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_normalsd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_objd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_ogrd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_openflightd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_oscd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_osgd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_osgad.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_osgjsd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_osgshadowd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_osgterraind.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_osgtgzd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_osgviewerd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_p3dd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_picd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_plyd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_pngd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_pnmd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_povd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_pvrd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_revisionsd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_rgbd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_rotd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_scaled.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_serializers_osgd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_serializers_osganimationd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_serializers_osgfxd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_serializers_osggad.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_serializers_osgmanipulatord.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_serializers_osgparticled.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_serializers_osgshadowd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_serializers_osgsimd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_serializers_osgterraind.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_serializers_osgtextd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_serializers_osguid.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_serializers_osgutild.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_serializers_osgviewerd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_serializers_osgvolumed.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_shpd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_stld.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_tfd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_tgad.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_tgzd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_tiffd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_transd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_trkd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_txfd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_txpd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_vtfd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_xd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_zipd.dll %DEBUG_DIR%\osgPlugins-3.6.5


:: --------------------------------------------------
:: osgearth
:: --------------------------------------------------
    echo --------- osgearth ---------
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgEarthd.dll %DEBUG_DIR%

    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_earthd.dll %DEBUG_DIR%\osgPlugins-3.6.5
		xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_fastdxtd.dll %DEBUG_DIR%\osgPlugins-3.6.5
		xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_gltfd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_kmld.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_lercd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_osgearth_bumpmapd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_osgearth_cache_filesystemd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_osgearth_cache_leveldbd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_osgearth_colorrampd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_osgearth_detaild.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_osgearth_engine_rexd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_osgearth_featurefilter_intersectd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_osgearth_featurefilter_joind.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_osgearth_mapinspectord.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_osgearth_monitord.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_osgearth_scriptengine_javascriptd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_osgearth_sky_gld.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_osgearth_sky_simpled.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_osgearth_terrainshaderd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_osgearth_vdatum_egm84d.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_osgearth_vdatum_egm96d.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_osgearth_vdatum_egm2008d.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_osgearth_viewpointsd.dll %DEBUG_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_templated.dll %DEBUG_DIR%\osgPlugins-3.6.5
    
    pause