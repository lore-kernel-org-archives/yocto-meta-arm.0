Return-Path: <maxim.uvarov@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2307EC433EF
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 10:02:17 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web08.5255.1637143335811192761
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Nov 2021 02:02:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=nQBU/cqL;
 spf=pass (domain: linaro.org, ip: 209.85.167.47,
 mailfrom: maxim.uvarov@linaro.org)
Received: by mail-lf1-f47.google.com with SMTP id l22so5836035lfg.7
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Nov 2021 02:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=EhZaL7pmbKn9z7I8lrbhdz71T/7mlSfblcKrdY+gCvk=;
        b=nQBU/cqLauY0JMmNDTtW81F5f5RllmKuAUXwNzLOMSnSIo9okl8N3T869qLN9oEnKj
         gW6kHZMHW227llRdOfBR0BQyIwlkuMj8C8SDo7Izohryx0JPwuDh3heGvNe3Tt+inK+O
         FRjluObmAVJdYESQhg66X81xlulvuiC+ALfQiD2ocDA5KAdo+FGGyA/C9h/m/s1xLIKU
         7DzFM518eOBAqzXYU6Vyz72PtBdS6CAfaUYKwz4IAe5YIqkf8XyojrHWlkjOyyykvdgn
         DDCkJxU1x+qAhcjzVzzypuBvBpKeVTZWHP+ZWoviMobXzjQ1zRMQED0pJIzqPuHZmhIF
         Q7Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=EhZaL7pmbKn9z7I8lrbhdz71T/7mlSfblcKrdY+gCvk=;
        b=dD6NiF9GokM7IeqldTyW5td0Y0alhN9a3+YtFTY2hx2Zt4mT7WbSPr8VOgSIfFmrNT
         vRBAc6QE/VuYr2Yjyqb4UBLrqILztyuv2pvEMcclPfPKQxPsY7LC2kF/DGbAYaHeS3Jc
         Bcf0RkHWiSJhu5VpF7nGGP/Mi2642JPEHX2aV4YTAALZ/MU08XRPTnIujcnMXhlvy+L+
         wGocDKEixtouSKnojlZbqCR+2x5Qj2PryFSMnKPQA2ljATrOeTyrwMdCJwCSRCNXQQ9+
         oTLcFZLpu4E1iq6bgJVkOpTaR4YPH0zB7IbR1Nb46CRKSvKkAmFQzauf8AdtSppQ8EAQ
         bztg==
X-Gm-Message-State: AOAM532g/mhp2yrLM250OC2ZJ36lzOvSc612X5QNs5KX+YTpSZMkDrDJ
	1JA14AUk/AkLy75tl2L7zevy5izJ5LVTaA==
X-Google-Smtp-Source: 
 ABdhPJwKd8oe9dbgPm7awQaJ/cXkZOAcPrRY6thxPe8y4a+rT2/3PoDSK6iR8D6EtW4AAJFBDbzK1Q==
X-Received: by 2002:a05:6512:2098:: with SMTP id
 t24mr13900960lfr.289.1637143333053;
        Wed, 17 Nov 2021 02:02:13 -0800 (PST)
Received: from maximlap.d-systems.local ([45.87.143.160])
        by smtp.gmail.com with ESMTPSA id
 j1sm2068126lfg.154.2021.11.17.02.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 02:02:12 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: jon.mason@arm.com,
	ross.burton@arm.com,
	Maxim Uvarov <maxim.uvarov@linaro.org>
Subject: [PATCHv5 1/3] optee: updae optee-os.inc to support external TAs
Date: Wed, 17 Nov 2021 13:02:08 +0300
Message-Id: <20211117100210.1401-1-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 17 Nov 2021 10:02:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2414

Separate recipe for TA devkit is needed to solve
circular dependency to build TAs withthe devkit
and integrate it inside optee-os.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
---
 - no change from v4

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


