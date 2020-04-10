Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web10.1836.1586540563057438066
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 10 Apr 2020 10:42:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=olTeaH7R;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f193.google.com with SMTP id 14so2057769qtp.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 10 Apr 2020 10:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OHJPitDdQESd58wpqLw82z8ymMMPnRFquuPV+8yLJZo=;
        b=olTeaH7RrO4vXdclt0tmWlcJUeu8vBhCigolizvi393MoespE3l96URXctEhrGJaoq
         ZuMZThJJ25uFljSsvaQvT5zYcOXzXs7mJM/Fn6lYVhTwtgujXGhjbqn84ginCFqwuqiB
         B/c+pSWbmp+IbOYGET22G/eV2URMxFLEtTLBesc6kxTEyV0rOvyMAl3cqYyo2muiPUvG
         gwbJwTE+F6oNLUIltlo6sRpZF4kz8Zkdp/xS1DPUoCx69bcRLxFSEv1AZ6ph5d45g4B9
         f3tvibCjSIWUDKykT6ZnsGJzOMUtuZNfVmUhXF2yt8wAu4KurPGkEq5srAbJTVNjvWIc
         a9lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OHJPitDdQESd58wpqLw82z8ymMMPnRFquuPV+8yLJZo=;
        b=XLWSfWLSzYljyXQBleBZS3MQVDLeI1a00KVDKBJx2ZcCoRn1592kZnvncteblpxz9b
         9jppY38yC6VfNe+bOV31zJhi0Ash6RsAeMInzuZz67gd6tN+zYQ0VGjyqSk/JzWG92y/
         g4HdU7dKfs2sH/GGNpDdEmJIIqbuJsiDpR0Msiu/H1oen4rwI8GA31QBe8icn+UOIaYL
         PoyTilv1YpOleSyOjfWuPP0yr3JZHn+D0EeU6wWx5zfmrPOU73pn14fYNrDs8d+fTdPH
         3AhNUoIqByHyKSdPQG+A/9Yb59QWtwMlG97beM4CP/CZT89UH4woKrr+C1taVNxb86y1
         sN3A==
X-Gm-Message-State: AGi0PuZSn8u6be+aNb2dRj48bA2YSf3QgZ4xIM2yK9MsWmq5OzzzGowu
	185P1O6Jp4hug+SH/WKCzcDv24yzjFSol6j4
X-Google-Smtp-Source: APiQypJX5p/fR1xSs0NDGiiBsJh6HyZ9RJYt5gQT7fSX5Mvj7y8+vpX0TOE1TObt+4c3cutUBJGgLQ==
X-Received: by 2002:aed:2fc5:: with SMTP id m63mr324564qtd.126.1586540561991;
        Fri, 10 Apr 2020 10:42:41 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:fdce:218c:4ca5:6b77])
        by smtp.gmail.com with ESMTPSA id u14sm2063862qtq.41.2020.04.10.10.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 10:42:41 -0700 (PDT)
Date: Fri, 10 Apr 2020 13:42:39 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Cc: jon.mason@arm.com, nicolas.dechesne@linaro.org, riku.voipio@linaro.org,
	denis@denix.org, daniel.thompson@linaro.org,
	Sumit Garg <sumit.garg@linaro.org>
Subject: Re: [meta-arm] [PATCH] meta-arm-toolchain: use GCC 9.2 source tar ball insted of svn
Message-ID: <20200410174238.GB28574@kudzu.us>
References: <1586413772-31763-1-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1586413772-31763-1-git-send-email-sumit.garg@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 09, 2020 at 11:59:32AM +0530, Sumit Garg wrote:
> GCC 9.2 source fetch from svn is quite slow as compared to source tar
> ball. So switch to fetch GCC 9.2 source tar ball instead.


Pulled in to the master branch of meta-arm.

Thanks,
Jon

> 
> Reported-by: Riku Voipio <riku.voipio@linaro.org>
> Suggested-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc
> index 366a070..08e8f7f 100644
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc
> @@ -27,10 +27,7 @@ LIC_FILES_CHKSUM = "\
>      file://COPYING.RUNTIME;md5=fe60d87048567d4fe8c8a0ed2448bcc8 \
>  "
>  
> -#BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
> -#RELEASE ?= "5a5ca2d"
> -#BASEURI ?= "https://repo.or.cz/official-gcc.git/snapshot/${RELEASE}.tar.gz;downloadfilename=gcc-${RELEASE}.tar.gz"
> -BASEURI ?= "svn://gcc.gnu.org/svn/gcc/branches/ARM;rev=277439;module=arm-9-branch"
> +BASEURI ?= "https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/srcrel/gcc-arm-src-snapshot-9.2-2019.12.tar.xz"
>  SRC_URI = "\
>             ${BASEURI} \
>             file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
> @@ -71,7 +68,9 @@ SRC_URI = "\
>             file://0036-Re-introduce-spe-commandline-options.patch \
>             file://0037-Fix-up-libsanitizer-build-with-master-glibc.patch \
>  "
> -S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/arm-9-branch"
> +SRC_URI[md5sum] = "9c570fc4286825b4e6f67b3d34aade23"
> +
> +S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-arm-src-snapshot-9.2-2019.12"
>  
>  # For dev release snapshotting
>  #S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/official-gcc-${RELEASE}"
> -- 
> 2.7.4
> 

> 

