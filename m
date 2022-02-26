Return-Path: <alhe@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9487FC433EF
	for <webhook@archiver.kernel.org>; Sat, 26 Feb 2022 03:04:50 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.2793.1645844689194106705
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 25 Feb 2022 19:04:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com
 header.s=default header.b=F104q+AP;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: alhe@linux.microsoft.com)
Received: from alsamon-xub.lan (cpe-70-112-59-126.austin.res.rr.com
 [70.112.59.126])
	by linux.microsoft.com (Postfix) with ESMTPSA id F353120B7178;
	Fri, 25 Feb 2022 19:04:47 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com F353120B7178
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1645844688;
	bh=lYakx7eqMqHg/Al6KEAoxxe3yKH9a4vc4b7GwDPAgY4=;
	h=From:To:Cc:Subject:Date:From;
	b=F104q+APExRCqXDK5CbhkApgNGdviYUbgZy1YgCW3dpRVywlBHb54N6InVtNgamCf
	 8B8bOBiv0nT2SOYYL80Ceupw1Mxj1kPYPwCsSyIGBE0qDVNJUZAPojcH67Gdo1XYUe
	 QbGJ585BfCPyz4N+YbCqfdRCDAJKHDGRf8HTi7iw=
From: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
To: meta-arm@lists.yoctoproject.org
Cc: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
Subject: [PATCH] arm/optee: Upgrade from 3.14 to 3.16
Date: Fri, 25 Feb 2022 20:04:41 -0700
Message-Id: <20220226030441.2301940-1-alhe@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 26 Feb 2022 03:04:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3072

- Removes upstreamed patches for optee-examples
- Fixes optee-examples installation
- Includes new python3-cryptography dependency
- Fixes python3-cryptography to work with openssl

Tested on qemuarm64-secureboot via optee-examples xtest -l 15

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsof=
t.com>
---
 ....bbappend =3D> optee-client_3.16.0.bbappend} |  0
 ...pend =3D> optee-os-tadevkit_3.16.0.bbappend} |  0
 ...14.0.bbappend =3D> optee-os_3.16.0.bbappend} |  0
 ....0.bbappend =3D> optee-test_3.16.0.bbappend} |  0
 .../optee-ftpm/optee-ftpm_git.bb              |  8 +-
 .../optee/optee-client_3.14.0.bb              |  3 -
 .../optee/optee-client_3.16.0.bb              |  3 +
 .../recipes-security/optee/optee-examples.inc |  7 +-
 ...ix-non-portable-sh-check-for-plugins.patch | 46 ++++++++++
 ...efault-cross-compiler-environment-se.patch | 84 -------------------
 ...nable-plugins-installation-in-rootfs.patch | 37 --------
 .../optee/optee-examples_3.14.0.bb            |  4 -
 .../optee/optee-examples_3.16.0.bb            |  3 +
 ..._3.14.0.bb =3D> optee-os-tadevkit_3.16.0.bb} |  3 +-
 meta-arm/recipes-security/optee/optee-os.inc  |  2 +-
 ...{optee-os_3.14.0.bb =3D> optee-os_3.16.0.bb} |  2 +-
 .../recipes-security/optee/optee-test.inc     |  2 +-
 .../optee/optee-test_3.14.0.bb                |  3 -
 .../optee/optee-test_3.16.0.bb                |  3 +
 meta-arm/recipes-security/optee/optee.inc     |  3 +
 20 files changed, 73 insertions(+), 140 deletions(-)
 rename meta-arm-bsp/recipes-security/optee/{optee-client_3.14.0.bbappend=
 =3D> optee-client_3.16.0.bbappend} (100%)
 rename meta-arm-bsp/recipes-security/optee/{optee-os-tadevkit_3.14.0.bba=
ppend =3D> optee-os-tadevkit_3.16.0.bbappend} (100%)
 rename meta-arm-bsp/recipes-security/optee/{optee-os_3.14.0.bbappend =3D=
> optee-os_3.16.0.bbappend} (100%)
 rename meta-arm-bsp/recipes-security/optee/{optee-test_3.14.0.bbappend =3D=
> optee-test_3.16.0.bbappend} (100%)
 delete mode 100644 meta-arm/recipes-security/optee/optee-client_3.14.0.b=
