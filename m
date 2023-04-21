Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D761C77B78
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 09:07:51 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.7393.1682068066265497971
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Apr 2023 02:07:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=glwylpnM;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: peron.clem@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3f177cb2c6cso9779005e9.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 21 Apr 2023 02:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682068063; x=1684660063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wp/gLb/1KoZQKDauef6Kfw66mH0SVUg/5a759NeFdik=;
        b=glwylpnMwezpGPCOoOiT8VM1D0bdpjRSADIKyg0ckRIlSFadwYbPp5TQiDyW/WHbbg
         tHEhigL9/BgD1CV8Iy2m7gy38LaqwuRwTQODmVGrlBJYnpuLQ72QOVDbnlHCoVudXyJe
         Nx35rx4dKuV/CxLW3QjdQnBMgYihxvjNNWbxdWCJxXUafVGFrgyptL2GFbkbRHWv3hf5
         2sSIUm10wYLvnZt1OyU8zJJToKBoKvkPPZb2cYJ/jw0a+OyAzWsTt6rJbHTsW+cF3RDi
         DHxySeoPQDhBHzf/AGD2Hqoa5Kd/j6/IjHozuL1Nmhi/SawAIlfz0RJBPWETEEZL2VEl
         8XxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682068063; x=1684660063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wp/gLb/1KoZQKDauef6Kfw66mH0SVUg/5a759NeFdik=;
        b=g3rJGSstnQWJNIhMwqzXEkDoH/ork3xVwA/kXfWKmtKAeZyd51vnaCtFQVdv4wPqcW
         S4KUGY1dOJZT6TS7322uhKrWMFj4uoUkkeSwIfkneld7Ac+woazI3Tk03GyTaOD8WDV3
         o0ok1UT0/t2KpO9EmXAeI3qUoUcZ3FGOeQ5MwInfd8VFIkdZ4DNAbKi4eY60SO/6OgEP
         eFVaIFJIiDVRMfv1/wqEFRwqejf2HXHUWKgjCIay61csMspbe1K1/rTq2mMsmbz357e1
         /VVer5bd9WZovpWbjlGUUM/RBqEe9UWCcmDSLPZQdhTPx54ky8O608HHxCMi2URoWIku
         VdKQ==
X-Gm-Message-State: AAQBX9d5xC+2qeRni1S/F8Keu3BhXOiE40h/eZpPC0WzCfIXyF4thBoM
	2GE84ifkQgFpPtMtLoVP/jPll1jFJnM=
X-Google-Smtp-Source: AKy350a+NBW+4HQJx7UHaP7D5nTHxsau0MHZHX+UB4aEWHD+XAc6x/t3kdPGNjmgYwSjnTTB9xvQrw==
X-Received: by 2002:adf:e8d1:0:b0:2f4:6a97:c27b with SMTP id k17-20020adfe8d1000000b002f46a97c27bmr3491802wrn.5.1682068062994;
        Fri, 21 Apr 2023 02:07:42 -0700 (PDT)
Received: from Clement-Blade14.home (2a01cb000c0d3d00d52d9d45828de677.ipv6.abo.wanadoo.fr. [2a01:cb00:c0d:3d00:d52d:9d45:828d:e677])
        by smtp.gmail.com with ESMTPSA id h5-20020a1ccc05000000b003ed1ff06faasm4230443wmb.19.2023.04.21.02.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 02:07:42 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v2 1/2] support: add libmxml 3.3.1 recipe
Date: Fri, 21 Apr 2023 11:07:31 +0200
Message-Id: <20230421090732.54079-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 21 Apr 2023 09:07:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4606

libmxml is required by new version of gator-daemon as it
has been removed from the package and is now an explicit
dependency.

This is a duplicate of the recipe present in meta-oe layer.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 .../recipes-support/libmxml/libmxml_3.3.1.bb  | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 meta-arm/recipes-support/libmxml/libmxml_3.3.1.bb

diff --git a/meta-arm/recipes-support/libmxml/libmxml_3.3.1.bb b/meta-arm/recipes-support/libmxml/libmxml_3.3.1.bb
new file mode 100644
index 00000000..b81050b2
--- /dev/null
+++ b/meta-arm/recipes-support/libmxml/libmxml_3.3.1.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "Tiny XML Library"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
+HOMEPAGE = "https://www.msweet.org/mxml/"
+BUGTRACKER = "https://github.com/michaelrsweet/mxml/issues"
+
+SRC_URI = "git://github.com/michaelrsweet/mxml.git;nobranch=1;protocol=https"
+SRCREV = "fd47c7d115191c8a6bce2c781ffee41e179530f2"
+S = "${WORKDIR}/git"
+
+inherit autotools
+
+PACKAGECONFIG ??= "threads"
+PACKAGECONFIG[threads] = "--enable-threads,--disable-threads"
+
+# Package does not support out of tree builds.
+B = "${S}"
+
+# MXML uses autotools but it explicitly states it does not support autoheader.
+EXTRA_AUTORECONF = "--exclude=autopoint,autoheader"
+
+do_configure:prepend() {
+    # Respect optimization CFLAGS specified by OE.
+    sed -e 's/-Os -g//' -i ${S}/configure.ac
+
+    # Enable verbose compilation output. This is required for extra QA checks to work.
+    sed -e '/.SILENT:/d' -i ${S}/Makefile.in
+}
+
+do_install() {
+    # Package uses DSTROOT instread of standard DESTDIR to specify install location.
+    oe_runmake install DSTROOT=${D}
+}
-- 
2.40.0


