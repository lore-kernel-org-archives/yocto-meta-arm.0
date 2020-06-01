Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web11.49448.1591050026245213841
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 01 Jun 2020 15:20:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=FPDOa4hi;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f193.google.com with SMTP id v79so10675173qkb.10
        for <meta-arm@lists.yoctoproject.org>; Mon, 01 Jun 2020 15:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ruXF8LITCbcRzxDU0rKxeF2PmQ2Cv6i4zUDLD35lYIg=;
        b=FPDOa4hilab4Hs3MYO96mWX19VEidP5bpI8hecC4lh2bMrdhle/UL2nEJNhxBiGFR1
         IR2tRWLYO9gZGnS03euXITqX9IrgRp8AYaDfN5jfh1goo4xRB9zEfpu9ZJf+eUL05xuZ
         cuWwjcyvCIwK2rP2tYKjQyXD9cQZjDfUgHz9fIJvoXe5mSxeG0RhZcLvixz7k/c1la+4
         aeyYw3V1JYvrss6q49K4ZEli0SWsRHpm3TaXacN2tjg8YFKJGuHFtdjuUXuZScbvyKNm
         cW7PnLewyANdmz4AkJPep3u6k+GCVNFhBz866IxzfgLUKsxW7jWOg/plR1vA46CBZRmo
         VFfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ruXF8LITCbcRzxDU0rKxeF2PmQ2Cv6i4zUDLD35lYIg=;
        b=jPAcK/nxl0Kew6pC/+ajZmQz1W4BoC6/ekMrgb5MwieSrXEPDga5qUJJxeMQ7rQuvK
         5fJtaCN+eOWeSdPf7R2r1srwgqMS+Ah2x36j6PPBM5E2fjl9NUw4YiqhZJviSw7srVsR
         pwig68GVpOg5eAM905MBLym3HHo0IU2B7rh3DNtfIjhqNj9fbTD4bPfDsw+mbO41Nj+p
         eNZGvzBC0Av0xHY/vXfMnCSh4KUmcW8+j8oS4Mn8FBjuaD0f1pohhcNx1kkuJ9zixnlV
         6oDg1EIZuWvM95nvn607LBR9naPBvctCMn68a7gWkZS+/wEDEnx4HAc+EJDCQyRcojNU
         mbmg==
X-Gm-Message-State: AOAM532GhZLYb4iA18Hw38IZ7oUfFwb2HxKibM6wgaKm6hjCTsiW+DPA
	PJxjmoDSy629Hx9Qql8G3asmuQ==
X-Google-Smtp-Source: ABdhPJwe1G0mKHYA5QapDxVR/RTdnCCH15+Gxt1qsi4suZFaitsNYgD+axR9RcqIDOnOK0hnnTkT6A==
X-Received: by 2002:a37:a604:: with SMTP id p4mr12738961qke.101.1591050025382;
        Mon, 01 Jun 2020 15:20:25 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:40d9:962b:46e7:a335])
        by smtp.gmail.com with ESMTPSA id r77sm606034qke.6.2020.06.01.15.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 15:20:25 -0700 (PDT)
Date: Mon, 1 Jun 2020 18:20:23 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org, jon.mason@arm.com
Subject: Re: [meta-arm] [PATCH] optee-test: Fix build with musl
Message-ID: <20200601222023.GC31505@kudzu.us>
References: <20200531005940.1032825-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200531005940.1032825-1-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 30, 2020 at 05:59:40PM -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Applied to the master branch.

Thanks,
Jon

> ---
>  ...Adjust-order-of-including-compiler.h.patch | 64 +++++++++++++++++++
>  .../recipes-security/optee/optee-test_git.bb  |  4 +-
>  2 files changed, 67 insertions(+), 1 deletion(-)
>  create mode 100644 meta-arm/recipes-security/optee/optee-test/0001-host-xtest-Adjust-order-of-including-compiler.h.patch
> 
> diff --git a/meta-arm/recipes-security/optee/optee-test/0001-host-xtest-Adjust-order-of-including-compiler.h.patch b/meta-arm/recipes-security/optee/optee-test/0001-host-xtest-Adjust-order-of-including-compiler.h.patch
> new file mode 100644
> index 0000000..3066b66
> --- /dev/null
> +++ b/meta-arm/recipes-security/optee/optee-test/0001-host-xtest-Adjust-order-of-including-compiler.h.patch
> @@ -0,0 +1,64 @@
> +From fc95b3ccbbfd336797ae2cfd6dd4dc58644e146f Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sat, 30 May 2020 17:52:18 -0700
> +Subject: [PATCH] host/xtest: Adjust order of including compiler.h
> +
> +compiler.h defines some defines which violate libc namespace e.g.
> +__unused, this works ok with glibc but fails in awkward ways with musl
> +the reason is musl uses __unused in its internal structures and this
> +define in compiler.h conflicts with system headers causing errors like
> +
> +recipe-sysroot/usr/include/bits/stat.h:17:19: error: expected identifier or '(' before '[' token unsigned __unused[2];
> +                   ^
> +including compiler.h afer sys/stat.h fixes the problem.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + host/xtest/install_ta.c | 2 +-
> + host/xtest/stats.c      | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/host/xtest/install_ta.c b/host/xtest/install_ta.c
> +index 09a4c6d..6f7bb5c 100644
> +--- a/host/xtest/install_ta.c
> ++++ b/host/xtest/install_ta.c
> +@@ -4,7 +4,6 @@
> +  * SPDX-License-Identifier: BSD-2-Clause
> +  */
> + 
> +-#include <compiler.h>
> + #include <dirent.h>
> + #include <err.h>
> + #include <errno.h>
> +@@ -20,6 +19,7 @@
> + #include <sys/types.h>
> + #include <tee_client_api.h>
> + #include <unistd.h>
> ++#include <compiler.h>
> + 
> + #include "install_ta.h"
> + #include "xtest_helpers.h"
> +diff --git a/host/xtest/stats.c b/host/xtest/stats.c
> +index 96b0b5f..db9bf25 100644
> +--- a/host/xtest/stats.c
> ++++ b/host/xtest/stats.c
> +@@ -3,7 +3,6 @@
> +  * Copyright (c) 2019, Linaro Limited
> +  */
> + 
> +-#include <compiler.h>
> + #include <dirent.h>
> + #include <err.h>
> + #include <errno.h>
> +@@ -18,6 +17,7 @@
> + #include <sys/types.h>
> + #include <tee_client_api.h>
> + #include <unistd.h>
> ++#include <compiler.h>
> + #include "xtest_test.h"
> + #include "stats.h"
> + 
> +-- 
> +2.26.2
> +
> diff --git a/meta-arm/recipes-security/optee/optee-test_git.bb b/meta-arm/recipes-security/optee/optee-test_git.bb
> index f699972..957286c 100644
> --- a/meta-arm/recipes-security/optee/optee-test_git.bb
> +++ b/meta-arm/recipes-security/optee/optee-test_git.bb
> @@ -13,7 +13,9 @@ DEPENDS = "optee-client optee-os python3-pycryptodomex-native"
>  PV = "3.8.0+git${SRCPV}"
>  
>  SRCREV = "30481e381cb4285706e7516853495a7699c93b2c"
> -SRC_URI = "git://github.com/OP-TEE/optee_test.git"
> +SRC_URI = "git://github.com/OP-TEE/optee_test.git \
> +           file://0001-host-xtest-Adjust-order-of-including-compiler.h.patch \
> +          "
>  
>  S = "${WORKDIR}/git"
>  B = "${WORKDIR}/build"
> -- 
> 2.26.2
> 

> 

