Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.17286.1594724634440691751
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Jul 2020 04:03:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=vy26lrz3;
 spf=pass (domain: burtonini.com, ip: 209.85.221.68, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f68.google.com with SMTP id z13so20822290wrw.5
        for <meta-arm@lists.yoctoproject.org>; Tue, 14 Jul 2020 04:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aH/2CsjBBc2eDwB3C+A52wxMLu3nOmtaLcs6teFA1ls=;
        b=vy26lrz3tJAZyAzgnveID4CnVV57MysKX+QJjCUkcqAudLws7R47Xmr4KEiA9Z85zZ
         6WNzUAayhWWCbeMHViIjKJgQQH048/yTTa6esEtxc4Gegrgjk7WsvelANAxGLLnW3oLR
         AXemfWLpTwEnI+GLG0iPSNJ1IRNuxRNhHGiDnsfRsRxv53v+1irkOOsFVdj9GiB28XZ4
         J5u8VvuEC3S1P0Ro7LqQqO3gRUO6bQpftwQ77TH/+DmhqhPXC8OuJPlToLeFh6FkHKY/
         JJHW5lruUcxiN6kvitZSf7skcnTDFnCHu2JbQFk5R/BBWZpUTYacnbvJUpnfuBxb7NdV
         5eQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aH/2CsjBBc2eDwB3C+A52wxMLu3nOmtaLcs6teFA1ls=;
        b=AEY1AUaugSzoJ80neLOhjLTH5XkOjaHAU+0AQXdLBozHMOYVHp+3Yx2KvP3XsUPhkw
         89VemenPKqHuETYnP/4Dgbfm4Rk5Z3NRPeS9KWZCMxZbTJA5Pr4+4vwIB2gxJQwK/bXZ
         yj3pBK6k1YVMjt9R3FfRNnXM/vAvWjRzdvRhDO9n5FIY2HvmOW/K98goXrmQ1rZPZlbA
         +E3XFZ1sZE9gQ/04XeqBJc8MK33qQ4MC5x2KWo5QFcCccrj2vnbdbjoTxzZBrxmAmU9Q
         O+9CxulB7A9/3G6PjY34DtM0jzhKHTBFvSCrQjzkInEtfUvD06ViDeDIp3H7DL8qm7su
         Fv1w==
X-Gm-Message-State: AOAM533klvhoh/tF5PFAetqHvOqvCHw9pRPlOF4RDSuHj/dTWfYiP8PV
	DlA4gM5cWhrwjMhd665yX0or3abWIxw=
X-Google-Smtp-Source: ABdhPJwjmQ3+X39jLQBrlVh/7bpvtChr3fTSv3iZYSVo/60SyNkAo53Hmj14WbVuvdTMHcc0tABytA==
X-Received: by 2002:a5d:4687:: with SMTP id u7mr4768694wrq.357.1594724632547;
        Tue, 14 Jul 2020 04:03:52 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id b10sm3625725wmj.30.2020.07.14.04.03.51
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 04:03:52 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/trusted-firmware-a: move machine customisations to the versioned appends
Date: Tue, 14 Jul 2020 12:03:45 +0100
Message-Id: <20200714110345.570531-1-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

By having MACHINE_TFA_REQUIRE set and required in both the wildcard
bbappend and the versioned append, the same file can get included twice
which results in a warning from bitbake:

WARNING: trusted-firmware-a_2.3.bb: Duplicate inclusion for
trusted-firmware-a-juno.inc in trusted-firmware-a_2.3.bbappend

Move the customisations from the wildcard bbappend to the specific
version of trusted-firmware-a that is used for that platform to be clear
about what platforms are supported and remove this warning.

Change-Id: Ib220aedbf94fa11d21ddc6c5f9ac2c5de5c66b7a
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-a/trusted-firmware-a_2.%.bbappend | 10 +---------
 .../trusted-firmware-a/trusted-firmware-a_2.1.bbappend |  6 ++++++
 .../trusted-firmware-a/trusted-firmware-a_2.3.bbappend |  2 ++
 3 files changed, 9 insertions(+), 9 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bbappend

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.%.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.%.bbappend
index 2ce14b8..e5b10ff 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.%.bbappend
@@ -1,11 +1,3 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/files/:"
 
-# Machine specific TFAs
-
-MACHINE_TFA_REQUIRE ?= ""
-
-MACHINE_TFA_REQUIRE_foundation-armv8 = "trusted-firmware-a-fvp.inc"
-MACHINE_TFA_REQUIRE_fvp-base = "trusted-firmware-a-fvp.inc"
-MACHINE_TFA_REQUIRE_juno = "trusted-firmware-a-juno.inc"
-
-require ${MACHINE_TFA_REQUIRE}
+# Don't put machine customisation in here, use a versioned append.
\ No newline at end of file
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bbappend
new file mode 100644
index 0000000..f5f1632
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bbappend
@@ -0,0 +1,6 @@
+# Machine specific TFAs
+
+MACHINE_TFA_REQUIRE ?= ""
+MACHINE_TFA_REQUIRE_juno = "trusted-firmware-a-juno.inc"
+
+require ${MACHINE_TFA_REQUIRE}
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
index d8aa786..f37c589 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
@@ -3,5 +3,7 @@
 MACHINE_TFA_REQUIRE ?= ""
 MACHINE_TFA_REQUIRE_tc0 = "trusted-firmware-a-tc0.inc"
 MACHINE_TFA_REQUIRE_a5ds = "trusted-firmware-a-a5ds.inc"
+MACHINE_TFA_REQUIRE_foundation-armv8 = "trusted-firmware-a-fvp.inc"
+MACHINE_TFA_REQUIRE_fvp-base = "trusted-firmware-a-fvp.inc"
 
 require ${MACHINE_TFA_REQUIRE}
-- 
2.26.2

