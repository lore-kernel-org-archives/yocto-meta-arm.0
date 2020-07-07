Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.20079.1594139105186755235
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 Jul 2020 09:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=ufD8qjAV;
 spf=pass (domain: burtonini.com, ip: 209.85.221.45, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f45.google.com with SMTP id f18so37783702wrs.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 07 Jul 2020 09:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sJLLZGsbjkqGrrObz7jY7XKCrZwCkeYJRXRlas6Jrz4=;
        b=ufD8qjAVIeRhIzM8EwehT7sSlsFxs6VO7ivq3KWy33eu6Y7HC7SOYucLt5cwfcMS1b
         na4ik63dVSP2LBlzyDXAeuJ1Ye8gGC0RwCOOpzEs9q8CNhoV1k63YHBSrHydnYlkqTCe
         M/FfL8lK4yGuJYlk8zJZhHooJe8KkZWzLimA057Qx3aQu/DM52BkJ2xwUlzTOwxoE7Vm
         RWN3FBb+iXX78psVfYfgvlJuV0tDSXxKpLPyqLJoxo3k62JJZdtNWZoCByEiaoeztVC5
         pEbualhrtMPvsZjUmM39V9moWtRx6iFq+e2k5OdNdRZAbwLVun6UI7Hd93/LekJ92c7m
         Cq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sJLLZGsbjkqGrrObz7jY7XKCrZwCkeYJRXRlas6Jrz4=;
        b=OpB0Z20xdkmYfR1i9M7EYmMy/y7IVkCk1qZl2wxQviyTaTLFbF4rYMIath39oBudZ1
         nUTjeuOJwnXiZqn8A7mR7q5fmYD0+mRTp3cF3jySXqlI4bI3q5LNKla4WLHjMKW8WYca
         DDKw7YR2gJFi+LUjTX4B1ryBnPC0sj3FEIF2JE5qCFhpMNmXecqkl6KWlA2p7uuBlqm8
         v5WHnlVneGOo3aS9nsT4mvCivnDGjakt9vMfc6tGNjp2EPJ+Ea8Xlbm1U53VP7G6GzNb
         8iEJUCcer4zWRKFo6zYeC5cElOrP0erj9OWXG6Tnc8dCtFkbMr9rU8RR7jFsj2SdNWgf
         46Pw==
X-Gm-Message-State: AOAM53158bM2eMp9tQQPsju75KVDDnN3aJ6es0KlfAOZ8RrBY+jBWP9X
	7mWEAVO35a7iySpKPZ8833Pu2kPlmjwjqg==
X-Google-Smtp-Source: ABdhPJzA36fwOlAZR0RQIYF0OwIiD1+KuqFUm0A0oWklGVwsEhIs5d1JIZIY2KN5uTudOtUFBwEVww==
X-Received: by 2002:adf:f784:: with SMTP id q4mr54322911wrp.397.1594139103216;
        Tue, 07 Jul 2020 09:25:03 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id p4sm1715838wrx.63.2020.07.07.09.25.02
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 09:25:02 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm-bsp/trusted-firmware-a: move A5 DesignStart to 2.3
Date: Tue,  7 Jul 2020 17:24:58 +0100
Message-Id: <20200707162459.131391-1-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

0001-plat-arm-a5ds-move-dtb-to-a-new-address.patch was never applied,
and has been merged upstream so drop it.

The recipe was using the _git.bb recipe and setting the SRCREV to a
commit 300+ commits past 2.2 but not quite 2.3.  Instead, just use 2.3.

Change-Id: I76aee592e7ce3ec23268872d7f202efa945e5e59
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...t-arm-a5ds-move-dtb-to-a-new-address.patch | 31 -------------------
 .../trusted-firmware-a-a5ds.inc               |  5 ---
 .../trusted-firmware-a_2.3.bbappend           |  1 +
 .../trusted-firmware-a_git.bbappend           |  7 -----
 4 files changed, 1 insertion(+), 43 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/a5ds/0001-plat-arm-a5ds-move-dtb-to-a-new-address.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bbappend

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/a5ds/0001-plat-arm-a5ds-move-dtb-to-a-new-address.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/a5ds/0001-plat-arm-a5ds-move-dtb-to-a-new-address.patch
deleted file mode 100644
index 8d848ec..0000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/a5ds/0001-plat-arm-a5ds-move-dtb-to-a-new-address.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From d3cadbc6f1060020960dc05af0465db919bbbe2b Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Fri, 30 Aug 2019 13:38:44 +0100
-Subject: [PATCH] plat/arm: a5ds: move dtb to a new address
-
-When Using bigger kernel images (>8.4MB compressed zImage) and at
-decompress and final location init stage of kernel start makes it
-override dtb at this address, to avoid this move the dtb a little
-higher in address related.
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- plat/arm/board/a5ds/fdts/a5ds_tb_fw_config.dts | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/plat/arm/board/a5ds/fdts/a5ds_tb_fw_config.dts b/plat/arm/board/a5ds/fdts/a5ds_tb_fw_config.dts
-index 9ab2d9656600..c616ff772237 100644
---- a/plat/arm/board/a5ds/fdts/a5ds_tb_fw_config.dts
-+++ b/plat/arm/board/a5ds/fdts/a5ds_tb_fw_config.dts
-@@ -10,7 +10,7 @@
-       /* Platform Config */
-       plat_arm_bl2 {
-               compatible = "arm,tb_fw";
--              hw_config_addr = <0x0 0x82000000>;
-+              hw_config_addr = <0x0 0x83000000>;
-               hw_config_max_size = <0x01000000>;
-               /* Disable authentication for development */
-               disable_auth = <0x0>;
---
-2.22.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-a5ds.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-a5ds.inc
index aa21b74..d892794 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-a5ds.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-a5ds.inc
@@ -7,9 +7,6 @@ TFA_UBOOT = "1"
 TFA_BUILD_TARGET = "all fip"
 TFA_INSTALL_TARGET = "bl1.bin fip.bin"
 
-SRCREV = "5d3ee0764b03567bf3501edf47d67d72daff0cb3"
-LIC_FILES_CHKSUM = "file://license.rst;md5=1dd070c98a281d18d9eefd938729b031"
-
 EXTRA_OEMAKE_append = " \
                     ARCH=aarch32 \
                     FVP_HW_CONFIG_DTS=fdts/a5ds.dts \
@@ -18,5 +15,3 @@ EXTRA_OEMAKE_append = " \
                     ARM_CORTEX_A5=yes \
                     ARM_XLAT_TABLES_LIB_V1=1 \
                     "
-
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
index b642708..d8aa786 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
@@ -2,5 +2,6 @@
 
 MACHINE_TFA_REQUIRE ?= ""
 MACHINE_TFA_REQUIRE_tc0 = "trusted-firmware-a-tc0.inc"
+MACHINE_TFA_REQUIRE_a5ds = "trusted-firmware-a-a5ds.inc"
 
 require ${MACHINE_TFA_REQUIRE}
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bbappend
deleted file mode 100644
index 772f65a..0000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bbappend
+++ /dev/null
@@ -1,7 +0,0 @@
-# Machine specific TFAs
-
-MACHINE_TFA_REQUIRE ?= ""
-
-MACHINE_TFA_REQUIRE_a5ds = "trusted-firmware-a-a5ds.inc"
-
-require ${MACHINE_TFA_REQUIRE}
-- 
2.26.2

