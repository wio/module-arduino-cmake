function(_fix_redundant_target_compile_flags target_)

   # Get the current compile flags of a target
   #
   get_target_property(compile_flags ${target_} COMPILE_FLAGS)
   
   # Turn the space separated list of compile flags into a semicolon 
   # separated list
   #
   string(REGEX REPLACE " +('*-)" ";\\1" new_compile_flags "${compile_flags}")
   
   # Remove any duplicate flags (includes directory specifications, ...)
   #
   list(REMOVE_DUPLICATES new_compile_flags)
   
   # Convert the semicolon separated list back into a space separated one
   #
   string(REGEX REPLACE ";('*-)" " \\1" new_compile_flags "${new_compile_flags}")
   
   # Replace the bad (redundant) compile flags
   #
   set_target_properties(${target_} PROPERTIES COMPILE_FLAGS "${new_compile_flags}")
   
endfunction()