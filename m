Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web12.17162.1591957974923231140
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Jun 2020 03:32:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=tJxXkzfA;
 spf=pass (domain: linaro.org, ip: 209.85.210.196, mailfrom: sumit.garg@linaro.org)
Received: by mail-pf1-f196.google.com with SMTP id j1so4119384pfe.4
        for <meta-arm@lists.yoctoproject.org>; Fri, 12 Jun 2020 03:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ZHBPvjSWePGsNjllRV0+qTuRSC0Z7D5x3IFRZeA5vxA=;
        b=tJxXkzfASZVUj/o9AxMpyXxIZ6utBbV5IVkP252A0QDYH79BqrJAU7DC07brNkxPZp
         HRt7Z0iz3QlEr75jLHYOny9dVCviLsNaKKTrq/PW3BW7xI5Lh75nnuDzl/opFJYeirjH
         KBOeMTG1R0gOkPLntx6cPi+mNdvcxxeOC/AKxt5/2XFIlYAwAWUvFmNgzrE6O0m68li0
         /d0nc4xdh/clgrXrYDNIAZbNP+y3eqWDc5zks/pOzYtxs7Hc7PEj1ysWJUMTYxP2TlS6
         iMdbIyIEb/9XJI7v9lLXH+S4ybFP1yx0kqe6314LFMMoa+TjyWHMtGXB7QZdjyvEOVFL
         o6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ZHBPvjSWePGsNjllRV0+qTuRSC0Z7D5x3IFRZeA5vxA=;
        b=iFQFlQEyImdRISH9zjczz7xFGOuKP4NR7+bsj4uLhSOQFrqd2lXowDAIkF7i9Z6maT
         HlXcXSNIfiiQced2FvUhPcrUMPdXdmcR0qPL7iOQTy8YJRffAiVl4WbsCkueFLcG12mj
         m815F88PMLnPIU4a1q/Wu2C6f0FWbzSSSWchalkGrLsuW92emnG9pmkvwTtzoHIEZZwZ
         Amq9whiX6srRWbtOmPKDexqxt0PMsauDZzo3l3/33eYx00cN2tcnknx9/QPL66zhhWvT
         2uclh2RR/Y20kTW4HDaOHfYiIouRfAclKSKdbuTGJPQKgYgoXdvhdh83MM/SpussXtt0
         2hsQ==
X-Gm-Message-State: AOAM532nRHeLu8GLsJLpTJzH4q3KFK51Frz+B9G5+U2+S6kmL44Gi+Tv
	xnxKRV3JquB2zYD6AS2EfPy3s+eWWe8=
X-Google-Smtp-Source: ABdhPJxUJ0hIFaUeyXplqsKw+Qa/W9dyzfG4KVV7Fv7pivyaTsZ6pRnWLg5eRA8FpsIDd0bnmi98Ow==
X-Received: by 2002:a63:5b63:: with SMTP id l35mr10228624pgm.34.1591957973692;
        Fri, 12 Jun 2020 03:32:53 -0700 (PDT)
Return-Path: <sumit.garg@linaro.org>
Received: from localhost.localdomain ([117.252.64.69])
        by smtp.gmail.com with ESMTPSA id y81sm5871606pfb.33.2020.06.12.03.32.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Jun 2020 03:32:52 -0700 (PDT)
From: "Sumit Garg" <sumit.garg@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: pbarker@konsulko.com,
	denis@denix.org,
	wmills@ti.com,
	richard.purdie@linuxfoundation.org,
	daniel.thompson@linaro.org,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH v3 4/5] meta-arm-toolchain: Add README
Date: Fri, 12 Jun 2020 16:02:07 +0530
Message-Id: <1591957928-5959-5-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591957928-5959-1-git-send-email-sumit.garg@linaro.org>
References: <1591957928-5959-1-git-send-email-sumit.garg@linaro.org>

Document usage details for GNU Arm toolchains which could either be built
from source or pre-built.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 meta-arm-toolchain/README.md | 113 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)
 create mode 100644 meta-arm-toolchain/README.md

