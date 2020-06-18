Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web12.5215.1592518761116392433
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Jun 2020 15:19:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=FRSxt2We;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.65, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f65.google.com with SMTP id e2so3562432qvw.7
        for <meta-arm@lists.yoctoproject.org>; Thu, 18 Jun 2020 15:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2hUIKoLFmYghEuK87SpeQ9mhNZyRKxmocAFtu1QRyYM=;
        b=FRSxt2WevN65GEaGwxxE/AzlYrP/t2tmN2WqAXnYcj/eHcDeN9EWMAm9Guran7fEiY
         lp/nSdX+Kq1wlyomRZa9m44IoeKlTtem1wBlnGKPocyzcx+P2cyhRkNg8axWs3M+oDi3
         g23MuX3OkAbKHuBfxMRCGwBre2vvriqXULLwDM4yh/w5yiddelu7yywJto72mc+/m1Cc
         qg5KhCwFJQL+JTDbZ81x7pHJh8AelKbroD+0Q3iE67b2Ke8r3qLkDGabqWM7JayYZ92m
         1r6j9GDVsLploHLlc/fJXQUt2bPkGXWxo+vpKhiB4EV5uz9l1qF1R19ppHEL7JlJHHpu
         0/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2hUIKoLFmYghEuK87SpeQ9mhNZyRKxmocAFtu1QRyYM=;
        b=c5/MbESRWuoFGUB6YasdEX52DDsVyWBEm7QPxJrB+55GDmwo8nDCQiXM0VRQ/mdHYz
         Z8v/J6JNuIB9UXlGvuEfQAiWl7FJJ4lgh81RrRi1pJJP4wwKWrHkPUlv9e4t0LPJ7z7E
         wsqLZ1KlAVKHJDrIEoKpg2CF2VHmttCex6lbtaN9naW/SUI2p7JJO4aWpt40AV+cIiLe
         ssKzK/DKd7AdyZR+T+SwXIItRi2VX9SniHV0i2kSxKEhiuL+ZLgHBNSOOmG8gwdxj234
         wecsqU2livuPqTwu5I9SZ0pMTHWRNS3flLHEzhvh4Nmb3hOqGeNYsmg1Z5JaQPzs4RN+
         goGg==
X-Gm-Message-State: AOAM530taichx1gREmgqZTlJxHmcU7W058pUuZM1V/bgWPSnGWlekW8O
	hPAE9g59SCbB2wBhlVg3hWDoOc0/gLA=
X-Google-Smtp-Source: ABdhPJz8FzoNtI1eR7PQ8hnucRcppm/RyMWgqP1pzo0C52r9X3zzPh6r+BRffQeJjtd5WZ5q6Bqphg==
X-Received: by 2002:a0c:a8d4:: with SMTP id h20mr5655417qvc.41.1592518760238;
        Thu, 18 Jun 2020 15:19:20 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:f04f:fa6f:35e8:ae6f])
        by smtp.gmail.com with ESMTPSA id v22sm4670128qka.122.2020.06.18.15.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 15:19:19 -0700 (PDT)
Date: Thu, 18 Jun 2020 18:19:18 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH 1/2] arm-autonomy, xenguest: Fail if Dom0 is not properly initialized
Message-ID: <20200618221917.GC22389@kudzu.us>
References: <1592373744-85392-1-git-send-email-diego.sueiro@arm.com>
MIME-Version: 1.0
In-Reply-To: <1592373744-85392-1-git-send-email-diego.sueiro@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 17, 2020 at 07:02:23AM +0100, Diego Sueiro wrote:
> During the xenguest initialization and when invoking the
> xenguest-manager tool, abort the execution if Dom0 was not properly
> initialized on top of Xen and with the proper kernel configurations.
> 
> Change-Id: I307c03e58a266a943968df1bc5ba39951912d2cb
> Issue-Id: SCM-996
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>

Series pulled in to the master branch.

Thanks,
Jon

> ---
>  .../recipes-extended/xenguest/files/xenguest-init      |  3 +++
>  .../recipes-extended/xenguest/files/xenguest-manager   | 18 ++++++++++++++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
> index 9563d2f..cd249cf 100755
> --- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
> @@ -12,6 +12,9 @@ fi
>  
>  source ${XENGUEST_CONF_BASE}/xenguest-manager.conf
>  
> +# Make sure we properly initialized the Dom0
> +/usr/bin/xenguest-manager check-xen || exit $?
> +
>  # Create guest list
>  guestlist=$(/usr/bin/xenguest-manager list)
>  
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> index 99975a2..6a10d35 100755
> --- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> @@ -566,6 +566,24 @@ case ${cmd} in
>          usage
>          exit 0
>          ;;
> +
> +esac
> +
> +# Check if we have a valid Dom0 booted with Xen
> +ERROR_MSG=$(xl info 2>&1)
> +if [ $? -ne 0 ]; then
> +    echo "ERROR: Xen environment is not valid!!!" | tee -a ${LOGFILE}
> +    echo "ERROR: Check if Xen has booted and the kernel configuration." \
> +        | tee -a ${LOGFILE}
> +    echo "ERROR: Output from 'xl info' command:" | tee -a ${LOGFILE}
> +    echo "$ERROR_MSG" | tee -a ${LOGFILE}
> +    exit 1
> +fi
> +
> +case ${cmd} in
> +    check-xen)
> +        exit 0
> +        ;;
>      create)
>          guestfile="${arg1}"
>          guestname="${arg2}"
> -- 
> 2.7.4
> 

> 

