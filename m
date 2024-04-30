Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9708DC19F53
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 12:37:58 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.14054.1714480669870521581
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 05:37:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=fLME25Fv;
 spf=pass (domain: linaro.org, ip: 209.85.167.41, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-516d1ecaf25so7815426e87.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 05:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714480668; x=1715085468; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lFbeBJfkCazYlaTP/GNFnuK/S+C7yulSq/e202qjHZ0=;
        b=fLME25Fvwsbj5wBa/O3+aNUBjE577VpzDrxUBnRPtg2M6gNjcftiNG3knFQjkze1Md
         n2bTBaVisud9uaGJd3jSvkkP9G4O1Fh7GNmPallO7iKkwolPrWswTgj1yuSeJj2UFQxP
         nEHZtaxcJProz+2/k/sWAOoMWHUSipHyIwIdJCI5W6WG7RzEJOxQ14QHG2bcyHeOBMiW
         3v70bQ1ImTT6V6xlReuVRh+iJvoOl6o9XSdSO6OTC7hPr+7OcZv7yDtnvwarsM+Ig9Bs
         9UMUlEOlHOraCIQGaXokqOHBZYfuDDyvArnUHUSq5vZZRSoepkMAganQOrw0ROvj1YcK
         p0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714480668; x=1715085468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lFbeBJfkCazYlaTP/GNFnuK/S+C7yulSq/e202qjHZ0=;
        b=rCZtyRJvq9/SS0n3Q7AX3KmY+MGzUyfkZaLywdLGEdvE8XzqOzPTxZiBpzAZ6gLpft
         aT8kVrAoh4wMnRrQb8ijXTSIA0bdbbLG1mS6cksgMtttD4EyW3kTARRNieIsnF0NDINc
         CjSqQe/wjwlZsZt1zKMJkxe5ZvcUYauh5MI5TZYh/kz4EmsekkXMo4C3lvCEdmqhtaXa
         abD5cLy5CovRVZfXdJPfIpOhYBTGiuhRt7gW6QIChdMlepwVHeP+FNX146ZY60T6dKBU
         OFt0y2oeKx4qV7PJ7Rvai9etWnHnjV8N7O7R7L5p8HNbXtzPOkMSdzYrmK7PdpuRGk+f
         x43g==
X-Gm-Message-State: AOJu0Yz1r/3c4jhAsrooQo7C1g+SJ0C1IcJkRihByKmpANpjzoCtrgFU
	rP7o8W+kWrg/hIFSwhPNJnuwok2lYZ6LeTrROTwYomV4NzM6nSHgalvvH/G+9lMMWpPp5lrRkxc
	WHqc=
X-Google-Smtp-Source: AGHT+IEmfQVKtWWoBfsH1r7DKQeQ+pUJ3wmn9ePRIV9Gdui+Nsdt2n2ug9RTL5imCoUFqrJ2gRr/7g==
X-Received: by 2002:a05:6512:3497:b0:51d:6260:3222 with SMTP id v23-20020a056512349700b0051d62603222mr1706062lfr.45.1714480667862;
        Tue, 30 Apr 2024 05:37:47 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id cf12-20020a056512280c00b0051b41844048sm3011149lfb.285.2024.04.30.05.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 05:37:47 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 1/6] trusted-firmware-a: continue if TPM device is missing
Date: Tue, 30 Apr 2024 15:37:27 +0300
Message-Id: <20240430123732.534277-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240430123732.534277-1-mikko.rapeli@linaro.org>
References: <20240430123732.534277-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 12:37:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5642

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


