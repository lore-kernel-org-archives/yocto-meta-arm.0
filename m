Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.336.1616599703475693766
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 24 Mar 2021 08:28:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: nathan.dunne@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC179D6E;
	Wed, 24 Mar 2021 08:28:22 -0700 (PDT)
Received: from e120809.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 21DF83F7D7;
	Wed, 24 Mar 2021 08:28:22 -0700 (PDT)
From: "Nathan Dunne" <Nathan.Dunne@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Nathan Dunne <Nathan.Dunne@arm.com>
Subject: [PATCH dunfell] arm-autonomy/u-boot: Modified kernel_addr for fvp-base with xen
Date: Wed, 24 Mar 2021 15:28:16 +0000
Message-Id: <20210324152816.4494-1-nathan.dunne@arm.com>
X-Mailer: git-send-email 2.17.1

From: Nathan Dunne <Nathan.Dunne@arm.com>

Modified the default booti command for fvp-base with xen to boot
into xen at 0x84000000, rather than requiring the user to break
into the u-boot prompt.

Issue-Id: SCM-2195
Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
Change-Id: I91f324ce77716474596a78f97e74f432969d9803
---
 .../documentation/arm-autonomy-quickstart.md     |  4 ++++
 .../fvp-base/xen_u-boot_kernel_addr.patch        | 16 ++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_2020.01.bbappend   |  9 +++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 meta-arm-autonomy/recipes-bsp/u-boot/u-boot-2020.01/fvp-base/xen_u-boot_kernel_addr.patch
 create mode 100644 meta-arm-autonomy/recipes-bsp/u-boot/u-boot_2020.01.bbappend

diff --git a/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md b/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
index 2a457c1..22b270a 100644
--- a/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
+++ b/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
@@ -115,6 +115,10 @@ To boot the system using an u-boot base board you will need to:

 In this example the addresses might need to be adapted depending on your board.

+For arm-autonomy host on FVP-Base u-boot has been modified such that
+`booti 0x84000000 - 0x83000000` is the default boot command. If FVP-Base is your
+MACHINE target there should be no need to interfere with u-boot.
+
 Guest project
 -------------
 The guest projects are not target specific and will use a Yocto MACHINE defined
diff --git a/meta-arm-autonomy/recipes-bsp/u-boot/u-boot-2020.01/fvp-base/xen_u-boot_kernel_addr.patch b/meta-arm-autonomy/recipes-bsp/u-boot/u-boot-2020.01/fvp-base/xen_u-boot_kernel_addr.patch
new file mode 100644
index 0000000..ac27dde
--- /dev/null
+++ b/meta-arm-autonomy/recipes-bsp/u-boot/u-boot-2020.01/fvp-base/xen_u-boot_kernel_addr.patch
@@ -0,0 +1,16 @@
+Upstream Status: Inappropriate [meta-arm-autonomy specifc u-boot config]
+Signed-off-by: Nathan Dunne <nathan.dunne@arm.com>
+
+diff --git a/include/configs/vexpress_aemv8a.h b/include/configs/vexpress_aemv8a.h
+index e63c335f85..9ee050a4a6 100644
+--- a/include/configs/vexpress_aemv8a.h
++++ b/include/configs/vexpress_aemv8a.h
+@@ -162,7 +162,7 @@
+ #elif CONFIG_TARGET_VEXPRESS64_BASE_FVP
+ #define CONFIG_EXTRA_ENV_SETTINGS	\
+ 				"kernel_name=Image\0"		\
+-				"kernel_addr=0x80080000\0"	\
++				"kernel_addr=0x84000000\0"	\
+ 				"initrd_name=ramdisk.img\0"	\
+ 				"initrd_addr=0x88000000\0"	\
+ 				"fdtfile=devtree.dtb\0"		\
diff --git a/meta-arm-autonomy/recipes-bsp/u-boot/u-boot_2020.01.bbappend b/meta-arm-autonomy/recipes-bsp/u-boot/u-boot_2020.01.bbappend
new file mode 100644
index 0000000..daabc5f
--- /dev/null
+++ b/meta-arm-autonomy/recipes-bsp/u-boot/u-boot_2020.01.bbappend
@@ -0,0 +1,9 @@
+# Machine specific u-boot
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${BP}:"
+
+#
+# FVP BASE
+#
+
+SRC_URI_append_fvp-base = "${@bb.utils.contains('DISTRO_FEATURES', 'arm-autonomy-host', ' file://xen_u-boot_kernel_addr.patch', '', d)}"
--
2.17.1

