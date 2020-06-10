Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web11.11077.1591796608910834524
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Jun 2020 06:43:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=bGUxnech;
 spf=pass (domain: linaro.org, ip: 209.85.210.193, mailfrom: sumit.garg@linaro.org)
Received: by mail-pf1-f193.google.com with SMTP id z63so198187pfb.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 10 Jun 2020 06:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9XbUZ4cz7+fd/t0OVh4WqIpIyr9Dm1TayQ+BcE8Vxis=;
        b=bGUxnechiXsumK7r7n5Vi7TJAy7+CMgd/2FU3PBOpVQxrjitzvtaJ3rzqA3/9vVG8I
         uSkFdfJE4a0pInsW651K1gN8TY/RxRCXk29r3kKLZQNSBcnoqtHan7TROwIoTXLNdqin
         SyvCxIHGOZJHHjnNkcDU8Sm72/QkeJJV0entgOVRc3WDq7xG04KfpEBFDF7zRwp0Ca6V
         xEbjm0WAtPCHUOrva5e5ddK6mTJbPOmtKxsxHnu1OYFs4mVwNk8oOzwB7sYGK3wtJbdq
         KkUdxznmAuxd+Cb7BOrwwA+sW9phvDiCJykd38AWLj8RT6IaVqJuUTgIU4vw5YD79nV8
         Ix5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9XbUZ4cz7+fd/t0OVh4WqIpIyr9Dm1TayQ+BcE8Vxis=;
        b=aHPdNFkRrXdbbn33odikCo3SWZk1ES1TCUZoCUTK54pMvSR204uumeYGtq4ErMRv9o
         djzwIZZxFS0G3fpRSy+5mREshF5aSLhS4uFO8S4W3Zgh7Q7DI9oJmZehmI/58WSXJL2K
         yZuvAAjpWhdOhpLJW6DK4aSgK+wXh6GXu1PAX9voHM3xK1/Oe1VKiZ2YsV0O34Fov0rs
         jvXL9i3/iyt9PTKbz0BacXApvqb+G86DlD7cspOAp4Axw1UDVUMR/1sfoCvoNnwSb36R
         j97omU80ztuyUUc2GPBwv4aVH6jBipcVjoYQ7hL1nREsGxCt5qFmpH7hmMrkG+obYzhq
         UpcA==
X-Gm-Message-State: AOAM5328CtGm96KNmvD5y63iSWf58TW/eYm+lSeZTbJOMkBSZjT29LPY
	dAFCnNxk8ZLDWTQSDvz7ffEvF+6v87k=
X-Google-Smtp-Source: ABdhPJy0IyDwVpO/lAn9K1vKbUiBt0ARSMkOATRGQC3AI10kj+5zGcot4qriEcAS7HoDk6AzFSn6eQ==
X-Received: by 2002:a63:2257:: with SMTP id t23mr2674886pgm.245.1591796608003;
        Wed, 10 Jun 2020 06:43:28 -0700 (PDT)
Return-Path: <sumit.garg@linaro.org>
Received: from localhost.localdomain ([117.252.64.69])
        by smtp.gmail.com with ESMTPSA id u12sm5227530pjy.37.2020.06.10.06.43.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jun 2020 06:43:27 -0700 (PDT)
From: "Sumit Garg" <sumit.garg@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: pbarker@konsulko.com,
	denis@denix.org,
	wmills@ti.com,
	richard.purdie@linuxfoundation.org,
	daniel.thompson@linaro.org,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH v2 1/5] external-arm-toolchain: Remove glibc locale dependency
Date: Wed, 10 Jun 2020 19:12:58 +0530
Message-Id: <1591796582-5015-2-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591796582-5015-1-git-send-email-sumit.garg@linaro.org>
References: <1591796582-5015-1-git-send-email-sumit.garg@linaro.org>

Currently external Arm toolchain recipe doesn't provide packages
corresponding to OE glibc locale recipe. So explicitly remove corresponding
libc dependencies until we sort out glibc locale packaging rather than
blocking OE SDK generation which is still useful without glibc locale
packaging.

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

