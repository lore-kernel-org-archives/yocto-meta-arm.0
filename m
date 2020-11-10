Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.29549.1605023542376165527
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 Nov 2020 07:52:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 49502139F
	for <meta-arm@lists.yoctoproject.org>; Tue, 10 Nov 2020 07:52:21 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF0AB3F718
	for <meta-arm@lists.yoctoproject.org>; Tue, 10 Nov 2020 07:52:20 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/6] arm/linux-arm64-ack: fix build of perf
Date: Tue, 10 Nov 2020 15:52:12 +0000
Message-Id: <20201110155216.1313151-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201110155216.1313151-1-ross.burton@arm.com>
References: <20201110155216.1313151-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Backport a number of patches from master to fix the build of perf.
These are incorporated into newer ACK 5.4.x releases but we're too close
to release of to bump the kernel version.

Change-Id: I60f599d9ffd9be170eb024622399d8df3e9a1fa1
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...-definition-of-traceid_list-global-v.patch |  69 +++++
 ..._account-Make-global-variable-static.patch |  43 ++++
 ...-some-global-variables-to-fix-build-.patch | 240 ++++++++++++++++++
 ...ceevent-Fix-build-with-binutils-2.35.patch |  39 +++
 .../linux/linux-arm64-ack_5.4.bb              |   4 +
 5 files changed, 395 insertions(+)
 create mode 100644 meta-arm/recipes-kernel/linux/linux-arm64-ack/0001-pe=
rf-cs-etm-Move-definition-of-traceid_list-global-v.patch
 create mode 100644 meta-arm/recipes-kernel/linux/linux-arm64-ack/0002-pe=
rf-tests-bp_account-Make-global-variable-static.patch
 create mode 100644 meta-arm/recipes-kernel/linux/linux-arm64-ack/0003-pe=
rf-bench-Share-some-global-variables-to-fix-build-.patch
 create mode 100644 meta-arm/recipes-kernel/linux/linux-arm64-ack/0004-li=
btraceevent-Fix-build-with-binutils-2.35.patch

