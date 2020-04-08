Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web11.5302.1586317706589745915
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 Apr 2020 20:48:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=ZfsP80fY;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.68, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f68.google.com with SMTP id ef12so2976602qvb.11
        for <meta-arm@lists.yoctoproject.org>; Tue, 07 Apr 2020 20:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=a0g8SljxGSsp4HmTHdgIrlJXSXfqNbw5+wLtHpb3S6A=;
        b=ZfsP80fYJPDshVl3vBdZzJxQMHOUN7YWDltmdpa+nUUqB6LgmamiGqp8AF1/ZsNzaf
         etdp/TtqRUMgeeJf8HSnfb9sji4qM83Hm66CqhCBZYtR0JONkac3RapoaIlKc50lZvVX
         FfBD+LHaYLjEl4+ESPO8zzbt9Uz/z8Dh6td+koJPSwiaoDOCD7+2WNu4WBi71xMHuGr4
         4JydHSVBlsusyg3Hym0waP0Dko/1XWjMJ4fWLNavcwRMN818FY3yIBMztTiRMbb23DHr
         vHW5V+taoKAB+peMro9Bocc/WN4SpeUNej8iSLWIq6yyIx8Yd2VLp9HECae7Lx3t9o4w
         3kaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=a0g8SljxGSsp4HmTHdgIrlJXSXfqNbw5+wLtHpb3S6A=;
        b=mCMrmACFQe7bW0nIHHazxrj5j1VK1Cx1lUI3QZRdZ1yNd/awEmiCKJEgWh05NpFa1i
         WRmt8n1dQT6LzPRw3/VtxCrxZI5Ed5dHRyub1OLnM0ZtrZ+sWUKRY336dzWLv2JT9wce
         NNF6zbFlM3Al+hidI4K1Xn3Pxq4Sd1zW+QEckT8VefcPjumzgWWCxhc4k5w09VQpic2u
         Yqy7XRrtMjylouj8rVvQl9oJu2Cvu4OWS0nA9nNJJgzDMSiYCRgrxpW33C9rY9DyWdpB
         wrckM9dU54wjsomrKK6kGre9ObIkr3bxFPIrt8/yIJ91lsOK0nvvO1CbwbX028TGUexV
         lbKg==
X-Gm-Message-State: AGi0PubEVHC9bCuH+oi+E6RZDwlbpLglZR0pQl5c0enjlFXPGpQkmY9o
	pR1On3ygK7zR0JqLWv4myWMG6yDVa+r3CA==
X-Google-Smtp-Source: APiQypJxQ6CINI6V4EpKNdB8bvbNVK++5wlvirSY82W3YrN5JJB9KyreYNpVfaUJKgU1VnLDBZXwow==
X-Received: by 2002:a0c:a2c5:: with SMTP id g63mr5386585qva.114.1586317705572;
        Tue, 07 Apr 2020 20:48:25 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:e180:b789:7869:7b22])
        by smtp.gmail.com with ESMTPSA id f13sm18554826qti.47.2020.04.07.20.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 20:48:25 -0700 (PDT)
Date: Tue, 7 Apr 2020 23:48:23 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-arm] [PATCH v2] optee-client: upgrade 3.7.0 -> 3.8.0, cleanup
Message-ID: <20200408034823.GE29748@kudzu.us>
References: <1601D50E2F786E6D.29801@lists.yoctoproject.org>
 <1585929820-14071-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1585929820-14071-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 03, 2020 at 12:03:40PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
> v2 - correct typo in the commit log - use dots in version instead of commas

I tried to swap out this patch in the series above, but it failed to
apply cleanly.  Can you resend the entire series asa v2?

Thanks,
Jon

> 
>  .../optee/{optee-client.bb => optee-client_git.bb}   | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
>  rename meta-arm/recipes-security/optee/{optee-client.bb => optee-client_git.bb} (63%)
> 
> diff --git a/meta-arm/recipes-security/optee/optee-client.bb b/meta-arm/recipes-security/optee/optee-client_git.bb
> similarity index 63%
> rename from meta-arm/recipes-security/optee/optee-client.bb
> rename to meta-arm/recipes-security/optee/optee-client_git.bb
> index 519683a..a25d343 100644
> --- a/meta-arm/recipes-security/optee/optee-client.bb
> +++ b/meta-arm/recipes-security/optee/optee-client_git.bb
> @@ -1,18 +1,21 @@
> -SUMMARY = "OPTEE Client"
> -HOMEPAGE = "https://github.com/OP-TEE/optee_client"
> +SUMMARY = "OP-TEE Client API"
> +DESCRIPTION = "Open Portable Trusted Execution Environment - Normal World Client side of the TEE"
> +HOMEPAGE = "https://www.op-tee.org/"
>  
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=69663ab153298557a59c67a60a743e5b"
>  
> -PV = "3.7.0+git${SRCPV}"
> +PV = "3.8.0+git${SRCPV}"
>  
>  inherit python3native systemd
>  
> -SRC_URI = "git://github.com/OP-TEE/optee_client.git \
> -           file://tee-supplicant.service"
> -S = "${WORKDIR}/git"
> +SRCREV = "be4fa2e36f717f03ca46e574aa66f697a897d090"
> +SRC_URI = " \
> +    git://github.com/OP-TEE/optee_client.git \
> +    file://tee-supplicant.service \
> +"
>  
> -SRCREV = "bc0ec8ce1e4dc5ae23f4737ef659338b7cd408fe"
> +S = "${WORKDIR}/git"
>  
>  SYSTEMD_SERVICE_${PN} = "tee-supplicant.service"
>  
> @@ -25,7 +28,8 @@ do_install() {
>      ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so
>      ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so.1
>  
> -    cp -a ${S}/out/export/usr/include ${D}/usr/
> +    install -d ${D}${includedir}
> +    install -p -m0644 ${S}/out/export/usr/include/*.h ${D}${includedir}
>  
>      sed -i -e s:/etc:${sysconfdir}:g \
>             -e s:/usr/bin:${bindir}:g \
> -- 
> 2.7.4
> 

> 

