Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.13148.1618408082808971713
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 06:48:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=Nck0MNL/;
 spf=pass (domain: blade-group.com, ip: 209.85.221.41, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wr1-f41.google.com with SMTP id k26so3536821wrc.8
        for <meta-arm@lists.yoctoproject.org>; Wed, 14 Apr 2021 06:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mx40MF7WoUpvsTM/yqnXJoZdtUgZAi7uRTFr3XNOh3Y=;
        b=Nck0MNL/t7BrLDwNhHIoSVz1NVGezn8gHjv/s9oHRN7oJartg4vqMv0IdDBletCjYM
         4Yg/nAh8HVNixTqpxpoWBPcNUkp8Xbom2GCYlZ1pJpviKpBNUBHa5Ep0/arqjo7+6Mpi
         jpbimV0YlF7Df1XEGykpi0j+ITthGLxZbUTZQt46X8LuO6bB0UkIR2DLN6rTHcxOtrFW
         11FO6sj2Ix/PaiBWbCXdao2zSMQtzXVzfALzCmhteV6MWtaWqHvNh/mxjiae14GRDhAA
         jZNpELY4bbGvqfNh5ep0+a9BHKQ37tPcjjVi87SSDCUeJ5XcfAmDvHQPIHPz/oTjBG6p
         D7qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mx40MF7WoUpvsTM/yqnXJoZdtUgZAi7uRTFr3XNOh3Y=;
        b=Lt8223KQ34hTbrc787IGEnCa4qJBK+aP6WZbONd0Bq+VTb++Ii3h8V1bX1JFtuDh2l
         3CGHT8FNSaX8k3w9JUFT0T8YuBWg0DAloEgtFwD62zAf4sPvGY6ty/jGxKgmiDZALxq9
         m2m+DqjohYZSy3NU2HxLYZqLiZt9+u2JbJWJM90ZEWaffrH9xtuRs1/Xd3L0iubjA17z
         MkK5kPc1JO5xcEo9czc4QaqJ+P7IgTA5pgSHaBUQx4/lTrD1lz45B+zQ9VkWfFW1ctG9
         j/2agi4PO6u1zmSAKzHX3nxCVZd+QSXmY2fl8CjC0daTyrQBkzf8ycmGMZ0re55sB9Sz
         wQAQ==
X-Gm-Message-State: AOAM533Xwsj6kPlfOFFWm3VeD3TKl8lxcoXBBjYy2EYI8soyz2R4lNBK
	OInE5detPlT6a3l6hJoBHkDENNBFfgrUJA==
X-Google-Smtp-Source: ABdhPJwI/fRWrFncatnmY0w5ex0GmyK7uiVqncmKN2Ns20QisJZLz5GfeWnR4tWMNXGM3WDbRD3YKQ==
X-Received: by 2002:adf:fb42:: with SMTP id c2mr43101108wrs.83.1618408081497;
        Wed, 14 Apr 2021 06:48:01 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id q20sm5517551wmq.2.2021.04.14.06.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 06:48:01 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: meta-arm@lists.yoctoproject.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH v2 3/6] arm/optee-os: deploy tee.elf for u-boot
Date: Wed, 14 Apr 2021 15:47:23 +0200
Message-Id: <20210414134726.4125294-4-yann@blade-group.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210414134726.4125294-1-yann@blade-group.com>
References: <20210414134726.4125294-1-yann@blade-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

Integration of OP-TEE in the u-boot image is done with `TEE=tee.elf`,
so this build artifact must be exported.

U-boot integration can now be done in a BSP layer with something like
this in `u-boot_%.bbappend`:

 # OP-TEE, dependent on "optee" DISTRO_FEATURES

 OPTEE_OEMAKE ?= " TEE=${DEPLOY_DIR_IMAGE}/optee/tee.elf"

 EXTRA_OEMAKE_append = " ${PACKAGECONFIG_CONFARGS}"
 PACKAGECONFIG[optee] = "${OPTEE_OEMAKE},,optee-os"
 PACKAGECONFIG_append = " ${@bb.utils.filter('DISTRO_FEATURES', 'optee', d)}"

Signed-off-by: Yann Dirson <yann@blade-group.com>
---
 meta-arm/recipes-security/optee/optee-os.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipes-security/optee/optee-os.inc
index 34f586a..08cc2f0 100644
--- a/meta-arm/recipes-security/optee/optee-os.inc
+++ b/meta-arm/recipes-security/optee/optee-os.inc
@@ -45,7 +45,7 @@ do_compile[cleandirs] = "${B}"
 do_install() {
     #install core in firmware
     install -d ${D}${nonarch_base_libdir}/firmware/
-    install -m 644 ${B}/core/*.bin ${D}${nonarch_base_libdir}/firmware/
+    install -m 644 ${B}/core/*.bin ${B}/core/tee.elf ${D}${nonarch_base_libdir}/firmware/
 
     #install TA devkit
     install -d ${D}${includedir}/optee/export-user_ta/
-- 
2.30.2

