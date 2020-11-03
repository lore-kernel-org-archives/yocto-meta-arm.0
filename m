Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web08.4482.1604369590666102272
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 02 Nov 2020 18:13:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=2BepcEog;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f177.google.com with SMTP id h12so10684175qtc.9
        for <meta-arm@lists.yoctoproject.org>; Mon, 02 Nov 2020 18:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wHU57suDbC4bB1LvytDRgF85c3O3WIoe5W06QHOPErY=;
        b=2BepcEoglBFaElBK6Ej2leEPhGg64V/3vfJqXdpvtzGiOg/560P/mW7d7xpa8gP+SQ
         o5TKQKPA50+9Fw62fbPinWi/jyovsE7fpBbmpHRO0v+EF2z5Jc/qmIJIkmoZ9YM/mhtc
         Q1ILpMDpNTJDZarHkwEfhprzEC5pOv6a+ajOvLxgnIlFCpdy/EYfTmF5xFpTXlcVuwj5
         FINr2315mulE319ahLPnkECW0KtWN2oe7nDHL8Si6waafovDlrMB53qug8DYDQKofHon
         EhY0RwSM7hwn8skHCV/rb1TaN7SBlug62uv30GL5kemSWwKJl0sYgtprtiwYb/5GLZ6B
         JsYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wHU57suDbC4bB1LvytDRgF85c3O3WIoe5W06QHOPErY=;
        b=aws3PBqnXme7B3+1CduIX5SyYtHF+mbSE/jq7tXuuUBTeo8/Blz1vCzVYWRQ2M6leI
         PvkIAId2ZvatwTcDrbe3atVSNXku/mK7tWbtUW//QQKOBClw6bRFqS3IazPn6BHdNvAF
         Xo2w4FCdqaym0RGUdyu6xLWOJzOjvDMmWhNmqpHUsxLy5yCk6CgMFQ3/oknFaYNGK9qp
         mv4ucsASJEwNJFMjJuvwamHSKQScZFmxyWOkKUwQp7RPyepfjv2+Qy0nuObG40m7FM7s
         jhASsOQXXwZ+TCYB0PB+mlvkJBQA4pHAEH+rptIWvcAsZsKeWgoqjEILx4gMCHcuZYYY
         uy0g==
X-Gm-Message-State: AOAM532Mvdr+ee0JfSmKcVw5r1MQKfx0sCMfv+yTjxeqAZ5TOwLo/sGa
	zdXyQMV1jEHbZJnr4g5UERzZIA==
X-Google-Smtp-Source: ABdhPJzSu8sMsVdVtyFlRE8x7NN0NOjmMxQyEgfJdMn0ChyHMN6HRuiw7dxkbPYCi6fMZzhfKz9A8w==
X-Received: by 2002:ac8:5141:: with SMTP id h1mr16787080qtn.139.1604369589653;
        Mon, 02 Nov 2020 18:13:09 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id a25sm3726648qko.17.2020.11.02.18.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 18:13:09 -0800 (PST)
Date: Mon, 2 Nov 2020 21:13:04 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Khasim Mohammed <khasim.mohammed@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-bsp/linux-linaro-arm-5.4: fixup perf to build with gcc 10
Message-ID: <20201103021303.GF24538@kudzu.us>
References: <20201102163330.29896-1-khasim.mohammed@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201102163330.29896-1-khasim.mohammed@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 02, 2020 at 10:03:30PM +0530, Khasim Mohammed wrote:
> Many errors were observed while trying to build perf with gcc 10.
> There were few patches which were merged on 5.4 stable which were missing in
> our kernel repository, backporting the same here.
> 
> Change-Id: I4c4104fd3c99a60706662cc05b18f3ee94c7afa2
> Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>

Applied to master.

Thanks,
Jon

