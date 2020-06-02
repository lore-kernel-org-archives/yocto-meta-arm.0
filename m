Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web10.8135.1591095926520000752
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 02 Jun 2020 04:05:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=MunhfSLh;
 spf=pass (domain: linaro.org, ip: 209.85.215.196, mailfrom: sumit.garg@linaro.org)
Received: by mail-pg1-f196.google.com with SMTP id e9so3752972pgo.9
        for <meta-arm@lists.yoctoproject.org>; Tue, 02 Jun 2020 04:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wQ3i9gW93KHYo9SN2vIFN1j1Q3w3LZFgOxTdBNQahSw=;
        b=MunhfSLh67V4FXfeMG/Py50DSMwSjg9vstM70iWUS+zyO4EtBrwoDHrMeUu3zvSOen
         9+rMcu6Q08jjMvYQIrOoa05DnSSX1xpgqy0MgEyHPJfqgeR2Gu39WwD7JHiLrZcy5vJm
         3MsjSWC05aa33/cKKXuG36Rf5J7QJQdpUY9Nn0HXRUlwMDqgShb1S+tEYgVProiEY9GW
         26c2K7c+vzg8eOTKDGVBNBugWaf9NvFZL9q8oeT1AW+AHVyA4NEXu9bJimRFcnVNnG5j
         RGlgd5TIllvTZUUkJ/2vVO4zy7tIAcLk+KE7qJ32ww5AxdpRU9fNZ5kML0UP/2/z7KqC
         Y3SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=wQ3i9gW93KHYo9SN2vIFN1j1Q3w3LZFgOxTdBNQahSw=;
        b=FxB4NPY87Bk7FpuYpEkBXSVFIbkaleB2s+vzOjepaqL7kF3qtWPRiHp47oasu8jHrI
         YfaYDB5Lh+usnDtoGLwpbWoSGeyW5Rf5hxznwEvgoffD8LJT1zQABWDz8CRfQsreyis/
         cMXIjGkNMuikryE49u96xRhUc5CMlgdStn279FBd1SDHtAbgHkD5O9DnxdiBZWRYlkUH
         xdpEZ8ROuQbpkjrqEaMKTns7iIk/P341FMqn6W5ItwtsyZzqsyPcCFjErWdXUDMlZCPL
         lN3hwiSyNpUSn1Q9jFNFzfP2xsBDWylD52kIyCBkSywcelF40qsy1fn0evl429xmbh0W
         XTCQ==
X-Gm-Message-State: AOAM531EcWPwLVM0L4r/PXdeClC2AR3E0bCv94gWfSuKzUWH16b4EQyj
	haMAHIpimTlqUNebq6MYDbcmmBThK0c=
X-Google-Smtp-Source: ABdhPJwSHhaEeQ8M0KJ6Z9cwqE2ETZL5lBKLzgy1l/ADRSUDhkBuLjYXwWyZiuTUU5EIZ6q8iqTX3A==
X-Received: by 2002:a63:5f90:: with SMTP id t138mr22662115pgb.122.1591095925533;
        Tue, 02 Jun 2020 04:05:25 -0700 (PDT)
Return-Path: <sumit.garg@linaro.org>
Received: from localhost.localdomain ([117.252.66.248])
        by smtp.gmail.com with ESMTPSA id w12sm2277895pjb.11.2020.06.02.04.05.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jun 2020 04:05:24 -0700 (PDT)
From: "Sumit Garg" <sumit.garg@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: pbarker@konsulko.com,
	denis@denix.org,
	wmills@ti.com,
	daniel.thompson@linaro.org,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH 1/4] external-arm-toolchain: Remove glibc locale dependency
Date: Tue,  2 Jun 2020 16:34:51 +0530
Message-Id: <1591095894-15178-2-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591095894-15178-1-git-send-email-sumit.garg@linaro.org>
References: <1591095894-15178-1-git-send-email-sumit.garg@linaro.org>

External Arm tool-set doesn't seem to provide packages corresponding to
OE glibc locale recipe. So explicitly remove corresponding libc
dependencies.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
index 9171380..eee1a51 100644
--- a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
+++ b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
@@ -58,6 +58,7 @@ DISTRO_FEATURES_LIBC = "ipv4 ipv6 libc-backtrace libc-big-macros libc-bsd libc-c
 ENABLE_BINARY_LOCALE_GENERATION = "0"
 GLIBC_INTERNAL_USE_BINARY_LOCALE = "precompiled"
 LIBCOVERRIDE = ":libc-glibc"
+LIBC_DEPENDENCIES_remove = "glibc-gconv-cp1252 glibc-gconv-ibm850 glibc-gconv-iso8859-1 glibc-gconv-iso8859-15 glibc-localedata-i18n"
 
 ERROR_QA[type] ?= "list"
 python toolchain_metadata_setup () {
-- 
2.7.4

