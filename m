Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.654.1627390284117454913
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 27 Jul 2021 05:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=tPmS8qGK;
 spf=pass (domain: linaro.org, ip: 209.85.216.54, mailfrom: sumit.garg@linaro.org)
Received: by mail-pj1-f54.google.com with SMTP id u9-20020a17090a1f09b029017554809f35so4034557pja.5
        for <meta-arm@lists.yoctoproject.org>; Tue, 27 Jul 2021 05:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pdjK3O3WE36FYuKurJZr0cF3bniLgsGDdZBvyexjAC4=;
        b=tPmS8qGKZGgPIuhJ+Mpk6sYAVljBy/xNkhUhIP7bOzR7xk8NVqixPbkiLk8NaXwCjV
         Dl+SuikkjWdgWlD/T+D/Mmqg6tyX5hfV5PTenwn4MSr3QFa56osxGyV9SftR7xpi4kae
         JJ57MwJLflIY5dg6nDZCaEseaLbX/iGYyWlAxEv7AHLCTIi5dK9ldRZ2R4f039hV6ia5
         oJKoJS9xObpCqzfXWv/tSr7YPMH99nIUbm2Fe56dzSP31MGH/A40dpNWiZ0TKo7Xyxt8
         0naJNcdseHeR/OfcgotzqRUZGrB4M+1uiRbwGW2osn9TZ7o5PexW4u/F0G+oo/U/w3f3
         wLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pdjK3O3WE36FYuKurJZr0cF3bniLgsGDdZBvyexjAC4=;
        b=BRCq4j9tnZU2TiXIAgSCATegttEk601htRXAVHs42vAZ8klmodi9RrRyi/MwEOzZth
         ELGNXPAlUIv+F692OYTkW/CH4RNHSPE6kSdTa1DS7S6pKQImuMPPAYVEYq9oRElioWmT
         qw8+DMwPupWKoJKHmPTyna7/gR+5oXIJ7W+YCaK01APxuxj8xGWfgAoAWU+84vmsCae4
         oZS12xzjfatvF0Bli6LT3tTf2enoiNoS6YYjYYSXWQzoaKqsbgUSJ2ErPIV2BUfFuGrR
         usZPThrp1b0NWwWk83XG3l54nS5DPN3DkAoc56qwUUkYepU9Tz+fuNJTAxsK5Es9ASEw
         UoaQ==
X-Gm-Message-State: AOAM530JmhWSOofa1IMdrLvlvePWjri97AhMTJGLdCn2ZGDFbDPgOBNX
	SCQKQX/1p3FlZyDVMsVUw4Nz+lOTFhnFqLGI
X-Google-Smtp-Source: ABdhPJzo4gPNHjeeU4sj1ejzxkt2KAjvZhl2aF/vsJFfTGJbHkmhhkg7eEKS0ehQQxXB7jBGgK8WjA==
X-Received: by 2002:a65:5b47:: with SMTP id y7mr23362445pgr.22.1627390282878;
        Tue, 27 Jul 2021 05:51:22 -0700 (PDT)
Return-Path: <sumit.garg@linaro.org>
Received: from localhost.localdomain ([223.178.210.84])
        by smtp.gmail.com with ESMTPSA id u3sm2870428pjn.18.2021.07.27.05.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 05:51:22 -0700 (PDT)
From: "Sumit Garg" <sumit.garg@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Jon.Mason@arm.com,
	Ross.Burton@arm.com,
	arunachalam.ganapathy@arm.com,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH v2] arm/optee: version uplift 3.11.0 -> 3.14.0
Date: Tue, 27 Jul 2021 18:20:51 +0530
Message-Id: <20210727125051.141278-1-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Brief description of changes:
- Version uplift 3.11.0 -> 3.14.0.
- Removed OP-TEE patches that has already been accepted upstream.
- Added support for tee-supplicant plugin framework testing.

Tested on qemuarm64_secureboot:
$ xtest -l 15
$ optee-examples_*

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---

