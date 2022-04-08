Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C6E9C433F5
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 17:23:44 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.98.1649438236027440676
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 08 Apr 2022 10:17:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=tM+AkvW/;
 spf=pass (domain: linaro.org, ip: 209.85.219.42,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qv1-f42.google.com with SMTP id ke15so7979086qvb.11
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 08 Apr 2022 10:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1FXyUWXnJpUzJV4O9po6ketFeiuPNzAKjsoQRpFTl+8=;
        b=tM+AkvW/9touDFdU9eXCgyWfUg93zCnyUKCWgs8UNDPAMJVJvqP24IbJg7iAt1gtGw
         Ubz4Z7erraaUN/ZaqiOuR+y+aBOFYdTHIJY6YEw/MREshJNwAoEfXrELj0zajQx1B93T
         xDTSb1vx9fAxKiJo9GXQdBUK2QqCaHqgvpAKEpzTHtF2cCJM+Zu7l+7IgUEK0Nfj+7gQ
         iBML0HzU9GhvKwdmXhTlJ09HIPKKCrvHCyx1JG98GgyHSkxA4wHbJV1e1HPBlNcSUrbT
         cbYPAKSONwZX21tlvFTz8fxGLhxiqadJWR2CGjSa86jCq2ismzwl9/C5xgcSMHxxTV9l
         N9MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1FXyUWXnJpUzJV4O9po6ketFeiuPNzAKjsoQRpFTl+8=;
        b=qGSWLiHRP/XN3S/zdSzE4IhHa/k1u/4qmSjsd929GZkKqYqs1gOLwJ4yl0u+0T5V6+
         ggtIUkK+xkDbSxEWR12ZpCuL1kKB8ysC5dkrKR0UL5V/KR/L3ezBL/E0FzayPR2Cns/i
         jc5bg0Cn9NwZEv2eAlj2tgZaHdHhUGjB0n7NH2RPBxd/+pyna93Lm6iJ86BEiUT65v+W
         Udhw7x0oKIDHCEuEOr8uuIQZp9MX9swknbwUUmdpbct48ZccnxpE10RMNAbP3ZZQTwRO
         TUWnsG/e4YGyXnOGYnWMve/bPYFVG9MyfQDdWyyIHNVeA1cOnr7zuBrS8Y9luwqJKdPO
         JfdQ==
X-Gm-Message-State: AOAM532Qccq8UYPYApR+rpNxCfQb8NEkirIG9zrPJAMCv0S3alfOwOMY
	qAMzZW9rGBQl2XpWG9jvipBY4uAtczQaRg==
X-Google-Smtp-Source: 
 ABdhPJzC1+V8AfgGSue4cXZA4PL7xEiO7IU2ptLSPinkL/oQvrusAm93she89epsM9WFBG2J9pieiw==
X-Received: by 2002:a0c:c692:0:b0:443:f22e:520 with SMTP id
 d18-20020a0cc692000000b00443f22e0520mr14262988qvj.96.1649438234956;
        Fri, 08 Apr 2022 10:17:14 -0700 (PDT)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id
 br13-20020a05620a460d00b00680d020b4cbsm13373737qkb.10.2022.04.08.10.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 10:17:14 -0700 (PDT)
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [dunfell][PATCH] arm-toolchain: ignore CVE-2019-15847 CVE-2021-37322
Date: Fri,  8 Apr 2022 13:17:11 -0400
Message-Id: <20220408171711.2274694-1-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 08 Apr 2022 17:23:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3267

CVE-2019-15847 is a bug in gcc POWER9 back-end, which is not relevant
for ARM architecture. (It has been fixed in gcc 8.4, 9.3, and 10.1).

CVE-2021-37322 is a bug in c++filt, which is part of binutils rather
than gcc. The issue was fixed in binutils 2.32 (poky has 2.34).

These exclusions are needed only in the dunfell branch, as it is the
only one with affected gcc versions. Master branch has gcc 11.2,
hardknott has 10.2, and honister has 10.3.

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
Duplication could be avoided by patching gcc-common.inc. However if we
were to update to gcc 8.4 or 9.3 then we might want to remove the
exclusion for that version.

 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2.inc | 6 ++++++
 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3.inc | 6 ++++++
 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc | 6 ++++++
 3 files changed, 18 insertions(+)

diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2.inc b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2.inc
index 65fbeff..6e18e2a 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2.inc
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2.inc
@@ -4,6 +4,12 @@ BASEPV = "8.2"
 PV = "arm-${BASEPV}"
 CVE_VERSION = "${BASEPV}"
 
+# CVE-2019-15847 is only relevant to POWER9 architecture
+CVE_CHECK_WHITELIST += "CVE-2019-15847"
+
+# CVE-2021-37322 is in binutils < 2.32, not in gcc
+CVE_CHECK_WHITELIST += "CVE-2021-37322"
+
 MMYY = "19.01"
 RELEASE = "20${MMYY}"
 PR = "r${RELEASE}"
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3.inc b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3.inc
index 3fb87bb..c86467f 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3.inc
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3.inc
@@ -9,6 +9,12 @@ RELEASE = "20${MMYY}"
 PR = "r${RELEASE}"
 BINV = "${BASEPV}.0"
 
+# CVE-2019-15847 is only relevant to POWER9 architecture
+CVE_CHECK_WHITELIST += "CVE-2019-15847"
+
+# CVE-2021-37322 is in binutils < 2.32, not in gcc
+CVE_CHECK_WHITELIST += "CVE-2021-37322"
+
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-${BASEPV}:${FILE_DIRNAME}/gcc-${BASEPV}/backport:"
 
 DEPENDS =+ "mpfr gmp libmpc zlib flex-native"
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc
index 6378ecf..ebbb5ed 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc
@@ -5,6 +5,12 @@ require recipes-devtools/gcc/gcc-common.inc
 PV = "arm-9.2"
 CVE_VERSION = "9.2"
 
+# CVE-2019-15847 is only relevant to POWER9 architecture
+CVE_CHECK_WHITELIST += "CVE-2019-15847"
+
+# CVE-2021-37322 is in binutils < 2.32, not in gcc
+CVE_CHECK_WHITELIST += "CVE-2021-37322"
+
 # BINV should be incremented to a revision after a minor gcc release
 
 BINV = "9.2.1"
-- 
2.25.1


