###
# Librairies de la gestion de système de fichiers
# ==============================================================================
# @package olixsh
# @author Olivier
##


function filesystem_getExtension()
{
    logger_debug "filesystem_getExtension ($1)"
    local FILE
    FILE=$(basename $1)
    echo ${FILE#*.}
}


###
# Extrait une archive dans un emplacement désiré
# @param $1 : Nom du fichier
# @param $2 : Emplacement
# @param $3 : Paramètre supplémentaire
# @return   : Nom du fichier compressé
##
function filesystem_extractTAR()
{
    logger_debug "filesystem_unpackTAR ($1, $2, $3)"
    local OPTS=""

    [[ ${OLIX_OPTION_VERBOSE} == true ]] && OPTS="${OPTS} --verbose"
    [[ -n $3 ]] && OPTS="${OPTS} $3"
    logger_info "Extraction de $1 vers $2"
    logger_debug "tar --extract ${OPTS} --file=$1 --directory=$2"

    tar --extract ${OPTS} --file=$1 --directory=$2 2> ${OLIX_LOGGER_FILE_ERR}
    return $?
}