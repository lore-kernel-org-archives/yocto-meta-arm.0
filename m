Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8131CC4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 11:07:52 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.10177.1713352069749718779
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Apr 2024 04:07:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Uli7+DQi;
 spf=pass (domain: linaro.org, ip: 209.85.167.43, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5194a4da476so586095e87.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 17 Apr 2024 04:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713352068; x=1713956868; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lFbeBJfkCazYlaTP/GNFnuK/S+C7yulSq/e202qjHZ0=;
        b=Uli7+DQih2o9fPekwuiM2DCh5dmTHMhdJ/wv6vZTI3+wBHdxtAyCLntruTuzgn3Suz
         Gt/mm7kf/L0kxEly0v5Tn+sh5FxOBmedvXvgTS6LdVlmvs1PN3lnPLlrQAy496+CxODG
         zB6mhhvtDP3BUR2MBDg3R8k74XjL05yjiXfy4NiPnOjqkiNqirsuxqB5NO9qSqNoFllm
         FOhHJ0ZsDsmlx3EE3pbK4UW+fzjwO8rO6rj72ZhaqpPpwjeP4NnR/p1fTtwWM3BVzpOw
         rqdy0/2vqYX/vA0vS58wNrFlNUCHeT41Dg+RTOVqEX03KPLEUnh66SkwbO0bMEpyzQQE
         cHaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713352068; x=1713956868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lFbeBJfkCazYlaTP/GNFnuK/S+C7yulSq/e202qjHZ0=;
        b=Tw3kOzZrckn0I/PM1JKLHpnLbGpi3IAGzXZ7huXNVoPKLKgpnYKTqzrbeN1jzpjIyb
         VJmjcx1RfofKP11H3i7ZxUVaxhLFnHnL350VVc+b4T5RHTq4Zv+n1vVtoovb34LsdJJJ
         9KE8eWnFIq5Eo9aiVjQ48IOy1K5CEwSUGGmKH6MZ7N9TmdtovpBIV4JonPgzK0HEG5TX
         PiyMrWceeRqsLlNlTUyHeUNeLTYM+deFHtqdTfyHx31OilUZTGoBG4LdVja+Zt9NUHNt
         NqERC1k5aGwGqgCamfeR3KEKyjxfPN4q6ehyjTvdpUcyMddAe503Zyta/h2TtnuMoXI2
         ZfLQ==
X-Gm-Message-State: AOJu0YxhIcbMHcsY00mS1p1w38i6Mi9H9X9uZkGFzSAXd8QgpVlu1/HI
	Z2jx2pWD+i60olC4NP7Ms3xooHtWYCMPdIlUhFJ99tfLreLIrSz3gzWbbVXgZRQh0BHeN2Rcplr
	rINs=
X-Google-Smtp-Source: AGHT+IEIraDB8Uk5+QMpNN0svXJWjySbnEtQVa+eqlQJLcAw39r48scndhZHsrapdScyrHAcUvWcCQ==
X-Received: by 2002:ac2:4c17:0:b0:517:870b:a13d with SMTP id t23-20020ac24c17000000b00517870ba13dmr11421193lfq.37.1713352067642;
        Wed, 17 Apr 2024 04:07:47 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id cf4-20020a056512280400b00518bf12488csm1194790lfb.160.2024.04.17.04.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 04:07:47 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 1/2] trusted-firmware-a: continue if TPM device is missing
Date: Wed, 17 Apr 2024 14:07:21 +0300
Message-Id: <20240417110722.283283-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 17 Apr 2024 11:07:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5554

All other firmware boot components also continue booting
if TPM is not found. It is up to subsequent SW components
to e.g. fail if rootfs can't be decrypted. Enables policies
like fall back to unencrypted rootfs if TPM device is
not found with qemu and swtpm.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 ...ot.c-ignore-TPM-error-and-continue-w.patch | 36 +++++++++++++++++++
 .../trusted-firmware-a_2.10.3.bb              |  5 +++
 2 files changed, 41 insertions(+)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/0001-qemu_measured_boot.c-ignore-TPM-error-and-continue-w.patch

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-qemu_measured_boot.c-ignore-TPM-error-and-continue-w.patch b/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-qemu_measured_boot.c-ignore-TPM-error-and-continue-w.patch
new file mode 100644
index 00000000..2d189d8e
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-qemu_measured_boot.c-ignore-TPM-error-and-continue-w.patch
@@ -0,0 +1,36 @@
+From 1d1425bde8435d6e2b3e4f2b7bcb2eb293ef9601 Mon Sep 17 00:00:00 2001
+From: Mikko Rapeli <mikko.rapeli@linaro.org>
+Date: Mon, 15 Jan 2024 09:26:56 +0000
+Subject: [PATCH] qemu_measured_boot.c: ignore TPM error and continue with boot
+
+If firmware is configured with TPM support but it's missing
+on HW, e.g. swtpm not started and/or configured with qemu,
+then continue booting. Missing TPM is not a fatal error.
+Enables testing boot without TPM device to see that
+missing TPM is detected further up the SW stack and correct
+fallback actions are taken.
+
+Upstream-Status: Pending
+
+Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
+---
+ plat/qemu/qemu/qemu_measured_boot.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/plat/qemu/qemu/qemu_measured_boot.c b/plat/qemu/qemu/qemu_measured_boot.c
+index 122bb23b14..731b081c47 100644
+--- a/plat/qemu/qemu/qemu_measured_boot.c
++++ b/plat/qemu/qemu/qemu_measured_boot.c
+@@ -79,7 +79,8 @@ void bl2_plat_mboot_finish(void)
+ 		 * Note: In QEMU platform, OP-TEE uses nt_fw_config to get the
+ 		 * secure Event Log buffer address.
+ 		 */
+-		panic();
++		ERROR("Ignoring TPM errors, continuing without\n");
++		return;
+ 	}
+ 
+ 	/* Copy Event Log to Non-secure memory */
+-- 
+2.34.1
+
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.3.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.3.bb
index b30ac725..13942dbb 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.3.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.3.bb
@@ -11,3 +11,8 @@ SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=ht
 SRCREV_mbedtls = "72718dd87e087215ce9155a826ee5a66cfbe9631"
 
 LIC_FILES_CHKSUM_MBEDTLS = "file://mbedtls/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+# continue to boot also without TPM
+SRC_URI += "\
+    file://0001-qemu_measured_boot.c-ignore-TPM-error-and-continue-w.patch \
+"
-- 
2.34.1