Changes in v2:
- Fix bashism ("=" instead of "==") in optee-examples Makefile patch.

 .../optee/optee-client_3.11.0.bb              |   3 -
 .../optee/optee-client_3.14.0.bb              |   3 +
 .../recipes-security/optee/optee-examples.inc |   9 +-
 .../0001-make-Pass-ldflags-during-link.patch  | 103 ------------------
 ...efault-cross-compiler-environment-se.patch |  84 ++++++++++++++
 ...nable-plugins-installation-in-rootfs.patch |  37 +++++++
 .../optee/optee-examples_3.11.0.bb            |   4 -
 .../optee/optee-examples_3.14.0.bb            |   4 +
 ...ide-empty-__getauxval-implementation.patch |  62 -----------
 ...t-support-for-libnames-after-libgcc-.patch |  55 ----------
 ...ke-sure-that-libutils-is-linked-seco.patch |  44 --------
 .../recipes-security/optee/optee-os_3.11.0.bb |  11 --
 .../recipes-security/optee/optee-os_3.14.0.bb |   8 ++
 .../recipes-security/optee/optee-test.inc     |  15 +--
 ...Adjust-order-of-including-compiler.h.patch |  64 -----------
 ...ake-remove-Wno-unsafe-loop-for-clang.patch |  31 ------
 ...e-remove-Wmissing-noreturn-for-clang.patch |  31 ------
 .../optee/optee-test_3.11.0.bb                |   3 -
 .../optee/optee-test_3.14.0.bb                |   3 +
 19 files changed, 152 insertions(+), 422 deletions(-)
 delete mode 100644 meta-arm/recipes-security/optee/optee-client_3.11.0.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-client_3.14.0.bb
 delete mode 100644 meta-arm/recipes-security/optee/optee-examples/0001-make-Pass-ldflags-during-link.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-examples/0001-plugins-Honour-default-cross-compiler-environment-se.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-examples/0002-Makefile-Enable-plugins-installation-in-rootfs.patch
 delete mode 100644 meta-arm/recipes-security/optee/optee-examples_3.11.0.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-examples_3.14.0.bb
 delete mode 100644 meta-arm/recipes-security/optee/optee-os/0001-libutils-provide-empty-__getauxval-implementation.patch
 delete mode 100644 meta-arm/recipes-security/optee/optee-os/0002-link.mk-implement-support-for-libnames-after-libgcc-.patch
 delete mode 100644 meta-arm/recipes-security/optee/optee-os/0003-ta_dev_kit.mk-make-sure-that-libutils-is-linked-seco.patch
 delete mode 100644 meta-arm/recipes-security/optee/optee-os_3.11.0.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-os_3.14.0.bb
 delete mode 100644 meta-arm/recipes-security/optee/optee-test/0001-host-xtest-Adjust-order-of-including-compiler.h.patch
 delete mode 100644 meta-arm/recipes-security/optee/optee-test/0002-make-remove-Wno-unsafe-loop-for-clang.patch
 delete mode 100644 meta-arm/recipes-security/optee/optee-test/0003-make-remove-Wmissing-noreturn-for-clang.patch
 delete mode 100644 meta-arm/recipes-security/optee/optee-test_3.11.0.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-test_3.14.0.bb

diff --git a/meta-arm/recipes-security/optee/optee-client_3.11.0.bb b/meta-arm/recipes-security/optee/optee-client_3.11.0.bb
deleted file mode 100644
index f765d12..0000000
--- a/meta-arm/recipes-security/optee/optee-client_3.11.0.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require optee-client.inc
-
-SRCREV = "c0c925384c1d7e3558d27d2708857482952d7907"
diff --git a/meta-arm/recipes-security/optee/optee-client_3.14.0.bb b/meta-arm/recipes-security/optee/optee-client_3.14.0.bb
new file mode 100644
index 0000000..be78b88
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-client_3.14.0.bb
@@ -0,0 +1,3 @@
+require optee-client.inc
+
+SRCREV = "06e1b32f6a7028e039c625b07cfc25fda0c17d53"
diff --git a/meta-arm/recipes-security/optee/optee-examples.inc b/meta-arm/recipes-security/optee/optee-examples.inc
index 81c31bc..f2e53f3 100644
--- a/meta-arm/recipes-security/optee/optee-examples.inc
+++ b/meta-arm/recipes-security/optee/optee-examples.inc
@@ -12,7 +12,8 @@ inherit python3native
 require optee.inc
 
 SRC_URI = "git://github.com/linaro-swg/optee_examples.git \
-           file://0001-make-Pass-ldflags-during-link.patch \
+           file://0001-plugins-Honour-default-cross-compiler-environment-se.patch \
+           file://0002-Makefile-Enable-plugins-installation-in-rootfs.patch \
           "
 
 EXTRA_OEMAKE += "TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
