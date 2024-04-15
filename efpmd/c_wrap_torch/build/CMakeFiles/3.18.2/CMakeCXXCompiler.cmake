set(CMAKE_CXX_COMPILER "/apps/spack/bell/apps/gcc/9.3.0-gcc-4.8.5-z2ug7z7/bin/g++")
set(CMAKE_CXX_COMPILER_ARG1 "")
set(CMAKE_CXX_COMPILER_ID "GNU")
set(CMAKE_CXX_COMPILER_VERSION "9.3.0")
set(CMAKE_CXX_COMPILER_VERSION_INTERNAL "")
set(CMAKE_CXX_COMPILER_WRAPPER "")
set(CMAKE_CXX_STANDARD_COMPUTED_DEFAULT "14")
set(CMAKE_CXX_COMPILE_FEATURES "cxx_std_98;cxx_template_template_parameters;cxx_std_11;cxx_alias_templates;cxx_alignas;cxx_alignof;cxx_attributes;cxx_auto_type;cxx_constexpr;cxx_decltype;cxx_decltype_incomplete_return_types;cxx_default_function_template_args;cxx_defaulted_functions;cxx_defaulted_move_initializers;cxx_delegating_constructors;cxx_deleted_functions;cxx_enum_forward_declarations;cxx_explicit_conversions;cxx_extended_friend_declarations;cxx_extern_templates;cxx_final;cxx_func_identifier;cxx_generalized_initializers;cxx_inheriting_constructors;cxx_inline_namespaces;cxx_lambdas;cxx_local_type_template_args;cxx_long_long_type;cxx_noexcept;cxx_nonstatic_member_init;cxx_nullptr;cxx_override;cxx_range_for;cxx_raw_string_literals;cxx_reference_qualified_functions;cxx_right_angle_brackets;cxx_rvalue_references;cxx_sizeof_member;cxx_static_assert;cxx_strong_enums;cxx_thread_local;cxx_trailing_return_types;cxx_unicode_literals;cxx_uniform_initialization;cxx_unrestricted_unions;cxx_user_literals;cxx_variadic_macros;cxx_variadic_templates;cxx_std_14;cxx_aggregate_default_initializers;cxx_attribute_deprecated;cxx_binary_literals;cxx_contextual_conversions;cxx_decltype_auto;cxx_digit_separators;cxx_generic_lambdas;cxx_lambda_init_captures;cxx_relaxed_constexpr;cxx_return_type_deduction;cxx_variable_templates;cxx_std_17;cxx_std_20")
set(CMAKE_CXX98_COMPILE_FEATURES "cxx_std_98;cxx_template_template_parameters")
set(CMAKE_CXX11_COMPILE_FEATURES "cxx_std_11;cxx_alias_templates;cxx_alignas;cxx_alignof;cxx_attributes;cxx_auto_type;cxx_constexpr;cxx_decltype;cxx_decltype_incomplete_return_types;cxx_default_function_template_args;cxx_defaulted_functions;cxx_defaulted_move_initializers;cxx_delegating_constructors;cxx_deleted_functions;cxx_enum_forward_declarations;cxx_explicit_conversions;cxx_extended_friend_declarations;cxx_extern_templates;cxx_final;cxx_func_identifier;cxx_generalized_initializers;cxx_inheriting_constructors;cxx_inline_namespaces;cxx_lambdas;cxx_local_type_template_args;cxx_long_long_type;cxx_noexcept;cxx_nonstatic_member_init;cxx_nullptr;cxx_override;cxx_range_for;cxx_raw_string_literals;cxx_reference_qualified_functions;cxx_right_angle_brackets;cxx_rvalue_references;cxx_sizeof_member;cxx_static_assert;cxx_strong_enums;cxx_thread_local;cxx_trailing_return_types;cxx_unicode_literals;cxx_uniform_initialization;cxx_unrestricted_unions;cxx_user_literals;cxx_variadic_macros;cxx_variadic_templates")
set(CMAKE_CXX14_COMPILE_FEATURES "cxx_std_14;cxx_aggregate_default_initializers;cxx_attribute_deprecated;cxx_binary_literals;cxx_contextual_conversions;cxx_decltype_auto;cxx_digit_separators;cxx_generic_lambdas;cxx_lambda_init_captures;cxx_relaxed_constexpr;cxx_return_type_deduction;cxx_variable_templates")
set(CMAKE_CXX17_COMPILE_FEATURES "cxx_std_17")
set(CMAKE_CXX20_COMPILE_FEATURES "cxx_std_20")

