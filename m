Return-Path: <rui.silva@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB19C433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 11:39:57 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.9490.1664883589350731207
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Oct 2022 04:39:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=vJzcNBPs;
 spf=pass (domain: linaro.org, ip: 209.85.221.51,
 mailfrom: rui.silva@linaro.org)
Received: by mail-wr1-f51.google.com with SMTP id u10so20769188wrq.2
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Oct 2022 04:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=1seUEEoDUn++DtbyXW8oNI24ZNv6JWxc7zsSY6oVUWs=;
        b=vJzcNBPslUUve90ahbBxA0W/OTwvZluESv7+ujYGd8WkiLuQgYewmOi0n7c2upB08C
         hsR4R+6MDFrjRSP6nI/xc8Av4ZLKr6GBjCbQL+srk5OwBN+BGpvAkffFMp2DePp5Lqyl
         tT7KCisIH4O65+hGnyizrj3LhbqZl9eYPLl9vz5Uh2XSGt3H+2t65thtAmCUHBd8ndRO
         ItigaRsxm88OQvFd5kurNb0qPhVAstHa9XCe8XyGeAzVtq4ExWjF+q9mEKVeLHviBNU0
         AsSOhgJSrmrdT5rKc0W7NSAZqeqngTWt0p8xz48M+Q3WTJH+rpvSb2vbrK5IIC9trNi0
         /R+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=1seUEEoDUn++DtbyXW8oNI24ZNv6JWxc7zsSY6oVUWs=;
        b=oSVnlWE3Z+k+/mC24m9CEDjD6V7tHLFbBqQzZa9lM9pr/IAXzN8eLoF64KV9gP/rP8
         3xbJ+dsJ+Isk2l3Kn3vJr8VNG3bz6H5cp/tSDn2W+raiURGqG79yx1KW4NlZVnj5HTv8
         xzevqp9DF+NOX+vruA98HGKmfHCXa2o0jk9y29//onNhBvwZa5hHx6oHtWSUms16ET6K
         lY3d0DcULIoKOJuzVvixQFue7lKDHwN5+OU2FlBxxZha+6MHjXCH+AExZNiJ9dFE7HcR
         oWnHQXsv0QsPWUr25yN2ps19z8649MDAj1aYS3sMjyeVwc+YUSqoxgSVqKaI+ib+aJhl
         aRnw==
X-Gm-Message-State: ACrzQf0ImyRd8cm3AbuA2SFXia9HkCZSgFK1o23FAUWz9tKDHTb7mt6G
	rcMBFhh6L9mMUVA+QOBte2FfMdGC+uUrlA==
X-Google-Smtp-Source: 
 AMsMyM7in45fNWeVAf5KY4Jqin81RyVEtCA2E7XGeWjCO2ZKItx5LwQt7+a8lg3tqa6lhhIaoJG75Q==
X-Received: by 2002:a5d:6301:0:b0:226:d87b:b55c with SMTP id
 i1-20020a5d6301000000b00226d87bb55cmr15173309wru.560.1664883587201;
        Tue, 04 Oct 2022 04:39:47 -0700 (PDT)
Received: from arch-thunder.local (a109-49-33-111.cpe.netcabo.pt.
 [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id
 v19-20020a7bcb53000000b003b4a68645e9sm19095083wmj.34.2022.10.04.04.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 04:39:46 -0700 (PDT)
From: Rui Miguel Silva <rui.silva@linaro.org>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH] arm-bsp/corstone1000: bump kernel version to 5.19
Date: Tue,  4 Oct 2022 12:39:39 +0100
Message-Id: <20221004113939.1290283-1-rui.silva@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 04 Oct 2022 11:39:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3915

Bump the kernel version to 5.19.9, remove backported ffa
related patch to previous version and fix issues in the arm
rpmsg driver.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 .../conf/machine/include/corstone1000.inc     |  2 +-
 ...e-arm_ffa-Handle-compatibility-with-.patch | 90 -------------------
 ...3-Add-rpmsg-driver-for-corstone1000.patch} |  4 +-
 .../0004-rpmsg-arm-fix-return-value.patch     | 35 ++++++++
 ...pdate-chrdev-to-ctrldev-registration.patch | 33 +++++++
 .../linux/linux-arm-platforms.inc             |  5 +-
 6 files changed, 74 insertions(+), 95 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0001-UPSTREAM-firmware-arm_ffa-Handle-compatibility-with-.patch
 rename meta-arm-bsp/recipes-kernel/linux/files/corstone1000/{0003-Add-rpsmg-driver-for-corstone1000.patch => 0003-Add-rpmsg-driver-for-corstone1000.patch} (98%)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0004-rpmsg-arm-fix-return-value.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0005-rpmsg-arm-update-chrdev-to-ctrldev-registration.patch

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-arm-bsp/conf/machine/include/corstone1000.inc
index e4ef06846b91..ff00e3f1098f 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -49,7 +49,7 @@ EXTRA_IMAGEDEPENDS += "external-system"
 
 # Linux kernel
 PREFERRED_PROVIDER_virtual/kernel:forcevariable = "linux-yocto"
