function(configure_dep DEP_NAME BUILD_DIR BUILD_TYPE INSTALL_DIR)
	message("Configure ${DEP_NAME} in: ${BUILD_DIR}")
	file(MAKE_DIRECTORY ${BUILD_DIR})
	execute_process(
		COMMAND ${CMAKE_COMMAND}
		-DCMAKE_BUILD_TYPE=${BUILD_TYPE}
		-DCMAKE_INSTALL_PREFIX=${INSTALL_DIR}
		..
		WORKING_DIRECTORY ${BUILD_DIR}
		RESULT_VARIABLE RES
		)
	if(RES)
		message(FATAL_ERROR "Configure of ${DEPNAME} failed: ${RES}")
	endif()
endfunction()

function(build_dep DEP_NAME BUILD_DIR BUILD_TYPE)
	message("Building ${DEP_NAME} in: ${BUILD_DIR}")
	execute_process(
		COMMAND ${CMAKE_COMMAND}
		--build .
	        --target INSTALL
		--config ${BUILD_TYPE}
		WORKING_DIRECTORY ${BUILD_DIR}
		RESULT_VARIABLE RES
	)
	if(RES)
		message(FATAL_ERROR "Build of OpenAL-soft failed: ${RES}")
	endif()
endfunction()

function(configure_build_dep DEP_NAME BUILD_DIR BUILD_TYPE INSTALL_DIR)
	configure_dep(${DEP_NAME} ${BUILD_DIR} ${BUILD_TYPE} ${INSTALL_DIR})
	build_dep(${DEP_NAME} ${BUILD_DIR} ${BUILD_TYPE})
endfunction()
