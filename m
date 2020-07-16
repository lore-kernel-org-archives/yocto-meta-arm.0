Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web12.17232.1594911350200560895
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Jul 2020 07:55:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=OZ/pnv90;
 spf=pass (domain: burtonini.com, ip: 209.85.128.67, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f67.google.com with SMTP id g10so5516837wmc.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 16 Jul 2020 07:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=UdVtH55qBbLqDNzWiArc20GDYWO6zXWJVxfhxdgP4bA=;
        b=OZ/pnv90qjn2IfENiLEICTd1h5evX+ekqpRIBlSgt3z6gRxc8e7bcAzFIYZJyPmDER
         4GJ6TRiWtIokrDnuPsNZC8Gtz1pLgRowaXTEm8Dpom8UzYxS+/TkP2d7qajuU8eHetT/
         ZS+z0GnHjUlUXk4QT0PyLw3qQ7Sm158MWNgv/hP62ege4me69//elCQvkL0I2o2BorgP
         xkB+ckE/N+Q/OKV3J3HmD/PC9Zj4m5vLhGirv+V6x74pjUs6CkmYeTSjqpgMOTL+X5Vc
         Jfwn7cJEhGYTezcMmPfKZRzMUpPtXCCTRCG6HPMIzYZjEvD//m5kakEatjuqiKwHDkI5
         aFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UdVtH55qBbLqDNzWiArc20GDYWO6zXWJVxfhxdgP4bA=;
        b=fe4LspNMTeg2rGdEUGilpAemah5M+/dF9eiq9t6Ve4IgF1KWWYGyqS6/cq+5XWPZ19
         MId2CVA/czXf1sPvt4xLfpYObBzWZ1bVa99Ahj0F/vD8517aSUsXrebxNla/bu4wczY+
         eL2VrCR57vtie9JGp9QNt2UHDahalATbj9UsyavjYUtrfzoiZ/k7ZUTuYu24/lMw742N
         AjZdLarbRbqs7iR3qnrJg5LBZz7ZdWFELiS8EChC/uGo1ax+4ZTvl3fKnnPttJvN2i64
         bOetPFXJ0qMxzIjQTddSzAhzJ/bi6wi6+cY9v5yNZNWEHEywbIH7x4TzFJ5fFtdpmYpe
         QyAg==
X-Gm-Message-State: AOAM532BvQkm7bG3Oq+1l2E36AvcpvQiyH3zhDjTeV+QslmNrwjKS4B+
	7DAflRQYfOaByCAWkZSdzqSGt0sgztY=
X-Google-Smtp-Source: ABdhPJwUMtqbdKj7tPlqBYAi6GO6apj1mPjTn0KLTfJHKHqHLlf95/1jvy3rpfo1EI4NJfe7MrnMBA==
X-Received: by 2002:a1c:7d54:: with SMTP id y81mr4884877wmc.110.1594911348538;
        Thu, 16 Jul 2020 07:55:48 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id h13sm9379361wml.42.2020.07.16.07.55.47
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 07:55:48 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/6] arm-toolchain/arm-binary-toolchain: more QA skipping
Date: Thu, 16 Jul 2020 15:55:40 +0100
Message-Id: <20200716145542.232165-4-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200716145542.232165-1-ross@burtonini.com>
References: <20200716145542.232165-1-ross@burtonini.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

When building nativesdk or target forms of these recipes more QA tests
are executed, which produce more warnings. As these recipes are quite
special, skip more tests:

- arch, as we ship ilp32 binaries in aarch64 packages
- dev-so, as the entire toolchain is put into a single package

Change-Id: Ib72b224749642c912278f0d5601fe04b30afc25f
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../external-arm-toolchain/arm-binary-toolchain.inc             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc
index d099481..2fbabfb 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc
@@ -13,7 +13,7 @@ do_install() {
     done
 }
 
-INSANE_SKIP_${PN} = "already-stripped libdir staticdev file-rdeps"
+INSANE_SKIP_${PN} = "already-stripped libdir staticdev file-rdeps arch dev-so"
 
 INHIBIT_SYSROOT_STRIP = "1"
 INHIBIT_PACKAGE_STRIP = "1"
-- 
2.26.2

