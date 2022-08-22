Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 702DDC32772
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 16:55:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.20646.1661187310370383571
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Aug 2022 09:55:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 081881516;
	Mon, 22 Aug 2022 09:55:13 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 38EE53F70D;
	Mon, 22 Aug 2022 09:55:09 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 3/3] arm/optee-os: backport RWX permission error patch
Date: Mon, 22 Aug 2022 17:55:05 +0100
Message-Id: <20220822165505.3603138-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822165505.3603138-1-ross.burton@arm.com>
References: <20220822165505.3603138-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 22 Aug 2022 16:55:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3710

From: Anton Antonov <Anton.Antonov@arm.com>

Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
---
 meta-arm/recipes-security/optee/optee-os.inc  |  1 +
 .../optee-os/0008-no-warn-rwx-segments.patch  | 64 +++++++++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 meta-arm/recipes-security/optee/optee-os/0008-no-warn=
-rwx-segments.patch

diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/reci=
pes-security/optee/optee-os.inc
index fe0f8b0a..a03ea6a3 100644
--- a/meta-arm/recipes-security/optee/optee-os.inc
+++ b/meta-arm/recipes-security/optee/optee-os.inc
@@ -19,6 +19,7 @@ SRC_URI =3D "git://github.com/OP-TEE/optee_os.git;branc=
h=3Dmaster;protocol=3Dhttps"
 SRC_URI:append =3D " \
     file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
     file://0007-allow-setting-sysroot-for-clang.patch \
+    file://0008-no-warn-rwx-segments.patch \
    "
=20
 S =3D "${WORKDIR}/git"
diff --git a/meta-arm/recipes-security/optee/optee-os/0008-no-warn-rwx-se=
gments.patch b/meta-arm/recipes-security/optee/optee-os/0008-no-warn-rwx-=
segments.patch
new file mode 100644
index 00000000..1dd70b31
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os/0008-no-warn-rwx-segments.=
patch
@@ -0,0 +1,64 @@
+Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
+Upstream-Status: Backport [https://github.com/OP-TEE/optee_os/pull/5474]
+
+From 0b8a917fa51a366806edc0f04b88cd23b24098c4 Mon Sep 17 00:00:00 2001
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
+index 7eed333a32..c39d43cbfc 100644
+--- a/core/arch/arm/kernel/link.mk
++++ b/core/arch/arm/kernel/link.mk
+@@ -31,6 +31,7 @@ link-ldflags +=3D -T $(link-script-pp) -Map=3D$(link-o=
ut-dir)/tee.map
+ link-ldflags +=3D --sort-section=3Dalignment
+ link-ldflags +=3D --fatal-warnings
+ link-ldflags +=3D --gc-sections
++link-ldflags +=3D $(call ld-option,--no-warn-rwx-segments)
+=20
+ link-ldadd  =3D $(LDADD)
+ link-ldadd +=3D $(ldflags-external)
+@@ -55,6 +56,7 @@ link-script-cppflags :=3D \
+ 		$(cppflagscore))
+=20
+ ldargs-all_objs :=3D -T $(link-script-dummy) --no-check-sections \
++		   $(call ld-option,--no-warn-rwx-segments) \
+ 		   $(link-objs) $(link-ldadd) $(libgcccore)
+ cleanfiles +=3D $(link-out-dir)/all_objs.o
+ $(link-out-dir)/all_objs.o: $(objs) $(libdeps) $(MAKEFILE_LIST)
+@@ -67,7 +69,8 @@ $(link-out-dir)/unpaged_entries.txt: $(link-out-dir)/a=
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
+@@ -95,7 +98,8 @@ $(link-out-dir)/init_entries.txt: $(link-out-dir)/all_=
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
--=20
2.34.1