set(CMAKE_CXX_PLATFORM_ID "Linux")
set(CMAKE_CXX_SIMULATE_ID "")
set(CMAKE_CXX_COMPILER_FRONTEND_VARIANT "")
set(CMAKE_CXX_SIMULATE_VERSION "")




set(CMAKE_AR "/usr/bin/ar")
set(CMAKE_CXX_COMPILER_AR "/apps/spack/bell/apps/gcc/10.2.0-gcc-4.8.5-mgcgzho/bin/gcc-ar")
set(CMAKE_RANLIB "/usr/bin/ranlib")
set(CMAKE_CXX_COMPILER_RANLIB "/apps/spack/bell/apps/gcc/10.2.0-gcc-4.8.5-mgcgzho/bin/gcc-ranlib")
set(CMAKE_LINKER "/apps/cent7/xalt/bin/ld")
set(CMAKE_MT "")
set(CMAKE_COMPILER_IS_GNUCXX 1)
set(CMAKE_CXX_COMPILER_LOADED 1)
set(CMAKE_CXX_COMPILER_WORKS TRUE)
set(CMAKE_CXX_ABI_COMPILED TRUE)
set(CMAKE_COMPILER_IS_MINGW )
set(CMAKE_COMPILER_IS_CYGWIN )
if(CMAKE_COMPILER_IS_CYGWIN)
  set(CYGWIN 1)
  set(UNIX 1)
endif()

set(CMAKE_CXX_COMPILER_ENV_VAR "CXX")

if(CMAKE_COMPILER_IS_MINGW)
  set(MINGW 1)
endif()
set(CMAKE_CXX_COMPILER_ID_RUN 1)
set(CMAKE_CXX_SOURCE_FILE_EXTENSIONS C;M;c++;cc;cpp;cxx;m;mm;CPP)
set(CMAKE_CXX_IGNORE_EXTENSIONS inl;h;hpp;HPP;H;o;O;obj;OBJ;def;DEF;rc;RC)

foreach (lang C OBJC OBJCXX)
  if (CMAKE_${lang}_COMPILER_ID_RUN)
    foreach(extension IN LISTS CMAKE_${lang}_SOURCE_FILE_EXTENSIONS)
      list(REMOVE_ITEM CMAKE_CXX_SOURCE_FILE_EXTENSIONS ${extension})
    endforeach()
  endif()
endforeach()

set(CMAKE_CXX_LINKER_PREFERENCE 30)
set(CMAKE_CXX_LINKER_PREFERENCE_PROPAGATES 1)

# Save compiler ABI information.
set(CMAKE_CXX_SIZEOF_DATA_PTR "8")
set(CMAKE_CXX_COMPILER_ABI "ELF")
set(CMAKE_CXX_LIBRARY_ARCHITECTURE "")

if(CMAKE_CXX_SIZEOF_DATA_PTR)
  set(CMAKE_SIZEOF_VOID_P "${CMAKE_CXX_SIZEOF_DATA_PTR}")
endif()

if(CMAKE_CXX_COMPILER_ABI)
  set(CMAKE_INTERNAL_PLATFORM_ABI "${CMAKE_CXX_COMPILER_ABI}")
endif()

if(CMAKE_CXX_LIBRARY_ARCHITECTURE)
  set(CMAKE_LIBRARY_ARCHITECTURE "")
endif()

set(CMAKE_CXX_CL_SHOWINCLUDES_PREFIX "")
if(CMAKE_CXX_CL_SHOWINCLUDES_PREFIX)
  set(CMAKE_CL_SHOWINCLUDES_PREFIX "${CMAKE_CXX_CL_SHOWINCLUDES_PREFIX}")
endif()





