Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B475DC433F5
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 16:30:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.6063.1643041817196365185
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Jan 2022 08:30:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D72D3D6E
	for <meta-arm@lists.yoctoproject.org>; Mon, 24 Jan 2022 08:30:16 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 832133F793
	for <meta-arm@lists.yoctoproject.org>; Mon, 24 Jan 2022 08:30:16 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/4] arm-bsp/linux-yocto: remove old 5.6 recipe
Date: Mon, 24 Jan 2022 16:30:11 +0000
Message-Id: <20220124163012.3796553-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124163012.3796553-1-ross.burton@arm.com>
References: <20220124163012.3796553-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 24 Jan 2022 16:30:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2900

This was only used by Corstone 700, so is redundant now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...ceevent-Fix-build-with-binutils-2.35.patch | 38 ----------
 ...-definition-of-traceid_list-global-v.patch | 69 -------------------
 .../linux/linux-yocto_5.6%.bbappend           |  4 --
 .../recipes-kernel/linux/linux-yocto_5.6.bb   | 22 ------
 4 files changed, 133 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.6/000=
1-libtraceevent-Fix-build-with-binutils-2.35.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.6/000=
2-perf-cs-etm-Move-definition-of-traceid_list-global-v.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6%.bb=
append
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6.bb

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.6/0001-libtr=
aceevent-Fix-build-with-binutils-2.35.patch b/meta-arm-bsp/recipes-kernel=
/linux/linux-yocto-5.6/0001-libtraceevent-Fix-build-with-binutils-2.35.pa=
tch
deleted file mode 100644
index f44a4b49..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.6/0001-libtraceeven=
t-Fix-build-with-binutils-2.35.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From c139f8e8dc8a5388f63bf2cf1c17ee114dcdb919 Mon Sep 17 00:00:00 2001
-From: Ben Hutchings <ben@decadent.org.uk>
-Date: Sat, 25 Jul 2020 02:06:23 +0100
-Subject: [PATCH 1/2] libtraceevent: Fix build with binutils 2.35
-
-In binutils 2.35, 'nm -D' changed to show symbol versions along with
-symbol names, with the usual @@ separator.  When generating
-libtraceevent-dynamic-list we need just the names, so strip off the
-version suffix if present.
-
-Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
-Tested-by: Salvatore Bonaccorso <carnil@debian.org>
-Reviewed-by: Steven Rostedt <rostedt@goodmis.org>
-Cc: linux-trace-devel@vger.kernel.org
-Cc: stable@vger.kernel.org
-Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
----
- tools/lib/traceevent/plugins/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/lib/traceevent/plugins/Makefile b/tools/lib/traceeven=
t/plugins/Makefile
-index 349bb81482ab..680d883efe05 100644
---- a/tools/lib/traceevent/plugins/Makefile
-+++ b/tools/lib/traceevent/plugins/Makefile
-@@ -197,7 +197,7 @@ define do_generate_dynamic_list_file
- 	xargs echo "U w W" | tr 'w ' 'W\n' | sort -u | xargs echo`;\
- 	if [ "$$symbol_type" =3D "U W" ];then				\
- 		(echo '{';                                              \
--		$(NM) -u -D $1 | awk 'NF>1 {print "\t"$$2";"}' | sort -u;\
-+		$(NM) -u -D $1 | awk 'NF>1 {sub("@.*", "", $$2); print "\t"$$2";"}' |=
 sort -u;\
- 		echo '};';                                              \
- 		) > $2;                                                 \
- 	else                                                            \
---=20
-2.25.1
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.6/0002-perf-=
cs-etm-Move-definition-of-traceid_list-global-v.patch b/meta-arm-bsp/reci=
pes-kernel/linux/linux-yocto-5.6/0002-perf-cs-etm-Move-definition-of-trac=
eid_list-global-v.patch
deleted file mode 100644
index 0e4e362a..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.6/0002-perf-cs-etm-=
Move-definition-of-traceid_list-global-v.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 9e752121f8d4edcde6f3fb466593eeaf6d8306b9 Mon Sep 17 00:00:00 2001
-From: Leo Yan <leo.yan@linaro.org>
-Date: Tue, 5 May 2020 21:36:42 +0800
-Subject: [PATCH 2/2] perf cs-etm: Move definition of 'traceid_list' glob=
al
- variable from header file
-
-The variable 'traceid_list' is defined in the header file cs-etm.h,
-if multiple C files include cs-etm.h the compiler might complaint for
-multiple definition of 'traceid_list'.
-
-To fix multiple definition error, move the definition of 'traceid_list'
-into cs-etm.c.
-
-Fixes: cd8bfd8c973e ("perf tools: Add processing of coresight metadata")
-Reported-by: Thomas Backlund <tmb@mageia.org>
-Signed-off-by: Leo Yan <leo.yan@linaro.org>
-Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
-Reviewed-by: Mike Leach <mike.leach@linaro.org>
-Tested-by: Mike Leach <mike.leach@linaro.org>
-Tested-by: Thomas Backlund <tmb@mageia.org>
-Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
-Cc: Jiri Olsa <jolsa@redhat.com>
-Cc: Mark Rutland <mark.rutland@arm.com>
-Cc: Namhyung Kim <namhyung@kernel.org>
-Cc: Peter Zijlstra <peterz@infradead.org>
-Cc: Suzuki Poulouse <suzuki.poulose@arm.com>
-Cc: Tor Jeremiassen <tor@ti.com>
-Cc: linux-arm-kernel@lists.infradead.org
-Link: http://lore.kernel.org/lkml/20200505133642.4756-1-leo.yan@linaro.o=
rg
-Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
----
- tools/perf/util/cs-etm.c | 3 +++
- tools/perf/util/cs-etm.h | 3 ---
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
-index 5471045ebf5c..4d8efe96015b 100644
---- a/tools/perf/util/cs-etm.c
-+++ b/tools/perf/util/cs-etm.c
-@@ -94,6 +94,9 @@ struct cs_etm_queue {
- 	struct cs_etm_traceid_queue **traceid_queues;
- };
-=20
-+/* RB tree for quick conversion between traceID and metadata pointers *=
/
-+static struct intlist *traceid_list;
-+
- static int cs_etm__update_queues(struct cs_etm_auxtrace *etm);
- static int cs_etm__process_queues(struct cs_etm_auxtrace *etm);
- static int cs_etm__process_timeless_queues(struct cs_etm_auxtrace *etm,
-diff --git a/tools/perf/util/cs-etm.h b/tools/perf/util/cs-etm.h
-index 650ecc2a6349..4ad925d6d799 100644
---- a/tools/perf/util/cs-etm.h
-+++ b/tools/perf/util/cs-etm.h
-@@ -114,9 +114,6 @@ enum cs_etm_isa {
- 	CS_ETM_ISA_T32,
- };
-=20
--/* RB tree for quick conversion between traceID and metadata pointers *=
/
--struct intlist *traceid_list;
--
- struct cs_etm_queue;
-=20
- struct cs_etm_packet {
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6%.bbappend =
b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6%.bbappend
deleted file mode 100644
index cf3af8a2..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6%.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/linux-yocto-5.6:"
-
-SRC_URI:append =3D " file://0001-libtraceevent-Fix-build-with-binutils-2=
.35.patch \
-                   file://0002-perf-cs-etm-Move-definition-of-traceid_li=
st-global-v.patch"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6.bb b/meta-=
arm-bsp/recipes-kernel/linux/linux-yocto_5.6.bb
deleted file mode 100644
index 9b536c9e..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-KBRANCH ?=3D "v5.6/standard/base"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-SRCREV_machine =3D "cd5b55b99dab4da10ffd084f00f2ba088a74f45f"
-SRCREV_meta =3D "b152cd93ea7046a835c869a76085aefdb6ce7421"
-
-SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;name=3Dmachine;b=
ranch=3D${KBRANCH}; \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-5.6;destsuffix=3D${KMETA}"
-
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
-LINUX_VERSION =3D "5.6.19"
-
-DEPENDS +=3D "openssl-native util-linux-native"
-
-PV =3D "${LINUX_VERSION}+git${SRCPV}"
-
-KMETA =3D "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL =3D "1"
-
-# Functionality flags
-KERNEL_FEATURES:append =3D " ${KERNEL_EXTRA_FEATURES}"
--=20
2.25.1


