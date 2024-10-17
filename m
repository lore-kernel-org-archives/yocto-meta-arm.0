Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DF38D2F7EF
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 06:59:33 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.43488.1729148370466946838
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 16 Oct 2024 23:59:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ufRPq0d0;
 spf=pass (domain: linaro.org, ip: 209.85.167.54, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53a007743e7so690953e87.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 16 Oct 2024 23:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729148368; x=1729753168; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0cFDu6zBysKRUvbQZab9fBHDbzI5Yfefr9sR6KPRMVA=;
        b=ufRPq0d0BOholmGapu85k/5tznbZ4tb7EwuzBKHhJM1BpooI9dXxbdmBYos2B3lo1i
         GIbbPew4EPaBg5IEvrTiqjGrgRFoZOwCWlvKRKyQC9Q0qmp9n3uBRSHVIvPENOzGkZF2
         bzl2daEt4CnwawYppdpvXimFWTTx9VqFYWU/0Oz6lymrf0w5A6gqek5k6ug3fOrUHa5t
         wB0q8/IW2lw249uUegyAl13M+QWTaQ8lg3V8NE/cKfJtqLMMgrknz77Oa2UMRj/H3zT2
         FMb2LSkeSc2CCz6+yckY9dkEqsBK78B3HS603WB5kxoa1xM7btw/aTx2dP6Dlnva6qgT
         09pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729148368; x=1729753168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0cFDu6zBysKRUvbQZab9fBHDbzI5Yfefr9sR6KPRMVA=;
        b=SU3iqPWfcY5BnshVA35WfEHFtM9CGKeF+VQdP9Km8YoWo2b/F3ovjyImPhDIgrixw0
         sU1M++Wf4diPEYyvG1pbB1cmpaGnlfpTAOp5y5FjJ8/N0K7BsMNTRU1Y3lkPGcCvXOeO
         y2wHV96Bl++LEEKNvhC0McOKQApm21kGjWsPz9o3qrvrjRm2aqje/e2RLs/XFUY+yRf/
         7ywVgcAtw0jrBYBlvdEi8a0bHf1Y0OAauiFDCxkasAj4v9dUCD0RSA+biMdv75hs+Ejt
         SH6ukFO2ieOUYYruNxLZ88mcy0lwie2BkabfcYS7OKpaS6C/3Eds2TFubk9PTG4cXmal
         hDyQ==
X-Gm-Message-State: AOJu0YxhzlwOUo0m/OQoenrXQ5FiWne0NWNxORozNw+DBIHSBME0uxO4
	prB28KmpNhOJt0Wq+JGBgvFIjFgfSf1T41bus03OQC1kj+MXzOPgvH1rGCct0x5EJskX2HN++aY
	mKvM=
X-Google-Smtp-Source: AGHT+IHb0VI2WE9qvb5srLQXxaJ0ESDbS6ZMYTc6hRl8bzoaowpWfwvOSz+lKz+lSUZdlHk+YpurkQ==
X-Received: by 2002:a05:6512:3b0b:b0:539:f06c:6f1d with SMTP id 2adb3069b0e04-539f06c704amr7594201e87.55.1729148368497;
        Wed, 16 Oct 2024 23:59:28 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a00014109sm670023e87.289.2024.10.16.23.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 23:59:26 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v3 2/2] trusted-service: remove optee udev and group settings
Date: Thu, 17 Oct 2024 09:59:07 +0300
Message-ID: <20241017065907.172504-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241017065907.172504-1-mikko.rapeli@linaro.org>
References: <20241017065907.172504-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 17 Oct 2024 06:59:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6204

optee-client now provides them and sets "tee" group for
/dev/tee* and "teepriv" group for /dev/teepriv* access.
tee-supplicant runs as "teesuppl" user account.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 .../trusted-services/libts/tee-udev.rules     |  7 -------
 .../trusted-services/libts_git.bb             | 19 ++-----------------
 2 files changed, 2 insertions(+), 24 deletions(-)
 delete mode 100644 meta-arm/recipes-security/trusted-services/libts/tee-udev.rules

diff --git a/meta-arm/recipes-security/trusted-services/libts/tee-udev.rules b/meta-arm/recipes-security/trusted-services/libts/tee-udev.rules
deleted file mode 100644
index 43fafd8c..00000000
--- a/meta-arm/recipes-security/trusted-services/libts/tee-udev.rules
+++ /dev/null
@@ -1,7 +0,0 @@
-# tee devices can only be accessed by the teeclnt group members
-KERNEL=="tee[0-9]*", TAG+="systemd", MODE="0660", GROUP="teeclnt"
-
-# If a /dev/teepriv[0-9]* device is detected, start an instance of
-# tee-supplicant.service with the device name as parameter
-KERNEL=="teepriv[0-9]*", MODE="0660", OWNER="root", GROUP="tee", \
-    TAG+="systemd", ENV{SYSTEMD_WANTS}+="tee-supplicant@%k.service"
diff --git a/meta-arm/recipes-security/trusted-services/libts_git.bb b/meta-arm/recipes-security/trusted-services/libts_git.bb
index 635e4769..9d0e7373 100644
--- a/meta-arm/recipes-security/trusted-services/libts_git.bb
+++ b/meta-arm/recipes-security/trusted-services/libts_git.bb
@@ -5,24 +5,13 @@ TS_ENV = "arm-linux"
 
 require trusted-services.inc
 
-SRC_URI += "file://tee-udev.rules \
-            file://0001-Remove-TEE-driver-external-component.patch \
-           "
+SRC_URI += "file://0001-Remove-TEE-driver-external-component.patch"
 
 OECMAKE_SOURCEPATH="${S}/deployments/libts/${TS_ENV}"
 
 DEPENDS           += "arm-ffa-user"
 
-# Unix group name for dev/tee* ownership.
-TEE_GROUP_NAME ?= "teeclnt"
-
 do_install:append () {
-    if ${@oe.utils.conditional('VIRTUAL-RUNTIME_dev_manager', 'busybox-mdev', 'false', 'true', d)}; then
-        install -d ${D}${nonarch_base_libdir}/udev/rules.d/
-        install -m 755 ${UNPACKDIR}/tee-udev.rules ${D}${nonarch_base_libdir}/udev/rules.d/
-        sed -i -e "s/teeclnt/${TEE_GROUP_NAME}/" ${D}${nonarch_base_libdir}/udev/rules.d/tee-udev.rules
-    fi
-
     # Move the dynamic libraries into the standard place.
     install -d ${D}${libdir}
     mv ${D}${TS_INSTALL}/lib/libts* ${D}${libdir}
@@ -34,9 +23,5 @@ do_install:append () {
     fi
 }
 
-inherit ${@oe.utils.conditional('VIRTUAL-RUNTIME_dev_manager', 'busybox-mdev', '', 'useradd', d)}
-USERADD_PACKAGES = "${PN}"
-GROUPADD_PARAM:${PN} = "--system ${TEE_GROUP_NAME}"
-
-FILES:${PN} = "${libdir}/libts.so.* ${nonarch_base_libdir}/udev/rules.d/"
+FILES:${PN} = "${libdir}/libts.so.*"
 FILES:${PN}-dev = "${TS_INSTALL}/lib/cmake ${TS_INSTALL}/include ${libdir}/libts.so"
-- 
2.34.1


