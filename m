Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.5909.1583462250123742890
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 05 Mar 2020 18:37:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=WS9tBr4+;
 spf=pass (domain: linaro.org, ip: 209.85.221.43, mailfrom: leo.yan@linaro.org)
Received: by mail-wr1-f43.google.com with SMTP id n7so525335wrt.11
        for <meta-arm@lists.yoctoproject.org>; Thu, 05 Mar 2020 18:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=PKXGSZFJGoYFrMj+B3ze/sDu9BR0a+ba2yXxGqSYmus=;
        b=WS9tBr4+592W/fFlvjP/eXpd7S+6Sz+xSBIEC+BIhfNVI2u9uszc6MmdUvLEadkmWO
         ep8NmxpsvdvgxGk17AyGUTLr0MHoE4CusGygCk+mHnh1vDnp88OYXuC14UrREd7/2agU
         G3v4zRvKmia8O5mQ7+tC5NQZy2G6WxeQCqPVVrr/j+vBRfj/2HAfy3vl56ZhlomB/xy0
         /q2ug0n0weo7ZVsjg4E6m1aq8fG2YTFMZUAZZGSUK2P3pfKmQgl75MSmuv4L45kWeHBC
         Y7aeG8Izo6229fsWPWizrzwbJJ1MWp9/dHKqIoi8PYAL1aYTg6R3WYQj6+gKYvW3XfEK
         eoxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=PKXGSZFJGoYFrMj+B3ze/sDu9BR0a+ba2yXxGqSYmus=;
        b=RK4qD4A8DpJuicFIoKuDy4V3QRlsJ6Hrf9VxaD1TpxXqxTN/qvlfD/TmtI8wG7n5CB
         KLUHBG/bhzvb9umV/rmSk4khhCDzBFPzsFibq2hR4B+uO32aiFiYo+GnD/orGGj6B6jU
         viGpWl6CUu3PVc/UXqQF8XrUswZZHIYdUokjRY6s0PvuGgQHgXHamsw7JizIBcg7nBKO
         h6bXqSuFInblKkTPpJBkF/NQl7GDisBBjpDg6mxAcHYwoDFcLxzzjhsAGaDU9SFRRhQP
         72Y4JreTMwLU9yHpBo5wHJL2tmYNJ6L8SoUKC3yeoiImjKx+bSJ1XDIphb7ldan9USHz
         gVfA==
X-Gm-Message-State: ANhLgQ1jBv9OMa5j5aKtZ4exzyoTcZO65t9chLO1W2hZDly2LzdstcW+
	52PbukhY1uQ8yBhc+6LfCIxpDpc8kumA1w==
X-Google-Smtp-Source: ADFU+vtbPqfZexvKW/Ooe/CAAPKYe0pvnRcW/UDjMOGiR55zG+OMIJSf8K7JiBUD1cNOtook66SlMw==
X-Received: by 2002:adf:e506:: with SMTP id j6mr1105169wrm.309.1583462247880;
        Thu, 05 Mar 2020 18:37:27 -0800 (PST)
Return-Path: <leo.yan@linaro.org>
Received: from hackbox2.linaro.org ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id z12sm10042236wrl.48.2020.03.05.18.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2020 18:37:27 -0800 (PST)
From: leo.yan@linaro.org
To: meta-arm@lists.yoctoproject.org,
	Khem Raj <raj.khem@gmail.com>,
	Scott Murray <scott.murray@konsulko.com>,
	Jon Mason <jdmason@kudzu.us>,
	Mike Leach <mike.leach@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v1 RESEND] OpenCSD: Support for Arm CoreSight decode lib
Date: Fri,  6 Mar 2020 02:37:20 +0000
Message-Id: <20200306023720.24723-1-leo.yan@linaro.org>
X-Mailer: git-send-email 2.17.1

This patch is to add recipe for OpenCSD, which is an open source
CoreSight trace decode library and utility.

Also create a new folder recipes-devtools under meta-arm to place
this recipe.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 .../recipes-devtools/opencsd/opencsd_git.bb   | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-arm/recipes-devtools/opencsd/opencsd_git.bb

diff --git a/meta-arm/recipes-devtools/opencsd/opencsd_git.bb b/meta-arm/recipes-devtools/opencsd/opencsd_git.bb
new file mode 100644
index 0000000..0c3b483
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
+    ( cd ${S}/decoder/build/linux; oe_runmake ${EXTRA_OEMAKE}; cd - )
+}
+
+do_install() {
+    ( cd ${S}/decoder/build/linux; oe_runmake PREFIX=${D}/usr install; cd - )
+}
-- 
2.17.1

