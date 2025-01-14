# Copyright (C) 2023 Advanced Micro Devices, Inc.  All rights reserved.
# SPDX-License-Identifier: MIT
cmake_minimum_required(VERSION 3.16)

###    USER SETTINGS  START    ###
# Below settings can be customized
# User need to edit it manually as per their needs.
###    DO NOT ADD OR REMOVE VARIABLES FROM THIS SECTION    ###
# -----------------------------------------
# Add any compiler definitions, they will be added as extra definitions
# Example adding VERBOSE=1 will pass -DVERBOSE=1 to the compiler.
set(USER_COMPILE_DEFINITIONS
)

# Undefine any previously specified compiler definitions, either built in or provided with a -D option
# Example adding MY_SYMBOL will pass -UMY_SYMBOL to the compiler.
set(USER_UNDEFINED_SYMBOLS
"__clang__"
)


# Add any directories below, they will be added as extra include directories.
# Example 1: Adding /proj/data/include will pass -I/proj/data/include
# Example 2: Adding ../../common/include will consider the path as relative to this component directory.
# Example 3: Adding ${CMAKE_SOURCE_DIR}/data/include to add data/include from this project.

set(USER_INCLUDE_DIRECTORIES
doomgeneric
sdcard
)
set(USER_COMPILE_SOURCES
"doomgeneric_microblaze.cpp"
"sdcard/SD.cpp"
"sdcard/SdFile.cpp"
"sdcard/spi.c"
"sdcard/Stream.cpp"
"sdcard/Sd2Card.cpp"
"sdcard/timer.c"
"sdcard/SysTick.c"
"sdcard/Print.cpp"
"sdcard/File.cpp"
"sdcard/SdVolume.cpp"
"doomgeneric/info.c"
"doomgeneric/d_event.c"
"doomgeneric/i_timer.c"
"doomgeneric/r_main.c"
"doomgeneric/g_game.c"
"doomgeneric/r_segs.c"
"doomgeneric/r_plane.c"
"doomgeneric/sounds.c"
"doomgeneric/m_argv.c"
"doomgeneric/m_misc.cpp"
"doomgeneric/p_maputl.c"
"doomgeneric/d_items.c"
"doomgeneric/r_draw.c"
"doomgeneric/icon.c"
"doomgeneric/gusconf.c"
"doomgeneric/memio.c"
"doomgeneric/hu_lib.c"
"doomgeneric/i_scale.c"
"doomgeneric/p_spec.c"
"doomgeneric/p_inter.c"
"doomgeneric/r_data.c"
"doomgeneric/d_loop.c"
"doomgeneric/statdump.c"
"doomgeneric/m_menu.c"
"doomgeneric/hu_stuff.c"
"doomgeneric/w_main.c"
"doomgeneric/f_finale.c"
"doomgeneric/w_file_stdc.cpp"
"doomgeneric/w_wad.c"
"doomgeneric/p_floor.c"
"doomgeneric/p_telept.c"
"doomgeneric/p_doors.c"
"doomgeneric/p_map.c"
"doomgeneric/st_stuff.c"
"doomgeneric/r_sky.c"
"doomgeneric/p_enemy.c"
"doomgeneric/m_fixed.c"
"doomgeneric/doomgeneric.c"
"doomgeneric/mus2mid.c"
"doomgeneric/p_saveg.c"
"doomgeneric/i_system.c"
"doomgeneric/p_user.c"
"doomgeneric/r_bsp.c"
"doomgeneric/z_zone.c"
"doomgeneric/w_checksum.c"
"doomgeneric/p_switch.c"
"doomgeneric/r_things.c"
"doomgeneric/v_video.c"
"doomgeneric/m_random.c"
"doomgeneric/s_sound.c"
"doomgeneric/m_config.c"
"doomgeneric/p_lights.c"
"doomgeneric/i_joystick.c"
"doomgeneric/d_net.c"
"doomgeneric/i_sound.c"
"doomgeneric/dstrings.c"
"doomgeneric/m_bbox.c"
"doomgeneric/am_map.c"
"doomgeneric/p_plats.c"
"doomgeneric/d_mode.c"
"doomgeneric/wi_stuff.c"
"doomgeneric/p_setup.c"
"doomgeneric/d_iwad.c"
"doomgeneric/doomdef.c"
"doomgeneric/doomstat.c"
"doomgeneric/sha1.c"
"doomgeneric/dummy.c"
"doomgeneric/tables.c"
"doomgeneric/i_cdmus.c"
"doomgeneric/m_cheat.c"
"doomgeneric/i_endoom.c"
"doomgeneric/p_pspr.c"
"doomgeneric/w_file.c"
"doomgeneric/st_lib.c"
"doomgeneric/m_controls.c"
"doomgeneric/f_wipe.c"
"doomgeneric/i_input.c"
"doomgeneric/p_ceilng.c"
"doomgeneric/p_tick.c"
"doomgeneric/i_video.c"
"doomgeneric/p_sight.c"
"doomgeneric/p_mobj.c"
"doomgeneric/d_main.c"
)

# -----------------------------------------

# Turn on all optional warnings (-Wall)
set(USER_COMPILE_WARNINGS_ALL -Wall)

