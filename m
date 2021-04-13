Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.6776.1618306868344112821
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 02:41:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=gvDPZNdK;
 spf=pass (domain: blade-group.com, ip: 209.85.221.48, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wr1-f48.google.com with SMTP id p6so9034418wrn.9
        for <meta-arm@lists.yoctoproject.org>; Tue, 13 Apr 2021 02:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rxtmWADhSLYfoen0lte6H1mJvIyjYbdBFACoD+CXxwk=;
        b=gvDPZNdKGAAqu5no3omZSfEvLVqMYyUXjbRK29lWXOIU61J4v9RbRJ3rNSd0UBgJie
         E4VcqF/HUsYfzLj++7k7DPpDWB7rxr4z1AEZLN9L/HpasBQyarNmSxnkYsotflqgReHM
         J2BrwRcMUnS5tAFNLpc2LkUgUZzHX3sTnjsfKmThbEkI2lob21z0maZRFrZ02vEsmUqK
         k0oBCOd17AJqnin+stFY0zd8klvZqCYRoPR3CPHLeppx5a/1SFywmS8Rh9OThZIECWBK
         CJ8qYsx/O2QfoPtzLXemSLwEEK+2uLCbmDJxSuXdITHuYTd39G5Xq0uO1xt+Oxf29te6
         GwFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rxtmWADhSLYfoen0lte6H1mJvIyjYbdBFACoD+CXxwk=;
        b=rSfafmbcB+dBzzhZTG1tcYROkyZBF6M/3LrgysTAywp00rmd6zzVBoVRCkUpQgsz4q
         FD92zN2ShueATTWabK4Nii0HUIXs5JTsGh8ELLbNCIFfjXinXUqfJexxvM/ko6PfyGrT
         o1+fVp2wYhEVobYepndmeyXEgpIrZ69Dr6C6uVnCSoj/DXrYnleEV1jc9umYD5uIAzz7
         rxUFirqS9DlGpR8Dgujv9+1jVgfQcoSCQ98L/RhVK9uc44CnposlCJjQB6DtB5mossPe
         mwIip4Vd8Yae2XRmSPY5jGAACjbf+0jM7mif08lhN6InEIggBl5/TQeTi/x5OthWin+1
         BE1A==
X-Gm-Message-State: AOAM532VWzVnp5Qx3YBD0gc5oN89npXUbbOe89acR9uCUWejzFd8+LgW
	zhigU4yx6SwmhCGyhI00mAlny37HKx5OFQ==
X-Google-Smtp-Source: ABdhPJwdUpJuo0XTWOwq6mZdCoYuS/gfkgnujvIdBSQ+fNyPfcvnwqfCrgY0qBvGKRRzfU1xl6BigA==
X-Received: by 2002:adf:e108:: with SMTP id t8mr34922256wrz.371.1618306866895;
        Tue, 13 Apr 2021 02:41:06 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id g12sm10544145wru.47.2021.04.13.02.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 02:41:06 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: meta-arm@lists.yoctoproject.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH 4/4] arm/optee-client: create the /data/tee/ directory needed by tee-supplicant
Date: Tue, 13 Apr 2021 11:40:38 +0200
Message-Id: <20210413094038.3577754-5-yann@blade-group.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210413094038.3577754-1-yann@blade-group.com>
References: <20210413094038.3577754-1-yann@blade-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

With a writable rootfs, tee-supplicant will create this directory as needed,
but on a readonly rootfs it's obviously not possible.

Getting a readonly-rootfs use-case fully working still require a proper writable
filesystem to be mounted there, but how to do that is distro policy, and correct
OP-TEE can be at least be checked by mounting a tmpfs there.

Signed-off-by: Yann Dirson <yann@blade-group.com>
---
 meta-arm/recipes-security/optee/optee-client.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-arm/recipes-security/optee/optee-client.inc b/meta-arm/recipes-security/optee/optee-client.inc
index f697386..0198433 100644
--- a/meta-arm/recipes-security/optee/optee-client.inc
+++ b/meta-arm/recipes-security/optee/optee-client.inc
@@ -24,6 +24,8 @@ do_install_append() {
     install -D -p -m0644 ${WORKDIR}/tee-supplicant.service ${D}${systemd_system_unitdir}/tee-supplicant.service
     install -D -p -m0755 ${WORKDIR}/tee-supplicant.sh ${D}${sysconfdir}/init.d/tee-supplicant
 
+    install -d -m755 ${D}/data/tee
+
     sed -i -e s:@sysconfdir@:${sysconfdir}:g \
            -e s:@sbindir@:${sbindir}:g \
               ${D}${systemd_system_unitdir}/tee-supplicant.service \
@@ -35,3 +37,7 @@ SYSTEMD_SERVICE_${PN} = "tee-supplicant.service"
 INITSCRIPT_PACKAGES = "${PN}"
 INITSCRIPT_NAME_${PN} = "tee-supplicant"
 INITSCRIPT_PARAMS_${PN} = "start 10 1 2 3 4 5 . stop 90 0 6 ."
+
+FILES_${PN} += "\
+    /data/tee/ \
+"
-- 
2.30.2