diff --git a/meta-arm/recipes-kernel/linux/linux-arm64-ack/0001-perf-cs-e=
tm-Move-definition-of-traceid_list-global-v.patch b/meta-arm/recipes-kern=
el/linux/linux-arm64-ack/0001-perf-cs-etm-Move-definition-of-traceid_list=
-global-v.patch
new file mode 100644
index 0000000..94ab435
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/linux-arm64-ack/0001-perf-cs-etm-Move=
-definition-of-traceid_list-global-v.patch
@@ -0,0 +1,69 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 28c69b683210b5d5321ceb71e44a77bc31a32c8a Mon Sep 17 00:00:00 2001
+From: Leo Yan <leo.yan@linaro.org>
+Date: Tue, 5 May 2020 21:36:42 +0800
+Subject: [PATCH 1/4] perf cs-etm: Move definition of 'traceid_list' glob=
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
+index f5f855fff412..50de6a1ed0ce 100644
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
diff --git a/meta-arm/recipes-kernel/linux/linux-arm64-ack/0002-perf-test=
s-bp_account-Make-global-variable-static.patch b/meta-arm/recipes-kernel/=
linux/linux-arm64-ack/0002-perf-tests-bp_account-Make-global-variable-sta=
tic.patch
new file mode 100644
index 0000000..142d4b7
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/linux-arm64-ack/0002-perf-tests-bp_ac=
count-Make-global-variable-static.patch
@@ -0,0 +1,43 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From b28dc646b4c5cd3844bd591af841494dd1de0a9f Mon Sep 17 00:00:00 2001
+From: Arnaldo Carvalho de Melo <acme@redhat.com>
+Date: Mon, 2 Mar 2020 11:13:19 -0300
+Subject: [PATCH 2/4] perf tests bp_account: Make global variable static
+
+To fix the build with newer gccs, that without this patch exit with:
+
+    LD       /tmp/build/perf/tests/perf-in.o
+  ld: /tmp/build/perf/tests/bp_account.o:/git/perf/tools/perf/tests/bp_a=
ccount.c:22: multiple definition of `the_var'; /tmp/build/perf/tests/bp_s=
ignal.o:/git/perf/tools/perf/tests/bp_signal.c:38: first defined here
+  make[4]: *** [/git/perf/tools/build/Makefile.build:145: /tmp/build/per=
f/tests/perf-in.o] Error 1
+
+First noticed in fedora:rawhide/32 with:
+
+  [perfbuilder@a5ff49d6e6e4 ~]$ gcc --version
+  gcc (GCC) 10.0.1 20200216 (Red Hat 10.0.1-0.8)
+
+Reported-by: Jiri Olsa <jolsa@kernel.org>
+Cc: Adrian Hunter <adrian.hunter@intel.com>
+Cc: Namhyung Kim <namhyung@kernel.org>
+Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
+---
+ tools/perf/tests/bp_account.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/perf/tests/bp_account.c b/tools/perf/tests/bp_account=
.c
+index 016bba2c142d..55a9de311d7b 100644
+--- a/tools/perf/tests/bp_account.c
++++ b/tools/perf/tests/bp_account.c
+@@ -23,7 +23,7 @@
+ #include "../perf-sys.h"
+ #include "cloexec.h"
+=20
+-volatile long the_var;
++static volatile long the_var;
+=20
+ static noinline int test_function(void)
+ {
+--=20
+2.25.1
+
diff --git a/meta-arm/recipes-kernel/linux/linux-arm64-ack/0003-perf-benc=
h-Share-some-global-variables-to-fix-build-.patch b/meta-arm/recipes-kern=
el/linux/linux-arm64-ack/0003-perf-bench-Share-some-global-variables-to-f=
ix-build-.patch
new file mode 100644
index 0000000..965cc38
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/linux-arm64-ack/0003-perf-bench-Share=
-some-global-variables-to-fix-build-.patch
@@ -0,0 +1,240 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From e6ae6031755b6781af42af28f11186bb18e94842 Mon Sep 17 00:00:00 2001
+From: Arnaldo Carvalho de Melo <acme@redhat.com>
+Date: Mon, 2 Mar 2020 12:09:38 -0300
+Subject: [PATCH 3/4] perf bench: Share some global variables to fix buil=
d with
+ gcc 10
+
+Noticed with gcc 10 (fedora rawhide) that those variables were not being
+declared as static, so end up with:
+
+  ld: /tmp/build/perf/bench/epoll-wait.o:/git/perf/tools/perf/bench/epol=
l-wait.c:93: multiple definition of `end'; /tmp/build/perf/bench/futex-ha=
sh.o:/git/perf/tools/perf/bench/futex-hash.c:40: first defined here
+  ld: /tmp/build/perf/bench/epoll-wait.o:/git/perf/tools/perf/bench/epol=
l-wait.c:93: multiple definition of `start'; /tmp/build/perf/bench/futex-=
hash.o:/git/perf/tools/perf/bench/futex-hash.c:40: first defined here
+  ld: /tmp/build/perf/bench/epoll-wait.o:/git/perf/tools/perf/bench/epol=
l-wait.c:93: multiple definition of `runtime'; /tmp/build/perf/bench/fute=
x-hash.o:/git/perf/tools/perf/bench/futex-hash.c:40: first defined here
+  ld: /tmp/build/perf/bench/epoll-ctl.o:/git/perf/tools/perf/bench/epoll=
-ctl.c:38: multiple definition of `end'; /tmp/build/perf/bench/futex-hash=
.o:/git/perf/tools/perf/bench/futex-hash.c:40: first defined here
+  ld: /tmp/build/perf/bench/epoll-ctl.o:/git/perf/tools/perf/bench/epoll=
-ctl.c:38: multiple definition of `start'; /tmp/build/perf/bench/futex-ha=
sh.o:/git/perf/tools/perf/bench/futex-hash.c:40: first defined here
+  ld: /tmp/build/perf/bench/epoll-ctl.o:/git/perf/tools/perf/bench/epoll=
-ctl.c:38: multiple definition of `runtime'; /tmp/build/perf/bench/futex-=
hash.o:/git/perf/tools/perf/bench/futex-hash.c:40: first defined here
+  make[4]: *** [/git/perf/tools/build/Makefile.build:145: /tmp/build/per=
f/bench/perf-in.o] Error 1
+
+Prefix those with bench__ and add them to bench/bench.h, so that we can
+share those on the tools needing to access those variables from signal
+handlers.
+
+Acked-by: Thomas Gleixner <tglx@linutronix.de>
+Cc: Adrian Hunter <adrian.hunter@intel.com>
+Cc: Davidlohr Bueso <dave@stgolabs.net>
+Cc: Jiri Olsa <jolsa@kernel.org>
+Cc: Namhyung Kim <namhyung@kernel.org>
+Link: http://lore.kernel.org/lkml/20200303155811.GD13702@kernel.org
+Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
+---
+ tools/perf/bench/bench.h         |  4 ++++
+ tools/perf/bench/epoll-ctl.c     |  7 +++----
+ tools/perf/bench/epoll-wait.c    | 11 +++++------
+ tools/perf/bench/futex-hash.c    | 12 ++++++------
+ tools/perf/bench/futex-lock-pi.c | 11 +++++------
+ 5 files changed, 23 insertions(+), 22 deletions(-)
+
+diff --git a/tools/perf/bench/bench.h b/tools/perf/bench/bench.h
+index fddb3ced9db6..4aa6de1aa67d 100644
+--- a/tools/perf/bench/bench.h
++++ b/tools/perf/bench/bench.h
+@@ -2,6 +2,10 @@
+ #ifndef BENCH_H
+ #define BENCH_H
+=20
++#include <sys/time.h>
++
++extern struct timeval bench__start, bench__end, bench__runtime;
++
+ /*
+  * The madvise transparent hugepage constants were added in glibc
+  * 2.13. For compatibility with older versions of glibc, define these
+diff --git a/tools/perf/bench/epoll-ctl.c b/tools/perf/bench/epoll-ctl.c
+index bb617e568841..a7526c05df38 100644
+--- a/tools/perf/bench/epoll-ctl.c
++++ b/tools/perf/bench/epoll-ctl.c
+@@ -35,7 +35,6 @@
+=20
+ static unsigned int nthreads =3D 0;
+ static unsigned int nsecs    =3D 8;
+-struct timeval start, end, runtime;
+ static bool done, __verbose, randomize;
+=20
+ /*
+@@ -94,8 +93,8 @@ static void toggle_done(int sig __maybe_unused,
+ {
+ 	/* inform all threads that we're done for the day */
+ 	done =3D true;
+-	gettimeofday(&end, NULL);
+-	timersub(&end, &start, &runtime);
++	gettimeofday(&bench__end, NULL);
++	timersub(&bench__end, &bench__start, &bench__runtime);
+ }
+=20
+ static void nest_epollfd(void)
+@@ -361,7 +360,7 @@ int bench_epoll_ctl(int argc, const char **argv)
+=20
+ 	threads_starting =3D nthreads;
+=20
+-	gettimeofday(&start, NULL);
++	gettimeofday(&bench__start, NULL);
+=20
+ 	do_threads(worker, cpu);
+=20
+diff --git a/tools/perf/bench/epoll-wait.c b/tools/perf/bench/epoll-wait=
.c
+index 7af694437f4e..d1c5cb526b9f 100644
+--- a/tools/perf/bench/epoll-wait.c
++++ b/tools/perf/bench/epoll-wait.c
+@@ -90,7 +90,6 @@
+=20
+ static unsigned int nthreads =3D 0;
+ static unsigned int nsecs    =3D 8;
+-struct timeval start, end, runtime;
+ static bool wdone, done, __verbose, randomize, nonblocking;
+=20
+ /*
+@@ -276,8 +275,8 @@ static void toggle_done(int sig __maybe_unused,
+ {
+ 	/* inform all threads that we're done for the day */
+ 	done =3D true;
+-	gettimeofday(&end, NULL);
+-	timersub(&end, &start, &runtime);
++	gettimeofday(&bench__end, NULL);
++	timersub(&bench__end, &bench__start, &bench__runtime);
+ }
+=20
+ static void print_summary(void)
+@@ -287,7 +286,7 @@ static void print_summary(void)
+=20
+ 	printf("\nAveraged %ld operations/sec (+- %.2f%%), total secs =3D %d\n=
",
+ 	       avg, rel_stddev_stats(stddev, avg),
+-	       (int) runtime.tv_sec);
++	       (int)bench__runtime.tv_sec);
+ }
+=20
+ static int do_threads(struct worker *worker, struct perf_cpu_map *cpu)
+@@ -479,7 +478,7 @@ int bench_epoll_wait(int argc, const char **argv)
+=20
+ 	threads_starting =3D nthreads;
+=20
+-	gettimeofday(&start, NULL);
++	gettimeofday(&bench__start, NULL);
+=20
+ 	do_threads(worker, cpu);
+=20
+@@ -519,7 +518,7 @@ int bench_epoll_wait(int argc, const char **argv)
+ 		qsort(worker, nthreads, sizeof(struct worker), cmpworker);
+=20
+ 	for (i =3D 0; i < nthreads; i++) {
+-		unsigned long t =3D worker[i].ops/runtime.tv_sec;
++		unsigned long t =3D worker[i].ops / bench__runtime.tv_sec;
+=20
+ 		update_stats(&throughput_stats, t);
+=20
+diff --git a/tools/perf/bench/futex-hash.c b/tools/perf/bench/futex-hash=
.c
+index 8ba0c3330a9a..21776862e940 100644
+--- a/tools/perf/bench/futex-hash.c
++++ b/tools/perf/bench/futex-hash.c
+@@ -37,7 +37,7 @@ static unsigned int nfutexes =3D 1024;
+ static bool fshared =3D false, done =3D false, silent =3D false;
+ static int futex_flag =3D 0;
+=20
+-struct timeval start, end, runtime;
++struct timeval bench__start, bench__end, bench__runtime;
+ static pthread_mutex_t thread_lock;
+ static unsigned int threads_starting;
+ static struct stats throughput_stats;
+@@ -103,8 +103,8 @@ static void toggle_done(int sig __maybe_unused,
+ {
+ 	/* inform all threads that we're done for the day */
+ 	done =3D true;
+-	gettimeofday(&end, NULL);
+-	timersub(&end, &start, &runtime);
++	gettimeofday(&bench__end, NULL);
++	timersub(&bench__end, &bench__start, &bench__runtime);
+ }
+=20
+ static void print_summary(void)
+@@ -114,7 +114,7 @@ static void print_summary(void)
+=20
+ 	printf("%sAveraged %ld operations/sec (+- %.2f%%), total secs =3D %d\n=
",
+ 	       !silent ? "\n" : "", avg, rel_stddev_stats(stddev, avg),
+-	       (int) runtime.tv_sec);
++	       (int)bench__runtime.tv_sec);
+ }
+=20
+ int bench_futex_hash(int argc, const char **argv)
+@@ -161,7 +161,7 @@ int bench_futex_hash(int argc, const char **argv)
+=20
+ 	threads_starting =3D nthreads;
+ 	pthread_attr_init(&thread_attr);
+-	gettimeofday(&start, NULL);
++	gettimeofday(&bench__start, NULL);
+ 	for (i =3D 0; i < nthreads; i++) {
+ 		worker[i].tid =3D i;
+ 		worker[i].futex =3D calloc(nfutexes, sizeof(*worker[i].futex));
+@@ -204,7 +204,7 @@ int bench_futex_hash(int argc, const char **argv)
+ 	pthread_mutex_destroy(&thread_lock);
+=20
+ 	for (i =3D 0; i < nthreads; i++) {
+-		unsigned long t =3D worker[i].ops/runtime.tv_sec;
++		unsigned long t =3D worker[i].ops / bench__runtime.tv_sec;
+ 		update_stats(&throughput_stats, t);
+ 		if (!silent) {
+ 			if (nfutexes =3D=3D 1)
+diff --git a/tools/perf/bench/futex-lock-pi.c b/tools/perf/bench/futex-l=
ock-pi.c
+index d0cae8125423..30d97121dc4f 100644
+--- a/tools/perf/bench/futex-lock-pi.c
++++ b/tools/perf/bench/futex-lock-pi.c
+@@ -37,7 +37,6 @@ static bool silent =3D false, multi =3D false;
+ static bool done =3D false, fshared =3D false;
+ static unsigned int nthreads =3D 0;
+ static int futex_flag =3D 0;
+-struct timeval start, end, runtime;
+ static pthread_mutex_t thread_lock;
+ static unsigned int threads_starting;
+ static struct stats throughput_stats;
+@@ -64,7 +63,7 @@ static void print_summary(void)
+=20
+ 	printf("%sAveraged %ld operations/sec (+- %.2f%%), total secs =3D %d\n=
",
+ 	       !silent ? "\n" : "", avg, rel_stddev_stats(stddev, avg),
+-	       (int) runtime.tv_sec);
++	       (int)bench__runtime.tv_sec);
+ }
+=20
+ static void toggle_done(int sig __maybe_unused,
+@@ -73,8 +72,8 @@ static void toggle_done(int sig __maybe_unused,
+ {
+ 	/* inform all threads that we're done for the day */
+ 	done =3D true;
+-	gettimeofday(&end, NULL);
+-	timersub(&end, &start, &runtime);
++	gettimeofday(&bench__end, NULL);
++	timersub(&bench__end, &bench__start, &bench__runtime);
+ }
+=20
+ static void *workerfn(void *arg)
+@@ -185,7 +184,7 @@ int bench_futex_lock_pi(int argc, const char **argv)
+=20
+ 	threads_starting =3D nthreads;
+ 	pthread_attr_init(&thread_attr);
+-	gettimeofday(&start, NULL);
++	gettimeofday(&bench__start, NULL);
+=20
+ 	create_threads(worker, thread_attr, cpu);
+ 	pthread_attr_destroy(&thread_attr);
+@@ -211,7 +210,7 @@ int bench_futex_lock_pi(int argc, const char **argv)
+ 	pthread_mutex_destroy(&thread_lock);
+=20
+ 	for (i =3D 0; i < nthreads; i++) {
+-		unsigned long t =3D worker[i].ops/runtime.tv_sec;
++		unsigned long t =3D worker[i].ops / bench__runtime.tv_sec;
+=20
+ 		update_stats(&throughput_stats, t);
+ 		if (!silent)
+--=20
+2.25.1
+
diff --git a/meta-arm/recipes-kernel/linux/linux-arm64-ack/0004-libtracee=
vent-Fix-build-with-binutils-2.35.patch b/meta-arm/recipes-kernel/linux/l=
inux-arm64-ack/0004-libtraceevent-Fix-build-with-binutils-2.35.patch
new file mode 100644
index 0000000..5e18157
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/linux-arm64-ack/0004-libtraceevent-Fi=
x-build-with-binutils-2.35.patch
@@ -0,0 +1,39 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From c2c2c58915def6cda401d1782048d23b2b02ed85 Mon Sep 17 00:00:00 2001
+From: Ben Hutchings <ben@decadent.org.uk>
+Date: Sat, 25 Jul 2020 02:06:23 +0100
+Subject: [PATCH 4/4] libtraceevent: Fix build with binutils 2.35
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
+index f440989fa55e..23c3535bcbd6 100644
+--- a/tools/lib/traceevent/plugins/Makefile
++++ b/tools/lib/traceevent/plugins/Makefile
+@@ -196,7 +196,7 @@ define do_generate_dynamic_list_file
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
+
diff --git a/meta-arm/recipes-kernel/linux/linux-arm64-ack_5.4.bb b/meta-=
arm/recipes-kernel/linux/linux-arm64-ack_5.4.bb
index 99b9b9f..3221fd8 100644
--- a/meta-arm/recipes-kernel/linux/linux-arm64-ack_5.4.bb
+++ b/meta-arm/recipes-kernel/linux/linux-arm64-ack_5.4.bb
@@ -6,6 +6,10 @@ require linux-arm64-ack.inc
=20
 SRC_URI =3D " \
     git://android.googlesource.com/kernel/common.git;protocol=3Dhttps;br=
anch=3Dandroid11-5.4-lts \
+    file://0001-perf-cs-etm-Move-definition-of-traceid_list-global-v.pat=
ch \
+    file://0002-perf-tests-bp_account-Make-global-variable-static.patch =
\
+    file://0003-perf-bench-Share-some-global-variables-to-fix-build-.pat=
ch \
+    file://0004-libtraceevent-Fix-build-with-binutils-2.35.patch \
     "
=20
 # ASB-2020-06-05_5.4-stable tag commit
--=20
2.25.1

