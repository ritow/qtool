#！/bin/bash
exit 0


################################################################################
VERSION="author: Yongfeng.Qi
create: 2012-8-20 Yongfeng.Qi
modify: 2012-8-27 Yongfeng.Qi"
HELPS="使用说明：
        $0 [-h|-v]
功能说明：
        简单或者详细的功能介绍
参数说明：
        -h  显示帮助信息
        -v  显示版本信息"

function func_usage  { echo "$HELPS"; exit 1; }
[ "$1" = "-v" ] && { echo "$VERSION"; exit 0; }
[ "$1" = "-h" ] && func_usage
## [ $# -lt 1 ] && func_usage


################################################################################
LOGToStdO="yes"
LOGFile=/cache/smp/FileName_log.${HOSTNAME}.log
LOGMaxLine=100000
LOGDelLine=2000

function func_logger()
{
    ## log头，形如：[2012-08-22 11:11:55] ritow-linuxpc
    LogPrefix="`date '+[%Y-%m-%d %T]'` $HOSTNAME "

    [ "$LOGToStdO" = "yes" ] && { echo -e "${LogPrefix}  $*";return 0;}

    [ -f "${LOGFile}" ] || touch "${LOGFile}"
    [ -f "${LOGFile}" ] || { echo -e "${LogPrefix}  $*";return $LINENO;}
    [ -w "${LOGFile}" ] || { echo -e "${LogPrefix}  $*";return $LINENO;}

    LineOflog=`wc -l ${LOGFile}|awk '{print $1}'`
    if [ ${LineOflog} -gt "${LOGMaxLine}" ] ; then
        sed -i "1,${LOGDelLine} d" ${LOGFile}
    fi
    echo -e "${LogPrefix}  $*" >>${LOGFile}

    return 0
}
################################################################################


