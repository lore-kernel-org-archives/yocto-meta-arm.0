Return-Path: <maxim.uvarov@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16A7AC433EF
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 12:55:12 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web09.9409.1637067310986968553
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Nov 2021 04:55:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=d/loOlLY;
 spf=pass (domain: linaro.org, ip: 209.85.167.45,
 mailfrom: maxim.uvarov@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id k37so52976638lfv.3
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Nov 2021 04:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Sep/MNfUKbePSN9uXGfC3xQc+xrMz7DDX/PNGViK42w=;
        b=d/loOlLYsHOmkRVysZ+QuMmV/5D1wbd8+1mDZDido5V/AKE7nsztABPOjIwV6jOtCJ
         CdRLDCAN6U5R301WpO5Dk8NR5yi8BF7/r3WxBjrDXUI1lMhnoZkc0TTvN1u0KaIOJx3C
         /MOgbdnW77Q3qu8QeEDz4bLwlZs1nbx/lqxWWaWQba25YQ+KqF218RwcPpNlfbqthnBN
         dKQPfhyvoVCR4N/iMOiTzcg91giyCHwcS0rwK4qprik/HNvQiTrqcSuQJy1/W2b+pycP
         W/v6zx73D2KyRyQZkD/vz2c0v0nPD8GlcF6g6YgOk9uMZ5SX+3fjbZ9653g1MN8pqPHd
         s5dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Sep/MNfUKbePSN9uXGfC3xQc+xrMz7DDX/PNGViK42w=;
        b=pLbNGpSm7t3W1yDbgn5tqXy2iwzPlwJS1pLw8J8ttrhzyQ1V93aGefOtlRfD9MhxYc
         7xCCdmvyahxgEukOAT8REhhmqWzN16v6aLxOPUD9WreiZ4/U6ABUm1MjNP/Xc2hV1/w8
         lBReK/IaVD5+JYc/l7pf8yYovH6i9dEAJscBc/yNUM0Hhkw5bhZeNVRpilc91cJ0Dw7L
         +fABf2y6+p+wxKj6DI6MWlU3ZGR2baLZBaEMx50z0gP0OZS3p5eBqT3kDSC05P00S4Bo
         1tipyRKNwPBgVq/w0u86QUxPBOAj0pcoPpHCFpqKyl+8NM2eryAwVwOIntevem2CIi0r
         Iw2g==
X-Gm-Message-State: AOAM533bVTHMqFhRROJllT9zJn3lFYXvLzgJ35NWWf4oL4N6+BFWCo7+
	tKJpqkF9+JQ5hUWauT3nihIzbGGczy/8rA==
X-Google-Smtp-Source: 
 ABdhPJwqoKN8DNT6LimMSUSB4I5osiS6K2n3sCAXbD0B9PscngrXlYUY60+9BgLjq7OopbE3IIKK/A==
X-Received: by 2002:a05:6512:ac4:: with SMTP id
 n4mr6182004lfu.352.1637067308594;
        Tue, 16 Nov 2021 04:55:08 -0800 (PST)
Received: from maximlap.d-systems.local ([45.87.143.160])
        by smtp.gmail.com with ESMTPSA id
 r25sm1753053lfi.166.2021.11.16.04.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 04:55:08 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: jon.mason@arm.com,
	ross.burton@arm.com,
	Maxim Uvarov <maxim.uvarov@linaro.org>
Subject: [PATCHv4 1/3] optee: updae optee-os.inc to support external TAs
Date: Tue, 16 Nov 2021 15:55:03 +0300
Message-Id: <20211116125505.32716-1-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 16 Nov 2021 12:55:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2406

Separate recipe for TA devkit is needed to solve
circular dependency to build TAs withthe devkit
and integrate it inside optee-os.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
---
 .../recipes-security/optee/optee-examples.inc |  2 +-
 .../optee/optee-os-tadevkit_3.14.0.bb         | 20 +++++++++++++++++++
 meta-arm/recipes-security/optee/optee-os.inc  |  7 -------
 3 files changed, 21 insertions(+), 8 deletions(-)
 create mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb

diff --git a/meta-arm/recipes-security/optee/optee-examples.inc b/meta-arm/recipes-security/optee/optee-examples.inc
index 921fa18..656722e 100644
--- a/meta-arm/recipes-security/optee/optee-examples.inc
+++ b/meta-arm/recipes-security/optee/optee-examples.inc
@@ -5,7 +5,7 @@ HOMEPAGE = "https://github.com/linaro-swg/optee_examples"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cd95ab417e23b94f381dafc453d70c30"
 
-DEPENDS = "optee-client optee-os python3-pycryptodome-native"
+DEPENDS = "optee-client optee-os-tadevkit python3-pycryptodome-native"
 
 inherit python3native
 
diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb
new file mode 100644
index 0000000..0d37a52
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb
@@ -0,0 +1,20 @@
+FILESEXTRAPATHS:prepend := "${THISDIR}/optee-os:"
+require optee-os_3.14.0.bb
+
+SUMMARY = "OP-TEE Trusted OS TA devkit"
+DESCRIPTION = "OP-TEE TA devkit for build TAs"
+HOMEPAGE = "https://www.op-tee.org/"
+
+do_install() {
+    #install TA devkit
+    install -d ${D}${includedir}/optee/export-user_ta/
+    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
+        cp -aR $f ${D}${includedir}/optee/export-user_ta/
+    done
+}
+
+do_deploy() {
+	echo "Do not inherit do_deploy from optee-os."
+}
+
+FILES:${PN} = "${includedir}/optee/"
diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipes-security/optee/optee-os.inc
index 277646e..1506a58 100644
--- a/meta-arm/recipes-security/optee/optee-os.inc
+++ b/meta-arm/recipes-security/optee/optee-os.inc
@@ -46,12 +46,6 @@ do_install() {
     #install core in firmware
     install -d ${D}${nonarch_base_libdir}/firmware/
     install -m 644 ${B}/core/*.bin ${B}/core/tee.elf ${D}${nonarch_base_libdir}/firmware/
-
-    #install TA devkit
-    install -d ${D}${includedir}/optee/export-user_ta/
-    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
-        cp -aR $f ${D}${includedir}/optee/export-user_ta/
-    done
 }
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -66,7 +60,6 @@ addtask deploy before do_build after do_install
 SYSROOT_DIRS += "${nonarch_base_libdir}/firmware"
 
 FILES:${PN} = "${nonarch_base_libdir}/firmware/"
-FILES:${PN}-dev = "${includedir}/optee/"
 
 # note: "textrel" is not triggered on all archs
 INSANE_SKIP:${PN} = "textrel"
-- 
2.17.1


