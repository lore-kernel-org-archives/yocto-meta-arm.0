Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.8819.1584505700916096526
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Mar 2020 21:28:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=MvUb3/xi;
 spf=pass (domain: linaro.org, ip: 209.85.128.50, mailfrom: leo.yan@linaro.org)
Received: by mail-wm1-f50.google.com with SMTP id t13so1689221wmi.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 17 Mar 2020 21:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=q+5g5/dIRYPO2FquiY4b84UdtQOsEIFSv+rjgpA/7Us=;
        b=MvUb3/xiybH8XoEv57jeFz9hOtVUVVJZhg9nCgGwGVcs5QxsHvDY2St2Isacl8RCXm
         vS/87SoKsb/nVZIT63GVetp9H6DqKR6YXYnDsM6iiQqXbqEU9+B8h4p2NySt94LhSAAi
         ONrHFuZdauv4JG07hLKk08JjFfUy6NUrn75Vm/VQLXjEIWgTfDDP3575XdirWe05ws6e
         9lt3Huth99uRGinXIHRZNhGunOstApyy4F+k0dW5LvnsEhZi/Oi2Lkq7AVPMIY4ZshQC
         FXBnbz8rRIQxRvF9oJRCfQ4vyCX3xdGvNDsgStHuq4S1w6lWk8yGqseeIyURVJ3iyvDc
         0MMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=q+5g5/dIRYPO2FquiY4b84UdtQOsEIFSv+rjgpA/7Us=;
        b=HT6XRSiC1sltaNiVOp5cn9qzQwpEGWrSunOCydQmO70bCNrc8FkQ0aLD4/8Yo42jIe
         Td3GEvpoXLbE3UwmuweKKfs68EGGRNNd5BuooH/2OXgUYuc3h3dn/pXL3fiScDGGOIdk
         T4aDVDios1O+GIIT2niqswnmSzgqEZ1+UBRwmI7oa1KWZWaCx+W4o2LYmbxzCTg0ye2e
         4DFuWklzzLLgwE8cY5zBuFDhrDE/bDXOHo+N6mx+W3yeRJCWHqYNJaOw5KfSDDMPClCh
         L1OvCjNvTiALsjSofIF8vVaRCC7VKHAM7xyvuPbhQAhcxjIO4Vr0vG2TPXDlGYqyASec
         zcZw==
X-Gm-Message-State: ANhLgQ0190RodS9E3VapsB+IOOPd6Zr266ieRvO3XY0h4eVDmHJueUA8
	mCuuv8YNhtfgKLdKCKShWrCMBP1yV4EPsA==
X-Google-Smtp-Source: ADFU+vsbTyqX0A73ISikKc5145b7YOBMGXGPJhVfDC3CMVrFBEvm2E/tpSep3WLzetjBO0nXWoxO3A==
X-Received: by 2002:a1c:7504:: with SMTP id o4mr2341558wmc.111.1584505698819;
        Tue, 17 Mar 2020 21:28:18 -0700 (PDT)
Return-Path: <leo.yan@linaro.org>
Received: from hackbox2.linaro.org ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id x15sm4073299wrs.5.2020.03.17.21.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2020 21:28:18 -0700 (PDT)
From: "Leo Yan" <leo.yan@linaro.org>
To: meta-arm@lists.yoctoproject.org,
	Khem Raj <raj.khem@gmail.com>,
	Scott Murray <scott.murray@konsulko.com>,
	Jon Mason <jdmason@kudzu.us>,
	Mike Leach <mike.leach@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Leo Yang <Leo.Yang@arm.com>,
	nd <nd@arm.com>
Cc: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v2] OpenCSD: Support for Arm CoreSight decode lib
Date: Wed, 18 Mar 2020 04:28:07 +0000
Message-Id: <20200318042807.32785-1-leo.yan@linaro.org>
X-Mailer: git-send-email 2.17.1

This patch is to add recipe for OpenCSD, which is an open source
CoreSight trace decode library and utility.

Also create a new folder recipes-devtools under meta-arm to place
this recipe.

v2: Refined recipe to use '-C' make option so can catch make error
    (Bertrand Marquis).

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 .../recipes-devtools/opencsd/opencsd_git.bb   | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-arm/recipes-devtools/opencsd/opencsd_git.bb

diff --git a/meta-arm/recipes-devtools/opencsd/opencsd_git.bb b/meta-arm/recipes-devtools/opencsd/opencsd_git.bb
new file mode 100644
index 0000000..af96723
--- /dev/null
+++ b/meta-arm/recipes-devtools/opencsd/opencsd_git.bb
@@ -0,0 +1,28 @@
+SUMMARY = "OpenCSD - An open source CoreSight(tm) Trace Decode library"
+HOMEPAGE = "https://github.com/Linaro/OpenCSD"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ad8cb685eb324d2fa2530b985a43f3e5"
+
+SRC_URI = "git://github.com/Linaro/OpenCSD;protocol=http;branch=master"
+SRCREV = "03c194117971e4ad0598df29395757ced2e6e9bd"
+
+S = "${WORKDIR}/git"
+
+COMPATIBLE_HOST = "(x86_64.*|aarch64.*)-linux"
+
+EXTRA_OEMAKE = "ARCH='${TARGET_ARCH}' \
+                CROSS_COMPILE='${TARGET_SYS}-' \
+                CC='${CC}' \
+                CXX='${CXX}' \
+                LINKER='${CXX}' \
+                LINUX64=1 \
+                DEBUG=1 \
+                "
+
+do_compile() {
+    oe_runmake -C ${S}/decoder/build/linux ${EXTRA_OEMAKE}
+}
+
+do_install() {
+    oe_runmake -C ${S}/decoder/build/linux PREFIX=${D}/usr install
+}
-- 
2.17.1

