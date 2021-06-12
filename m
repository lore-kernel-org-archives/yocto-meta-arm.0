Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web08.2577.1623473898480523029
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Jun 2021 21:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nkEMXEzI;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id h12-20020a17090aa88cb029016400fd8ad8so7123082pjq.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 11 Jun 2021 21:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y1K2QU2WJxCgjvnaiKsnDp/YM5WZybZARPMgfYNfDb4=;
        b=nkEMXEzIukyS1y4iUp7yx/Xki0CNR6J4H0mxsB+vXgngd5kZInTUowX6ryn71WFeof
         mA8t4PIw9qQ2/DtBEfULMjCEhCNbX8WKFwLzJLtG4auoUQ8iZnZNowUvUSGx/dKI3Gc8
         3IarftCY3N+SCVGwHZeALGNlyzJPVP1W6eoP98SmMSV7aM6BEXpV8YHpItTLTLEwpYkJ
         SSg2cFnwzw1PMJe5oZYH7DsJyEw/7pKQgYlBwgPkSz6PLWUG32c8s35NjWjh+jMCMail
         +B2/VXLxwP3ghQ744m4l4d/Z+psTiNC/IpV5O3iVvYjh/yYBa/RdHJIsY4xgy7Cl2NVg
         a4cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y1K2QU2WJxCgjvnaiKsnDp/YM5WZybZARPMgfYNfDb4=;
        b=Ej7AO26hTpBbdE7q0K/V1WTNWwDrlYnt0KfhQblLmq/mkCi7x2dFugye8TVPSQZ+ss
         rvpQLVHTPFd4HfQeWI+BxOnO0e3wMHq6TX/2CuVB57UrhXYp0rZ4F5tJQzby9U42idaG
         yYwDmmQmLV1/NpSLW+SejMgjhfD+taZjNl2f/sTP3S1gFSpPUCb3rM9JLuKSrFuCBaeO
         t0oXCdUiFdRvB9XbWiY5O0pSblNeaIaj/4V1oVx1XPnaxdADvUl2PJCZEL5wrBWgSy1q
         r32USsvoru2B/C72KaMNyJpbC+fvuUnJaUmKLv92Uv4jieaJvlfY1F/FeTT0Q1ddXWsc
         So3A==
X-Gm-Message-State: AOAM532UE2x5xzHQxGT9jhz0YmNNoDKHs653H91d/70JXojP1WY3eUet
	AlT2bZ4CVltgBN1hgdqdJLpXVCcRdvXPmA==
X-Google-Smtp-Source: ABdhPJw/Xf648+neO9emhaviL5FkaVc7CMXTFjASl2odwHWAG12lTUnOmY0uc0Yxf2UbWM7nwSdc4A==
X-Received: by 2002:a17:90a:fd86:: with SMTP id cx6mr12187509pjb.148.1623473897769;
        Fri, 11 Jun 2021 21:58:17 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0:db81:2f56:60e4:2c64])
        by smtp.gmail.com with ESMTPSA id o20sm6306373pjq.4.2021.06.11.21.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 21:58:17 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Jon Mason <jon.mason@arm.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH v2] sbsa-acs,edk2-firmware: Adjust target tuple for clang
Date: Fri, 11 Jun 2021 21:58:14 -0700
Message-Id: <20210612045814.3983639-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current settings assume glibc tuples and hence when building with musl C
library clang can not find correct cross tools and system headers and
libraries, really we should be using exact tuple that is in play so
using HOST_SYS is right replacement for OE

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Jon Mason <jon.mason@arm.com>
Cc: Ross Burton <ross.burton@arm.com>
---
v2: Move the patch to edk2-firmware and use HOST_SYS

 meta-arm/recipes-bsp/uefi/edk2-firmware.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
index c2d9bf1..2334201 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
@@ -64,6 +64,10 @@ export BTOOLS_PATH = "${EDK_TOOLS_PATH}/BinWrappers/PosixLike"
 EDK_COMPILER ?= "GCC5"
 EDK_COMPILER_toolchain-clang = "CLANG38"
 
+do_configure_prepend() {
+    sed -i -e "s#-target ${HOST_ARCH}-linux-gnu*#-target ${HOST_SYS}#" ${S}/BaseTools/Conf/tools_def.template
+}
+
 do_compile() {
     sed -i -e 's:-I \.\.:-I \.\. ${BUILD_CFLAGS} :' ${EDK_TOOLS_PATH}/Source/C/Makefiles/header.makefile
     sed -i -e 's: -luuid: -luuid ${BUILD_LDFLAGS}:g' ${EDK_TOOLS_PATH}/Source/C/*/GNUmakefile
-- 
2.32.0

