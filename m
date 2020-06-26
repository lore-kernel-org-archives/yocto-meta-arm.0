Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.8517.1593180499076836769
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 26 Jun 2020 07:08:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=fpYThQuZ;
 spf=pass (domain: burtonini.com, ip: 209.85.221.66, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f66.google.com with SMTP id s10so9610808wrw.12
        for <meta-arm@lists.yoctoproject.org>; Fri, 26 Jun 2020 07:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/u0qlAts03YoFcEygIB0p8fSXseVlUjBLYL0lA9X5+k=;
        b=fpYThQuZnkHWK4YcqejvOyKBqUFokdJ6w5X6w06BfeKLKwYFqoIkXdPFLQ/SRcS8vU
         QLwgN2kfi7fZEneNhYExJYgdxiNe1bAB0BplyLx67rX7RB/KruYFS9/6GIG7iDtlf7vh
         lrGgBjlG0rd3dkeKP2YfPUZJP7dX9Jm21N+0Lt5uV6YFm9azdFWWyY8fGgi3gaCZb57b
         9kRFy66ehJ1B2PXeZqFdy5DycUhBE5n8RdL5skKU8MAr2Hw8CPvQcKp6nltH13HVvAdv
         VFLstxsL8CBsTPdRbBYnoG5kgbEKLtmNCUDA8CJhYGFQKCXgMjyGLCpRiGV+W1Eb1SQ1
         8oSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/u0qlAts03YoFcEygIB0p8fSXseVlUjBLYL0lA9X5+k=;
        b=LvXfXzWFEXsZAKj6TzvpDlcQ17ZRG5oLRClfWv9p2EuZlw3hM1/Ns0a+VYvCqq7AMA
         nShv8gMGjN8DraHiOugUw4e9KqTMAoJePnh+SqlHjWbtPMcf6+6dKyyD6bGBzU6Sypy8
         IwXC7287Yp26L6/liOz7pDwpGLRrf4cePy7Ind24WD0NCXoiusleb4QUE0uGN3vMfhRd
         PPufQ1nsEQrg2SbgjiVmXkV2eGkUxRx4Tf7vkhmjRWQUH+5dUZa3X2Y+IsRYMSnXNJHK
         kdTt/3qIPTHrP7AGObUk4Yyw6BOV9OC380fY+RhGQnXu7m/wMItgOT9XGTiayt37GebK
         QInQ==
X-Gm-Message-State: AOAM530G7uqpNKa5AOB6l0KcKEC1GQfdBmU1F5GcS/jheWglN5MeJahb
	sgLZ+l1ygHGanbEs/+sFcwpwJCzF+S0=
X-Google-Smtp-Source: ABdhPJzVVL5sY+D27lGJdF3EEWdIXo+BxHOhqeTueqd+YD0q1ObG5Ny6SdEirAYeGpmRJ9sSfYnnYA==
X-Received: by 2002:adf:f745:: with SMTP id z5mr4244818wrp.128.1593180496851;
        Fri, 26 Jun 2020 07:08:16 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id v20sm16573802wmh.26.2020.06.26.07.08.16
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 07:08:16 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] meta-gem5: extract the gem5 recipe and machine into a dedicate meta-gem5 layer
Date: Fri, 26 Jun 2020 15:07:25 +0100
Message-Id: <20200626140725.1541598-1-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

meta-arm-bsp no longer has to depend on meta-oe, and in the future
meta-gem5 could be moved out of meta-arm.

