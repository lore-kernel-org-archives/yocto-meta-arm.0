Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2857.1614806863121013789
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 03 Mar 2021 13:27:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6103E1FB
	for <meta-arm@lists.yoctoproject.org>; Wed,  3 Mar 2021 13:27:37 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A2B83F7D7
	for <meta-arm@lists.yoctoproject.org>; Wed,  3 Mar 2021 13:27:36 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/opencsd: backport patch to fix build race
Date: Wed,  3 Mar 2021 21:27:33 +0000
Message-Id: <20210303212734.758924-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change-Id: I46ea9cfa5e149db000740b4a2c6730ced99340ef
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...ild-race-issue-32-reported-on-github.patch | 160 ++++++++++++++++++
 .../opencsd/opencsd_0.14.3.bb                 |   4 +-
 2 files changed, 163 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm/recipes-devtools/opencsd/files/0001-build-Fi=
x-build-race-issue-32-reported-on-github.patch

diff --git a/meta-arm/recipes-devtools/opencsd/files/0001-build-Fix-build=
-race-issue-32-reported-on-github.patch b/meta-arm/recipes-devtools/openc=
sd/files/0001-build-Fix-build-race-issue-32-reported-on-github.patch
new file mode 100644
index 0000000..8ebc788
--- /dev/null
+++ b/meta-arm/recipes-devtools/opencsd/files/0001-build-Fix-build-race-i=
ssue-32-reported-on-github.patch
@@ -0,0 +1,160 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From b3eb31b79d6eee04020f0dc2ec5140ff5aa28282 Mon Sep 17 00:00:00 2001
+From: Mike Leach <mike.leach@linaro.org>
+Date: Mon, 16 Nov 2020 17:48:40 +0000
+Subject: [PATCH] build: Fix build race issue - #32 reported on github
+
+Issue reported of race when building tests. On a heavily loaded build
+machine the creation of the build directory could occur at the same time
+as compilation into that directory creating issue with finding object
+files.
+
+Reported-by: rossburton (github issue #32)
+Signed-off-by: Mike Leach <mike.leach@linaro.org>
+---
+ decoder/tests/build/linux/c_api_pkt_print_test/makefile | 6 +++---
+ decoder/tests/build/linux/echo_test_dcd_lib/makefile    | 6 +++---
+ decoder/tests/build/linux/mem_buffer_eg/makefile        | 6 +++---
+ decoder/tests/build/linux/snapshot_parser_lib/makefile  | 6 +++---
+ decoder/tests/build/linux/trc_pkt_lister/makefile       | 6 +++---
+ 5 files changed, 15 insertions(+), 15 deletions(-)
+
+diff --git a/decoder/tests/build/linux/c_api_pkt_print_test/makefile b/d=
ecoder/tests/build/linux/c_api_pkt_print_test/makefile
+index b0b5604..f1108e4 100644
+--- a/decoder/tests/build/linux/c_api_pkt_print_test/makefile
++++ b/decoder/tests/build/linux/c_api_pkt_print_test/makefile
+@@ -51,12 +51,12 @@ OBJECTS		=3D	$(BUILD_DIR)/c_api_pkt_print_test.o
+ LIBS		=3D	-L$(LIB_TARGET_DIR) -l$(LIB_BASE_NAME) -l$(LIB_CAPI_NAME) \
+ 				-L$(LIB_TEST_TARGET_DIR) -l_echo_test_dcd
+=20
+-all:  build_dir copy_libs
++all: copy_libs
+=20
+ test_app: 	$(BIN_TEST_TARGET_DIR)/$(PROG)
+=20
+=20
+- $(BIN_TEST_TARGET_DIR)/$(PROG): $(OBJECTS)
++ $(BIN_TEST_TARGET_DIR)/$(PROG): $(OBJECTS) | build_dir
+ 			mkdir -p  $(BIN_TEST_TARGET_DIR)
+ 			$(LINKER) $(LDFLAGS) $(OBJECTS) -Wl,--start-group $(LIBS) -Wl,--end-=
group -o $(BIN_TEST_TARGET_DIR)/$(PROG)
+ 			cp $(LIB_TARGET_DIR)/*.so .
+@@ -77,7 +77,7 @@ DEPS :=3D $(OBJECTS:%.o=3D%.d)
+ -include $(DEPS)
+=20
+ ## object compile
+-$(BUILD_DIR)/%.o : %.c
++$(BUILD_DIR)/%.o : %.c | build_dir
+ 			$(CC) $(CFLAGS) $(CC_INCLUDES) -MMD $< -o $@=20
+=20
+ #### clean
+diff --git a/decoder/tests/build/linux/echo_test_dcd_lib/makefile b/deco=
der/tests/build/linux/echo_test_dcd_lib/makefile
+index 31ca38f..8c255a8 100644
+--- a/decoder/tests/build/linux/echo_test_dcd_lib/makefile
++++ b/decoder/tests/build/linux/echo_test_dcd_lib/makefile
+@@ -48,9 +48,9 @@ CC_INCLUDES	=3D	\
+ OBJECTS		=3D	$(BUILD_DIR)/ext_dcd_echo_test.o \
+ 				$(BUILD_DIR)/ext_dcd_echo_test_fact.o
+=20
+-all:  build_dir $(LIB_TEST_TARGET_DIR)/$(LIB_NAME).a
++all: $(LIB_TEST_TARGET_DIR)/$(LIB_NAME).a
+=20
+-$(LIB_TEST_TARGET_DIR)/$(LIB_NAME).a: $(OBJECTS)
++$(LIB_TEST_TARGET_DIR)/$(LIB_NAME).a: $(OBJECTS) | build_dir
+ 	mkdir -p $(LIB_TEST_TARGET_DIR)
+ 	$(LIB) $(ARFLAGS) $(LIB_TEST_TARGET_DIR)/$(LIB_NAME).a $(OBJECTS)
+=20
+@@ -64,7 +64,7 @@ DEPS :=3D $(OBJECTS:%.o=3D%.d)
+ -include $(DEPS)
+=20
+ ## object compile
+-$(BUILD_DIR)/%.o : %.c
++$(BUILD_DIR)/%.o : %.c | build_dir
+ 			$(CC) $(CFLAGS) $(CC_INCLUDES) -MMD $< -o $@=20
+=20
+ #### clean
+diff --git a/decoder/tests/build/linux/mem_buffer_eg/makefile b/decoder/=
tests/build/linux/mem_buffer_eg/makefile
+index 850ed49..7939521 100644
+--- a/decoder/tests/build/linux/mem_buffer_eg/makefile
++++ b/decoder/tests/build/linux/mem_buffer_eg/makefile
+@@ -51,12 +51,12 @@ OBJECTS		=3D	$(BUILD_DIR)/mem_buff_demo.o
+ LIBS		=3D	-L$(LIB_TEST_TARGET_DIR) -lsnapshot_parser \
+ 				-L$(LIB_TARGET_DIR) -l$(LIB_BASE_NAME)
+=20
+-all:  build_dir copy_libs
++all: copy_libs
+=20
+ test_app: $(BIN_TEST_TARGET_DIR)/$(PROG)
+=20
+=20
+- $(BIN_TEST_TARGET_DIR)/$(PROG): $(OBJECTS)
++ $(BIN_TEST_TARGET_DIR)/$(PROG): $(OBJECTS) | build_dir
+ 			mkdir -p  $(BIN_TEST_TARGET_DIR)
+ 			$(LINKER) $(LDFLAGS) $(OBJECTS) -Wl,--start-group $(LIBS) -Wl,--end-=
group -o $(BIN_TEST_TARGET_DIR)/$(PROG)
+=20
+@@ -76,7 +76,7 @@ DEPS :=3D $(OBJECTS:%.o=3D%.d)
+ -include $(DEPS)
+=20
+ ## object compile
+-$(BUILD_DIR)/%.o : %.cpp
++$(BUILD_DIR)/%.o : %.cpp | build_dir
+ 			$(CXX) $(CXXFLAGS) $(CXX_INCLUDES) -MMD $< -o $@
+=20
+ #### clean
+diff --git a/decoder/tests/build/linux/snapshot_parser_lib/makefile b/de=
coder/tests/build/linux/snapshot_parser_lib/makefile
+index 295bab6..ae566eb 100644
+--- a/decoder/tests/build/linux/snapshot_parser_lib/makefile
++++ b/decoder/tests/build/linux/snapshot_parser_lib/makefile
+@@ -63,9 +63,9 @@ OBJECTS=3D$(BUILD_DIR)/device_info.o \
+ 		$(BUILD_DIR)/snapshot_reader.o \
+ 		$(BUILD_DIR)/ss_to_dcdtree.o
+=20
+-all: build_dir $(LIB_TEST_TARGET_DIR)/$(LIB_NAME).a
++all: $(LIB_TEST_TARGET_DIR)/$(LIB_NAME).a
+=20
+-$(LIB_TEST_TARGET_DIR)/$(LIB_NAME).a: $(OBJECTS)
++$(LIB_TEST_TARGET_DIR)/$(LIB_NAME).a: $(OBJECTS) | build_dir
+ 	mkdir -p $(LIB_TEST_TARGET_DIR)
+ 	$(LIB) $(ARFLAGS) $(LIB_TEST_TARGET_DIR)/$(LIB_NAME).a $(OBJECTS)
+=20
+@@ -80,7 +80,7 @@ DEPS :=3D $(OBJECTS:%.o=3D%.d)
+ -include $(DEPS)
+=20
+ ## object compile
+-$(BUILD_DIR)/%.o : %.cpp
++$(BUILD_DIR)/%.o : %.cpp | build_dir
+ 	$(CXX) $(CXXFLAGS) $(CXX_INCLUDES) -MMD $< -o $@
+=20
+ ### clean
+diff --git a/decoder/tests/build/linux/trc_pkt_lister/makefile b/decoder=
/tests/build/linux/trc_pkt_lister/makefile
+index 54ce27d..1027964 100644
+--- a/decoder/tests/build/linux/trc_pkt_lister/makefile
++++ b/decoder/tests/build/linux/trc_pkt_lister/makefile
+@@ -51,12 +51,12 @@ OBJECTS		=3D	$(BUILD_DIR)/trc_pkt_lister.o
+ LIBS		=3D	-L$(LIB_TEST_TARGET_DIR) -lsnapshot_parser \
+ 				-L$(LIB_TARGET_DIR) -l$(LIB_BASE_NAME)
+=20
+-all:  build_dir copy_libs
++all: copy_libs
+=20
+ test_app: $(BIN_TEST_TARGET_DIR)/$(PROG)
+=20
+=20
+- $(BIN_TEST_TARGET_DIR)/$(PROG): $(OBJECTS)
++ $(BIN_TEST_TARGET_DIR)/$(PROG): $(OBJECTS) | build_dir
+ 			mkdir -p  $(BIN_TEST_TARGET_DIR)
+ 			$(LINKER) $(LDFLAGS) $(OBJECTS) -Wl,--start-group $(LIBS) -Wl,--end-=
group -o $(BIN_TEST_TARGET_DIR)/$(PROG)
+=20
+@@ -76,7 +76,7 @@ DEPS :=3D $(OBJECTS:%.o=3D%.d)
+ -include $(DEPS)
+=20
+ ## object compile
+-$(BUILD_DIR)/%.o : %.cpp
++$(BUILD_DIR)/%.o : %.cpp | build_dir
+ 			$(CXX) $(CXXFLAGS) $(CXX_INCLUDES) -MMD $< -o $@
+=20
+ #### clean
+--=20
+2.25.1
+
diff --git a/meta-arm/recipes-devtools/opencsd/opencsd_0.14.3.bb b/meta-a=
rm/recipes-devtools/opencsd/opencsd_0.14.3.bb
index bec3dc7..e126f6b 100644
--- a/meta-arm/recipes-devtools/opencsd/opencsd_0.14.3.bb
+++ b/meta-arm/recipes-devtools/opencsd/opencsd_0.14.3.bb
@@ -3,7 +3,9 @@ HOMEPAGE =3D "https://github.com/Linaro/OpenCSD"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dad8cb685eb324d2fa2530b985a43f=
3e5"
=20
-SRC_URI =3D "git://github.com/Linaro/OpenCSD;protocol=3Dhttps;branch=3Dm=
aster"
+SRC_URI =3D "git://github.com/Linaro/OpenCSD;protocol=3Dhttps;branch=3Dm=
aster \
+           file://0001-build-Fix-build-race-issue-32-reported-on-github.=
patch"
+
 SRCREV =3D "957d18219d162f52ebe2426f32a4263ec10f357d"
=20
 S =3D "${WORKDIR}/git"
--=20
2.25.1