-PREFERRED_VERSION_linux-yocto = "5.15%"
+PREFERRED_VERSION_linux-yocto = "5.19%"
 KERNEL_IMAGETYPE = "Image.gz"
 
 INITRAMFS_IMAGE_BUNDLE ?= "1"
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0001-UPSTREAM-firmware-arm_ffa-Handle-compatibility-with-.patch b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0001-UPSTREAM-firmware-arm_ffa-Handle-compatibility-with-.patch
deleted file mode 100644
index a4fd67308450..000000000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0001-UPSTREAM-firmware-arm_ffa-Handle-compatibility-with-.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8e3f9da608f14cfebac2659d8dd8737b79d01308]
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-
-From a8f3e351c07c48774be2a45e184b9f08dc92f1db Mon Sep 17 00:00:00 2001
-From: Sudeep Holla <sudeep.holla@arm.com>
-Date: Wed, 13 Apr 2022 15:43:19 +0100
-Subject: [PATCH] UPSTREAM: firmware: arm_ffa: Handle compatibility with
- different firmware versions
-
-The driver currently just support v1.0 of Arm FFA specification. It also
-expects the firmware implementation to match the same and bail out if it
-doesn't match. This is causing issue when running with higher version of
-firmware implementation(e.g. v1.1 which will released soon).
-
-In order to support compatibility with different firmware versions, let
-us add additional checks and find the compatible version the driver can
-work with.
-
-Link: https://lore.kernel.org/r/20211013091127.990992-1-sudeep.holla@arm.com
-Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
-Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
-(cherry picked from commit 8e3f9da608f14cfebac2659d8dd8737b79d01308)
-Change-Id: I7bc9a3b172a9067bfd4e9bb9d50b4729e915b5a5
-Bug: 168585974
----
- drivers/firmware/arm_ffa/driver.c | 37 ++++++++++++++++++++++++++-----
- 1 file changed, 32 insertions(+), 5 deletions(-)
-
-diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
-index c9fb56afbcb4..6e0c883ab708 100644
---- a/drivers/firmware/arm_ffa/driver.c
-+++ b/drivers/firmware/arm_ffa/driver.c
-@@ -167,6 +167,28 @@ struct ffa_drv_info {
- 
- static struct ffa_drv_info *drv_info;
- 
-+/*
-+ * The driver must be able to support all the versions from the earliest
-+ * supported FFA_MIN_VERSION to the latest supported FFA_DRIVER_VERSION.
-+ * The specification states that if firmware supports a FFA implementation
-+ * that is incompatible with and at a greater version number than specified
-+ * by the caller(FFA_DRIVER_VERSION passed as parameter to FFA_VERSION),
-+ * it must return the NOT_SUPPORTED error code.
-+ */
-+static u32 ffa_compatible_version_find(u32 version)
-+{
-+	u32 compat_version;
-+	u16 major = MAJOR_VERSION(version), minor = MINOR_VERSION(version);
-+	u16 drv_major = MAJOR_VERSION(FFA_DRIVER_VERSION);
-+	u16 drv_minor = MINOR_VERSION(FFA_DRIVER_VERSION);
-+
-+	if ((major < drv_major) || (major == drv_major && minor <= drv_minor))
-+		return version;
-+
-+	pr_info("Firmware version higher than driver version, downgrading\n");
-+	return FFA_DRIVER_VERSION;
-+}
-+
- static int ffa_version_check(u32 *version)
- {
- 	ffa_value_t ver;
-@@ -180,15 +202,20 @@ static int ffa_version_check(u32 *version)
- 		return -EOPNOTSUPP;
- 	}
- 
--	if (ver.a0 < FFA_MIN_VERSION || ver.a0 > FFA_DRIVER_VERSION) {
--		pr_err("Incompatible version %d.%d found\n",
--		       MAJOR_VERSION(ver.a0), MINOR_VERSION(ver.a0));
-+	if (ver.a0 < FFA_MIN_VERSION) {
-+		pr_err("Incompatible v%d.%d! Earliest supported v%d.%d\n",
-+		       MAJOR_VERSION(ver.a0), MINOR_VERSION(ver.a0),
-+		       MAJOR_VERSION(FFA_MIN_VERSION),
-+		       MINOR_VERSION(FFA_MIN_VERSION));
- 		return -EINVAL;
- 	}
- 
--	*version = ver.a0;
--	pr_info("Version %d.%d found\n", MAJOR_VERSION(ver.a0),
-+	pr_info("Driver version %d.%d\n", MAJOR_VERSION(FFA_DRIVER_VERSION),
-+		MINOR_VERSION(FFA_DRIVER_VERSION));
-+	pr_info("Firmware version %d.%d found\n", MAJOR_VERSION(ver.a0),
- 		MINOR_VERSION(ver.a0));
-+	*version = ffa_compatible_version_find(ver.a0);
-+
- 	return 0;
- }
- 
--- 
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0003-Add-rpsmg-driver-for-corstone1000.patch b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0003-Add-rpmsg-driver-for-corstone1000.patch
similarity index 98%
rename from meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0003-Add-rpsmg-driver-for-corstone1000.patch
rename to meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0003-Add-rpmsg-driver-for-corstone1000.patch
index d88acfc0f670..809661487d81 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0003-Add-rpsmg-driver-for-corstone1000.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0003-Add-rpmsg-driver-for-corstone1000.patch
@@ -4,9 +4,9 @@ Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
 From e683c37ee51717e625c8a598056cf4bb1bdadcbc Mon Sep 17 00:00:00 2001
 From: Emekcan <emekcan.aras@arm.com>
 Date: Wed, 17 Aug 2022 14:21:42 +0100
-Subject: [PATCH] Add rpsmg driver for corstone1000
+Subject: [PATCH] Add rpmsg driver for corstone1000
 
-Adds rpsmg driver to communicate with external
+Adds rpmsg driver to communicate with external
 system in corstone1000 platform.
 
 Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0004-rpmsg-arm-fix-return-value.patch b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0004-rpmsg-arm-fix-return-value.patch
new file mode 100644
index 000000000000..207476886941
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0004-rpmsg-arm-fix-return-value.patch
@@ -0,0 +1,35 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
+
+From 1426dd2b541cb51741bffbd95191ae5593e1749d Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Tue, 27 Sep 2022 10:05:27 +0100
+Subject: [PATCH 1/2] rpmsg: arm: fix return value
+
+The creation of and endpoint returns a pointer, fix the return
+value to the right type.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ drivers/rpmsg/rpmsg_arm_mailbox.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/rpmsg/rpmsg_arm_mailbox.c b/drivers/rpmsg/rpmsg_arm_mailbox.c
+index 4a80102669f6..5c0dcc8e353d 100644
+--- a/drivers/rpmsg/rpmsg_arm_mailbox.c
++++ b/drivers/rpmsg/rpmsg_arm_mailbox.c
+@@ -103,8 +103,9 @@ static struct rpmsg_endpoint *arm_create_ept(struct rpmsg_device *rpdev,
+ 
+ 	channel->mbox = mbox_request_channel_byname(&channel->cl, chinfo.name);
+ 	if (IS_ERR_OR_NULL(channel->mbox)) {
+-		printk("RPMsg ARM: Cannot get channel by name: '%s'\n", chinfo.name);
+-		return -1;
++		printk("RPMsg ARM: Cannot get channel by name: %s\n",
++		       chinfo.name);
++		return ERR_PTR(-ENOENT);
+ 	}
+ 
+ 	return &channel->ept;
+-- 
+2.37.3
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0005-rpmsg-arm-update-chrdev-to-ctrldev-registration.patch b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0005-rpmsg-arm-update-chrdev-to-ctrldev-registration.patch
new file mode 100644
index 000000000000..504fa676c5df
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0005-rpmsg-arm-update-chrdev-to-ctrldev-registration.patch
@@ -0,0 +1,33 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
+
+From 20cd41fee8e4638eb47072b91d9a9f985730583b Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Tue, 27 Sep 2022 10:07:21 +0100
+Subject: [PATCH 2/2] rpmsg: arm: update chrdev to ctrldev registration
+
+Since "rpmsg: Update rpmsg_chrdev_register_device function",
+there was a replacement of the chrdev driver to ctrldev
+driver. Fix the registration.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ drivers/rpmsg/rpmsg_arm_mailbox.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drivers/rpmsg/rpmsg_arm_mailbox.c b/drivers/rpmsg/rpmsg_arm_mailbox.c
+index 5c0dcc8e353d..90bc8df90885 100644
+--- a/drivers/rpmsg/rpmsg_arm_mailbox.c
++++ b/drivers/rpmsg/rpmsg_arm_mailbox.c
+@@ -142,7 +142,7 @@ static int client_probe(struct platform_device *pdev)
+ 	rpdev->dev.parent = dev;
+ 	rpdev->dev.release = arm_release_device;
+ 
+-	return rpmsg_chrdev_register_device(rpdev);
++	return rpmsg_ctrldev_register_device(rpdev);
+ }
+ 
+ static const struct of_device_id client_of_match[] = {
+-- 
+2.37.3
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 0d1017ac2d8a..97de2d012e79 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -41,9 +41,10 @@ LINUX_KERNEL_TYPE:corstone1000 = "standard"
 KERNEL_EXTRA_ARGS:corstone1000 += "CONFIG_INITRAMFS_COMPRESSION_NONE=y"
 SRC_URI:append:corstone1000 = " \
            file://defconfig  \
-           file://0001-UPSTREAM-firmware-arm_ffa-Handle-compatibility-with-.patch  \
            file://0002-Add-external-system-driver.patch \
-           file://0003-Add-rpsmg-driver-for-corstone1000.patch \
+           file://0003-Add-rpmsg-driver-for-corstone1000.patch \
+           file://0004-rpmsg-arm-fix-return-value.patch \
+           file://0005-rpmsg-arm-update-chrdev-to-ctrldev-registration.patch \
         "
 
 SRC_URI:append:corstone1000 = " ${@bb.utils.contains('MACHINE_FEATURES', \
-- 
2.37.3


