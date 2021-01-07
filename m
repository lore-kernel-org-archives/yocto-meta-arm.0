Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.5817.1610010231027033260
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 Jan 2021 01:03:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=gy9+MTyz;
 spf=pass (domain: linaro.org, ip: 209.85.214.182, mailfrom: sumit.garg@linaro.org)
Received: by mail-pl1-f182.google.com with SMTP id r4so3143669pls.11
        for <meta-arm@lists.yoctoproject.org>; Thu, 07 Jan 2021 01:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=OWgFtZtly7kAD83rb1eG0/OvMPl9J4vKsQEDj7mx6s8=;
        b=gy9+MTyzepT8oSJMQoYRYLi6q7A6FqtLsWaehVAjXVcnnO1s8KMeKESgL0wSbUv7X4
         zpcypbMLt6jEL5GbQKlzx3X2lMkW0vi5t/O34xCy8PC/dHvZ+PgBgxGQQ9OMTymPZNbS
         gAepPUlo2ptC7QoPFvqaaZeKgM1lX3LEYa4IUmYkK+/SxUiEofos1kBLTwAoIy9Vag+z
         hNe22YBVUx+9e+mpRGQ8P30Uz0zNPfeUADO2TStiQxM2LAf+8pz0UR8cxG2CMEwnoKsk
         DUzRBSY5howm5UJAarvq4vKNpIWpzdN1oWMktOT8TjZjCTr6FBlzoDdsQJ77uz8CPjTV
         k8UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=OWgFtZtly7kAD83rb1eG0/OvMPl9J4vKsQEDj7mx6s8=;
        b=XDzYiHh3VKoMoMFYL/EK6O86WmoTbkvAB2IGCtTlPPD05AUReX80UgbT2jyvAVVbqn
         t5+geQGEJGFoxeqj8A2C9M+Cc+wILMr4C972jPkPQRgD5ElC7TbNqNG6uNLKG13G5kqN
         PUpTyGViho1Q1Ru2hcHaPvSpSPkUPnFJ0ODWkfyCmoEp0bMh2aiwVP9OzPj88MHJP79Z
         Wgrn9d4WFUKhOu1HEVq4VcSFQluXScV5qrMEvp6DLu4XKgXbFx5/ejnCcIgIpnSWGJUy
         zyP+1M/iS+8HkACMrY+g5FUiR7Y7Zj16Z8O4HO5tKA6OV2u6Dben+DFOs4V9s0tFRHQ+
         YkSA==
X-Gm-Message-State: AOAM531T64sB1FAs08hfu9T1WK+fiIYwlqMDVhhAZpSHOk+2Czlf6W2n
	D+KyH9Yishusu7w73sGfJCv8I0ztfvy/Jw==
X-Google-Smtp-Source: ABdhPJwi9e+DB8nLULKkh3V1teXrl8hBloE0FLoEDNRwEOKTFYLNhMDIgP83NfgsAR4ohyKaOJvwfQ==
X-Received: by 2002:a17:90b:68b:: with SMTP id m11mr8308535pjz.208.1610010229944;
        Thu, 07 Jan 2021 01:03:49 -0800 (PST)
Return-Path: <sumit.garg@linaro.org>
Received: from localhost.localdomain ([122.173.219.238])
        by smtp.gmail.com with ESMTPSA id q70sm4474349pja.39.2021.01.07.01.03.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Jan 2021 01:03:49 -0800 (PST)
From: "Sumit Garg" <sumit.garg@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: jon.mason@arm.com,
	ross.burton@arm.com,
	denys@ti.com,
	nicolas.dechesne@linaro.org,
	daniel.thompson@linaro.org,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [meta-arm][PATCH] external-arm-toolchain: Misc. fixup for GCC 10.2 support
Date: Thu,  7 Jan 2021 14:33:27 +0530
Message-Id: <1610010207-23400-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4

Arm GCC 10.2 prebuilt toolchain comes with ldd and tzselect scripts
which uses "/usr/bin/bash", so replace this with "/bin/sh" as the
default shell.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 .../external-arm-toolchain/external-arm-toolchain.bb            | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
index b44fd2f..c506c41 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
@@ -115,6 +115,8 @@ do_install() {
 	rm -rf ${D}${bindir}/gdbserver
 	sed -i -e 's#/arm/tools/gnu/bash/4.2/rhe6-x86_64##' ${D}${bindir}/tzselect
 	sed -i -e 's#/arm/tools/gnu/bash/4.2/rhe6-x86_64##' ${D}${bindir}/ldd
+	sed -i -e 's#/usr/bin/bash#/bin/sh#' ${D}${bindir}/tzselect
+	sed -i -e 's#/usr/bin/bash#/bin/sh#' ${D}${bindir}/ldd
 	sed -i -e 's#/bin/bash#/bin/sh#' ${D}${bindir}/tzselect
 	sed -i -e 's#/bin/bash#/bin/sh#' ${D}${bindir}/ldd
 
-- 
2.17.1

