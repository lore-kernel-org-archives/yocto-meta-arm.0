Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web10.403.1601573911403956218
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 01 Oct 2020 10:38:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=jkfUlUaE;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.196, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f196.google.com with SMTP id f142so6270720qke.13
        for <meta-arm@lists.yoctoproject.org>; Thu, 01 Oct 2020 10:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ktm+BdASKOy/FpIDLG1DTAJQf+GJX1SrOx1lIQ1gv9c=;
        b=jkfUlUaEMdpVlwG4mZxh4H3yBEf6xj+W54sZmGRv71aAANyPxQZBGWoqth/HMjj5By
         8xQSI5NyvpF2FSi/39dS+C4NHllYiHrU35g16R2QmXOYdB/jWYjDoIT0PVMLOrEgH81U
         q8tqLsXRTGwQopAGBbBVg+8DRBHWCrCMKZtgmh4Zk+wBaDwQc5MlUQN2LkU0o8jG5W60
         lkVCD4KT2aqdTMwlOwMRujdX8vEkGRqdbzZadzKvuhmesfNEEa6B0QGmq/LjDurkHs3K
         kUBzsAfMVoahoriCwcS67tJv6TS6ubn1JK/8YUAgttBK6n07hu7mDCE7sSzyLHeLtxZs
         g85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ktm+BdASKOy/FpIDLG1DTAJQf+GJX1SrOx1lIQ1gv9c=;
        b=FvY6AVfuIKwxDKZuxOVuTSNoDxdvDAb7GEmQSpF+RSD0WX4Lhg5MsJvflqpZ8YVQGK
         7qgpL/O4x92D9GaG0WWih25H5WTQe8T0be2EAp3Y5VQiQKALWDDYR6IV+au0P9STOoWo
         szdi83o+UK6ebpgA/r/8RcJUer8XgYHdc23mpt3n6tlgXWhNOb8r0I386eGC+17lHKBl
         +9vW1k0IwxyFPlWwHzdSCu72l1IGeMAkbhYmrhiHAduRvycBswxEqKGK+KxGJN23hVrU
         qjlYrL3EMNoVFVZNH+EZZ6lz5SPWRir6C9gokHrXFT/Wi/sIsD0EGIIZ+flgvxbwKAkU
         yMBQ==
X-Gm-Message-State: AOAM533yK3TH36uvgNEIIFA9NxLobSjynjRiU3sge8oOQYvSeobhc2BD
	JA0pUkIiXT6THWOanNrpxPGmdg==
X-Google-Smtp-Source: ABdhPJyXVUkrCeadM6NHvAhq9sY4dm/TntXb626UGd8HkrCpWplF1ond6S1xFf1A87re37RnLkUDug==
X-Received: by 2002:a37:9bc2:: with SMTP id d185mr9106913qke.144.1601573910578;
        Thu, 01 Oct 2020 10:38:30 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id d51sm8167767qte.50.2020.10.01.10.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 10:38:30 -0700 (PDT)
Date: Thu, 1 Oct 2020 13:38:25 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Usama Arif <usama.arif@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-bsp/linux-arm64-ack: remove bbappend for version 4.19
Message-ID: <20201001173825.GC24357@kudzu.us>
References: <20200930154556.38686-1-usama.arif@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200930154556.38686-1-usama.arif@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 30, 2020 at 04:45:55PM +0100, Usama Arif wrote:
> This version is not used by any arm bsps' anymore.
> 
> Change-Id: I14b78e78ce05a50b7cd3428993de280b9394ad48
> Signed-off-by: Usama Arif <usama.arif@arm.com>

Applied to master.

Thanks,
Jon

> ---
>  .../recipes-kernel/linux/linux-arm64-ack_4.19.bbappend         | 3 ---
>  1 file changed, 3 deletions(-)
>  delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_4.19.bbappend
> 
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_4.19.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_4.19.bbappend
> deleted file mode 100644
> index f765661..0000000
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_4.19.bbappend
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -# Machine specific configurations
> -
> -require linux-arm-platforms.inc
> -- 
> 2.17.1
> 

> 
> 
> 