Change-Id: I49fa8f793b60af8c0cdb7e04b27fb53fc094cdad
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/layer.conf                    |  2 +-
 .../linux/linux-yocto-arm-platforms.inc         | 12 ------------
 meta-gem5/COPYING.MIT                           | 17 +++++++++++++++++
 meta-gem5/conf/layer.conf                       | 13 +++++++++++++
 .../conf/machine/gem5-arm64.conf                |  0
 .../documentation/gem5-arm64.md                 |  0
 .../boot-wrapper-aarch64.inc                    |  0
 .../boot-wrapper-aarch64_git.bb                 |  0
 .../recipes-devtools/gem5/files/start-gem5.sh   |  0
 .../gem5/gem5-aarch64-bootloader.inc            |  0
 .../gem5/gem5-aarch64-bootloader_20.bb          |  0
 .../recipes-devtools/gem5/gem5-aarch64-dtb.bb   |  0
 .../gem5/gem5-aarch64-native.inc                |  0
 ...L_XXFLAGS_EXTRA-for-the-marshal-object.patch |  0
 .../gem5/gem5-aarch64-native_20.bb              |  0
 .../recipes-devtools/gem5/gem5-native.inc       |  0
 .../files/dts/gem5-arm64/armv8_gem5_v2_1cpu.dts |  0
 .../files/dts/gem5-arm64/armv8_gem5_v2_2cpu.dts |  0
 .../files/dts/gem5-arm64/armv8_gem5_v2_4cpu.dts |  0
 .../files/dts/gem5-arm64/armv8_gem5_v2_8cpu.dts |  0
 .../files/dts/gem5-arm64/vexpress_gem5_v2.dtsi  |  0
 .../dts/gem5-arm64/vexpress_gem5_v2_base.dtsi   |  0
 .../bsp/gem5-platforms}/gem5-arm64-standard.scc |  0
 .../bsp/gem5-platforms}/gem5-arm64.scc          |  0
 .../gem5-arm64/gem5-arm64-board.cfg             |  0
 .../gem5-arm64/gem5-arm64-cfi.cfg               |  0
 .../gem5-arm64/gem5-arm64-drm.cfg               |  0
 .../gem5-arm64/gem5-arm64-net.cfg               |  0
 .../gem5-arm64/gem5-arm64-pata.cfg              |  0
 .../gem5-arm64/gem5-arm64-pci.cfg               |  0
 .../gem5-arm64/gem5-arm64-rtc.cfg               |  0
 .../gem5-arm64/gem5-arm64-serial.cfg            |  0
 .../gem5-arm64/gem5-arm64-virtio.cfg            |  0
 .../linux/linux-yocto_5.4.bbappend              | 11 +++++++++++
 34 files changed, 42 insertions(+), 13 deletions(-)
 create mode 100644 meta-gem5/COPYING.MIT
 create mode 100644 meta-gem5/conf/layer.conf
 rename {meta-arm-bsp => meta-gem5}/conf/machine/gem5-arm64.conf (100%)
 rename {meta-arm-bsp => meta-gem5}/documentation/gem5-arm64.md (100%)
 rename {meta-arm-bsp => meta-gem5}/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64.inc (100%)
 rename {meta-arm-bsp => meta-gem5}/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_git.bb (100%)
 rename {meta-arm-bsp => meta-gem5}/recipes-devtools/gem5/files/start-gem5.sh (100%)
 rename {meta-arm-bsp => meta-gem5}/recipes-devtools/gem5/gem5-aarch64-bootloader.inc (100%)
 rename {meta-arm-bsp => meta-gem5}/recipes-devtools/gem5/gem5-aarch64-bootloader_20.bb (100%)
 rename {meta-arm-bsp => meta-gem5}/recipes-devtools/gem5/gem5-aarch64-dtb.bb (100%)
 rename {meta-arm-bsp => meta-gem5}/recipes-devtools/gem5/gem5-aarch64-native.inc (100%)
 rename {meta-arm-bsp => meta-gem5}/recipes-devtools/gem5/gem5-aarch64-native/0001-scons-Add-MARSHAL_XXFLAGS_EXTRA-for-the-marshal-object.patch (100%)
 rename {meta-arm-bsp => meta-gem5}/recipes-devtools/gem5/gem5-aarch64-native_20.bb (100%)
 rename {meta-arm-bsp => meta-gem5}/recipes-devtools/gem5/gem5-native.inc (100%)
 rename {meta-arm-bsp => meta-gem5}/recipes-kernel/linux/files/dts/gem5-arm64/armv8_gem5_v2_1cpu.dts (100%)
 rename {meta-arm-bsp => meta-gem5}/recipes-kernel/linux/files/dts/gem5-arm64/armv8_gem5_v2_2cpu.dts (100%)
 rename {meta-arm-bsp => meta-gem5}/recipes-kernel/linux/files/dts/gem5-arm64/armv8_gem5_v2_4cpu.dts (100%)
 rename {meta-arm-bsp => meta-gem5}/recipes-kernel/linux/files/dts/gem5-arm64/armv8_gem5_v2_8cpu.dts (100%)
 rename {meta-arm-bsp => meta-gem5}/recipes-kernel/linux/files/dts/gem5-arm64/vexpress_gem5_v2.dtsi (100%)
 rename {meta-arm-bsp => meta-gem5}/recipes-kernel/linux/files/dts/gem5-arm64/vexpress_gem5_v2_base.dtsi (100%)
 rename {meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms => meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms}/gem5-arm64-standard.scc (100%)
 rename {meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms => meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms}/gem5-arm64.scc (100%)
 rename {meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms => meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms}/gem5-arm64/gem5-arm64-board.cfg (100%)
 rename {meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms => meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms}/gem5-arm64/gem5-arm64-cfi.cfg (100%)
 rename {meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms => meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms}/gem5-arm64/gem5-arm64-drm.cfg (100%)
 rename {meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms => meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms}/gem5-arm64/gem5-arm64-net.cfg (100%)
 rename {meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms => meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms}/gem5-arm64/gem5-arm64-pata.cfg (100%)
 rename {meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms => meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms}/gem5-arm64/gem5-arm64-pci.cfg (100%)
 rename {meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms => meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms}/gem5-arm64/gem5-arm64-rtc.cfg (100%)
 rename {meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms => meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms}/gem5-arm64/gem5-arm64-serial.cfg (100%)
 rename {meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms => meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms}/gem5-arm64/gem5-arm64-virtio.cfg (100%)
 create mode 100644 meta-gem5/recipes-kernel/linux/linux-yocto_5.4.bbappend

diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index 1a54ddc..7fe0e63 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -9,5 +9,5 @@ BBFILE_COLLECTIONS += "meta-arm-bsp"
 BBFILE_PATTERN_meta-arm-bsp = "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arm-bsp = "6"
 
-LAYERDEPENDS_meta-arm-bsp = "core openembedded-layer meta-arm"
+LAYERDEPENDS_meta-arm-bsp = "core meta-arm"
 LAYERSERIES_COMPAT_meta-arm-bsp = "warrior zeus dunfell"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-arm-platforms.inc
index 5622ae7..4d20a91 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-arm-platforms.inc
@@ -27,15 +27,3 @@ KMACHINE_fvp-base = "fvp"
 #
 COMPATIBLE_MACHINE_juno = "juno"
 KMACHINE_juno = "juno"
-
-#
-# Gem5 arm64 KMACHINE
-#
-COMPATIBLE_MACHINE_gem5-arm64 = "gem5-arm64"
-KMACHINE_gem5-arm64 = "gem5-arm64"
-SRC_URI_append_gem5-arm64 = " file://dts/gem5-arm64;subdir=add-files"
-
-do_patch_append_gem5-arm64() {
-    tar -C ${WORKDIR}/add-files/dts -cf - gem5-arm64 | \
-        tar -C arch/arm64/boot/dts -xf -
-}
diff --git a/meta-gem5/COPYING.MIT b/meta-gem5/COPYING.MIT
new file mode 100644
index 0000000..fb950dc
--- /dev/null
+++ b/meta-gem5/COPYING.MIT
@@ -0,0 +1,17 @@
+Permission is hereby granted, free of charge, to any person obtaining a copy 
+of this software and associated documentation files (the "Software"), to deal 
+in the Software without restriction, including without limitation the rights 
+to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
+copies of the Software, and to permit persons to whom the Software is 
+furnished to do so, subject to the following conditions:
+
+The above copyright notice and this permission notice shall be included in 
+all copies or substantial portions of the Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
+IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
+FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
+AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
+LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
+OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN 
+THE SOFTWARE.
diff --git a/meta-gem5/conf/layer.conf b/meta-gem5/conf/layer.conf
new file mode 100644
index 0000000..58242c3
--- /dev/null
+++ b/meta-gem5/conf/layer.conf
@@ -0,0 +1,13 @@
+# We have a conf and classes directory, add to BBPATH
+BBPATH .= ":${LAYERDIR}"
+
+# We have recipes-* directories, add to BBFILES
+BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
+            ${LAYERDIR}/recipes-*/*/*.bbappend"
+
+BBFILE_COLLECTIONS += "meta-gem5"
+BBFILE_PATTERN_meta-gem5 = "^${LAYERDIR}/"
+BBFILE_PRIORITY_meta-gem5 = "6"
+
+LAYERDEPENDS_meta-gem5 = "core openembedded-layer"
+LAYERSERIES_COMPAT_meta-gem5 = "gatesgarth"
diff --git a/meta-arm-bsp/conf/machine/gem5-arm64.conf b/meta-gem5/conf/machine/gem5-arm64.conf
similarity index 100%
rename from meta-arm-bsp/conf/machine/gem5-arm64.conf
rename to meta-gem5/conf/machine/gem5-arm64.conf
diff --git a/meta-arm-bsp/documentation/gem5-arm64.md b/meta-gem5/documentation/gem5-arm64.md
similarity index 100%
rename from meta-arm-bsp/documentation/gem5-arm64.md
rename to meta-gem5/documentation/gem5-arm64.md
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64.inc b/meta-gem5/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64.inc
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64.inc
rename to meta-gem5/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64.inc
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_git.bb b/meta-gem5/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_git.bb
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_git.bb
rename to meta-gem5/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_git.bb
diff --git a/meta-arm-bsp/recipes-devtools/gem5/files/start-gem5.sh b/meta-gem5/recipes-devtools/gem5/files/start-gem5.sh
similarity index 100%
rename from meta-arm-bsp/recipes-devtools/gem5/files/start-gem5.sh
rename to meta-gem5/recipes-devtools/gem5/files/start-gem5.sh
diff --git a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader.inc b/meta-gem5/recipes-devtools/gem5/gem5-aarch64-bootloader.inc
similarity index 100%
rename from meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader.inc
rename to meta-gem5/recipes-devtools/gem5/gem5-aarch64-bootloader.inc
diff --git a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader_20.bb b/meta-gem5/recipes-devtools/gem5/gem5-aarch64-bootloader_20.bb
similarity index 100%
rename from meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader_20.bb
rename to meta-gem5/recipes-devtools/gem5/gem5-aarch64-bootloader_20.bb
diff --git a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-dtb.bb b/meta-gem5/recipes-devtools/gem5/gem5-aarch64-dtb.bb
similarity index 100%
rename from meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-dtb.bb
rename to meta-gem5/recipes-devtools/gem5/gem5-aarch64-dtb.bb
diff --git a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native.inc b/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native.inc
similarity index 100%
rename from meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native.inc
rename to meta-gem5/recipes-devtools/gem5/gem5-aarch64-native.inc
diff --git a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native/0001-scons-Add-MARSHAL_XXFLAGS_EXTRA-for-the-marshal-object.patch b/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native/0001-scons-Add-MARSHAL_XXFLAGS_EXTRA-for-the-marshal-object.patch
similarity index 100%
rename from meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native/0001-scons-Add-MARSHAL_XXFLAGS_EXTRA-for-the-marshal-object.patch
rename to meta-gem5/recipes-devtools/gem5/gem5-aarch64-native/0001-scons-Add-MARSHAL_XXFLAGS_EXTRA-for-the-marshal-object.patch
diff --git a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_20.bb b/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bb
similarity index 100%
rename from meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_20.bb
rename to meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bb
diff --git a/meta-arm-bsp/recipes-devtools/gem5/gem5-native.inc b/meta-gem5/recipes-devtools/gem5/gem5-native.inc
similarity index 100%
rename from meta-arm-bsp/recipes-devtools/gem5/gem5-native.inc
rename to meta-gem5/recipes-devtools/gem5/gem5-native.inc
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-arm64/armv8_gem5_v2_1cpu.dts b/meta-gem5/recipes-kernel/linux/files/dts/gem5-arm64/armv8_gem5_v2_1cpu.dts
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-arm64/armv8_gem5_v2_1cpu.dts
rename to meta-gem5/recipes-kernel/linux/files/dts/gem5-arm64/armv8_gem5_v2_1cpu.dts
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-arm64/armv8_gem5_v2_2cpu.dts b/meta-gem5/recipes-kernel/linux/files/dts/gem5-arm64/armv8_gem5_v2_2cpu.dts
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-arm64/armv8_gem5_v2_2cpu.dts
rename to meta-gem5/recipes-kernel/linux/files/dts/gem5-arm64/armv8_gem5_v2_2cpu.dts
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-arm64/armv8_gem5_v2_4cpu.dts b/meta-gem5/recipes-kernel/linux/files/dts/gem5-arm64/armv8_gem5_v2_4cpu.dts
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-arm64/armv8_gem5_v2_4cpu.dts
rename to meta-gem5/recipes-kernel/linux/files/dts/gem5-arm64/armv8_gem5_v2_4cpu.dts
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-arm64/armv8_gem5_v2_8cpu.dts b/meta-gem5/recipes-kernel/linux/files/dts/gem5-arm64/armv8_gem5_v2_8cpu.dts
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-arm64/armv8_gem5_v2_8cpu.dts
rename to meta-gem5/recipes-kernel/linux/files/dts/gem5-arm64/armv8_gem5_v2_8cpu.dts
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-arm64/vexpress_gem5_v2.dtsi b/meta-gem5/recipes-kernel/linux/files/dts/gem5-arm64/vexpress_gem5_v2.dtsi
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-arm64/vexpress_gem5_v2.dtsi
rename to meta-gem5/recipes-kernel/linux/files/dts/gem5-arm64/vexpress_gem5_v2.dtsi
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-arm64/vexpress_gem5_v2_base.dtsi b/meta-gem5/recipes-kernel/linux/files/dts/gem5-arm64/vexpress_gem5_v2_base.dtsi
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-arm64/vexpress_gem5_v2_base.dtsi
rename to meta-gem5/recipes-kernel/linux/files/dts/gem5-arm64/vexpress_gem5_v2_base.dtsi
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/gem5-arm64-standard.scc b/meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms/gem5-arm64-standard.scc
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/gem5-arm64-standard.scc
rename to meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms/gem5-arm64-standard.scc
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/gem5-arm64.scc b/meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms/gem5-arm64.scc
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/gem5-arm64.scc
rename to meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms/gem5-arm64.scc
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/gem5-arm64/gem5-arm64-board.cfg b/meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms/gem5-arm64/gem5-arm64-board.cfg
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/gem5-arm64/gem5-arm64-board.cfg
rename to meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms/gem5-arm64/gem5-arm64-board.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/gem5-arm64/gem5-arm64-cfi.cfg b/meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms/gem5-arm64/gem5-arm64-cfi.cfg
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/gem5-arm64/gem5-arm64-cfi.cfg
rename to meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms/gem5-arm64/gem5-arm64-cfi.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/gem5-arm64/gem5-arm64-drm.cfg b/meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms/gem5-arm64/gem5-arm64-drm.cfg
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/gem5-arm64/gem5-arm64-drm.cfg
rename to meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms/gem5-arm64/gem5-arm64-drm.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/gem5-arm64/gem5-arm64-net.cfg b/meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms/gem5-arm64/gem5-arm64-net.cfg
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/gem5-arm64/gem5-arm64-net.cfg
rename to meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms/gem5-arm64/gem5-arm64-net.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/gem5-arm64/gem5-arm64-pata.cfg b/meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms/gem5-arm64/gem5-arm64-pata.cfg
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/gem5-arm64/gem5-arm64-pata.cfg
rename to meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms/gem5-arm64/gem5-arm64-pata.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/gem5-arm64/gem5-arm64-pci.cfg b/meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms/gem5-arm64/gem5-arm64-pci.cfg
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/gem5-arm64/gem5-arm64-pci.cfg
rename to meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms/gem5-arm64/gem5-arm64-pci.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/gem5-arm64/gem5-arm64-rtc.cfg b/meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms/gem5-arm64/gem5-arm64-rtc.cfg
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/gem5-arm64/gem5-arm64-rtc.cfg
rename to meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms/gem5-arm64/gem5-arm64-rtc.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/gem5-arm64/gem5-arm64-serial.cfg b/meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms/gem5-arm64/gem5-arm64-serial.cfg
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/gem5-arm64/gem5-arm64-serial.cfg
rename to meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms/gem5-arm64/gem5-arm64-serial.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/gem5-arm64/gem5-arm64-virtio.cfg b/meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms/gem5-arm64/gem5-arm64-virtio.cfg
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/gem5-arm64/gem5-arm64-virtio.cfg
rename to meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms/gem5-arm64/gem5-arm64-virtio.cfg
diff --git a/meta-gem5/recipes-kernel/linux/linux-yocto_5.4.bbappend b/meta-gem5/recipes-kernel/linux/linux-yocto_5.4.bbappend
new file mode 100644
index 0000000..7913f61
--- /dev/null
+++ b/meta-gem5/recipes-kernel/linux/linux-yocto_5.4.bbappend
@@ -0,0 +1,11 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}:${THISDIR}/files:"
+
+COMPATIBLE_MACHINE_gem5-arm64 = "gem5-arm64"
+KMACHINE_gem5-arm64 = "gem5-arm64"
+SRC_URI_append_gem5-arm64 = " file://gem5-kmeta;type=kmeta;name=gem5-kmeta;destsuffix=gem5-kmeta \
+                              file://dts/gem5-arm64;subdir=add-files"
+
+do_patch_append_gem5-arm64() {
+    tar -C ${WORKDIR}/add-files/dts -cf - gem5-arm64 | \
+        tar -C arch/arm64/boot/dts -xf -
+}
-- 
2.26.2

