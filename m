Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.7698.1593552224138670580
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Jun 2020 14:23:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=ZRhnHFry;
 spf=pass (domain: burtonini.com, ip: 209.85.221.66, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f66.google.com with SMTP id b6so21525268wrs.11
        for <meta-arm@lists.yoctoproject.org>; Tue, 30 Jun 2020 14:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u99Sk0kPCUaKwz54aCdp4w6pwTIxBWPgkjIRW4PIaWs=;
        b=ZRhnHFryXhvxF1Z26q+C9yxtkyChwe0hM8rPgTfGbriBbekPyNcxAwscSbG8/z9Ljt
         58xvRZZ8Scvwi8cQP4oF9ZCaUKHqDB4Gd+UjgwwtwfYbEIfe+44Oqg2/MzO6ns+S5AJn
         OylHom+8nFnkRfpdoRtubQZ9BDfHCkzRdp3V+vA8hDFaa7xjZOd8fwnB/sZ4sn09v2cc
         QYCnIJ5ly+JpohtUwjpodLbZCRRFK6pR7ge6iSfk8u915HKyHISL8hhh3TRl6Nos9Mxt
         q4Hw4a/gq7M9BxOn4y8YzI76lc9wwlnrWiJkWzB2OshRIFLc1X4ECjaiZADhM755newG
         4f6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u99Sk0kPCUaKwz54aCdp4w6pwTIxBWPgkjIRW4PIaWs=;
        b=cTqTZNPHxfSHejxk3CYCPB2DsogZGj/nn3+0AkbHxOELmIpW22ZEZmDznGU0P1lRYt
         0KKvW4Vbl33Y+EqYOPDB0V75TVjiAuKScpSwDwfmgLqVZ3i1sW4b9hQ1d7viAOIbUMW6
         RENnQ49v9mTwI3Fn6aZjfhGBYUpBoo7FcSuOnwLdKh2gi1vg153Um4dGm8rEkbNsKdyu
         LfLv1rgkrM2Bds1fiZ2qsdOxAxeZUBPFUuKq3zVidb4O8/FpRuLWM4YPakoDzjwfC916
         mGw6GsTUtSwKsbZrDr7YXAxrCUVWB59js6uDXxIRlGRQgHtfdBvrPNVPXjsEVtofcOn2
         jsCw==
X-Gm-Message-State: AOAM533pb0886p9vW3xFyeME8mHBJTWcdk/vqVSitAPIDP/jcWaYW2BG
	bu/xdW3Orxpks20jki0jR/xWYrUcbllW9tTS
X-Google-Smtp-Source: ABdhPJwlHFVeCG3R71UrGXDA2gCLF35fI3YrnCCWj+zYDrMD376fKtcDZK/9UpO9C+SVZVv7SROHeg==
X-Received: by 2002:adf:dfd1:: with SMTP id q17mr22141107wrn.94.1593552221669;
        Tue, 30 Jun 2020 14:23:41 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from localhost.localdomain (35.106.2.81.in-addr.arpa. [81.2.106.35])
        by smtp.gmail.com with ESMTPSA id l17sm4706845wmh.14.2020.06.30.14.23.40
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Jun 2020 14:23:41 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] linux-linaro-arm_5.4: fix build of Perf with new BFD
Date: Tue, 30 Jun 2020 22:23:35 +0100
Message-Id: <20200630212335.36096-1-ross@burtonini.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

Change-Id: Ice129ecddc17c3c24e177cf4f2d3445daeb6b455
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../linux-linaro-arm-5.4/fix-bfd-link.patch   | 60 +++++++++++++++++++
 .../linux/linux-linaro-arm_5.4.bb             |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/fix-bfd-link.patch

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/fix-bfd-link.patch b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/fix-bfd-link.patch
new file mode 100644
index 0000000..63d4fda
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/fix-bfd-link.patch
@@ -0,0 +1,60 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 0ada120c883d4f1f6aafd01cf0fbb10d8bbba015 Mon Sep 17 00:00:00 2001
+From: Changbin Du <changbin.du@gmail.com>
+Date: Tue, 28 Jan 2020 23:29:38 +0800
+Subject: [PATCH] perf: Make perf able to build with latest libbfd
+
+libbfd has changed the bfd_section_* macros to inline functions
+bfd_section_<field> since 2019-09-18. See below two commits:
+  o http://www.sourceware.org/ml/gdb-cvs/2019-09/msg00064.html
+  o https://www.sourceware.org/ml/gdb-cvs/2019-09/msg00072.html
+
+This fix make perf able to build with both old and new libbfd.
+
+Signed-off-by: Changbin Du <changbin.du@gmail.com>
+Acked-by: Jiri Olsa <jolsa@redhat.com>
+Cc: Peter Zijlstra <peterz@infradead.org>
+Link: http://lore.kernel.org/lkml/20200128152938.31413-1-changbin.du@gmail.com
+Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
+---
+ tools/perf/util/srcline.c | 16 +++++++++++++++-
+ 1 file changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/tools/perf/util/srcline.c b/tools/perf/util/srcline.c
+index 6ccf6f6d09df9..5b7d6c16d33fe 100644
+--- a/tools/perf/util/srcline.c
++++ b/tools/perf/util/srcline.c
+@@ -193,16 +193,30 @@ static void find_address_in_section(bfd *abfd, asection *section, void *data)
+ 	bfd_vma pc, vma;
+ 	bfd_size_type size;
+ 	struct a2l_data *a2l = data;
++	flagword flags;
+ 
+ 	if (a2l->found)
+ 		return;
+ 
+-	if ((bfd_get_section_flags(abfd, section) & SEC_ALLOC) == 0)
++#ifdef bfd_get_section_flags
++	flags = bfd_get_section_flags(abfd, section);
++#else
++	flags = bfd_section_flags(section);
++#endif
++	if ((flags & SEC_ALLOC) == 0)
+ 		return;
+ 
+ 	pc = a2l->addr;
++#ifdef bfd_get_section_vma
+ 	vma = bfd_get_section_vma(abfd, section);
++#else
++	vma = bfd_section_vma(section);
++#endif
++#ifdef bfd_get_section_size
+ 	size = bfd_get_section_size(section);
++#else
++	size = bfd_section_size(section);
++#endif
+ 
+ 	if (pc < vma || pc >= vma + size)
+ 		return;
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
index d2cd127..516573a 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
@@ -13,6 +13,7 @@ KBRANCH = "n1sdp"
 
 SRC_URI = "git://git.linaro.org/landing-teams/working/arm/kernel-release.git;nobranch=1 \
            file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch \
+           file://fix-bfd-link.patch \
           "
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
-- 
2.24.3 (Apple Git-128)