diff --git a/meta-arm-toolchain/README.md b/meta-arm-toolchain/README.md
new file mode 100644
index 0000000..e415136
--- /dev/null
+++ b/meta-arm-toolchain/README.md
@@ -0,0 +1,113 @@
+meta-arm-toolchain Yocto Layer
+==============================
+
+This layer contains recipes for GNU Arm toolchains which could either be built
+from source or pre-built toolchain binaries.
+
+Information regarding contributing, reporting bugs, etc can be found in the
+top-level meta-arm readme file.
+
+Source Arm toolchain for Linux development
+------------------------------------------
+
+Recipes for GNU Arm toolchain built from source are provided under
+``recipes-devtools/gcc/``. In order to use Arm toolchain instead of OE core
+toolchain, one just needs to override ``GCCVERSION`` in corresponding distro
+conf file.
+
+-  Eg. to use GNU Arm toolchain version ``9.2``
+   GCCVERSION = "arm-9.2"
+
+Pre-built Arm toolchain for Linux development
+---------------------------------------------
+
+Recipes for pre-built GNU Arm toolchain for Linux development are provided under
+``recipes-devtools/external-arm-toolchain/``.
+
+external-arm-toolchain.bb
+~~~~~~~~~~~~~~~~~~~~~~~~~
+
+This recipe provides support for pre-built GNU toolchains targeting processors
+from the Arm Cortex-A family and implementing the Arm A-profile architecture.
+
+Usage
+^^^^^
+
+In order to use any of pre-built Arm toolchain versions (8.2, 8.3, 9.2 and so
+on), a user needs to download and untar tool-set on host machine at a particular
+installation path eg: ``/opt/toolchain/``. Then user needs to specify following
+in ``conf/local.conf`` in order to replace OE toolchain with pre-built GNU-A
+toolchain:
+
+TCMODE = "external-arm"
+EXTERNAL_TOOLCHAIN = "<path-to-the-toolchain>"
+
+-  Eg. for AArch64 (eg. qemuarm64 machine in poky distro)
+   EXTERNAL_TOOLCHAIN = "\
+     <installation-path>/gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu \
+   "
+
+-  Eg. for AArch32 (eg. qemuarm machine in poky distro)
+   EXTERNAL_TOOLCHAIN = "\
+     <installation-path>/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf \
+   "
+
+Supported distros and machines
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Since this pre-built GNU-A tool-set simply replaces OE toolchain, so it is
+meant to be distro and machine agnostic as long as one is cross-compiling for
+Arm A-profile architecture.
+
+Tested distro and machines (for zeus stable release):
+1.  Distro: poky; machines: qemuarm and qemuarm64 (build and boot tested)
+2.  Distro: RPB; machines: dragonboard-410c (build and boot tested)
+3.  Distro: world; machines: qemuarm and qemuarm64. Build tested for following
+    layers:
+    - poky/meta
+    - poky/meta-poky
+    - poky/meta-yocto-bsp
+    - meta-openembedded/meta-oe
+    - meta-openembedded/meta-python
+    - meta-openembedded/meta-networking
+
+SDK support
+^^^^^^^^^^^
+
+Pre-built toochain provides support to build OE SDK which has been tested using
+following commands:
+
+$ bitbake core-image-base -c populate_sdk
+$ bitbake core-image-base -c testsdk
+
+Note: Currently generated SDK only uses glibc provided by pre-built toolchain.
+      The cross compiler, binutils, gdb/gdbserver etc. are built from source.
+      This is something we would like to improve in future in order to package
+      most of the components from pre-built toolchain instead.
+
+Pre-built Arm toolchain for bare-metal development
+--------------------------------------------------
+
+Recipes for pre-built GNU Arm toolchain for bare-metal development are provided
+under ``recipes-devtools/external-arm-toolchain/``.
+
+gcc-arm-none-eabi_<version>.bb
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+This recipe provides support for pre-built GNU Arm Embedded toolchain for
+bare-metal software development on devices based on 32-bit Arm Cortex-A,
+Cortex-R and Cortex-M processors.
+
+Supported version: 9-2019-q4-major
+
+gcc-aarch64-none-elf_<version>.bb
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+This recipe provides support for pre-built GNU Arm toolchain for bare-metal
+software development on devices based on 64-bit Arm Cortex-A processors.
+
+Supported version: 9.2-2019.12
+
+Layer maintainer(s)
+-------------------
+* Sumit Garg <sumit.garg@linaro.org>
-- 
2.7.4

