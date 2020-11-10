Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.29552.1605023543657152195
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 Nov 2020 07:52:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 107F31396
	for <meta-arm@lists.yoctoproject.org>; Tue, 10 Nov 2020 07:52:23 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B0BBC3F718
	for <meta-arm@lists.yoctoproject.org>; Tue, 10 Nov 2020 07:52:22 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/6] arm-bsp/linux-stable-5.6: fix build of perf
Date: Tue, 10 Nov 2020 15:52:15 +0000
Message-Id: <20201110155216.1313151-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201110155216.1313151-1-ross.burton@arm.com>
References: <20201110155216.1313151-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Backport a number of patches from master to fix the build of perf.

Change-Id: I0063b242116a15ba727ad6cf4c9b3abed61600ff
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...ceevent-Fix-build-with-binutils-2.35.patch | 38 ++++++++++
 ...-definition-of-traceid_list-global-v.patch | 69 +++++++++++++++++++
 .../linux/linux-stable_5.6%.bbappend          |  5 ++
 3 files changed, 112 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-stable-5.6/00=
01-libtraceevent-Fix-build-with-binutils-2.35.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-stable-5.6/00=
02-perf-cs-etm-Move-definition-of-traceid_list-global-v.patch

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-stable-5.6/0001-libt=
raceevent-Fix-build-with-binutils-2.35.patch b/meta-arm-bsp/recipes-kerne=
l/linux/linux-stable-5.6/0001-libtraceevent-Fix-build-with-binutils-2.35.=
patch
new file mode 100644
index 0000000..f44a4b4
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-stable-5.6/0001-libtraceeve=
nt-Fix-build-with-binutils-2.35.patch
@@ -0,0 +1,38 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From c139f8e8dc8a5388f63bf2cf1c17ee114dcdb919 Mon Sep 17 00:00:00 2001
+From: Ben Hutchings <ben@decadent.org.uk>
+Date: Sat, 25 Jul 2020 02:06:23 +0100
+Subject: [PATCH 1/2] libtraceevent: Fix build with binutils 2.35
+
+In binutils 2.35, 'nm -D' changed to show symbol versions along with
+symbol names, with the usual @@ separator.  When generating
+libtraceevent-dynamic-list we need just the names, so strip off the
+version suffix if present.
+
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+Tested-by: Salvatore Bonaccorso <carnil@debian.org>
+Reviewed-by: Steven Rostedt <rostedt@goodmis.org>
+Cc: linux-trace-devel@vger.kernel.org
+Cc: stable@vger.kernel.org
+Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
+---
+ tools/lib/traceevent/plugins/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/lib/traceevent/plugins/Makefile b/tools/lib/traceeven=
t/plugins/Makefile
+index 349bb81482ab..680d883efe05 100644
+--- a/tools/lib/traceevent/plugins/Makefile
++++ b/tools/lib/traceevent/plugins/Makefile
+@@ -197,7 +197,7 @@ define do_generate_dynamic_list_file
+ 	xargs echo "U w W" | tr 'w ' 'W\n' | sort -u | xargs echo`;\
+ 	if [ "$$symbol_type" =3D "U W" ];then				\
+ 		(echo '{';                                              \
+-		$(NM) -u -D $1 | awk 'NF>1 {print "\t"$$2";"}' | sort -u;\
++		$(NM) -u -D $1 | awk 'NF>1 {sub("@.*", "", $$2); print "\t"$$2";"}' |=
 sort -u;\
+ 		echo '};';                                              \
+ 		) > $2;                                                 \
+ 	else                                                            \
+--=20
+2.25.1
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-stable-5.6/0002-perf=
-cs-etm-Move-definition-of-traceid_list-global-v.patch b/meta-arm-bsp/rec=
ipes-kernel/linux/linux-stable-5.6/0002-perf-cs-etm-Move-definition-of-tr=
aceid_list-global-v.patch
new file mode 100644
index 0000000..0e4e362
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-stable-5.6/0002-perf-cs-etm=
-Move-definition-of-traceid_list-global-v.patch
@@ -0,0 +1,69 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 9e752121f8d4edcde6f3fb466593eeaf6d8306b9 Mon Sep 17 00:00:00 2001
+From: Leo Yan <leo.yan@linaro.org>
+Date: Tue, 5 May 2020 21:36:42 +0800
+Subject: [PATCH 2/2] perf cs-etm: Move definition of 'traceid_list' glob=
al
+ variable from header file
+
+The variable 'traceid_list' is defined in the header file cs-etm.h,
+if multiple C files include cs-etm.h the compiler might complaint for
+multiple definition of 'traceid_list'.
+
+To fix multiple definition error, move the definition of 'traceid_list'
+into cs-etm.c.
+
+Fixes: cd8bfd8c973e ("perf tools: Add processing of coresight metadata")
+Reported-by: Thomas Backlund <tmb@mageia.org>
+Signed-off-by: Leo Yan <leo.yan@linaro.org>
+Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
+Reviewed-by: Mike Leach <mike.leach@linaro.org>
+Tested-by: Mike Leach <mike.leach@linaro.org>
+Tested-by: Thomas Backlund <tmb@mageia.org>
+Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
+Cc: Jiri Olsa <jolsa@redhat.com>
+Cc: Mark Rutland <mark.rutland@arm.com>
+Cc: Namhyung Kim <namhyung@kernel.org>
+Cc: Peter Zijlstra <peterz@infradead.org>
+Cc: Suzuki Poulouse <suzuki.poulose@arm.com>
+Cc: Tor Jeremiassen <tor@ti.com>
+Cc: linux-arm-kernel@lists.infradead.org
+Link: http://lore.kernel.org/lkml/20200505133642.4756-1-leo.yan@linaro.o=
rg
+Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
+---
+ tools/perf/util/cs-etm.c | 3 +++
+ tools/perf/util/cs-etm.h | 3 ---
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
+index 5471045ebf5c..4d8efe96015b 100644
+--- a/tools/perf/util/cs-etm.c
++++ b/tools/perf/util/cs-etm.c
+@@ -94,6 +94,9 @@ struct cs_etm_queue {
+ 	struct cs_etm_traceid_queue **traceid_queues;
+ };
+=20
++/* RB tree for quick conversion between traceID and metadata pointers *=
/
++static struct intlist *traceid_list;
++
+ static int cs_etm__update_queues(struct cs_etm_auxtrace *etm);
+ static int cs_etm__process_queues(struct cs_etm_auxtrace *etm);
+ static int cs_etm__process_timeless_queues(struct cs_etm_auxtrace *etm,
+diff --git a/tools/perf/util/cs-etm.h b/tools/perf/util/cs-etm.h
+index 650ecc2a6349..4ad925d6d799 100644
+--- a/tools/perf/util/cs-etm.h
++++ b/tools/perf/util/cs-etm.h
+@@ -114,9 +114,6 @@ enum cs_etm_isa {
+ 	CS_ETM_ISA_T32,
+ };
+=20
+-/* RB tree for quick conversion between traceID and metadata pointers *=
/
+-struct intlist *traceid_list;
+-
+ struct cs_etm_queue;
+=20
+ struct cs_etm_packet {
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-stable_5.6%.bbappend=
 b/meta-arm-bsp/recipes-kernel/linux/linux-stable_5.6%.bbappend
index 3793fad..47c51e3 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-stable_5.6%.bbappend
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-stable_5.6%.bbappend
@@ -1,3 +1,8 @@
+FILESEXTRAPATHS_prepend :=3D "${THISDIR}/linux-stable-5.6:"
+
+SRC_URI_append =3D " file://0001-libtraceevent-Fix-build-with-binutils-2=
.35.patch \
+                   file://0002-perf-cs-etm-Move-definition-of-traceid_li=
st-global-v.patch"
+
 #
 # Corstone700 KMACHINE
 #
--=20
2.25.1