set(CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES "/apps/spack/bell/apps/gdb/11.1-gcc-4.8.5-otobz47/include;/apps/spack/bell/apps/gmp/6.1.2-gcc-4.8.5-6bsovvk/include;/apps/spack/bell/apps/qt/5.12.5-gcc-4.8.5-crhkujb/include;/apps/spack/bell/apps/libtiff/4.0.10-gcc-4.8.5-ay66rcp/include;/apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/include;/apps/spack/bell/apps/netlib-lapack/3.8.0-gcc-10.2.0-u6wadoq/include;/apps/spack/bell/apps/openblas/0.3.8-gcc-10.2.0-yierafl/include;/apps/spack/bell/apps/hdf5/1.10.6-gcc-10.2.0-fa6zg3j/include;/apps/spack/bell/apps/libszip/2.1.1-gcc-10.2.0-ep7tepl/include;/apps/spack/bell/apps/boost/1.68.0-gcc-10.2.0-illfiwk/include;/apps/spack/bell/apps/zlib/1.2.11-gcc-10.2.0-vfja5fy/include;/apps/spack/bell/apps/gcc/10.2.0-gcc-4.8.5-mgcgzho/include;/apps/spack/bell-20231031/apps/mpc/1.1.0-gcc-4.8.5-falbgx3/include;/apps/spack/bell-20231031/apps/mpfr/3.1.6-gcc-4.8.5-cslxql4/include;/apps/spack/bell/apps/gcc/9.3.0-gcc-4.8.5-z2ug7z7/include/c++/9.3.0;/apps/spack/bell/apps/gcc/9.3.0-gcc-4.8.5-z2ug7z7/include/c++/9.3.0/x86_64-pc-linux-gnu;/apps/spack/bell/apps/gcc/9.3.0-gcc-4.8.5-z2ug7z7/include/c++/9.3.0/backward;/apps/spack/bell/apps/gcc/9.3.0-gcc-4.8.5-z2ug7z7/lib/gcc/x86_64-pc-linux-gnu/9.3.0/include;/usr/local/include;/apps/spack/bell/apps/gcc/9.3.0-gcc-4.8.5-z2ug7z7/include;/apps/spack/bell/apps/gcc/9.3.0-gcc-4.8.5-z2ug7z7/lib/gcc/x86_64-pc-linux-gnu/9.3.0/include-fixed;/usr/include")
set(CMAKE_CXX_IMPLICIT_LINK_LIBRARIES "stdc++;m;gcc_s;gcc;c;gcc_s;gcc")
set(CMAKE_CXX_IMPLICIT_LINK_DIRECTORIES "/apps/spack/bell/apps/netlib-lapack/3.8.0-gcc-10.2.0-u6wadoq/lib64;/apps/spack/bell/apps/gcc/10.2.0-gcc-4.8.5-mgcgzho/lib64;/apps/spack/bell/apps/gcc/9.3.0-gcc-4.8.5-z2ug7z7/lib/gcc/x86_64-pc-linux-gnu/9.3.0;/apps/spack/bell/apps/gcc/9.3.0-gcc-4.8.5-z2ug7z7/lib64;/lib64;/usr/lib64;/apps/spack/bell/apps/gdb/11.1-gcc-4.8.5-otobz47/lib;/apps/spack/bell/apps/gmp/6.1.2-gcc-4.8.5-6bsovvk/lib;/apps/spack/bell/apps/qt/5.12.5-gcc-4.8.5-crhkujb/lib;/apps/spack/bell/apps/libtiff/4.0.10-gcc-4.8.5-ay66rcp/lib;/apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/lib;/apps/spack/bell/apps/openblas/0.3.8-gcc-10.2.0-yierafl/lib;/apps/spack/bell/apps/hdf5/1.10.6-gcc-10.2.0-fa6zg3j/lib;/apps/spack/bell/apps/libszip/2.1.1-gcc-10.2.0-ep7tepl/lib;/apps/spack/bell/apps/boost/1.68.0-gcc-10.2.0-illfiwk/lib;/apps/spack/bell/apps/zlib/1.2.11-gcc-10.2.0-vfja5fy/lib;/apps/spack/bell/apps/gcc/10.2.0-gcc-4.8.5-mgcgzho/lib;/apps/spack/bell-20231031/apps/mpc/1.1.0-gcc-4.8.5-falbgx3/lib;/apps/spack/bell-20231031/apps/mpfr/3.1.6-gcc-4.8.5-cslxql4/lib;/apps/spack/bell/apps/gcc/9.3.0-gcc-4.8.5-z2ug7z7/lib")
set(CMAKE_CXX_IMPLICIT_LINK_FRAMEWORK_DIRECTORIES "")