b
 create mode 100644 meta-arm/recipes-security/optee/optee-client_3.16.0.b=
b
 create mode 100644 meta-arm/recipes-security/optee/optee-examples/0001-M=
akefile-Fix-non-portable-sh-check-for-plugins.patch
 delete mode 100644 meta-arm/recipes-security/optee/optee-examples/0001-p=
lugins-Honour-default-cross-compiler-environment-se.patch
 delete mode 100644 meta-arm/recipes-security/optee/optee-examples/0002-M=
akefile-Enable-plugins-installation-in-rootfs.patch
 delete mode 100644 meta-arm/recipes-security/optee/optee-examples_3.14.0=
.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-examples_3.16.0=
.bb
 rename meta-arm/recipes-security/optee/{optee-os-tadevkit_3.14.0.bb =3D>=
 optee-os-tadevkit_3.16.0.bb} (94%)
 rename meta-arm/recipes-security/optee/{optee-os_3.14.0.bb =3D> optee-os=
_3.16.0.bb} (76%)
 delete mode 100644 meta-arm/recipes-security/optee/optee-test_3.14.0.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-test_3.16.0.bb

diff --git a/meta-arm-bsp/recipes-security/optee/optee-client_3.14.0.bbap=
pend b/meta-arm-bsp/recipes-security/optee/optee-client_3.16.0.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-security/optee/optee-client_3.14.0.bbapp=
end
rename to meta-arm-bsp/recipes-security/optee/optee-client_3.16.0.bbappen=
d
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.14.0=
.bbappend b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.16.0.=
bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.14.0.=
bbappend
rename to meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.16.0.bb=
append
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_3.14.0.bbappend=
 b/meta-arm-bsp/recipes-security/optee/optee-os_3.16.0.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-security/optee/optee-os_3.14.0.bbappend
rename to meta-arm-bsp/recipes-security/optee/optee-os_3.16.0.bbappend
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test_3.14.0.bbappe=
nd b/meta-arm-bsp/recipes-security/optee/optee-test_3.16.0.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-security/optee/optee-test_3.14.0.bbappen=
d
rename to meta-arm-bsp/recipes-security/optee/optee-test_3.16.0.bbappend
diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb b/met=
a-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
index f2a74da..0eb64cd 100644
--- a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
+++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
@@ -15,7 +15,9 @@ inherit deploy python3native
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3D27e94c0280987ab296b0b8dd=
02ab9fe5"
=20
-DEPENDS =3D "python3-pycryptodome-native python3-pycryptodomex-native py=
thon3-pyelftools-native optee-os-tadevkit"
+DEPENDS =3D "python3-pycryptodome-native python3-pycryptodomex-native py=
thon3-pyelftools-native optee-os-tadevkit \
+    python3-cryptography-native \
+    "
=20
 FTPM_UUID=3D"bc50d971-d4c9-42c4-82cb-343fb7f37896"
=20
@@ -48,6 +50,10 @@ EXTRA_OEMAKE:append:aarch64:qemuall =3D "\
     CFG_ARM64_ta_arm64=3Dy \
 "
=20
+# python3-cryptography needs the legacy provider, so set OPENSSL_MODULES=
 to the
+# right path until this is relocated automatically.
+export OPENSSL_MODULES=3D"${STAGING_LIBDIR_NATIVE}/ossl-modules"
+
 PARALLEL_MAKE =3D ""
