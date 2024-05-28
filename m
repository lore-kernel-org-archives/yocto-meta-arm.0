Return-Path: <andrey.z@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 993F1C25B78
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 20:29:34 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.1309.1716928165777687771
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 28 May 2024 13:29:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DpvndesV;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: andrey.z@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-356c4e926a3so1055148f8f.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 28 May 2024 13:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716928164; x=1717532964; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rDNHChQMtrwHkobFVtnJ9AlUpQMJYd259/6sDRpxGlk=;
        b=DpvndesVFXzG8vBiqPpyiNSXSnM8eOFPOfpYgvM33cSaB8qpDPgcFDKayBon+qpCeZ
         cze6WMFOrAgJa1QhUn4MPsrYrqm1E3jOSNQaUNQaps3exlpxjZaRqytxG1/uweByA8Vb
         I4y021GBw9RS1K77OQMtmnBxy5pc6EYcsndaIhqzCMXaGUdNX/OLk5C24dTsYgV/j1L/
         xFAk9NiVwC39b3qnJgLuE+d/x/fyzeB1/Y5nFbILSIa4egQru2GfZlrTDZ3oI1GJxRdd
         l7RO4lDhoTdlyy2aJF2G2o2Mr4mfgsFtGsi/e1l2RsRYS4B1iPgCUxy2YlI2uroGcXDV
         4mFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716928164; x=1717532964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rDNHChQMtrwHkobFVtnJ9AlUpQMJYd259/6sDRpxGlk=;
        b=TLUq1lpfU2HyTd0flMB3HHE+wBlZAeGNiCte84HJ23zklcKqkZ7OhHfbZkl4eWParK
         deBMWpAJbYyu2VXl19hb7Whq19sHD0HqHEhv8SEXHObiPoUDEcKLiIcr/IuPbiHJc0pA
         Krqs3WDF4IE6IQmxcbho6HjcgxocMRdUgC2yygt1xT3bPmeXbSUGLURR0aYg/NrxZ/vl
         ipOR7iO1f6hrcqP855v4Z2BQUvlKw6narnxq4Q9nha+xm+KmwI3OdRPzFYy1f1GCurBg
         VsDcwhKKPU7cQ7Bow/vA8I3pJ1JyDdbkqyQICUhZdYeKCp0qUuYJJ8y4lyHxx63w72ra
         gB4Q==
X-Gm-Message-State: AOJu0YyWQBFmUexEC4VzjRhi8LN6270q6u0VUSG2RCQ5aCDQqXw262Eh
	IXJsm+8s0lJSk+6i4ccTJ6ZPQ7xUxfm+6dyMdt6qb/0n4wtYT2YRk5xS7w==
X-Google-Smtp-Source: AGHT+IFF68vdlNu9GcujdHqMhvjnGM337fE+mCUPS5RCokR1uvZfmX6JMDA/lEz06Mu/HBzmc5OhvA==
X-Received: by 2002:a05:600c:19ca:b0:41a:3b7e:2235 with SMTP id 5b1f17b1804b1-421089b1b42mr102588155e9.5.1716928163817;
        Tue, 28 May 2024 13:29:23 -0700 (PDT)
Received: from aherlnxbspsrv01.lgs-net.com ([193.8.40.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212278b24dsm1985375e9.0.2024.05.28.13.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 13:29:23 -0700 (PDT)
From: Andrey Zhizhikin <andrey.z@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Andrey Zhizhikin <andrey.z@gmail.com>
Subject: [PATCH] optee-client: Switch away from S = WORKDIR
Date: Tue, 28 May 2024 22:29:16 +0200
Message-Id: <20240528202916.3082271-1-andrey.z@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 28 May 2024 20:29:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5768

Since OE-Core commit 32cba1cc916a ("insane: Error for S == WORKDIR")
usage of WORKDIR in tasks is fatal, and shall be replaced with UNPACKDIR.
Similar change is introduced in OE-Core commit d9328e3b0b06 ("recipes:
Switch away from S = WORKDIR"), follow the same pattern for OP-TEE client.

Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
---
 meta-arm/recipes-security/optee/optee-client.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm/recipes-security/optee/optee-client.inc b/meta-arm/recipes-security/optee/optee-client.inc
index 77f6a642..ddda2d1a 100644
--- a/meta-arm/recipes-security/optee/optee-client.inc
+++ b/meta-arm/recipes-security/optee/optee-client.inc
@@ -24,8 +24,8 @@ EXTRA_OECMAKE = " \
 EXTRA_OECMAKE:append:toolchain-clang = " -DCFG_WERROR=0"
 
 do_install:append() {
-    install -D -p -m0644 ${WORKDIR}/tee-supplicant@.service ${D}${systemd_system_unitdir}/tee-supplicant@.service
-    install -D -p -m0755 ${WORKDIR}/tee-supplicant.sh ${D}${sysconfdir}/init.d/tee-supplicant
+    install -D -p -m0644 ${UNPACKDIR}/tee-supplicant@.service ${D}${systemd_system_unitdir}/tee-supplicant@.service
+    install -D -p -m0755 ${UNPACKDIR}/tee-supplicant.sh ${D}${sysconfdir}/init.d/tee-supplicant
 
     sed -i -e s:@sysconfdir@:${sysconfdir}:g \
            -e s:@sbindir@:${sbindir}:g \
-- 
2.34.1


