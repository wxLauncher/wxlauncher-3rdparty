function(configure_dep DEP_NAME BUILD_DIR BUILD_TYPE INSTALL_DIR CONFIGURE_ARGS)
	message("Configure ${DEP_NAME} in: ${BUILD_DIR}")
	file(MAKE_DIRECTORY ${BUILD_DIR})
	execute_process(
		COMMAND ${CMAKE_COMMAND}
		-DCMAKE_BUILD_TYPE=${BUILD_TYPE}
		-DCMAKE_INSTALL_PREFIX=${INSTALL_DIR}
		${CONFIGURE_ARGS}
		..
		WORKING_DIRECTORY ${BUILD_DIR}
		RESULT_VARIABLE RES
		)
	if(RES)
		message(FATAL_ERROR "Configure of ${DEP_NAME} failed: ${RES}")
	endif()
endfunction()

function(build_dep DEP_NAME BUILD_DIR BUILD_TYPE TARGET)
	message("Building ${DEP_NAME} in: ${BUILD_DIR}")
	execute_process(
		COMMAND ${CMAKE_COMMAND}
		--build .
		--target ${TARGET}
		--config ${BUILD_TYPE}
		WORKING_DIRECTORY ${BUILD_DIR}
		RESULT_VARIABLE RES
	)
	if(RES)
		message(FATAL_ERROR "Build of ${DEP_NAME} failed: ${RES}")
	endif()
endfunction()

function(install_dep DEP_NAME BUILD_DIR BUILD_TYPE INSTALL_DIR
	CONFIGURE_ARGS)
	configure_dep(${DEP_NAME} ${BUILD_DIR} ${BUILD_TYPE} ${INSTALL_DIR}
		${CONFIGURE_ARGS})
	build_dep(${DEP_NAME} ${BUILD_DIR} ${BUILD_TYPE} INSTALL)
endfunction()

function(build_dep_only DEP_NAME BUILD_DIR BUILD_TYPE INSTALL_DIR)
	configure_dep(${DEP_NAME} ${BUILD_DIR} ${BUILD_TYPE} ${INSTALL_DIR} "")
	build_dep(${DEP_NAME} ${BUILD_DIR} ${BUILD_TYPE} ALL_BUILD)
endfunction()
