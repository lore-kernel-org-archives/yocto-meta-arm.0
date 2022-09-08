Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23C37C54EE9
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 13:14:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.5238.1662642884458274132
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 08 Sep 2022 06:14:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81C4414BF;
	Thu,  8 Sep 2022 06:14:49 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD8323F7B4;
	Thu,  8 Sep 2022 06:14:42 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm/optee-os: add backport of the rwx segments patch for
 optee-os 3.10
Date: Thu,  8 Sep 2022 14:14:41 +0100
Message-Id: <20220908131441.264455-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 08 Sep 2022 13:14:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3745

The existing 0008-no-warn-rwx-segments.patch doesn't apply cleanly to
3.10, so backport it and add to a version-specific directory.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../3.10/0008-no-warn-rwx-segments.patch      | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 meta-arm/recipes-security/optee/optee-os/3.10/0008-no=
-warn-rwx-segments.patch

diff --git a/meta-arm/recipes-security/optee/optee-os/3.10/0008-no-warn-r=
wx-segments.patch b/meta-arm/recipes-security/optee/optee-os/3.10/0008-no=
-warn-rwx-segments.patch
new file mode 100644
index 00000000..32be6c25
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os/3.10/0008-no-warn-rwx-segm=
ents.patch
@@ -0,0 +1,67 @@
+Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
+Upstream-Status: Backport [https://github.com/OP-TEE/optee_os/pull/5474]
+
+From 293d2a54fec962f2465b6e60e0fbd41bdb377c4f Mon Sep 17 00:00:00 2001
+From: Jerome Forissier <jerome.forissier@linaro.org>
+Date: Fri, 5 Aug 2022 09:48:03 +0200
+Subject: [PATCH] core: link: add --no-warn-rwx-segments
+
+binutils ld.bfd generates one RWX LOAD segment by merging several sectio=
ns
+with mixed R/W/X attributes (.text, .rodata, .data). After version 2.38 =
it
+also warns by default when that happens [1], which breaks the build due =
to
+--fatal-warnings. The RWX segment is not a problem for the TEE core, sin=
ce
+that information is not used to set memory permissions. Therefore, silen=
ce
+the warning.
+
+Link: [1] https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3D=
ba951afb99912da01a6e8434126b8fac7aa75107
+Link: https://sourceware.org/bugzilla/show_bug.cgi?id=3D29448
+Reported-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
+Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
+Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
+---
+ core/arch/arm/kernel/link.mk | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/core/arch/arm/kernel/link.mk b/core/arch/arm/kernel/link.mk
+index 69375ad6..bea239cf 100644
+--- a/core/arch/arm/kernel/link.mk
++++ b/core/arch/arm/kernel/link.mk
+@@ -17,6 +17,7 @@ link-ldflags +=3D -T $(link-script-pp) -Map=3D$(link-o=
ut-dir)/tee.map
+ link-ldflags +=3D --sort-section=3Dalignment
+ link-ldflags +=3D --fatal-warnings
+ link-ldflags +=3D --gc-sections
++link-ldflags +=3D $(call ld-option,--no-warn-rwx-segments)
+=20
+ link-ldadd  =3D $(LDADD)
+ link-ldadd +=3D $(libdeps)
+@@ -37,6 +38,7 @@ link-script-cppflags :=3D \
+ 		$(cppflagscore))
+=20
+ ldargs-all_objs :=3D -T $(link-script-dummy) --no-check-sections \
++		   $(call ld-option,--no-warn-rwx-segments) \
+ 		   $(link-objs) $(link-ldadd) $(libgcccore)
+ cleanfiles +=3D $(link-out-dir)/all_objs.o
+ $(link-out-dir)/all_objs.o: $(objs) $(libdeps) $(MAKEFILE_LIST)
+@@ -49,7 +51,8 @@ $(link-out-dir)/unpaged_entries.txt: $(link-out-dir)/a=
ll_objs.o
+ 	$(q)$(NMcore) $< | \
+ 		$(AWK) '/ ____keep_pager/ { printf "-u%s ", $$3 }' > $@
+=20
+-unpaged-ldargs =3D -T $(link-script-dummy) --no-check-sections --gc-sec=
tions
++unpaged-ldargs :=3D -T $(link-script-dummy) --no-check-sections --gc-se=
ctions \
++		 $(call ld-option,--no-warn-rwx-segments)
+ unpaged-ldadd :=3D $(objs) $(link-ldadd) $(libgcccore)
+ cleanfiles +=3D $(link-out-dir)/unpaged.o
+ $(link-out-dir)/unpaged.o: $(link-out-dir)/unpaged_entries.txt
+@@ -77,7 +80,8 @@ $(link-out-dir)/init_entries.txt: $(link-out-dir)/all_=
objs.o
+ 	$(q)$(NMcore) $< | \
+ 		$(AWK) '/ ____keep_init/ { printf "-u%s ", $$3 }' > $@
+=20
+-init-ldargs :=3D -T $(link-script-dummy) --no-check-sections --gc-secti=
ons
++init-ldargs :=3D -T $(link-script-dummy) --no-check-sections --gc-secti=
ons \
++	       $(call ld-option,--no-warn-rwx-segments)
+ init-ldadd :=3D $(link-objs-init) $(link-out-dir)/version.o  $(link-lda=
dd) \
+ 	      $(libgcccore)
+ cleanfiles +=3D $(link-out-dir)/init.o
+--=20
+2.34.1
+
--=20
2.34.1