=20
 do_compile() {
diff --git a/meta-arm/recipes-security/optee/optee-client_3.14.0.bb b/met=
a-arm/recipes-security/optee/optee-client_3.14.0.bb
deleted file mode 100644
index be78b88..0000000
--- a/meta-arm/recipes-security/optee/optee-client_3.14.0.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require optee-client.inc
-
-SRCREV =3D "06e1b32f6a7028e039c625b07cfc25fda0c17d53"
diff --git a/meta-arm/recipes-security/optee/optee-client_3.16.0.bb b/met=
a-arm/recipes-security/optee/optee-client_3.16.0.bb
new file mode 100644
index 0000000..4a36cbc
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-client_3.16.0.bb
@@ -0,0 +1,3 @@
+require optee-client.inc
+
+SRCREV =3D "06db73b3f3fdb8d23eceaedbc46c49c0b45fd1e2"
diff --git a/meta-arm/recipes-security/optee/optee-examples.inc b/meta-ar=
m/recipes-security/optee/optee-examples.inc
index 656722e..097f892 100644
--- a/meta-arm/recipes-security/optee/optee-examples.inc
+++ b/meta-arm/recipes-security/optee/optee-examples.inc
@@ -5,16 +5,14 @@ HOMEPAGE =3D "https://github.com/linaro-swg/optee_examp=
les"
 LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dcd95ab417e23b94f381dafc453d70=
c30"
=20
-DEPENDS =3D "optee-client optee-os-tadevkit python3-pycryptodome-native"
+DEPENDS =3D "optee-client optee-os-tadevkit python3-pycryptodome-native =
python3-cryptography-native"
=20
 inherit python3native
=20
 require optee.inc
=20
 SRC_URI =3D "git://github.com/linaro-swg/optee_examples.git;branch=3Dmas=
ter;protocol=3Dhttps \
-           file://0001-plugins-Honour-default-cross-compiler-environment=
-se.patch \
-           file://0002-Makefile-Enable-plugins-installation-in-rootfs.pa=
tch \
-          "
+           file://0001-Makefile-Fix-non-portable-sh-check-for-plugins.pa=
tch"
=20
 EXTRA_OEMAKE +=3D "TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \
                  HOST_CROSS_COMPILE=3D${HOST_PREFIX} \
@@ -25,6 +23,7 @@ EXTRA_OEMAKE +=3D "TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \
 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build"
=20
+
 do_compile() {
     oe_runmake -C ${S}
 }
diff --git a/meta-arm/recipes-security/optee/optee-examples/0001-Makefile=
-Fix-non-portable-sh-check-for-plugins.patch b/meta-arm/recipes-security/=
optee/optee-examples/0001-Makefile-Fix-non-portable-sh-check-for-plugins.=
patch
new file mode 100644
index 0000000..70add62
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-examples/0001-Makefile-Fix-no=
n-portable-sh-check-for-plugins.patch
@@ -0,0 +1,46 @@
+From 11610debf750f15c7a104db7315dcd7d69e282a8 Mon Sep 17 00:00:00 2001
+From: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
+Date: Sat, 26 Feb 2022 01:52:26 +0000
+Subject: [PATCH] Makefile: Fix non-portable sh check for plugins
+
+Upstream-Status: Pending
+
+We previously held a patch that used "=3D" for comparison, but when
+that patch got upstreamed it was changed to "=3D=3D" which is non-portab=
le,
+resulting in an error:
+
+/bin/sh: 6: [: acipher: unexpected operator
+/bin/sh: 6: [: plugins: unexpected operator
+/bin/sh: 6: [: hello_world: unexpected operator
+/bin/sh: 6: [: hotp: unexpected operator
+/bin/sh: 6: [: aes: unexpected operator
+/bin/sh: 6: [: random: unexpected operator
+/bin/sh: 6: [: secure_storage: unexpected operator
+
+if /bin/sh doesnt point to bash.
+
+Which in turn causes our do_install task to fail since plugins arent
+where we expect them to be.
+
+
+Signed-off-by: Alejandro Enedino Hernandez Samaniego <alhe@linux.microso=
ft.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index b3f16aa..9359d95 100644
+--- a/Makefile
++++ b/Makefile
+@@ -31,7 +31,7 @@ prepare-for-rootfs: examples
+ 			cp -p $$example/host/optee_example_$$example $(OUTPUT_DIR)/ca/; \
+ 		fi; \
+ 		cp -pr $$example/ta/*.ta $(OUTPUT_DIR)/ta/; \
+-		if [ $$example =3D=3D plugins ]; then \
++		if [ $$example =3D plugins ]; then \
+ 			cp -p plugins/syslog/*.plugin $(OUTPUT_DIR)/plugins/; \
+ 		fi; \
+ 	done
+--=20
+2.25.1
+
diff --git a/meta-arm/recipes-security/optee/optee-examples/0001-plugins-=
Honour-default-cross-compiler-environment-se.patch b/meta-arm/recipes-sec=
urity/optee/optee-examples/0001-plugins-Honour-default-cross-compiler-env=
ironment-se.patch
deleted file mode 100644
index 033e48c..0000000
--- a/meta-arm/recipes-security/optee/optee-examples/0001-plugins-Honour-=
default-cross-compiler-environment-se.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From 79c826c249001700007a6dffe80c3d61ff4428ef Mon Sep 17 00:00:00 2001
-From: Sumit Garg <sumit.garg@linaro.org>
-Date: Tue, 20 Jul 2021 13:54:30 +0530
-Subject: [PATCH 1/2] plugins: Honour default cross compiler environment =
setup
-
-Honour default $(CC), $(CFLAGS) and $(LDFLAGS) variables. Without this
-plugins example fails to build for OE/Yocto.
-
-Upstream-Status: Submitted [https://github.com/linaro-swg/optee_examples=
/pull/87]
-
-Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
----
- plugins/Makefile        |  2 +-
- plugins/host/Makefile   |  2 +-
- plugins/syslog/Makefile | 16 ++++++++++++----
- 3 files changed, 14 insertions(+), 6 deletions(-)
-
-diff --git a/plugins/Makefile b/plugins/Makefile
-index 2372b38..ea472b4 100644
---- a/plugins/Makefile
-+++ b/plugins/Makefile
-@@ -8,7 +8,7 @@ TA_CROSS_COMPILE ?=3D $(CROSS_COMPILE)
- all:
- 	$(MAKE) -C host CROSS_COMPILE=3D"$(HOST_CROSS_COMPILE)" --no-builtin-v=
ariables
- 	$(MAKE) -C ta CROSS_COMPILE=3D"$(TA_CROSS_COMPILE)" LDFLAGS=3D""
--	$(MAKE) -C syslog CROSS_COMPILE=3D"$(HOST_CROSS_COMPILE)"
-+	$(MAKE) -C syslog CROSS_COMPILE=3D"$(HOST_CROSS_COMPILE)" --no-builtin=
-variables
-=20
- .PHONY: clean
- clean:
-diff --git a/plugins/host/Makefile b/plugins/host/Makefile
-index 7285104..76244c7 100644
---- a/plugins/host/Makefile
-+++ b/plugins/host/Makefile
-@@ -20,7 +20,7 @@ BINARY =3D optee_example_plugins
- all: $(BINARY)
-=20
- $(BINARY): $(OBJS)
--	$(CC) -o $@ $< $(LDADD)
-+	$(CC) $(LDFLAGS) -o $@ $< $(LDADD)
-=20
- .PHONY: clean
- clean:
-diff --git a/plugins/syslog/Makefile b/plugins/syslog/Makefile
-index 62d916a..71f5f92 100644
---- a/plugins/syslog/Makefile
-+++ b/plugins/syslog/Makefile
-@@ -1,3 +1,11 @@
-+CC      ?=3D $(CROSS_COMPILE)gcc
-+LD      ?=3D $(CROSS_COMPILE)ld
-+AR      ?=3D $(CROSS_COMPILE)ar
-+NM      ?=3D $(CROSS_COMPILE)nm
-+OBJCOPY ?=3D $(CROSS_COMPILE)objcopy
-+OBJDUMP ?=3D $(CROSS_COMPILE)objdump
-+READELF ?=3D $(CROSS_COMPILE)readelf
-+
- PLUGIN_UUID =3D 96bcf744-4f72-4866-bf1d-8634fd9c65e5
-=20
- PLUGIN			=3D $(PLUGIN_UUID).plugin
-@@ -6,17 +14,17 @@ PLUGIN_OBJ		=3D $(patsubst %.c, %.o, $(PLUGIN_SRS))
- PLUGIN_INCLUDES_DIR	=3D $(CURDIR) $(TEEC_EXPORT)/include
-=20
- PLUGIN_INCLUDES		=3D $(addprefix -I, $(PLUGIN_INCLUDES_DIR))
--PLUGIN_CCFLAGS		=3D -Wall -fPIC
--PLUGIN_LDFLAGS		=3D -shared
-+PLUGIN_CCFLAGS		=3D $(CFLAGS) -Wall -fPIC
-+PLUGIN_LDFLAGS		=3D $(LDFLAGS) -shared
-=20
- .PHONY: all
- all: $(PLUGIN)
-=20
- $(PLUGIN): $(PLUGIN_OBJ)
--	$(CROSS_COMPILE)gcc $(PLUGIN_LDFLAGS) $(PLUGIN_OBJ) -o $@
-+	$(CC) $(PLUGIN_LDFLAGS) $(PLUGIN_OBJ) -o $@
-=20
- %.o: %.c
--	$(CROSS_COMPILE)gcc $(PLUGIN_CCFLAGS) $(PLUGIN_INCLUDES) -c $*.c -o $*=
.o
-+	$(CC) $(PLUGIN_CCFLAGS) $(PLUGIN_INCLUDES) -c $*.c -o $*.o
-=20
- .PHONY: clean
- clean:
---=20
-2.25.1
-
diff --git a/meta-arm/recipes-security/optee/optee-examples/0002-Makefile=
-Enable-plugins-installation-in-rootfs.patch b/meta-arm/recipes-security/=
optee/optee-examples/0002-Makefile-Enable-plugins-installation-in-rootfs.=
patch
deleted file mode 100644
index 80e6b5f..0000000
--- a/meta-arm/recipes-security/optee/optee-examples/0002-Makefile-Enable=
-plugins-installation-in-rootfs.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From f4e5e74548d92258855434b550c58fe44993c148 Mon Sep 17 00:00:00 2001
-From: Sumit Garg <sumit.garg@linaro.org>
-Date: Tue, 20 Jul 2021 14:20:10 +0530
-Subject: [PATCH] Makefile: Enable plugins installation in rootfs
-
-Upstream-Status: Submitted [https://github.com/linaro-swg/optee_examples=
/pull/87]
-
-Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
-
----
- Makefile | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/Makefile b/Makefile
-index a275842..9359d95 100644
---- a/Makefile
-+++ b/Makefile
-@@ -25,14 +25,19 @@ prepare-for-rootfs: examples
- 	@mkdir -p $(OUTPUT_DIR)
- 	@mkdir -p $(OUTPUT_DIR)/ta
- 	@mkdir -p $(OUTPUT_DIR)/ca
-+	@mkdir -p $(OUTPUT_DIR)/plugins
- 	@for example in $(EXAMPLE_LIST); do \
- 		if [ -e $$example/host/optee_example_$$example ]; then \
- 			cp -p $$example/host/optee_example_$$example $(OUTPUT_DIR)/ca/; \
- 		fi; \
- 		cp -pr $$example/ta/*.ta $(OUTPUT_DIR)/ta/; \
-+		if [ $$example =3D plugins ]; then \
-+			cp -p plugins/syslog/*.plugin $(OUTPUT_DIR)/plugins/; \
-+		fi; \
- 	done
-=20
- prepare-for-rootfs-clean:
- 	@rm -rf $(OUTPUT_DIR)/ta
- 	@rm -rf $(OUTPUT_DIR)/ca
-+	@rm -rf $(OUTPUT_DIR)/plugins
- 	@rmdir --ignore-fail-on-non-empty $(OUTPUT_DIR) || test ! -e $(OUTPUT_=
DIR)
diff --git a/meta-arm/recipes-security/optee/optee-examples_3.14.0.bb b/m=
eta-arm/recipes-security/optee/optee-examples_3.14.0.bb
deleted file mode 100644
index f2b5f7d..0000000
--- a/meta-arm/recipes-security/optee/optee-examples_3.14.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require optee-examples.inc
-
-SRCREV =3D "e9c870525af8f7e7fccf575a0ca5394ce55adcec"
-
diff --git a/meta-arm/recipes-security/optee/optee-examples_3.16.0.bb b/m=
eta-arm/recipes-security/optee/optee-examples_3.16.0.bb
new file mode 100644
index 0000000..b5f6269
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-examples_3.16.0.bb
@@ -0,0 +1,3 @@
+require optee-examples.inc
+
+SRCREV =3D "65fc74309e12189ad5b6ce3ffec37c8011088a5a"
diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb =
b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.16.0.bb
similarity index 94%
rename from meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb
rename to meta-arm/recipes-security/optee/optee-os-tadevkit_3.16.0.bb
index 0d37a52..c710e27 100644
--- a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.16.0.bb
@@ -1,10 +1,11 @@
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/optee-os:"
-require optee-os_3.14.0.bb
+require optee-os_3.16.0.bb
=20
 SUMMARY =3D "OP-TEE Trusted OS TA devkit"
 DESCRIPTION =3D "OP-TEE TA devkit for build TAs"
 HOMEPAGE =3D "https://www.op-tee.org/"
=20
+
 do_install() {
     #install TA devkit
     install -d ${D}${includedir}/optee/export-user_ta/
diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/reci=
pes-security/optee/optee-os.inc
index 1506a58..57c64fd 100644
--- a/meta-arm/recipes-security/optee/optee-os.inc
+++ b/meta-arm/recipes-security/optee/optee-os.inc
@@ -10,7 +10,7 @@ require optee.inc
=20
 CVE_PRODUCT =3D "linaro:op-tee op-tee:op-tee_os"
=20
-DEPENDS =3D "python3-pycryptodome-native python3-pyelftools-native"
+DEPENDS =3D "python3-pycryptodome-native python3-pyelftools-native pytho=
n3-cryptography-native"
=20
 DEPENDS:append:toolchain-clang =3D " compiler-rt"
=20
diff --git a/meta-arm/recipes-security/optee/optee-os_3.14.0.bb b/meta-ar=
m/recipes-security/optee/optee-os_3.16.0.bb
similarity index 76%
rename from meta-arm/recipes-security/optee/optee-os_3.14.0.bb
rename to meta-arm/recipes-security/optee/optee-os_3.16.0.bb
index 95d82bb..873e964 100644
--- a/meta-arm/recipes-security/optee/optee-os_3.14.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os_3.16.0.bb
@@ -1,6 +1,6 @@
 require optee-os.inc
=20
-SRCREV =3D "d21befa5e53eae9db469eba1685f5aa5c6f92c2f"
+SRCREV =3D "d0b742d1564834dac903f906168d7357063d5459"
=20
 SRC_URI:append =3D " \
     file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
diff --git a/meta-arm/recipes-security/optee/optee-test.inc b/meta-arm/re=
cipes-security/optee/optee-test.inc
index aada243..33eda29 100644
--- a/meta-arm/recipes-security/optee/optee-test.inc
+++ b/meta-arm/recipes-security/optee/optee-test.inc
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://${S}/LICENSE.md;md5=3Ddaa2bc=
ccc666345ab8940aab1315a4fa"
 inherit python3native ptest
 require optee.inc
=20
-DEPENDS =3D "optee-client optee-os-tadevkit python3-pycryptodome-native"
+DEPENDS =3D "optee-client optee-os-tadevkit python3-pycryptodome-native =
python3-cryptography-native"
=20
 SRC_URI =3D "git://github.com/OP-TEE/optee_test.git;branch=3Dmaster;prot=
ocol=3Dhttps \
            file://run-ptest \
diff --git a/meta-arm/recipes-security/optee/optee-test_3.14.0.bb b/meta-=
arm/recipes-security/optee/optee-test_3.14.0.bb
deleted file mode 100644
index 6367c27..0000000
--- a/meta-arm/recipes-security/optee/optee-test_3.14.0.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require optee-test.inc
-
-SRCREV =3D "f2eb88affbb7f028561b4fd5cbd049d5d704f741"
diff --git a/meta-arm/recipes-security/optee/optee-test_3.16.0.bb b/meta-=
arm/recipes-security/optee/optee-test_3.16.0.bb
new file mode 100644
index 0000000..03f9c34
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-test_3.16.0.bb
@@ -0,0 +1,3 @@
+require optee-test.inc
+
+SRCREV =3D "1cf0e6d2bdd1145370033d4e182634458528579d"
diff --git a/meta-arm/recipes-security/optee/optee.inc b/meta-arm/recipes=
-security/optee/optee.inc
index f02a022..beae366 100644
--- a/meta-arm/recipes-security/optee/optee.inc
+++ b/meta-arm/recipes-security/optee/optee.inc
@@ -26,3 +26,6 @@ EXTRA_OEMAKE +=3D "V=3D1 \
                  OPTEE_CLIENT_EXPORT=3D${STAGING_DIR_HOST}${prefix} \
                  TEEC_EXPORT=3D${STAGING_DIR_HOST}${prefix} \
                 "
+# python3-cryptography needs the legacy provider, so set OPENSSL_MODULES=
 to the
+# right path until this is relocated automatically.
+export OPENSSL_MODULES=3D"${STAGING_LIBDIR_NATIVE}/ossl-modules"
--=20
2.25.1