@@ -32,11 +33,15 @@ do_compile[cleandirs] = "${B}"
 do_install () {
     mkdir -p ${D}${nonarch_base_libdir}/optee_armtz
     mkdir -p ${D}${bindir}
+    mkdir -p ${D}${libdir}/tee-supplicant/plugins
     install -D -p -m0755 ${B}/ca/* ${D}${bindir}
     install -D -p -m0444 ${B}/ta/* ${D}${nonarch_base_libdir}/optee_armtz
+    install -D -p -m0444 ${B}/plugins/* ${D}${libdir}/tee-supplicant/plugins
 }
 
-FILES_${PN} += "${nonarch_base_libdir}/optee_armtz/"
+FILES_${PN} += "${nonarch_base_libdir}/optee_armtz/ \
+                ${libdir}/tee-supplicant/plugins/ \
+               "
 
 # Imports machine specific configs from staging to build
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta-arm/recipes-security/optee/optee-examples/0001-make-Pass-ldflags-during-link.patch b/meta-arm/recipes-security/optee/optee-examples/0001-make-Pass-ldflags-during-link.patch
deleted file mode 100644
index 84202ef..0000000
--- a/meta-arm/recipes-security/optee/optee-examples/0001-make-Pass-ldflags-during-link.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From 29ae21de41f2fbab6dbecbbf408826b28de82df1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 1 Sep 2020 21:09:56 -0700
-Subject: [PATCH] make: Pass ldflags during link
-
-OpenEmbeeded needs to pass essential linker flags to set correct flags
-for gnu_hash among others which sets the linking straight
-using LDFLAGS varible here means, we can affect the linker flags
-from build environment
-
-Upstream-Status: Submitted [https://github.com/linaro-swg/optee_examples/pull/85]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- acipher/host/Makefile        | 2 +-
- aes/host/Makefile            | 2 +-
- hello_world/host/Makefile    | 2 +-
- hotp/host/Makefile           | 2 +-
- random/host/Makefile         | 2 +-
- secure_storage/host/Makefile | 2 +-
- 6 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/acipher/host/Makefile b/acipher/host/Makefile
-index 8f4bc8a..c2cabef 100644
---- a/acipher/host/Makefile
-+++ b/acipher/host/Makefile
-@@ -18,7 +18,7 @@ BINARY = optee_example_acipher
- all: $(BINARY)
- 
- $(BINARY): $(OBJS)
--	$(CC) -o $@ $< $(LDADD)
-+	$(CC) -o $@ $< $(LDFLAGS) $(LDADD)
- 
- .PHONY: clean
- clean:
-diff --git a/aes/host/Makefile b/aes/host/Makefile
-index dfeb4e8..f61c71b 100644
---- a/aes/host/Makefile
-+++ b/aes/host/Makefile
-@@ -18,7 +18,7 @@ BINARY = optee_example_aes
- all: $(BINARY)
- 
- $(BINARY): $(OBJS)
--	$(CC) -o $@ $< $(LDADD)
-+	$(CC) -o $@ $< $(LDFLAGS) $(LDADD)
- 
- .PHONY: clean
- clean:
-diff --git a/hello_world/host/Makefile b/hello_world/host/Makefile
-index c4c8239..69cf42c 100644
---- a/hello_world/host/Makefile
-+++ b/hello_world/host/Makefile
-@@ -18,7 +18,7 @@ BINARY = optee_example_hello_world
- all: $(BINARY)
- 
- $(BINARY): $(OBJS)
--	$(CC) -o $@ $< $(LDADD)
-+	$(CC) -o $@ $< $(LDFLAGS) $(LDADD)
- 
- .PHONY: clean
- clean:
-diff --git a/hotp/host/Makefile b/hotp/host/Makefile
-index cb7fd19..e7f013f 100644
---- a/hotp/host/Makefile
-+++ b/hotp/host/Makefile
-@@ -18,7 +18,7 @@ BINARY = optee_example_hotp
- all: $(BINARY)
- 
- $(BINARY): $(OBJS)
--	$(CC) -o $@ $< $(LDADD)
-+	$(CC) -o $@ $< $(LDFLAGS) $(LDADD)
- 
- .PHONY: clean
- clean:
-diff --git a/random/host/Makefile b/random/host/Makefile
-index fd407d9..9377f7a 100644
---- a/random/host/Makefile
-+++ b/random/host/Makefile
-@@ -18,7 +18,7 @@ BINARY = optee_example_random
- all: $(BINARY)
- 
- $(BINARY): $(OBJS)
--	$(CC) -o $@ $< $(LDADD)
-+	$(CC) -o $@ $< $(LDFLAGS) $(LDADD)
- 
- .PHONY: clean
- clean:
-diff --git a/secure_storage/host/Makefile b/secure_storage/host/Makefile
-index 29bfb87..b3265ae 100644
---- a/secure_storage/host/Makefile
-+++ b/secure_storage/host/Makefile
-@@ -18,7 +18,7 @@ BINARY = optee_example_secure_storage
- all: $(BINARY)
- 
- $(BINARY): $(OBJS)
--	$(CC) -o $@ $< $(LDADD)
-+	$(CC) -o $@ $< $(LDFLAGS) $(LDADD)
- 
- .PHONY: clean
- clean:
--- 
-2.28.0
-
diff --git a/meta-arm/recipes-security/optee/optee-examples/0001-plugins-Honour-default-cross-compiler-environment-se.patch b/meta-arm/recipes-security/optee/optee-examples/0001-plugins-Honour-default-cross-compiler-environment-se.patch
new file mode 100644
index 0000000..033e48c
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-examples/0001-plugins-Honour-default-cross-compiler-environment-se.patch
@@ -0,0 +1,84 @@
+From 79c826c249001700007a6dffe80c3d61ff4428ef Mon Sep 17 00:00:00 2001
+From: Sumit Garg <sumit.garg@linaro.org>
+Date: Tue, 20 Jul 2021 13:54:30 +0530
+Subject: [PATCH 1/2] plugins: Honour default cross compiler environment setup
+
+Honour default $(CC), $(CFLAGS) and $(LDFLAGS) variables. Without this
+plugins example fails to build for OE/Yocto.
+
+Upstream-Status: Submitted [https://github.com/linaro-swg/optee_examples/pull/87]
+
+Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
+---
+ plugins/Makefile        |  2 +-
+ plugins/host/Makefile   |  2 +-
+ plugins/syslog/Makefile | 16 ++++++++++++----
+ 3 files changed, 14 insertions(+), 6 deletions(-)
+
+diff --git a/plugins/Makefile b/plugins/Makefile
+index 2372b38..ea472b4 100644
+--- a/plugins/Makefile
++++ b/plugins/Makefile
+@@ -8,7 +8,7 @@ TA_CROSS_COMPILE ?= $(CROSS_COMPILE)
+ all:
+ 	$(MAKE) -C host CROSS_COMPILE="$(HOST_CROSS_COMPILE)" --no-builtin-variables
+ 	$(MAKE) -C ta CROSS_COMPILE="$(TA_CROSS_COMPILE)" LDFLAGS=""
+-	$(MAKE) -C syslog CROSS_COMPILE="$(HOST_CROSS_COMPILE)"
++	$(MAKE) -C syslog CROSS_COMPILE="$(HOST_CROSS_COMPILE)" --no-builtin-variables
+ 
+ .PHONY: clean
+ clean:
+diff --git a/plugins/host/Makefile b/plugins/host/Makefile
+index 7285104..76244c7 100644
+--- a/plugins/host/Makefile
++++ b/plugins/host/Makefile
+@@ -20,7 +20,7 @@ BINARY = optee_example_plugins
+ all: $(BINARY)
+ 
+ $(BINARY): $(OBJS)
+-	$(CC) -o $@ $< $(LDADD)
++	$(CC) $(LDFLAGS) -o $@ $< $(LDADD)
+ 
+ .PHONY: clean
+ clean:
+diff --git a/plugins/syslog/Makefile b/plugins/syslog/Makefile
+index 62d916a..71f5f92 100644
+--- a/plugins/syslog/Makefile
++++ b/plugins/syslog/Makefile
+@@ -1,3 +1,11 @@
++CC      ?= $(CROSS_COMPILE)gcc
++LD      ?= $(CROSS_COMPILE)ld
++AR      ?= $(CROSS_COMPILE)ar
++NM      ?= $(CROSS_COMPILE)nm
++OBJCOPY ?= $(CROSS_COMPILE)objcopy
++OBJDUMP ?= $(CROSS_COMPILE)objdump
++READELF ?= $(CROSS_COMPILE)readelf
++
+ PLUGIN_UUID = 96bcf744-4f72-4866-bf1d-8634fd9c65e5
+ 
+ PLUGIN			= $(PLUGIN_UUID).plugin
+@@ -6,17 +14,17 @@ PLUGIN_OBJ		= $(patsubst %.c, %.o, $(PLUGIN_SRS))
+ PLUGIN_INCLUDES_DIR	= $(CURDIR) $(TEEC_EXPORT)/include
+ 
+ PLUGIN_INCLUDES		= $(addprefix -I, $(PLUGIN_INCLUDES_DIR))
+-PLUGIN_CCFLAGS		= -Wall -fPIC
+-PLUGIN_LDFLAGS		= -shared
++PLUGIN_CCFLAGS		= $(CFLAGS) -Wall -fPIC
++PLUGIN_LDFLAGS		= $(LDFLAGS) -shared
+ 
+ .PHONY: all
+ all: $(PLUGIN)
+ 
+ $(PLUGIN): $(PLUGIN_OBJ)
+-	$(CROSS_COMPILE)gcc $(PLUGIN_LDFLAGS) $(PLUGIN_OBJ) -o $@
++	$(CC) $(PLUGIN_LDFLAGS) $(PLUGIN_OBJ) -o $@
+ 
+ %.o: %.c
+-	$(CROSS_COMPILE)gcc $(PLUGIN_CCFLAGS) $(PLUGIN_INCLUDES) -c $*.c -o $*.o
++	$(CC) $(PLUGIN_CCFLAGS) $(PLUGIN_INCLUDES) -c $*.c -o $*.o
+ 
+ .PHONY: clean
+ clean:
+-- 
+2.25.1
+
diff --git a/meta-arm/recipes-security/optee/optee-examples/0002-Makefile-Enable-plugins-installation-in-rootfs.patch b/meta-arm/recipes-security/optee/optee-examples/0002-Makefile-Enable-plugins-installation-in-rootfs.patch
new file mode 100644
index 0000000..80e6b5f
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-examples/0002-Makefile-Enable-plugins-installation-in-rootfs.patch
@@ -0,0 +1,37 @@
+From f4e5e74548d92258855434b550c58fe44993c148 Mon Sep 17 00:00:00 2001
+From: Sumit Garg <sumit.garg@linaro.org>
+Date: Tue, 20 Jul 2021 14:20:10 +0530
+Subject: [PATCH] Makefile: Enable plugins installation in rootfs
+
+Upstream-Status: Submitted [https://github.com/linaro-swg/optee_examples/pull/87]
+
+Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
+
+---
+ Makefile | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/Makefile b/Makefile
+index a275842..9359d95 100644
+--- a/Makefile
++++ b/Makefile
+@@ -25,14 +25,19 @@ prepare-for-rootfs: examples
+ 	@mkdir -p $(OUTPUT_DIR)
+ 	@mkdir -p $(OUTPUT_DIR)/ta
+ 	@mkdir -p $(OUTPUT_DIR)/ca
++	@mkdir -p $(OUTPUT_DIR)/plugins
+ 	@for example in $(EXAMPLE_LIST); do \
+ 		if [ -e $$example/host/optee_example_$$example ]; then \
+ 			cp -p $$example/host/optee_example_$$example $(OUTPUT_DIR)/ca/; \
+ 		fi; \
+ 		cp -pr $$example/ta/*.ta $(OUTPUT_DIR)/ta/; \
++		if [ $$example = plugins ]; then \
++			cp -p plugins/syslog/*.plugin $(OUTPUT_DIR)/plugins/; \
++		fi; \
+ 	done
+ 
+ prepare-for-rootfs-clean:
+ 	@rm -rf $(OUTPUT_DIR)/ta
+ 	@rm -rf $(OUTPUT_DIR)/ca
++	@rm -rf $(OUTPUT_DIR)/plugins
+ 	@rmdir --ignore-fail-on-non-empty $(OUTPUT_DIR) || test ! -e $(OUTPUT_DIR)
diff --git a/meta-arm/recipes-security/optee/optee-examples_3.11.0.bb b/meta-arm/recipes-security/optee/optee-examples_3.11.0.bb
deleted file mode 100644
index 72473ed..0000000
--- a/meta-arm/recipes-security/optee/optee-examples_3.11.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require optee-examples.inc
-
-SRCREV = "9a7dc598591990349d88b4dba3a37aadd6851295"
-
diff --git a/meta-arm/recipes-security/optee/optee-examples_3.14.0.bb b/meta-arm/recipes-security/optee/optee-examples_3.14.0.bb
new file mode 100644
index 0000000..f2b5f7d
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-examples_3.14.0.bb
@@ -0,0 +1,4 @@
+require optee-examples.inc
+
+SRCREV = "e9c870525af8f7e7fccf575a0ca5394ce55adcec"
+
diff --git a/meta-arm/recipes-security/optee/optee-os/0001-libutils-provide-empty-__getauxval-implementation.patch b/meta-arm/recipes-security/optee/optee-os/0001-libutils-provide-empty-__getauxval-implementation.patch
deleted file mode 100644
index 0120f5c..0000000
--- a/meta-arm/recipes-security/optee/optee-os/0001-libutils-provide-empty-__getauxval-implementation.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 36e784f621bf5d5be9183beba35f39426277c110 Mon Sep 17 00:00:00 2001
-From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
-Date: Tue, 13 Oct 2020 22:45:39 +0300
-Subject: [PATCH 1/3] libutils: provide empty __getauxval() implementation
-
-Never version of libgcc are built with LSE implementation in mind. To
-determine if LSE is available on platform it calls __getauxval(), so in
-some cases we can get undefined reference to __getauxval() error.
-
-Prominent case is libgcc_eh.a library, which is used by C++ TAs. Exception
-handler depends on atomic operations, so it tries to call
-init_have_lse_atomics() first. This function in turn calls __getauxval(),
-which causes linking error.
-
-In the future we can make __getauxval() to return actual platform
-capabilities.
-
-Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
-Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
-Reviewed-by: Jerome Forissier <jerome@forissier.org>
----
- lib/libutils/ext/arch/arm/auxval.c | 12 ++++++++++++
- lib/libutils/ext/arch/arm/sub.mk   |  1 +
- 2 files changed, 13 insertions(+)
- create mode 100644 lib/libutils/ext/arch/arm/auxval.c
-
-diff --git a/lib/libutils/ext/arch/arm/auxval.c b/lib/libutils/ext/arch/arm/auxval.c
-new file mode 100644
-index 00000000..98bca850
---- /dev/null
-+++ b/lib/libutils/ext/arch/arm/auxval.c
-@@ -0,0 +1,12 @@
-+// SPDX-License-Identifier: BSD-2-Clause
-+/*
-+ * Copyright (c) 2020, EPAM Systems
-+ */
-+
-+#include <compiler.h>
-+
-+unsigned long int __getauxval (unsigned long int type);
-+unsigned long int __getauxval (unsigned long int type __unused)
-+{
-+	return 0;
-+}
-diff --git a/lib/libutils/ext/arch/arm/sub.mk b/lib/libutils/ext/arch/arm/sub.mk
-index dc5eed67..2e779066 100644
---- a/lib/libutils/ext/arch/arm/sub.mk
-+++ b/lib/libutils/ext/arch/arm/sub.mk
-@@ -3,6 +3,7 @@ srcs-$(CFG_ARM32_$(sm)) += aeabi_unwind.c
- endif
- srcs-$(CFG_ARM32_$(sm)) += atomic_a32.S
- srcs-$(CFG_ARM64_$(sm)) += atomic_a64.S
-+srcs-y += auxval.c
- ifneq ($(sm),ldelf) # TA, core
- srcs-$(CFG_ARM32_$(sm)) += mcount_a32.S
- srcs-$(CFG_ARM64_$(sm)) += mcount_a64.S
--- 
-2.25.1
-
diff --git a/meta-arm/recipes-security/optee/optee-os/0002-link.mk-implement-support-for-libnames-after-libgcc-.patch b/meta-arm/recipes-security/optee/optee-os/0002-link.mk-implement-support-for-libnames-after-libgcc-.patch
deleted file mode 100644
index 11296c8..0000000
--- a/meta-arm/recipes-security/optee/optee-os/0002-link.mk-implement-support-for-libnames-after-libgcc-.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 73196b58ea6978ffa5e581738030f51c5789ef73 Mon Sep 17 00:00:00 2001
-From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
-Date: Tue, 13 Oct 2020 22:54:13 +0300
-Subject: [PATCH 2/3] link.mk: implement support for libnames-after-libgcc
- variable
-
-Newer versions of libgcc depend on external __getauxval() symbol, which is
-now provided by libutils. But libgcc is linked after libutils, so linker
-can't resolve that symbol. We can't include libgcc into linking group with
-libtutils, because libgcc provides symbols that conflict with libutil's
-ones, like __aeabi_idiv with friends for instance.
-
-So, to resolve libgcc dependency on libutils we need to link with libutils
-second time. To make things more generic, we will introduce
-$(libnames-after-libgcc) variable for libraries that should be linked after
-libgcc.
-
-Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
-Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
-Reviewed-by: Jerome Forissier <jerome@forissier.org>
----
- ta/arch/arm/link.mk | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/ta/arch/arm/link.mk b/ta/arch/arm/link.mk
-index 445c285d..3025acb1 100644
---- a/ta/arch/arm/link.mk
-+++ b/ta/arch/arm/link.mk
-@@ -55,8 +55,11 @@ link-ldflags += --eh-frame-hdr
- link-ldadd += $(libstdc++$(sm)) $(libgcc_eh$(sm))
- endif
- link-ldadd += --end-group
--ldargs-$(user-ta-uuid).elf := $(link-ldflags) $(objs) $(link-ldadd) $(libgcc$(sm))
- 
-+link-ldadd-after-libgcc += $(addprefix -l,$(libnames-after-libgcc))
-+
-+ldargs-$(user-ta-uuid).elf := $(link-ldflags) $(objs) $(link-ldadd) \
-+				$(libgcc$(sm)) $(link-ldadd-after-libgcc)
- 
- link-script-cppflags-$(sm) := \
- 	$(filter-out $(CPPFLAGS_REMOVE) $(cppflags-remove), \
-@@ -76,6 +79,7 @@ $(link-script-pp$(sm)): $(link-script$(sm)) $(conf-file) $(link-script-pp-makefi
- 		$(link-script-cppflags-$(sm)) $$< -o $$@
- 
- $(link-out-dir$(sm))/$(user-ta-uuid).elf: $(objs) $(libdeps) \
-+					  $(libdeps-after-libgcc) \
- 					  $(link-script-pp$(sm)) \
- 					  $(dynlistdep) \
- 					  $(additional-link-deps)
--- 
-2.25.1
-
diff --git a/meta-arm/recipes-security/optee/optee-os/0003-ta_dev_kit.mk-make-sure-that-libutils-is-linked-seco.patch b/meta-arm/recipes-security/optee/optee-os/0003-ta_dev_kit.mk-make-sure-that-libutils-is-linked-seco.patch
deleted file mode 100644
index 88ba5f8..0000000
--- a/meta-arm/recipes-security/optee/optee-os/0003-ta_dev_kit.mk-make-sure-that-libutils-is-linked-seco.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From f50962e3f56f0932662b2ffa10afe53339a335dd Mon Sep 17 00:00:00 2001
-From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
-Date: Fri, 16 Oct 2020 16:36:08 +0300
-Subject: [PATCH 3/3] ta_dev_kit.mk: make sure that libutils is linked second
- time
-
-libgcc depends on __getauxval symbol from libuils. As, generally libutils
-is linked before libgcc, we will get "unresolved symbol" error. To resolve
-this dependency we need to link libutils second time - after libgcc.
-
-Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
-Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
-Reviewed-by: Jerome Forissier <jerome@forissier.org>
----
- ta/mk/ta_dev_kit.mk | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/ta/mk/ta_dev_kit.mk b/ta/mk/ta_dev_kit.mk
-index e28be677..d0e66317 100644
---- a/ta/mk/ta_dev_kit.mk
-+++ b/ta/mk/ta_dev_kit.mk
-@@ -78,6 +78,16 @@ endif
- libnames += dl
- libdeps += $(ta-dev-kit-dir$(sm))/lib/libdl.a
- 
-+# libutils provides __getauxval symbol which is needed by libgcc 10.x. We can't
-+# link libutils after libgcc, because libgcc will replace some symbols provided
-+# by libutils, which will cause further linking issues.
-+#
-+# But if we place libutils before libgcc, linker will not be able to resolve
-+# __getauxval. So we need to link with libutils twice: before and after libgcc.
-+# Hence it included both in $(libnames) and in $(libnames-after-libgcc)
-+libnames-after-libgcc += utils
-+libdeps-after-libgcc += $(ta-dev-kit-dir$(sm))/lib/libutils.a
-+
- # Pass config variable (CFG_) from conf.mk on the command line
- cppflags$(sm) += $(strip \
- 	$(foreach var, $(filter CFG_%,$(.VARIABLES)), \
--- 
-2.25.1
-
diff --git a/meta-arm/recipes-security/optee/optee-os_3.11.0.bb b/meta-arm/recipes-security/optee/optee-os_3.11.0.bb
deleted file mode 100644
index 13b3dc6..0000000
--- a/meta-arm/recipes-security/optee/optee-os_3.11.0.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require optee-os.inc
-
-SRCREV = "c4def2a8262a03244d9a88461699b9b8e43c6b55"
-
-SRC_URI_append = " \
-    file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
-    file://0007-allow-setting-sysroot-for-clang.patch \
-    file://0001-libutils-provide-empty-__getauxval-implementation.patch \
-    file://0002-link.mk-implement-support-for-libnames-after-libgcc-.patch \
-    file://0003-ta_dev_kit.mk-make-sure-that-libutils-is-linked-seco.patch \
-"
diff --git a/meta-arm/recipes-security/optee/optee-os_3.14.0.bb b/meta-arm/recipes-security/optee/optee-os_3.14.0.bb
new file mode 100644
index 0000000..3289e2c
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os_3.14.0.bb
@@ -0,0 +1,8 @@
+require optee-os.inc
+
+SRCREV = "d21befa5e53eae9db469eba1685f5aa5c6f92c2f"
+
+SRC_URI_append = " \
+    file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
+    file://0007-allow-setting-sysroot-for-clang.patch \
+"
diff --git a/meta-arm/recipes-security/optee/optee-test.inc b/meta-arm/recipes-security/optee/optee-test.inc
index f09b9d2..bcbcc06 100644
--- a/meta-arm/recipes-security/optee/optee-test.inc
+++ b/meta-arm/recipes-security/optee/optee-test.inc
@@ -8,17 +8,9 @@ LIC_FILES_CHKSUM = "file://${S}/LICENSE.md;md5=daa2bcccc666345ab8940aab1315a4fa"
 inherit python3native ptest
 require optee.inc
 
-# Linking fails on musl due to C++/threads
-# https://github.com/OP-TEE/optee_test/issues/458#issuecomment-720540834
-# When upgraded we should be able to remove this limitation
-COMPATIBLE_HOST_libc-musl = 'null'
-
 DEPENDS = "optee-client optee-os python3-pycryptodome-native"
 
 SRC_URI = "git://github.com/OP-TEE/optee_test.git \
-           file://0001-host-xtest-Adjust-order-of-including-compiler.h.patch \
-           file://0002-make-remove-Wno-unsafe-loop-for-clang.patch \ 
-           file://0003-make-remove-Wmissing-noreturn-for-clang.patch \
            file://run-ptest \
           "
 
@@ -36,6 +28,7 @@ do_compile() {
     # Top level makefile doesn't seem to handle parallel make gracefully
     oe_runmake xtest
     oe_runmake ta
+    oe_runmake test_plugin
 }
 do_compile[cleandirs] = "${B}"
 
@@ -46,9 +39,13 @@ do_install () {
     # default TEEC_LOAD_PATH is /lib
     mkdir -p ${D}${nonarch_base_libdir}/optee_armtz/
     install -D -p -m0444 ${B}/ta/*/*.ta ${D}${nonarch_base_libdir}/optee_armtz/
+    mkdir -p ${D}${libdir}/tee-supplicant/plugins
+    install -D -p -m0444 ${B}/supp_plugin/*.plugin ${D}${libdir}/tee-supplicant/plugins/
 }
 
-FILES_${PN} += "${nonarch_base_libdir}/optee_armtz/"
+FILES_${PN} += "${nonarch_base_libdir}/optee_armtz/ \
+                ${libdir}/tee-supplicant/plugins/ \
+               "
 
 # Imports machine specific configs from staging to build
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta-arm/recipes-security/optee/optee-test/0001-host-xtest-Adjust-order-of-including-compiler.h.patch b/meta-arm/recipes-security/optee/optee-test/0001-host-xtest-Adjust-order-of-including-compiler.h.patch
deleted file mode 100644
index 3c500d7..0000000
--- a/meta-arm/recipes-security/optee/optee-test/0001-host-xtest-Adjust-order-of-including-compiler.h.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From fc95b3ccbbfd336797ae2cfd6dd4dc58644e146f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 30 May 2020 17:52:18 -0700
-Subject: [PATCH] host/xtest: Adjust order of including compiler.h
-
-compiler.h defines some defines which violate libc namespace e.g.
-__unused, this works ok with glibc but fails in awkward ways with musl
-the reason is musl uses __unused in its internal structures and this
-define in compiler.h conflicts with system headers causing errors like
-
-recipe-sysroot/usr/include/bits/stat.h:17:19: error: expected identifier or '(' before '[' token unsigned __unused[2];
-                   ^
-including compiler.h afer sys/stat.h fixes the problem.
-
-Upstream-Status: Pending [https://github.com/OP-TEE/optee_test/issues/453]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- host/xtest/install_ta.c | 2 +-
- host/xtest/stats.c      | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/host/xtest/install_ta.c b/host/xtest/install_ta.c
-index 09a4c6d..6f7bb5c 100644
---- a/host/xtest/install_ta.c
-+++ b/host/xtest/install_ta.c
-@@ -4,7 +4,6 @@
-  * SPDX-License-Identifier: BSD-2-Clause
-  */
- 
--#include <compiler.h>
- #include <dirent.h>
- #include <err.h>
- #include <errno.h>
-@@ -20,6 +19,7 @@
- #include <sys/types.h>
- #include <tee_client_api.h>
- #include <unistd.h>
-+#include <compiler.h>
- 
- #include "install_ta.h"
- #include "xtest_helpers.h"
-diff --git a/host/xtest/stats.c b/host/xtest/stats.c
-index 96b0b5f..db9bf25 100644
---- a/host/xtest/stats.c
-+++ b/host/xtest/stats.c
-@@ -3,7 +3,6 @@
-  * Copyright (c) 2019, Linaro Limited
-  */
- 
--#include <compiler.h>
- #include <dirent.h>
- #include <err.h>
- #include <errno.h>
-@@ -18,6 +17,7 @@
- #include <sys/types.h>
- #include <tee_client_api.h>
- #include <unistd.h>
-+#include <compiler.h>
- #include "xtest_test.h"
- #include "stats.h"
- 
--- 
-2.26.2
-
diff --git a/meta-arm/recipes-security/optee/optee-test/0002-make-remove-Wno-unsafe-loop-for-clang.patch b/meta-arm/recipes-security/optee/optee-test/0002-make-remove-Wno-unsafe-loop-for-clang.patch
deleted file mode 100644
index 17dd7d8..0000000
--- a/meta-arm/recipes-security/optee/optee-test/0002-make-remove-Wno-unsafe-loop-for-clang.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 438533ce9da1df0b7c7914e64b39ffdc1da1ab79 Mon Sep 17 00:00:00 2001
-From: Brett Warren <brett.warran@arm.com>
-Date: Thu, 8 Oct 2020 10:03:25 +0100
-Subject: [PATCH] make: remove -Wmissing-noreturn for clang
-
-When compiling when clang, -Wmissing-noreturn causes an error because
-of non-compliant code. This option is removed to workaround this.
-
-Upstream-Status: Pending [https://github.com/OP-TEE/optee_test/issues/452]
-Changed-Id: 71cb511904547d790d1ea98f93bf8e5a6afcb36d
-Signed-off-by: Brett Warren <brett.warren@arm.com>
----
- host/xtest/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/host/xtest/Makefile b/host/xtest/Makefile
-index 3c206b0..96746de 100644
---- a/host/xtest/Makefile
-+++ b/host/xtest/Makefile
-@@ -169,7 +169,7 @@ CFLAGS += -Wall -Wcast-align -Werror \
- 	  -Werror-implicit-function-declaration -Wextra -Wfloat-equal \
- 	  -Wformat-nonliteral -Wformat-security -Wformat=2 -Winit-self \
- 	  -Wmissing-declarations -Wmissing-format-attribute \
--	  -Wmissing-include-dirs -Wmissing-noreturn \
-+	  -Wmissing-include-dirs \
- 	  -Wmissing-prototypes -Wnested-externs -Wpointer-arith \
- 	  -Wshadow -Wstrict-prototypes -Wswitch-default \
- 	  -Wwrite-strings \
--- 
-2.17.1
-
diff --git a/meta-arm/recipes-security/optee/optee-test/0003-make-remove-Wmissing-noreturn-for-clang.patch b/meta-arm/recipes-security/optee/optee-test/0003-make-remove-Wmissing-noreturn-for-clang.patch
deleted file mode 100644
index bbc303f..0000000
--- a/meta-arm/recipes-security/optee/optee-test/0003-make-remove-Wmissing-noreturn-for-clang.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From ed5a9d9f7a3e9e14ca0e8aea59008124ee0e5f96 Mon Sep 17 00:00:00 2001
-From: Brett Warren <brett.warren@arm.com>
-Date: Thu, 8 Oct 2020 10:20:52 +0100
-Subject: [PATCH] make: remove -Wno-unsafe-loop for clang
-
-When compiling with clang, the -Wno-unsafe-loop-optimizations option
-throws an error because clang doesn't recognise it. This option is
-removed to workaround this.
-
-Upstream-Status: Pending [https://github.com/OP-TEE/optee_test/issues/452]
-Change-Id: 5fe0892c73208aaffac8c9995cb3275936fb1ba6
-Signed-off-by: Brett Warren <brett.warren@arm.com>
----
- host/xtest/Makefile | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/host/xtest/Makefile b/host/xtest/Makefile
-index 96746de..73731d0 100644
---- a/host/xtest/Makefile
-+++ b/host/xtest/Makefile
-@@ -174,7 +174,6 @@ CFLAGS += -Wall -Wcast-align -Werror \
- 	  -Wshadow -Wstrict-prototypes -Wswitch-default \
- 	  -Wwrite-strings \
- 	  -Wno-declaration-after-statement \
--	  -Wno-unsafe-loop-optimizations \
- 	  -Wno-missing-field-initializers -Wno-format-zero-length
- endif
- 
--- 
-2.17.1
-
diff --git a/meta-arm/recipes-security/optee/optee-test_3.11.0.bb b/meta-arm/recipes-security/optee/optee-test_3.11.0.bb
deleted file mode 100644
index 0f8b5b0..0000000
--- a/meta-arm/recipes-security/optee/optee-test_3.11.0.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require optee-test.inc
-
-SRCREV = "159e295d5cc3ad2275ab15fe544620f6604d4ba4"
diff --git a/meta-arm/recipes-security/optee/optee-test_3.14.0.bb b/meta-arm/recipes-security/optee/optee-test_3.14.0.bb
new file mode 100644
index 0000000..6367c27
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-test_3.14.0.bb
@@ -0,0 +1,3 @@
+require optee-test.inc
+
+SRCREV = "f2eb88affbb7f028561b4fd5cbd049d5d704f741"
-- 
2.25.1