> ---
>  .../perf-fixup-gcc10-01.patch                 |  76 ++++++
>  .../perf-fixup-gcc10-02.patch                 |  50 ++++
>  .../perf-fixup-gcc10-03.patch                 | 246 ++++++++++++++++++
>  .../perf-fixup-gcc10-04.patch                 |  45 ++++
>  .../linux/linux-linaro-arm_5.4.bb             |   9 +-
>  5 files changed, 425 insertions(+), 1 deletion(-)
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-01.patch
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-02.patch
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-03.patch
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-04.patch
> 
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-01.patch b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-01.patch
> new file mode 100644
> index 0000000..efca58f
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-01.patch
> @@ -0,0 +1,76 @@
> +perf cs-etm: Move definition of 'traceid_list' global variable from header file
> +Upstream-Status: Backport https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/patch/tools/perf/util?id=bc79abf4afea97d5ce682aa2bd1095fb74400916
> +Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> +
> +From bc79abf4afea97d5ce682aa2bd1095fb74400916 Mon Sep 17 00:00:00 2001
> +From: Leo Yan <leo.yan@linaro.org>
> +Date: Tue, 5 May 2020 21:36:42 +0800
> +Subject: perf cs-etm: Move definition of 'traceid_list' global variable from
> + header file
> +
> +commit 168200b6d6ea0cb5765943ec5da5b8149701f36a upstream.
> +
> +The variable 'traceid_list' is defined in the header file cs-etm.h,
> +if multiple C files include cs-etm.h the compiler might complaint for
> +multiple definition of 'traceid_list'.
> +
> +To fix multiple definition error, move the definition of 'traceid_list'
> +into cs-etm.c.
> +
> +Fixes: cd8bfd8c973e ("perf tools: Add processing of coresight metadata")
> +Reported-by: Thomas Backlund <tmb@mageia.org>
> +Signed-off-by: Leo Yan <leo.yan@linaro.org>
> +Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> +Reviewed-by: Mike Leach <mike.leach@linaro.org>
> +Tested-by: Mike Leach <mike.leach@linaro.org>
> +Tested-by: Thomas Backlund <tmb@mageia.org>
> +Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
> +Cc: Jiri Olsa <jolsa@redhat.com>
> +Cc: Mark Rutland <mark.rutland@arm.com>
> +Cc: Namhyung Kim <namhyung@kernel.org>
> +Cc: Peter Zijlstra <peterz@infradead.org>
> +Cc: Suzuki Poulouse <suzuki.poulose@arm.com>
> +Cc: Tor Jeremiassen <tor@ti.com>
> +Cc: linux-arm-kernel@lists.infradead.org
> +Link: http://lore.kernel.org/lkml/20200505133642.4756-1-leo.yan@linaro.org
> +Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> +Cc: Paul Barker <pbarker@konsulko.com>
> +Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> +---
> + tools/perf/util/cs-etm.c | 3 +++
> + tools/perf/util/cs-etm.h | 3 ---
> + 2 files changed, 3 insertions(+), 3 deletions(-)
> +
> +(limited to 'tools/perf/util')
> +
> +diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> +index 451eee24165ee..f5a9cb4088080 100644
> +--- a/tools/perf/util/cs-etm.c
> ++++ b/tools/perf/util/cs-etm.c
> +@@ -94,6 +94,9 @@ struct cs_etm_queue {
> + 	struct cs_etm_traceid_queue **traceid_queues;
> + };
> + 
> ++/* RB tree for quick conversion between traceID and metadata pointers */
> ++static struct intlist *traceid_list;
> ++
> + static int cs_etm__update_queues(struct cs_etm_auxtrace *etm);
> + static int cs_etm__process_queues(struct cs_etm_auxtrace *etm);
> + static int cs_etm__process_timeless_queues(struct cs_etm_auxtrace *etm,
> +diff --git a/tools/perf/util/cs-etm.h b/tools/perf/util/cs-etm.h
> +index 650ecc2a63492..4ad925d6d7996 100644
> +--- a/tools/perf/util/cs-etm.h
> ++++ b/tools/perf/util/cs-etm.h
> +@@ -114,9 +114,6 @@ enum cs_etm_isa {
> + 	CS_ETM_ISA_T32,
> + };
> + 
> +-/* RB tree for quick conversion between traceID and metadata pointers */
> +-struct intlist *traceid_list;
> +-
> + struct cs_etm_queue;
> + 
> + struct cs_etm_packet {
> +-- 
> +cgit 1.2.3-1.el7
> +
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-02.patch b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-02.patch
> new file mode 100644
> index 0000000..b512d3e
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-02.patch
> @@ -0,0 +1,50 @@
> +perf tests bp_account: Make global variable static
> +Upstream-Status: Backport https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/patch/tools/perf/tests/bp_account.c?id=73d2d6b421dfdc66b4615452a94efcece27a3c21
> +Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> +
> +From 73d2d6b421dfdc66b4615452a94efcece27a3c21 Mon Sep 17 00:00:00 2001
> +From: Arnaldo Carvalho de Melo <acme@redhat.com>
> +Date: Mon, 2 Mar 2020 11:13:19 -0300
> +Subject: perf tests bp_account: Make global variable static
> +
> +commit cff20b3151ccab690715cb6cf0f5da5cccb32adf upstream.
> +
> +To fix the build with newer gccs, that without this patch exit with:
> +
> +    LD       /tmp/build/perf/tests/perf-in.o
> +  ld: /tmp/build/perf/tests/bp_account.o:/git/perf/tools/perf/tests/bp_account.c:22: multiple definition of `the_var'; /tmp/build/perf/tests/bp_signal.o:/git/perf/tools/perf/tests/bp_signal.c:38: first defined here
> +  make[4]: *** [/git/perf/tools/build/Makefile.build:145: /tmp/build/perf/tests/perf-in.o] Error 1
> +
> +First noticed in fedora:rawhide/32 with:
> +
> +  [perfbuilder@a5ff49d6e6e4 ~]$ gcc --version
> +  gcc (GCC) 10.0.1 20200216 (Red Hat 10.0.1-0.8)
> +
> +Reported-by: Jiri Olsa <jolsa@kernel.org>
> +Cc: Adrian Hunter <adrian.hunter@intel.com>
> +Cc: Namhyung Kim <namhyung@kernel.org>
> +Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> +Cc: Ben Hutchings <ben@decadent.org.uk>
> +Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> +---
> + tools/perf/tests/bp_account.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +(limited to 'tools/perf/tests/bp_account.c')
> +
> +diff --git a/tools/perf/tests/bp_account.c b/tools/perf/tests/bp_account.c
> +index 016bba2c142db..55a9de311d7b0 100644
> +--- a/tools/perf/tests/bp_account.c
> ++++ b/tools/perf/tests/bp_account.c
> +@@ -23,7 +23,7 @@
> + #include "../perf-sys.h"
> + #include "cloexec.h"
> + 
> +-volatile long the_var;
> ++static volatile long the_var;
> + 
> + static noinline int test_function(void)
> + {
> +-- 
> +cgit 1.2.3-1.el7
> +
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-03.patch b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-03.patch
> new file mode 100644
> index 0000000..8b8a299
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-03.patch
> @@ -0,0 +1,246 @@
> +perf bench: Share some global variables to fix build with gcc 10
> +Upstream-Status: Backport https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/tools/perf/bench?h=linux-5.4.y&id=df35e878d0a51755fb500e2e8e29c7ebb0239756
> +Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> +
> +From df35e878d0a51755fb500e2e8e29c7ebb0239756 Mon Sep 17 00:00:00 2001
> +From: Arnaldo Carvalho de Melo <acme@redhat.com>
> +Date: Mon, 2 Mar 2020 12:09:38 -0300
> +Subject: perf bench: Share some global variables to fix build with gcc 10
> +
> +commit e4d9b04b973b2dbce7b42af95ea70d07da1c936d upstream.
> +
> +Noticed with gcc 10 (fedora rawhide) that those variables were not being
> +declared as static, so end up with:
> +
> +  ld: /tmp/build/perf/bench/epoll-wait.o:/git/perf/tools/perf/bench/epoll-wait.c:93: multiple definition of `end'; /tmp/build/perf/bench/futex-hash.o:/git/perf/tools/perf/bench/futex-hash.c:40: first defined here
> +  ld: /tmp/build/perf/bench/epoll-wait.o:/git/perf/tools/perf/bench/epoll-wait.c:93: multiple definition of `start'; /tmp/build/perf/bench/futex-hash.o:/git/perf/tools/perf/bench/futex-hash.c:40: first defined here
> +  ld: /tmp/build/perf/bench/epoll-wait.o:/git/perf/tools/perf/bench/epoll-wait.c:93: multiple definition of `runtime'; /tmp/build/perf/bench/futex-hash.o:/git/perf/tools/perf/bench/futex-hash.c:40: first defined here
> +  ld: /tmp/build/perf/bench/epoll-ctl.o:/git/perf/tools/perf/bench/epoll-ctl.c:38: multiple definition of `end'; /tmp/build/perf/bench/futex-hash.o:/git/perf/tools/perf/bench/futex-hash.c:40: first defined here
> +  ld: /tmp/build/perf/bench/epoll-ctl.o:/git/perf/tools/perf/bench/epoll-ctl.c:38: multiple definition of `start'; /tmp/build/perf/bench/futex-hash.o:/git/perf/tools/perf/bench/futex-hash.c:40: first defined here
> +  ld: /tmp/build/perf/bench/epoll-ctl.o:/git/perf/tools/perf/bench/epoll-ctl.c:38: multiple definition of `runtime'; /tmp/build/perf/bench/futex-hash.o:/git/perf/tools/perf/bench/futex-hash.c:40: first defined here
> +  make[4]: *** [/git/perf/tools/build/Makefile.build:145: /tmp/build/perf/bench/perf-in.o] Error 1
> +
> +Prefix those with bench__ and add them to bench/bench.h, so that we can
> +share those on the tools needing to access those variables from signal
> +handlers.
> +
> +Acked-by: Thomas Gleixner <tglx@linutronix.de>
> +Cc: Adrian Hunter <adrian.hunter@intel.com>
> +Cc: Davidlohr Bueso <dave@stgolabs.net>
> +Cc: Jiri Olsa <jolsa@kernel.org>
> +Cc: Namhyung Kim <namhyung@kernel.org>
> +Link: http://lore.kernel.org/lkml/20200303155811.GD13702@kernel.org
> +Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> +Cc: Ben Hutchings <ben@decadent.org.uk>
> +Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> +---
> + tools/perf/bench/bench.h         |  4 ++++
> + tools/perf/bench/epoll-ctl.c     |  7 +++----
> + tools/perf/bench/epoll-wait.c    | 11 +++++------
> + tools/perf/bench/futex-hash.c    | 12 ++++++------
> + tools/perf/bench/futex-lock-pi.c | 11 +++++------
> + 5 files changed, 23 insertions(+), 22 deletions(-)
> +
> +(limited to 'tools/perf/bench')
> +
> +diff --git a/tools/perf/bench/bench.h b/tools/perf/bench/bench.h
> +index fddb3ced9db62..4aa6de1aa67dc 100644
> +--- a/tools/perf/bench/bench.h
> ++++ b/tools/perf/bench/bench.h
> +@@ -2,6 +2,10 @@
> + #ifndef BENCH_H
> + #define BENCH_H
> + 
> ++#include <sys/time.h>
> ++
> ++extern struct timeval bench__start, bench__end, bench__runtime;
> ++
> + /*
> +  * The madvise transparent hugepage constants were added in glibc
> +  * 2.13. For compatibility with older versions of glibc, define these
> +diff --git a/tools/perf/bench/epoll-ctl.c b/tools/perf/bench/epoll-ctl.c
> +index bb617e5688412..a7526c05df382 100644
> +--- a/tools/perf/bench/epoll-ctl.c
> ++++ b/tools/perf/bench/epoll-ctl.c
> +@@ -35,7 +35,6 @@
> + 
> + static unsigned int nthreads = 0;
> + static unsigned int nsecs    = 8;
> +-struct timeval start, end, runtime;
> + static bool done, __verbose, randomize;
> + 
> + /*
> +@@ -94,8 +93,8 @@ static void toggle_done(int sig __maybe_unused,
> + {
> + 	/* inform all threads that we're done for the day */
> + 	done = true;
> +-	gettimeofday(&end, NULL);
> +-	timersub(&end, &start, &runtime);
> ++	gettimeofday(&bench__end, NULL);
> ++	timersub(&bench__end, &bench__start, &bench__runtime);
> + }
> + 
> + static void nest_epollfd(void)
> +@@ -361,7 +360,7 @@ int bench_epoll_ctl(int argc, const char **argv)
> + 
> + 	threads_starting = nthreads;
> + 
> +-	gettimeofday(&start, NULL);
> ++	gettimeofday(&bench__start, NULL);
> + 
> + 	do_threads(worker, cpu);
> + 
> +diff --git a/tools/perf/bench/epoll-wait.c b/tools/perf/bench/epoll-wait.c
> +index 7af694437f4ea..d1c5cb526b9ff 100644
> +--- a/tools/perf/bench/epoll-wait.c
> ++++ b/tools/perf/bench/epoll-wait.c
> +@@ -90,7 +90,6 @@
> + 
> + static unsigned int nthreads = 0;
> + static unsigned int nsecs    = 8;
> +-struct timeval start, end, runtime;
> + static bool wdone, done, __verbose, randomize, nonblocking;
> + 
> + /*
> +@@ -276,8 +275,8 @@ static void toggle_done(int sig __maybe_unused,
> + {
> + 	/* inform all threads that we're done for the day */
> + 	done = true;
> +-	gettimeofday(&end, NULL);
> +-	timersub(&end, &start, &runtime);
> ++	gettimeofday(&bench__end, NULL);
> ++	timersub(&bench__end, &bench__start, &bench__runtime);
> + }
> + 
> + static void print_summary(void)
> +@@ -287,7 +286,7 @@ static void print_summary(void)
> + 
> + 	printf("\nAveraged %ld operations/sec (+- %.2f%%), total secs = %d\n",
> + 	       avg, rel_stddev_stats(stddev, avg),
> +-	       (int) runtime.tv_sec);
> ++	       (int)bench__runtime.tv_sec);
> + }
> + 
> + static int do_threads(struct worker *worker, struct perf_cpu_map *cpu)
> +@@ -479,7 +478,7 @@ int bench_epoll_wait(int argc, const char **argv)
> + 
> + 	threads_starting = nthreads;
> + 
> +-	gettimeofday(&start, NULL);
> ++	gettimeofday(&bench__start, NULL);
> + 
> + 	do_threads(worker, cpu);
> + 
> +@@ -519,7 +518,7 @@ int bench_epoll_wait(int argc, const char **argv)
> + 		qsort(worker, nthreads, sizeof(struct worker), cmpworker);
> + 
> + 	for (i = 0; i < nthreads; i++) {
> +-		unsigned long t = worker[i].ops/runtime.tv_sec;
> ++		unsigned long t = worker[i].ops / bench__runtime.tv_sec;
> + 
> + 		update_stats(&throughput_stats, t);
> + 
> +diff --git a/tools/perf/bench/futex-hash.c b/tools/perf/bench/futex-hash.c
> +index 8ba0c3330a9a2..21776862e940f 100644
> +--- a/tools/perf/bench/futex-hash.c
> ++++ b/tools/perf/bench/futex-hash.c
> +@@ -37,7 +37,7 @@ static unsigned int nfutexes = 1024;
> + static bool fshared = false, done = false, silent = false;
> + static int futex_flag = 0;
> + 
> +-struct timeval start, end, runtime;
> ++struct timeval bench__start, bench__end, bench__runtime;
> + static pthread_mutex_t thread_lock;
> + static unsigned int threads_starting;
> + static struct stats throughput_stats;
> +@@ -103,8 +103,8 @@ static void toggle_done(int sig __maybe_unused,
> + {
> + 	/* inform all threads that we're done for the day */
> + 	done = true;
> +-	gettimeofday(&end, NULL);
> +-	timersub(&end, &start, &runtime);
> ++	gettimeofday(&bench__end, NULL);
> ++	timersub(&bench__end, &bench__start, &bench__runtime);
> + }
> + 
> + static void print_summary(void)
> +@@ -114,7 +114,7 @@ static void print_summary(void)
> + 
> + 	printf("%sAveraged %ld operations/sec (+- %.2f%%), total secs = %d\n",
> + 	       !silent ? "\n" : "", avg, rel_stddev_stats(stddev, avg),
> +-	       (int) runtime.tv_sec);
> ++	       (int)bench__runtime.tv_sec);
> + }
> + 
> + int bench_futex_hash(int argc, const char **argv)
> +@@ -161,7 +161,7 @@ int bench_futex_hash(int argc, const char **argv)
> + 
> + 	threads_starting = nthreads;
> + 	pthread_attr_init(&thread_attr);
> +-	gettimeofday(&start, NULL);
> ++	gettimeofday(&bench__start, NULL);
> + 	for (i = 0; i < nthreads; i++) {
> + 		worker[i].tid = i;
> + 		worker[i].futex = calloc(nfutexes, sizeof(*worker[i].futex));
> +@@ -204,7 +204,7 @@ int bench_futex_hash(int argc, const char **argv)
> + 	pthread_mutex_destroy(&thread_lock);
> + 
> + 	for (i = 0; i < nthreads; i++) {
> +-		unsigned long t = worker[i].ops/runtime.tv_sec;
> ++		unsigned long t = worker[i].ops / bench__runtime.tv_sec;
> + 		update_stats(&throughput_stats, t);
> + 		if (!silent) {
> + 			if (nfutexes == 1)
> +diff --git a/tools/perf/bench/futex-lock-pi.c b/tools/perf/bench/futex-lock-pi.c
> +index d0cae8125423f..30d97121dc4fb 100644
> +--- a/tools/perf/bench/futex-lock-pi.c
> ++++ b/tools/perf/bench/futex-lock-pi.c
> +@@ -37,7 +37,6 @@ static bool silent = false, multi = false;
> + static bool done = false, fshared = false;
> + static unsigned int nthreads = 0;
> + static int futex_flag = 0;
> +-struct timeval start, end, runtime;
> + static pthread_mutex_t thread_lock;
> + static unsigned int threads_starting;
> + static struct stats throughput_stats;
> +@@ -64,7 +63,7 @@ static void print_summary(void)
> + 
> + 	printf("%sAveraged %ld operations/sec (+- %.2f%%), total secs = %d\n",
> + 	       !silent ? "\n" : "", avg, rel_stddev_stats(stddev, avg),
> +-	       (int) runtime.tv_sec);
> ++	       (int)bench__runtime.tv_sec);
> + }
> + 
> + static void toggle_done(int sig __maybe_unused,
> +@@ -73,8 +72,8 @@ static void toggle_done(int sig __maybe_unused,
> + {
> + 	/* inform all threads that we're done for the day */
> + 	done = true;
> +-	gettimeofday(&end, NULL);
> +-	timersub(&end, &start, &runtime);
> ++	gettimeofday(&bench__end, NULL);
> ++	timersub(&bench__end, &bench__start, &bench__runtime);
> + }
> + 
> + static void *workerfn(void *arg)
> +@@ -185,7 +184,7 @@ int bench_futex_lock_pi(int argc, const char **argv)
> + 
> + 	threads_starting = nthreads;
> + 	pthread_attr_init(&thread_attr);
> +-	gettimeofday(&start, NULL);
> ++	gettimeofday(&bench__start, NULL);
> + 
> + 	create_threads(worker, thread_attr, cpu);
> + 	pthread_attr_destroy(&thread_attr);
> +@@ -211,7 +210,7 @@ int bench_futex_lock_pi(int argc, const char **argv)
> + 	pthread_mutex_destroy(&thread_lock);
> + 
> + 	for (i = 0; i < nthreads; i++) {
> +-		unsigned long t = worker[i].ops/runtime.tv_sec;
> ++		unsigned long t = worker[i].ops / bench__runtime.tv_sec;
> + 
> + 		update_stats(&throughput_stats, t);
> + 		if (!silent)
> +-- 
> +cgit 1.2.3-1.el7
> +
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-04.patch b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-04.patch
> new file mode 100644
> index 0000000..dae1222
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-04.patch
> @@ -0,0 +1,45 @@
> +libtraceevent: Fix build with binutils 2.35
> +Upstream-Status: Backport https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/patch/tools/lib/traceevent/plugins/Makefile?id=c2fd34d4311033120fa502aa8bd4723cdeee0103
> +Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> +
> +From c2fd34d4311033120fa502aa8bd4723cdeee0103 Mon Sep 17 00:00:00 2001
> +From: Ben Hutchings <ben@decadent.org.uk>
> +Date: Sat, 25 Jul 2020 02:06:23 +0100
> +Subject: libtraceevent: Fix build with binutils 2.35
> +
> +commit 39efdd94e314336f4acbac4c07e0f37bdc3bef71 upstream.
> +
> +In binutils 2.35, 'nm -D' changed to show symbol versions along with
> +symbol names, with the usual @@ separator.  When generating
> +libtraceevent-dynamic-list we need just the names, so strip off the
> +version suffix if present.
> +
> +Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> +Tested-by: Salvatore Bonaccorso <carnil@debian.org>
> +Reviewed-by: Steven Rostedt <rostedt@goodmis.org>
> +Cc: linux-trace-devel@vger.kernel.org
> +Cc: stable@vger.kernel.org
> +Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> +Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> +---
> + tools/lib/traceevent/plugins/Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +(limited to 'tools/lib/traceevent/plugins/Makefile')
> +
> +diff --git a/tools/lib/traceevent/plugins/Makefile b/tools/lib/traceevent/plugins/Makefile
> +index f440989fa55e4..23c3535bcbd6b 100644
> +--- a/tools/lib/traceevent/plugins/Makefile
> ++++ b/tools/lib/traceevent/plugins/Makefile
> +@@ -196,7 +196,7 @@ define do_generate_dynamic_list_file
> + 	xargs echo "U w W" | tr 'w ' 'W\n' | sort -u | xargs echo`;\
> + 	if [ "$$symbol_type" = "U W" ];then				\
> + 		(echo '{';                                              \
> +-		$(NM) -u -D $1 | awk 'NF>1 {print "\t"$$2";"}' | sort -u;\
> ++		$(NM) -u -D $1 | awk 'NF>1 {sub("@.*", "", $$2); print "\t"$$2";"}' | sort -u;\
> + 		echo '};';                                              \
> + 		) > $2;                                                 \
> + 	else                                                            \
> +-- 
> +cgit 1.2.3-1.el7
> +
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
> index 577af5e..8e880ed 100644
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
> @@ -5,6 +5,13 @@ SRCREV_meta ?= "e32057eca987b7abbe3eb47ba36f06af8711278a"
>  KBRANCH ?= "n1sdp"
>  KMETA_BRANCH ?= "yocto-5.4"
>  
> -SRC_URI_append = " file://fix-bfd-link.patch"
> +# Apply following patches
> +SRC_URI_append = " \
> +    file://fix-bfd-link.patch \
> +    file://perf-fixup-gcc10-01.patch \
> +    file://perf-fixup-gcc10-02.patch \
> +    file://perf-fixup-gcc10-03.patch \
> +    file://perf-fixup-gcc10-04.patch \
> +    "
>  
>  require linux-linaro-arm.inc
> -- 
> 2.17.1
> 

> 
> 
> 

