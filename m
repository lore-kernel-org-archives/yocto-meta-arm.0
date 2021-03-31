Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web12.6187.1617195416310005878
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 05:56:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=sIe9eezR;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f176.google.com with SMTP id i9so19176431qka.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 31 Mar 2021 05:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Ufr3TMa/tI7c66twv91Yx8q8EHdycD94o208WtxfuWg=;
        b=sIe9eezRCMjU/JQai94tFl2WLIEnm1i1mA5g42KvFq89PdibZ6EQd0uxZX/JTmLqLb
         gVZMUu1PwfkJFqMLXyspIa04xFuXD8ZFjPVRJZjBG08lJ57FgkC6W8xCu8Oc/Z4g7ALk
         FBjfr1TM60HVLdZjqDSfmM8eOF4fVJpKySoqR1cMBhj9aqav+HnR6aaSVPEOMvgbSDdM
         OYuNkQYR0CraubLd4fjkhrojISvwsNhSqKND/kkFW4XgPD6Krse6MHMYEndcLsEeRFAO
         1//cX2mYwvrKtiLHBJ2H8XjupduMQjOwgL2hbn7W8noLP96mB7BOn5p/yOPcNQUl+8up
         OGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ufr3TMa/tI7c66twv91Yx8q8EHdycD94o208WtxfuWg=;
        b=AsR6UNQbhvAV8qM5hiV2oToeoly6WTpbvWRe4SPdBY1YEC0Op5FCkbNewUYAt01F8t
         Kut3wSQfbJXzkEr6Vp2kGBPBYn08ivAqBg5UPEPgDQUM+eu7Oi3/xKFI5AT2+ykaSzA7
         5TLwP8j30TL+/WgGHwLpYjytz0YCY8wBXZAdY2+iYehe78Lqj2h6CahU3m4Dy+qPHMnA
         DqMuI0o4fdzyPJ7vil481mBYEUBm/VGagRcpsqjZ8DqD7R6eOaAkctWWw+U0PeAATaBf
         6xjPibynMrFfrHvWv0RNv6WLuaOvrvtkqL5s+SGSOSDTSpqOKwkWNMflNUxxfl5YkIZI
         eYVA==
X-Gm-Message-State: AOAM531d/0siekazteXnBxJYEnSGi3O6tfqgjRKAGRxCBJUPRzxL+u4Q
	fT/aVadmYQZFpSwkP9ntGIj1SWvc12Wirw==
X-Google-Smtp-Source: ABdhPJz4SxTCgipuYqdFJ3sqpPKhCTbqRulRTae/kIjnEXEcaTTAy3oEMip1m7CMBlAvWrYHARAcag==
X-Received: by 2002:a05:620a:906:: with SMTP id v6mr2952685qkv.28.1617195415522;
        Wed, 31 Mar 2021 05:56:55 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a601:f800:4ba:158e:74b5:f678])
        by smtp.gmail.com with ESMTPSA id j30sm1259632qtv.90.2021.03.31.05.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 05:56:55 -0700 (PDT)
Date: Wed, 31 Mar 2021 08:56:53 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-bsp/scp-firmware: correct PV
Message-ID: <20210331125653.GC8543@kudzu.us>
References: <20210330134147.2539983-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210330134147.2539983-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 30, 2021 at 02:41:47PM +0100, Ross Burton wrote:
> These are git snapshots after 2.7.0, not 2.7.
> 
> Change-Id: I6371dd12f5d17f432839b3673331b3153c1c4b6a
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Patch included into the master branch.

Thanks,
Jon

>  meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc | 2 +-
>  meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
> index d365dc6..fa3403d 100644
> --- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
> +++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://license.md;beginline=5;md5=9db9e3d2fb8d9300a6c3d15101
>                      file://contrib/cmsis/git/LICENSE.txt;md5=e3fc50a88d0a364313df4b21ef20c29e"
>  
>  SRCREV  = "6c15afb1b37d0728482c598b063cd69bfc733e93"
> -PV = "2.7+git${SRCPV}"
> +PV = "2.7.0+git${SRCPV}"
>  
>  COMPATIBLE_MACHINE_n1sdp = "n1sdp"
>  
> diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
> index 7d71a57..4501b94 100644
> --- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
> +++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
> @@ -2,7 +2,7 @@
>  
>  # Intermediate SHA with 2.7 baseline version, required for Theodul DSU
>  SRCREV = "bc35f4fd2d5e93c77effdeba43c98ddd5038de96"
> -PV = "2.7+git${SRCPV}"
> +PV = "2.7.0+git${SRCPV}"
>  
>  COMPATIBLE_MACHINE = "tc0"
>  
> -- 
> 2.25.1
> 

> 
> 
> 

