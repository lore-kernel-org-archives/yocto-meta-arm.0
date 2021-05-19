Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.8409.1621410068954632128
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 May 2021 00:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=dO6Od1FU;
 spf=pass (domain: linaro.org, ip: 209.85.216.54, mailfrom: sumit.garg@linaro.org)
Received: by mail-pj1-f54.google.com with SMTP id q6so6904436pjj.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 19 May 2021 00:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zo0JOzDGs8pDpy4j4dUN9fl/CSXl6GtYMjYzY9Wdeus=;
        b=dO6Od1FUgfwvw3jEwrwXmlpo+STwqfkkedQodgAiAsyF935Cw+yOtjdBopnpOE1CNF
         LcfVxNVLsL/xsk71KTBuHkFvH+7oF6CizP+OFmbhQKkyS+f2cxUcvFDCQpbz6BJ2XN3r
         9qgTDfzj188ZgolBaSizdZrfrr3xlZpPvAWKoolbUQblDht4Xr/1o+rCzPq7eSD4xyIN
         u+lNcUWM0t69ggwLWGn580FPALR0m09fQWJAVP2rtEAkTIVlqhy2Qm3aREgZSowPtFon
         If9jSjp2/sUj56p7/vEDAz5GUta3gvzKyYBGe3Qsu+Cs+wXVqZUduhTPAx+OYMU0+E6+
         aq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zo0JOzDGs8pDpy4j4dUN9fl/CSXl6GtYMjYzY9Wdeus=;
        b=k56RnDGUXpJBDPT0wJ4R/9SFYeX8i3+nLRzhzW9skFEL2BQVttXa8cfqAicsTpT9FM
         po/EZY4o8SYB7Y7KT5q8lUSxvmGkE44n4QnmYD02eS0ehluAzcv7p8TUh0bV3xu+Wibm
         gRXRwqc3MEudA6Db9OmaXxM5H+P8lGEyiJ30ezUdscxD9VVwXl10uJjYR8WNLx675ich
         6SUWMoMVtSs1vMYSHZ/xex0MSh+hIfMFqTHKJ0AsWDQpDYxsxRAkiKstSpv9EBuU7YC6
         RWhrMFSqrYTV64E5tYUgmduj61//lYDbsSaMoJOJBimFryGjr1lGeG5s3XfjCU+Vj4h5
         2RdA==
X-Gm-Message-State: AOAM532tE4BaY+zXxllJQfa0TkLUDZlZIAEkO9W8HR0MJDrmmEBqlFKL
	EGHZYGVM/UX0Nw8jr5eXVW7x17AO/L11gg==
X-Google-Smtp-Source: ABdhPJwkfEQlQ++Q/yRgBprMp0GhNVdJ+PHYsv5hK9CFFYskBtlDSlKftBpERUxx/U5S4uxAhZsFuQ==
X-Received: by 2002:a17:90a:8c0c:: with SMTP id a12mr1121752pjo.85.1621410068019;
        Wed, 19 May 2021 00:41:08 -0700 (PDT)
Return-Path: <sumit.garg@linaro.org>
Received: from localhost.localdomain ([110.226.53.223])
        by smtp.gmail.com with ESMTPSA id v18sm14382914pff.90.2021.05.19.00.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 00:41:07 -0700 (PDT)
From: "Sumit Garg" <sumit.garg@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: patches@linaro.org,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH] arm/qemuarm64-secureboot: Enable kernel TEE drivers
Date: Wed, 19 May 2021 13:10:44 +0530
Message-Id: <20210519074044.3376104-1-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a config fragment to enable kernel TEE drivers.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 meta-arm/recipes-kernel/linux/linux-yocto/tee.cfg      | 10 ++++++++++
 .../recipes-kernel/linux/linux-yocto_5.10.bbappend     |  5 ++++-
 2 files changed, 14 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto/tee.cfg

diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/tee.cfg b/meta-arm/recipes-kernel/linux/linux-yocto/tee.cfg
new file mode 100644
index 0000000..3de03bf
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/linux-yocto/tee.cfg
@@ -0,0 +1,10 @@
+CONFIG_HW_RANDOM_OPTEE=y
+CONFIG_TEE=y
+
+#
+# TEE drivers
+#
+CONFIG_OPTEE=y
+CONFIG_OPTEE_SHM_NUM_PRIV_PAGES=1
+# end of TEE drivers
+
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend b/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend
index b9995e0..3c3d36a 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend
@@ -14,4 +14,7 @@ SRC_URI_append_qemuarm64-sbsa = " \
     "
 
 FILESEXTRAPATHS_prepend_qemuarm64-secureboot = "${ARMFILESPATHS}"
-SRC_URI_append_qemuarm64-secureboot = " file://zone_dma_revert.patch"
+SRC_URI_append_qemuarm64-secureboot = " \
+    file://zone_dma_revert.patch \
+    file://tee.cfg \
+    "
-- 
2.25.1

