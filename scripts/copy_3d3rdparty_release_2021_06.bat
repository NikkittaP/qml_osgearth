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
    set GDAL_DATA_DIR=%RELEASE_DIR%\data_osg\gdal_data\
    if not exist "%GDAL_DATA_DIR%" mkdir %GDAL_DATA_DIR%
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\gdal\release\data\* %GDAL_DATA_DIR%

    set PROJ_DATA_DIR=%RELEASE_DIR%\data_osg\proj_data\
    if not exist "%PROJ_DATA_DIR%" mkdir %PROJ_DATA_DIR%
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\proj\release\share\proj\* %PROJ_DATA_DIR%

:: --------------------------------------------------
:: Small libs
:: --------------------------------------------------
    echo --------- pnageo ---------
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\pnageo\release\bin\*.dll %RELEASE_DIR%
    :: No spotify-json dll
    echo --------- geos ---------
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\geos\release\bin\*.dll %RELEASE_DIR%
    echo --------- zlib ---------
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\zlib\release\bin\*.dll %RELEASE_DIR%
    echo --------- protobuf ---------
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\protobuf\release\bin\*.dll %RELEASE_DIR%
    echo --------- libpng ---------
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\libpng\release\bin\*.dll %RELEASE_DIR%
    echo --------- libjpeg ---------
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\libjpeg\release\bin\*.dll %RELEASE_DIR%
    echo --------- libraw ---------
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\libraw\release\bin\raw.dll %RELEASE_DIR%
    echo --------- libtiff ---------
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\libtiff\release\bin\*.dll %RELEASE_DIR%
    echo --------- libcurl ---------
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\libcurl\release\bin\*.dll %RELEASE_DIR%
    echo --------- freetype ---------
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\freetype\release\bin\*.dll %RELEASE_DIR%
    echo --------- proj ---------
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\proj\release\bin\*.dll %RELEASE_DIR%
    :: No libgeotiff dll
    echo --------- expat ---------
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\expat\release\bin\*.dll %RELEASE_DIR%
    echo --------- gdal ---------
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\gdal\release\bin\*.dll %RELEASE_DIR%
    echo --------- expat ---------
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\expat\release\bin\*.dll %RELEASE_DIR%
    :: No LevelDB dll
    echo --------- exiv2 ---------
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\exiv2\release\bin\*.dll %RELEASE_DIR%

    echo --------- sqlite3 ---------
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\sqlite3\release\bin\*.dll %RELEASE_DIR%
    echo --------- ECW ---------
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\ecw\bin\vc141\x64\NCSEcw.dll %RELEASE_DIR%
    echo --------- OpenSSL ---------
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\openssl\bin\libcryptoMD.dll %RELEASE_DIR%
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\openssl\bin\libsslMD.dll %RELEASE_DIR%


:: --------------------------------------------------
:: OpenSceneGraph
:: --------------------------------------------------
    echo --------- OpenSceneGraph ---------
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\ot21-OpenThreads.dll %RELEASE_DIR%
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osg162-osg.dll %RELEASE_DIR%
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osg162-osgAnimation.dll %RELEASE_DIR%
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osg162-osgDB.dll %RELEASE_DIR%
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osg162-osgFX.dll %RELEASE_DIR%
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osg162-osgGA.dll %RELEASE_DIR%
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osg162-osgManipulator.dll %RELEASE_DIR%
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osg162-osgParticle.dll %RELEASE_DIR%
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osg162-osgPresentation.dll %RELEASE_DIR%
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osg162-osgShadow.dll %RELEASE_DIR%
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osg162-osgSim.dll %RELEASE_DIR%
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osg162-osgTerrain.dll %RELEASE_DIR%
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osg162-osgText.dll %RELEASE_DIR%
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osg162-osgUI.dll %RELEASE_DIR%
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osg162-osgUtil.dll %RELEASE_DIR%
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osg162-osgViewer.dll %RELEASE_DIR%
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osg162-osgVolume.dll %RELEASE_DIR%
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osg162-osgWidget.dll %RELEASE_DIR%

    if not exist %RELEASE_DIR%\osgPlugins-3.6.5 mkdir %RELEASE_DIR%\osgPlugins-3.6.5
      
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_3dc.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_3ds.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_ac.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_bmp.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_bsp.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_bvh.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_cfg.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_curl.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_dds.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_deprecated_osg.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_deprecated_osganimation.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_deprecated_osgfx.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_deprecated_osgparticle.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_deprecated_osgshadow.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_deprecated_osgsim.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_deprecated_osgterrain.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_deprecated_osgtext.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_deprecated_osgviewer.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_deprecated_osgvolume.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_deprecated_osgwidget.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_dot.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_dxf.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_freetype.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_gdal.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_gles.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_glsl.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_gz.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_hdr.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_ive.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_jpeg.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_ktx.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_logo.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_lua.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_lwo.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_lws.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_md2.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_mdl.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_normals.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_obj.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_ogr.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_openflight.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_osc.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_osg.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_osga.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_osgjs.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_osgshadow.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_osgterrain.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_osgtgz.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_osgviewer.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_p3d.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_pic.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_ply.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_png.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_pnm.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_pov.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_pvr.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_revisions.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_rgb.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_rot.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_scale.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_serializers_osg.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_serializers_osganimation.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_serializers_osgfx.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_serializers_osgga.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_serializers_osgmanipulator.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_serializers_osgparticle.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_serializers_osgshadow.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_serializers_osgsim.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_serializers_osgterrain.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_serializers_osgtext.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_serializers_osgui.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_serializers_osgutil.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_serializers_osgviewer.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_serializers_osgvolume.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_shp.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_stl.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_tf.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_tga.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_tgz.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_tiff.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_trans.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_trk.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_txf.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_txp.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_vtf.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_x.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\OpenSceneGraph\bin\osgPlugins-3.6.5\osgdb_zip.dll %RELEASE_DIR%\osgPlugins-3.6.5


:: --------------------------------------------------
:: osgearth
:: --------------------------------------------------
    echo --------- osgearth ---------
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgEarth.dll %RELEASE_DIR%

    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_earth.dll %RELEASE_DIR%\osgPlugins-3.6.5
		xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_fastdxt.dll %RELEASE_DIR%\osgPlugins-3.6.5
		xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_gltf.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_kml.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_lerc.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_osgearth_bumpmap.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_osgearth_cache_filesystem.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_osgearth_cache_leveldb.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_osgearth_colorramp.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_osgearth_detail.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_osgearth_engine_rex.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_osgearth_featurefilter_intersect.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_osgearth_featurefilter_join.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_osgearth_mapinspector.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_osgearth_monitor.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_osgearth_scriptengine_javascript.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_osgearth_sky_gl.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_osgearth_sky_simple.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_osgearth_terrainshader.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_osgearth_vdatum_egm84.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_osgearth_vdatum_egm96.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_osgearth_vdatum_egm2008.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_osgearth_viewpoints.dll %RELEASE_DIR%\osgPlugins-3.6.5
    xcopy /D /S /Y /Q %DIR_3D3RDPARTY%\osgearth\bin\osgPlugins-3.6.5\osgdb_template.dll %RELEASE_DIR%\osgPlugins-3.6.5
    
    pause