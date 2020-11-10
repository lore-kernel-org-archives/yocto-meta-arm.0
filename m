Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.29553.1605023543875140565
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 Nov 2020 07:52:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96F8D139F
	for <meta-arm@lists.yoctoproject.org>; Tue, 10 Nov 2020 07:52:23 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4364A3F718
	for <meta-arm@lists.yoctoproject.org>; Tue, 10 Nov 2020 07:52:23 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 6/6] arm-bsp/linux-stable-5.7: backport a patch to fix CoreSight builds
Date: Tue, 10 Nov 2020 15:52:16 +0000
Message-Id: <20201110155216.1313151-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201110155216.1313151-1-ross.burton@arm.com>
References: <20201110155216.1313151-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Backport a patch from master to fix builds of perf with CoreSight
enabled.

Change-Id: Iaf4f8c4a188c898bde9dc2a45df8609c6c825eea
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../linux-stable-5.7/coresight-traceid.patch  | 71 +++++++++++++++++++
 .../linux/linux-stable_5.7%.bbappend          |  3 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-stable-5.7/co=
resight-traceid.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-stable_5.7%.b=
bappend

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-stable-5.7/coresight=
-traceid.patch b/meta-arm-bsp/recipes-kernel/linux/linux-stable-5.7/cores=
ight-traceid.patch
new file mode 100644
index 0000000..f72e59d
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-stable-5.7/coresight-tracei=
d.patch
@@ -0,0 +1,71 @@
+Fix the build with coresight enabled.
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From d5d9bc542a53b3fa3b0272090b152303cf4a57d9 Mon Sep 17 00:00:00 2001
+From: Leo Yan <leo.yan@linaro.org>
+Date: Tue, 5 May 2020 21:36:42 +0800
+Subject: [PATCH] perf cs-etm: Move definition of 'traceid_list' global
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
+index 62d2f9b9ce1b..381d9708e9bd 100644
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
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-stable_5.7%.bbappend=
 b/meta-arm-bsp/recipes-kernel/linux/linux-stable_5.7%.bbappend
new file mode 100644
index 0000000..797c22d
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-stable_5.7%.bbappend
@@ -0,0 +1,3 @@
+FILESEXTRAPATHS_prepend :=3D "${THISDIR}/linux-stable-5.7:"
+
+SRC_URI_append =3D " file://coresight-traceid.patch"
--=20
2.25.1

