Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web10.8138.1591095931763385120
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 02 Jun 2020 04:05:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ilGzauGt;
 spf=pass (domain: linaro.org, ip: 209.85.214.194, mailfrom: sumit.garg@linaro.org)
Received: by mail-pl1-f194.google.com with SMTP id y17so1206750plb.8
        for <meta-arm@lists.yoctoproject.org>; Tue, 02 Jun 2020 04:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xOlMYvvUZTf3MPn2qBy5c72y3PBgYKHiyOM08urY/qI=;
        b=ilGzauGtIP4s6GT9KfHr2XpaiJ/0S8hvUNzmaHzmyL/NrZmH0RobsSsj0lslHPA4eW
         wEdjkgBzkFq11t1Gl8fbh17tgdOTBIpdyaZ//o2ebaUD1MX+4SlyVT/KNe7LebJAru6L
         3s4RxsWVWBjGiuCMNRbCV7S1+X4rqs/LhtR7krf1C/PL+AvImw3il6EbC0aXAULh/BDT
         0VwDWZO5tyAm7GQyPagdn9RQIZpto2DAOMZYDSeIM+uvInwgk3Co2MTETCz/V8l2TeyG
         gApjARe7ivyudfkl/YB9Mbh+tchRzahxbkBlXNUAHRsu5svf9yDUyEc1yGWHsZs2pZQL
         t+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xOlMYvvUZTf3MPn2qBy5c72y3PBgYKHiyOM08urY/qI=;
        b=tk6kbwnvChCWzmiqhVyesL9DckqqdwQScDPaREH1k3rDRTd4N6V8KdvYLIOk0nabsP
         d88aaraUVez5OgAmaUDBz6Nd0p/kox+LbmBFzzbeX9QaWD7xvJJXLatvQoX/4T2h0Xys
         Crk5MbZdl7Konxr44+uWTl6nqjhRPConNHmRSeaEoNc3o9yKp08MyOj4yJZL7sylJ80d
         hOLkPoG7p3t5gaQYk0GxGNHHC3dxTybSizTy5fnALp4KACzJUvc1zx05t+alcY+lXbR0
         7FQ9W2KPpkO+x8Y35z7e9YteIV427LI9kObLSlzp1/3LiK95H552BMy1SItAxZ4C4Cwz
         NQ5w==
X-Gm-Message-State: AOAM532sPvJxGGkkXjV2rHEqWPdawruLhWn9YPiwj5tO9UwVHGXoKqcr
	YzkDfmMYw7HQ3L57bQspBv0iwILiCSs=
X-Google-Smtp-Source: ABdhPJwqt/sTwILgJhabmkeMOovne7VN5Q+rbUO8FlAX95nRF7REHtOdCOESH6nvONfncXz7M8yOQQ==
X-Received: by 2002:a17:90a:3321:: with SMTP id m30mr4922099pjb.20.1591095930660;
        Tue, 02 Jun 2020 04:05:30 -0700 (PDT)
Return-Path: <sumit.garg@linaro.org>
Received: from localhost.localdomain ([117.252.66.248])
        by smtp.gmail.com with ESMTPSA id w12sm2277895pjb.11.2020.06.02.04.05.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jun 2020 04:05:29 -0700 (PDT)
From: "Sumit Garg" <sumit.garg@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: pbarker@konsulko.com,
	denis@denix.org,
	wmills@ti.com,
	daniel.thompson@linaro.org,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH 2/4] external-arm-toolchain: Refine dev libraies packaging
Date: Tue,  2 Jun 2020 16:34:52 +0530
Message-Id: <1591095894-15178-3-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591095894-15178-1-git-send-email-sumit.garg@linaro.org>
References: <1591095894-15178-1-git-send-email-sumit.garg@linaro.org>

OE core by default package all libraies installed as "${libdir}/lib*.so"
or "${libdir}/*.la" as part of "FILES_${PN}-dev" but in case of external
Arm tool-set recipe, multiple packages are provided which needs to
include specific libraries. So split dev libraries packaging accordingly
and only package remaining libraries as part of "FILES_${PN}-dev" which
aren't provided as part of other packages.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 .../external-arm-toolchain.bb                      | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
index 04d8923..7f5a6f5 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
@@ -545,6 +545,29 @@ FILES_${PN} += "\
 	${base_libdir}/libpcprofile.so \
     "
 
+FILES_${PN}-dev_remove = "\
+	${libdir}/lib*.so \
+	${libdir}/*.la \
+    "
+FILES_${PN}-dev += "\
+	${libdir}/libcrypt.so \
+	${libdir}/libc.so \
+	${libdir}/libm.so \
+	${libdir}/libpthread.so \
+	${libdir}/libresolv.so \
+	${libdir}/librt.so \
+	${libdir}/libutil.so \
+	${libdir}/libnss_files.so \
+	${libdir}/libnss_compat.so \
+	${libdir}/libnss_dns.so \
+	${libdir}/libnss_hesiod.so \
+	${libdir}/libnss_db.so \
+	${libdir}/libdl.so \
+	${libdir}/libanl.so \
+	${libdir}/libBrokenLocale.so \
+	${libdir}/libthread_db.so \
+    "
+
 FILES_${PN}-dbg += "${base_libdir}/debug"
 
 # From gcc-runtime.inc
-- 
2.7.4

