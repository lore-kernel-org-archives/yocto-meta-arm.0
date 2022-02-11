Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95951C4332F
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 10:55:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.5787.1644576945300822032
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Feb 2022 02:55:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E09591042
	for <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 02:55:44 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09D0E3F73B
	for <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 02:55:43 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] arm-bsp/linux-yocto: remove unused 5.3 kernel
Date: Fri, 11 Feb 2022 10:55:39 +0000
Message-Id: <20220211105539.2483533-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211105539.2483533-1-ross.burton@arm.com>
References: <20220211105539.2483533-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 10:55:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2980

corstone500 was the only user of this and now uses 5.4, so this can be
removed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...-definition-of-traceid_list-global-v.patch |  69 -----
 ..._account-Make-global-variable-static.patch |  43 ----
 ...-some-global-variables-to-fix-build-.patch | 240 ------------------
 ...ceevent-Fix-build-with-binutils-2.35.patch |  39 ---
 ...erf-able-to-build-with-latest-libbfd.patch |  63 -----
 .../linux/linux-yocto_5.3%.bbappend           |   8 -
 .../recipes-kernel/linux/linux-yocto_5.3.bb   |  22 --
 7 files changed, 484 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.3/000=
1-perf-cs-etm-Move-definition-of-traceid_list-global-v.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.3/000=
2-perf-tests-bp_account-Make-global-variable-static.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.3/000=
3-perf-bench-Share-some-global-variables-to-fix-build-.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.3/000=
4-libtraceevent-Fix-build-with-binutils-2.35.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.3/000=
5-perf-Make-perf-able-to-build-with-latest-libbfd.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3%.bb=
append
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3.bb

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.3/0001-perf-=
cs-etm-Move-definition-of-traceid_list-global-v.patch b/meta-arm-bsp/reci=
pes-kernel/linux/linux-yocto-5.3/0001-perf-cs-etm-Move-definition-of-trac=
eid_list-global-v.patch
deleted file mode 100644
index fb1d529a..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.3/0001-perf-cs-etm-=
Move-definition-of-traceid_list-global-v.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 97180026ac37020c920f598fe0820e4e0bf58b22 Mon Sep 17 00:00:00 2001
-From: Leo Yan <leo.yan@linaro.org>
-Date: Tue, 5 May 2020 21:36:42 +0800
-Subject: [PATCH 1/4] perf cs-etm: Move definition of 'traceid_list' glob=
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
-index 3d1c34fc4d68..458195a942ec 100644
---- a/tools/perf/util/cs-etm.c
-+++ b/tools/perf/util/cs-etm.c
-@@ -90,6 +90,9 @@ struct cs_etm_queue {
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
-index bc848fd095f4..2b7cd3a741cd 100644
---- a/tools/perf/util/cs-etm.h
-+++ b/tools/perf/util/cs-etm.h
-@@ -113,9 +113,6 @@ enum cs_etm_isa {
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
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.3/0002-perf-=
tests-bp_account-Make-global-variable-static.patch b/meta-arm-bsp/recipes=
-kernel/linux/linux-yocto-5.3/0002-perf-tests-bp_account-Make-global-vari=
able-static.patch
deleted file mode 100644
index 1a571830..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.3/0002-perf-tests-b=
p_account-Make-global-variable-static.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 30a4e41456dc0d6dcfe55bbf9f5a5302a921b760 Mon Sep 17 00:00:00 2001
-From: Arnaldo Carvalho de Melo <acme@redhat.com>
-Date: Mon, 2 Mar 2020 11:13:19 -0300
-Subject: [PATCH 2/4] perf tests bp_account: Make global variable static
-
-To fix the build with newer gccs, that without this patch exit with:
-
-    LD       /tmp/build/perf/tests/perf-in.o
-  ld: /tmp/build/perf/tests/bp_account.o:/git/perf/tools/perf/tests/bp_a=
ccount.c:22: multiple definition of `the_var'; /tmp/build/perf/tests/bp_s=
ignal.o:/git/perf/tools/perf/tests/bp_signal.c:38: first defined here
-  make[4]: *** [/git/perf/tools/build/Makefile.build:145: /tmp/build/per=
f/tests/perf-in.o] Error 1
-
-First noticed in fedora:rawhide/32 with:
-
-  [perfbuilder@a5ff49d6e6e4 ~]$ gcc --version
-  gcc (GCC) 10.0.1 20200216 (Red Hat 10.0.1-0.8)
-
-Reported-by: Jiri Olsa <jolsa@kernel.org>
-Cc: Adrian Hunter <adrian.hunter@intel.com>
-Cc: Namhyung Kim <namhyung@kernel.org>
-Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
----
- tools/perf/tests/bp_account.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/perf/tests/bp_account.c b/tools/perf/tests/bp_account=
.c
-index 153624e2d0f5..a4c8007d0046 100644
---- a/tools/perf/tests/bp_account.c
-+++ b/tools/perf/tests/bp_account.c
-@@ -22,7 +22,7 @@
- #include "perf.h"
- #include "cloexec.h"
-=20
--volatile long the_var;
-+static volatile long the_var;
-=20
- static noinline int test_function(void)
- {
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.3/0003-perf-=
bench-Share-some-global-variables-to-fix-build-.patch b/meta-arm-bsp/reci=
pes-kernel/linux/linux-yocto-5.3/0003-perf-bench-Share-some-global-variab=
les-to-fix-build-.patch
deleted file mode 100644
index 77a0fe92..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.3/0003-perf-bench-S=
hare-some-global-variables-to-fix-build-.patch
+++ /dev/null
@@ -1,240 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 6990e5524e8953485723fc9f203a43da26cec800 Mon Sep 17 00:00:00 2001
-From: Arnaldo Carvalho de Melo <acme@redhat.com>
-Date: Mon, 2 Mar 2020 12:09:38 -0300
-Subject: [PATCH 3/4] perf bench: Share some global variables to fix buil=
d with
- gcc 10
-
-Noticed with gcc 10 (fedora rawhide) that those variables were not being
-declared as static, so end up with:
-
-  ld: /tmp/build/perf/bench/epoll-wait.o:/git/perf/tools/perf/bench/epol=
l-wait.c:93: multiple definition of `end'; /tmp/build/perf/bench/futex-ha=
sh.o:/git/perf/tools/perf/bench/futex-hash.c:40: first defined here
-  ld: /tmp/build/perf/bench/epoll-wait.o:/git/perf/tools/perf/bench/epol=
l-wait.c:93: multiple definition of `start'; /tmp/build/perf/bench/futex-=
hash.o:/git/perf/tools/perf/bench/futex-hash.c:40: first defined here
-  ld: /tmp/build/perf/bench/epoll-wait.o:/git/perf/tools/perf/bench/epol=
l-wait.c:93: multiple definition of `runtime'; /tmp/build/perf/bench/fute=
x-hash.o:/git/perf/tools/perf/bench/futex-hash.c:40: first defined here
-  ld: /tmp/build/perf/bench/epoll-ctl.o:/git/perf/tools/perf/bench/epoll=
-ctl.c:38: multiple definition of `end'; /tmp/build/perf/bench/futex-hash=
.o:/git/perf/tools/perf/bench/futex-hash.c:40: first defined here
-  ld: /tmp/build/perf/bench/epoll-ctl.o:/git/perf/tools/perf/bench/epoll=
-ctl.c:38: multiple definition of `start'; /tmp/build/perf/bench/futex-ha=
sh.o:/git/perf/tools/perf/bench/futex-hash.c:40: first defined here
-  ld: /tmp/build/perf/bench/epoll-ctl.o:/git/perf/tools/perf/bench/epoll=
-ctl.c:38: multiple definition of `runtime'; /tmp/build/perf/bench/futex-=
hash.o:/git/perf/tools/perf/bench/futex-hash.c:40: first defined here
-  make[4]: *** [/git/perf/tools/build/Makefile.build:145: /tmp/build/per=
f/bench/perf-in.o] Error 1
-
-Prefix those with bench__ and add them to bench/bench.h, so that we can
-share those on the tools needing to access those variables from signal
-handlers.
-
-Acked-by: Thomas Gleixner <tglx@linutronix.de>
-Cc: Adrian Hunter <adrian.hunter@intel.com>
-Cc: Davidlohr Bueso <dave@stgolabs.net>
-Cc: Jiri Olsa <jolsa@kernel.org>
-Cc: Namhyung Kim <namhyung@kernel.org>
-Link: http://lore.kernel.org/lkml/20200303155811.GD13702@kernel.org
-Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
----
- tools/perf/bench/bench.h         |  4 ++++
- tools/perf/bench/epoll-ctl.c     |  7 +++----
- tools/perf/bench/epoll-wait.c    | 11 +++++------
- tools/perf/bench/futex-hash.c    | 12 ++++++------
- tools/perf/bench/futex-lock-pi.c | 11 +++++------
- 5 files changed, 23 insertions(+), 22 deletions(-)
-
-diff --git a/tools/perf/bench/bench.h b/tools/perf/bench/bench.h
-index fddb3ced9db6..4aa6de1aa67d 100644
---- a/tools/perf/bench/bench.h
-+++ b/tools/perf/bench/bench.h
-@@ -2,6 +2,10 @@
- #ifndef BENCH_H
- #define BENCH_H
-=20
-+#include <sys/time.h>
-+
-+extern struct timeval bench__start, bench__end, bench__runtime;
-+
- /*
-  * The madvise transparent hugepage constants were added in glibc
-  * 2.13. For compatibility with older versions of glibc, define these
-diff --git a/tools/perf/bench/epoll-ctl.c b/tools/perf/bench/epoll-ctl.c
-index 2af067859966..8a383c3e0967 100644
---- a/tools/perf/bench/epoll-ctl.c
-+++ b/tools/perf/bench/epoll-ctl.c
-@@ -33,7 +33,6 @@
-=20
- static unsigned int nthreads =3D 0;
- static unsigned int nsecs    =3D 8;
--struct timeval start, end, runtime;
- static bool done, __verbose, randomize;
-=20
- /*
-@@ -92,8 +91,8 @@ static void toggle_done(int sig __maybe_unused,
- {
- 	/* inform all threads that we're done for the day */
- 	done =3D true;
--	gettimeofday(&end, NULL);
--	timersub(&end, &start, &runtime);
-+	gettimeofday(&bench__end, NULL);
-+	timersub(&bench__end, &bench__start, &bench__runtime);
- }
-=20
- static void nest_epollfd(void)
-@@ -359,7 +358,7 @@ int bench_epoll_ctl(int argc, const char **argv)
-=20
- 	threads_starting =3D nthreads;
-=20
--	gettimeofday(&start, NULL);
-+	gettimeofday(&bench__start, NULL);
-=20
- 	do_threads(worker, cpu);
-=20
-diff --git a/tools/perf/bench/epoll-wait.c b/tools/perf/bench/epoll-wait=
.c
-index fe85448abd45..235e3aa28aad 100644
---- a/tools/perf/bench/epoll-wait.c
-+++ b/tools/perf/bench/epoll-wait.c
-@@ -88,7 +88,6 @@
-=20
- static unsigned int nthreads =3D 0;
- static unsigned int nsecs    =3D 8;
--struct timeval start, end, runtime;
- static bool wdone, done, __verbose, randomize, nonblocking;
-=20
- /*
-@@ -274,8 +273,8 @@ static void toggle_done(int sig __maybe_unused,
- {
- 	/* inform all threads that we're done for the day */
- 	done =3D true;
--	gettimeofday(&end, NULL);
--	timersub(&end, &start, &runtime);
-+	gettimeofday(&bench__end, NULL);
-+	timersub(&bench__end, &bench__start, &bench__runtime);
- }
-=20
- static void print_summary(void)
-@@ -285,7 +284,7 @@ static void print_summary(void)
-=20
- 	printf("\nAveraged %ld operations/sec (+- %.2f%%), total secs =3D %d\n=
",
- 	       avg, rel_stddev_stats(stddev, avg),
--	       (int) runtime.tv_sec);
-+	       (int)bench__runtime.tv_sec);
- }
-=20
- static int do_threads(struct worker *worker, struct cpu_map *cpu)
-@@ -477,7 +476,7 @@ int bench_epoll_wait(int argc, const char **argv)
-=20
- 	threads_starting =3D nthreads;
-=20
--	gettimeofday(&start, NULL);
-+	gettimeofday(&bench__start, NULL);
-=20
- 	do_threads(worker, cpu);
-=20
-@@ -517,7 +516,7 @@ int bench_epoll_wait(int argc, const char **argv)
- 		qsort(worker, nthreads, sizeof(struct worker), cmpworker);
-=20
- 	for (i =3D 0; i < nthreads; i++) {
--		unsigned long t =3D worker[i].ops/runtime.tv_sec;
-+		unsigned long t =3D worker[i].ops / bench__runtime.tv_sec;
-=20
- 		update_stats(&throughput_stats, t);
-=20
-diff --git a/tools/perf/bench/futex-hash.c b/tools/perf/bench/futex-hash=
.c
-index a80797763e1f..c7325c5c250a 100644
---- a/tools/perf/bench/futex-hash.c
-+++ b/tools/perf/bench/futex-hash.c
-@@ -36,7 +36,7 @@ static unsigned int nfutexes =3D 1024;
- static bool fshared =3D false, done =3D false, silent =3D false;
- static int futex_flag =3D 0;
-=20
--struct timeval start, end, runtime;
-+struct timeval bench__start, bench__end, bench__runtime;
- static pthread_mutex_t thread_lock;
- static unsigned int threads_starting;
- static struct stats throughput_stats;
-@@ -102,8 +102,8 @@ static void toggle_done(int sig __maybe_unused,
- {
- 	/* inform all threads that we're done for the day */
- 	done =3D true;
--	gettimeofday(&end, NULL);
--	timersub(&end, &start, &runtime);
-+	gettimeofday(&bench__end, NULL);
-+	timersub(&bench__end, &bench__start, &bench__runtime);
- }
-=20
- static void print_summary(void)
-@@ -113,7 +113,7 @@ static void print_summary(void)
-=20
- 	printf("%sAveraged %ld operations/sec (+- %.2f%%), total secs =3D %d\n=
",
- 	       !silent ? "\n" : "", avg, rel_stddev_stats(stddev, avg),
--	       (int) runtime.tv_sec);
-+	       (int)bench__runtime.tv_sec);
- }
-=20
- int bench_futex_hash(int argc, const char **argv)
-@@ -160,7 +160,7 @@ int bench_futex_hash(int argc, const char **argv)
-=20
- 	threads_starting =3D nthreads;
- 	pthread_attr_init(&thread_attr);
--	gettimeofday(&start, NULL);
-+	gettimeofday(&bench__start, NULL);
- 	for (i =3D 0; i < nthreads; i++) {
- 		worker[i].tid =3D i;
- 		worker[i].futex =3D calloc(nfutexes, sizeof(*worker[i].futex));
-@@ -203,7 +203,7 @@ int bench_futex_hash(int argc, const char **argv)
- 	pthread_mutex_destroy(&thread_lock);
-=20
- 	for (i =3D 0; i < nthreads; i++) {
--		unsigned long t =3D worker[i].ops/runtime.tv_sec;
-+		unsigned long t =3D worker[i].ops / bench__runtime.tv_sec;
- 		update_stats(&throughput_stats, t);
- 		if (!silent) {
- 			if (nfutexes =3D=3D 1)
-diff --git a/tools/perf/bench/futex-lock-pi.c b/tools/perf/bench/futex-l=
ock-pi.c
-index d02330a69745..54b23fd79b10 100644
---- a/tools/perf/bench/futex-lock-pi.c
-+++ b/tools/perf/bench/futex-lock-pi.c
-@@ -36,7 +36,6 @@ static bool silent =3D false, multi =3D false;
- static bool done =3D false, fshared =3D false;
- static unsigned int nthreads =3D 0;
- static int futex_flag =3D 0;
--struct timeval start, end, runtime;
- static pthread_mutex_t thread_lock;
- static unsigned int threads_starting;
- static struct stats throughput_stats;
-@@ -63,7 +62,7 @@ static void print_summary(void)
-=20
- 	printf("%sAveraged %ld operations/sec (+- %.2f%%), total secs =3D %d\n=
",
- 	       !silent ? "\n" : "", avg, rel_stddev_stats(stddev, avg),
--	       (int) runtime.tv_sec);
-+	       (int)bench__runtime.tv_sec);
- }
-=20
- static void toggle_done(int sig __maybe_unused,
-@@ -72,8 +71,8 @@ static void toggle_done(int sig __maybe_unused,
- {
- 	/* inform all threads that we're done for the day */
- 	done =3D true;
--	gettimeofday(&end, NULL);
--	timersub(&end, &start, &runtime);
-+	gettimeofday(&bench__end, NULL);
-+	timersub(&bench__end, &bench__start, &bench__runtime);
- }
-=20
- static void *workerfn(void *arg)
-@@ -184,7 +183,7 @@ int bench_futex_lock_pi(int argc, const char **argv)
-=20
- 	threads_starting =3D nthreads;
- 	pthread_attr_init(&thread_attr);
--	gettimeofday(&start, NULL);
-+	gettimeofday(&bench__start, NULL);
-=20
- 	create_threads(worker, thread_attr, cpu);
- 	pthread_attr_destroy(&thread_attr);
-@@ -210,7 +209,7 @@ int bench_futex_lock_pi(int argc, const char **argv)
- 	pthread_mutex_destroy(&thread_lock);
-=20
- 	for (i =3D 0; i < nthreads; i++) {
--		unsigned long t =3D worker[i].ops/runtime.tv_sec;
-+		unsigned long t =3D worker[i].ops / bench__runtime.tv_sec;
-=20
- 		update_stats(&throughput_stats, t);
- 		if (!silent)
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.3/0004-libtr=
aceevent-Fix-build-with-binutils-2.35.patch b/meta-arm-bsp/recipes-kernel=
/linux/linux-yocto-5.3/0004-libtraceevent-Fix-build-with-binutils-2.35.pa=
tch
deleted file mode 100644
index 88711175..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.3/0004-libtraceeven=
t-Fix-build-with-binutils-2.35.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 18fd100d426ea3601dfa6d86b1ee856fe5a02b73 Mon Sep 17 00:00:00 2001
-From: Ben Hutchings <ben@decadent.org.uk>
-Date: Sat, 25 Jul 2020 02:06:23 +0100
-Subject: [PATCH 4/4] libtraceevent: Fix build with binutils 2.35
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
- tools/lib/traceevent/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/lib/traceevent/Makefile b/tools/lib/traceevent/Makefi=
le
-index a39cdd0d890d..983b674df7c1 100644
---- a/tools/lib/traceevent/Makefile
-+++ b/tools/lib/traceevent/Makefile
-@@ -269,7 +269,7 @@ define do_generate_dynamic_list_file
- 	xargs echo "U w W" | tr 'w ' 'W\n' | sort -u | xargs echo`;\
- 	if [ "$$symbol_type" =3D "U W" ];then				\
- 		(echo '{';						\
--		$(NM) -u -D $1 | awk 'NF>1 {print "\t"$$2";"}' | sort -u;\
-+		$(NM) -u -D $1 | awk 'NF>1 {sub("@.*", "", $$2); print "\t"$$2";"}' |=
 sort -u;\
- 		echo '};';						\
- 		) > $2;							\
- 	else								\
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.3/0005-perf-=
Make-perf-able-to-build-with-latest-libbfd.patch b/meta-arm-bsp/recipes-k=
ernel/linux/linux-yocto-5.3/0005-perf-Make-perf-able-to-build-with-latest=
-libbfd.patch
deleted file mode 100644
index 2d1a5e3a..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.3/0005-perf-Make-pe=
rf-able-to-build-with-latest-libbfd.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 46136d414171bbfed5595774e60ac35ba60d5e3b Mon Sep 17 00:00:00 2001
-From: Changbin Du <changbin.du@gmail.com>
-Date: Tue, 28 Jan 2020 23:29:38 +0800
-Subject: [PATCH] perf: Make perf able to build with latest libbfd
-
-libbfd has changed the bfd_section_* macros to inline functions
-bfd_section_<field> since 2019-09-18. See below two commits:
-  o http://www.sourceware.org/ml/gdb-cvs/2019-09/msg00064.html
-  o https://www.sourceware.org/ml/gdb-cvs/2019-09/msg00072.html
-
-This fix make perf able to build with both old and new libbfd.
-
-Signed-off-by: Changbin Du <changbin.du@gmail.com>
-Acked-by: Jiri Olsa <jolsa@redhat.com>
-Cc: Peter Zijlstra <peterz@infradead.org>
-Link: http://lore.kernel.org/lkml/20200128152938.31413-1-changbin.du@gma=
il.com
-Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
----
- tools/perf/util/srcline.c | 16 +++++++++++++++-
- 1 file changed, 15 insertions(+), 1 deletion(-)
-
-diff --git a/tools/perf/util/srcline.c b/tools/perf/util/srcline.c
-index 6ccf6f6d09df..5b7d6c16d33f 100644
---- a/tools/perf/util/srcline.c
-+++ b/tools/perf/util/srcline.c
-@@ -193,16 +193,30 @@ static void find_address_in_section(bfd *abfd, ase=
ction *section, void *data)
- 	bfd_vma pc, vma;
- 	bfd_size_type size;
- 	struct a2l_data *a2l =3D data;
-+	flagword flags;
-=20
- 	if (a2l->found)
- 		return;
-=20
--	if ((bfd_get_section_flags(abfd, section) & SEC_ALLOC) =3D=3D 0)
-+#ifdef bfd_get_section_flags
-+	flags =3D bfd_get_section_flags(abfd, section);
-+#else
-+	flags =3D bfd_section_flags(section);
-+#endif
-+	if ((flags & SEC_ALLOC) =3D=3D 0)
- 		return;
-=20
- 	pc =3D a2l->addr;
-+#ifdef bfd_get_section_vma
- 	vma =3D bfd_get_section_vma(abfd, section);
-+#else
-+	vma =3D bfd_section_vma(section);
-+#endif
-+#ifdef bfd_get_section_size
- 	size =3D bfd_get_section_size(section);
-+#else
-+	size =3D bfd_section_size(section);
-+#endif
-=20
- 	if (pc < vma || pc >=3D vma + size)
- 		return;
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3%.bbappend =
b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3%.bbappend
deleted file mode 100644
index 498ef1d8..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3%.bbappend
+++ /dev/null
@@ -1,8 +0,0 @@
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/linux-yocto-5.3:"
-
-SRC_URI:append =3D " file://0001-perf-cs-etm-Move-definition-of-traceid_=
list-global-v.patch \
-                   file://0002-perf-tests-bp_account-Make-global-variabl=
e-static.patch \
-                   file://0003-perf-bench-Share-some-global-variables-to=
-fix-build-.patch \
-                   file://0004-libtraceevent-Fix-build-with-binutils-2.3=
5.patch \
-                   file://0005-perf-Make-perf-able-to-build-with-latest-=
libbfd.patch \
-                   "
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3.bb b/meta-=
arm-bsp/recipes-kernel/linux/linux-yocto_5.3.bb
deleted file mode 100644
index 036cb00a..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-KBRANCH ?=3D "v5.3/standard/base"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-SRCREV_machine =3D "d4f3318ed8fab6316cb7a269b8f42306632a3876"
-SRCREV_meta =3D "8d0ed83a864cc91eef4d2abbc90f13d4ecd1c213"
-
-SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;name=3Dmachine;b=
ranch=3D${KBRANCH}; \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-5.4;destsuffix=3D${KMETA}"
-
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b8=
814"
-LINUX_VERSION =3D "5.3.18"
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