# Enable extra warning flags (-Wextra)
set(USER_COMPILE_WARNINGS_EXTRA -Wextra)

# Make all warnings into hard errors (-Werror)
set(USER_COMPILE_WARNINGS_AS_ERRORS )

# Check the code for syntax errors, but don't do anything beyond that. (-fsyntax-only)
set(USER_COMPILE_WARNINGS_CHECK_SYNTAX_ONLY )

# Issue all the mandatory diagnostics listed in the C standard (-pedantic)
set(USER_COMPILE_WARNINGS_PEDANTIC )

# Issue all the mandatory diagnostics, and make all mandatory diagnostics into errors. (-pedantic-errors)
set(USER_COMPILE_WARNINGS_PEDANTIC_AS_ERRORS )

# Suppress all warnings (-w)
set(USER_COMPILE_WARNINGS_INHIBIT_ALL -w)

# -----------------------------------------

# Optimization level   "-O0" [None] , "-O1" [Optimize] , "-O2" [Optimize More], "-O3" [Optimize Most] or "-Os" [Optimize Size]
set(USER_COMPILE_OPTIMIZATION_LEVEL -O0)

# Other flags related to optimization
set(USER_COMPILE_OPTIMIZATION_OTHER_FLAGS )

# -----------------------------------------

# Debug level "" [None], "-g1" [Minimum], "g2" [Default], "g3" [Maximim]
set(USER_COMPILE_DEBUG_LEVEL -g3)

# Other flags releated to debugging
set(USER_COMPILE_DEBUG_OTHER_FLAGS )

# -----------------------------------------

# Enable Profiling (-pg) (This feature is not supported currently)
# set(USER_COMPILE_PROFILING_ENABLE )

# -----------------------------------------

# Verbose (-v)
set(USER_COMPILE_VERBOSE )

# Support ANSI_PROGRAM (-ansi)
set(USER_COMPILE_ANSI )

# Add any compiler options that are not covered by the above variables, they will be added as extra compiler options
# To enable profiling -pg [ for gprof ]  or -p [ for prof information ]
set(USER_COMPILE_OTHER_FLAGS )

# -----------------------------------------

# Linker options
# Do not use the standard system startup files when linking.
# The standard system libraries are used normally, unless -nostdlib or -nodefaultlibs is used. (-nostartfiles)
set(USER_LINK_NO_START_FILES )

# Do not use the standard system libraries when linking. (-nodefaultlibs)
set(USER_LINK_NO_DEFAULT_LIBS )

# Do not use the standard system startup files or libraries when linking. (-nostdlib)
set(USER_LINK_NO_STDLIB )

# Omit all symbol information (-s)
set(USER_LINK_OMIT_ALL_SYMBOL_INFO )


# -----------------------------------------

# Add any libraries to be linked below, they will be added as extra libraries.
# User need to update USER_LINK_DIRECTORIES below with these library paths.
set(USER_LINK_LIBRARIES
)

# Add any directories to look for the libraries to be linked.
# Example 1: Adding /proj/compression/lib will pass -L/proj/compression/lib to the linker.
# Example adding Adding ../../common/lib will consider the path as relative to this directory. and will pass the path to -L option.
set(USER_LINK_DIRECTORIES
)

# -----------------------------------------

set(USER_LINKER_SCRIPT "${CMAKE_SOURCE_DIR}/lscript.ld")

# Add linker options to be passed, they will be added as extra linker options
# Example : adding -s will pass -s to the linker.
set(USER_LINK_OTHER_FLAGS
)

# -----------------------------------------

###   END OF USER SETTINGS SECTION ###
###   DO NOT EDIT BEYOND THIS LINE ###

set(USER_COMPILE_OPTIONS
    " ${USER_COMPILE_WARNINGS_ALL}"
    " ${USER_COMPILE_WARNINGS_EXTRA}"
    " ${USER_COMPILE_WARNINGS_AS_ERRORS}"
    " ${USER_COMPILE_WARNINGS_CHECK_SYNTAX_ONLY}"
    " ${USER_COMPILE_WARNINGS_PEDANTIC}"
    " ${USER_COMPILE_WARNINGS_PEDANTIC_AS_ERRORS}"
    " ${USER_COMPILE_WARNINGS_INHIBIT_ALL}"
    " ${USER_COMPILE_OPTIMIZATION_LEVEL}"
    " ${USER_COMPILE_OPTIMIZATION_OTHER_FLAGS}"
    " ${USER_COMPILE_DEBUG_LEVEL}"
    " ${USER_COMPILE_DEBUG_OTHER_FLAGS}"
    " ${USER_COMPILE_VERBOSE}"
    " ${USER_COMPILE_ANSI}"
    " ${USER_COMPILE_OTHER_FLAGS}"
)
foreach(entry ${USER_UNDEFINED_SYMBOLS})
    list(APPEND USER_COMPILE_OPTIONS " -U${entry}")
endforeach()

set(USER_LINK_OPTIONS
    " ${USER_LINKER_NO_START_FILES}"
    " ${USER_LINKER_NO_DEFAULT_LIBS}"
    " ${USER_LINKER_NO_STDLIB}"
    " ${USER_LINKER_OMIT_ALL_SYMBOL_INFO}"
    " ${USER_LINK_OTHER_FLAGS}"
)
