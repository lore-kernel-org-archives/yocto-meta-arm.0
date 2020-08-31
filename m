Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web10.62844.1598905644015789672
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 31 Aug 2020 13:27:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=hjIGvfyf;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.66, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f66.google.com with SMTP id y11so3276862qvl.4
        for <meta-arm@lists.yoctoproject.org>; Mon, 31 Aug 2020 13:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yU9Kh7MlZ8qJ1k7u03WKmGm4t96sUiToU9SJtfBsqQw=;
        b=hjIGvfyf07VvK8SdllYiI/QZPiNIZb0i3bayn6Al/1UiLinjsi/9Q1a3Icqwvjh3Fr
         tGHecED1ejBM9HeOj/R3nd2FoPRtnei/RkyS12Aoep93Qe5Z5RnNCgphp5o/c8wcMtDP
         pvI8pKzGSw/dWmATqciL8sNV3J27S8QDVOcNXsp+S4Q0A/wQlib++2hDujzjvqy53m6A
         dvEffKNG2a6ccgSLaFvwyvBns2/66pmZ+HVCkmTI5Bv5bx6FN+edzUDHoWOzT7+cukDn
         fdPArIbsWKL5bv+CKVWS720rH6jTKqZM7WKBC0wUKMF0QTt3xT6I7c7eztJF+6AXLQWJ
         SFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yU9Kh7MlZ8qJ1k7u03WKmGm4t96sUiToU9SJtfBsqQw=;
        b=k/rL5psrrIrN/pYreVCpmjsIph/B90XwUcbJ8/79nehNu1GUcQORJPAbUmHHLD8Ghk
         jqZD0ctwLyCvDoqem+FHrOsha62GYYyYY0DnRc/VXDq+rTTvTKo4WckGI0n63Vc9sAEU
         4/JriKcbOHASIvJNmqH83A8TlAU30mQ4gIew15mQvMl2LaJs82yLVWI68jCIsjxFzqoW
         itSjqc3fEmfG9j9QgxMUkx++rL5ph4bcHlrXdz2OXsmMNOx78a03XOoKe5qFepoufQlH
         yPd1mr7tiuXG6rC/+h3YPZy3HKXSgzw20VJZFXZAyBRKmX1X6zXTDPXNMtXRyP/6HyCx
         2oVg==
X-Gm-Message-State: AOAM531SvSiXGb3c5uMNxju57sKADqn9U7z/1KkZcIJTtK3sLR5vle7I
	3uCD/QslBHGKnvNOU0sLJBH9SMZcwyyozXO8
X-Google-Smtp-Source: ABdhPJySlVa4EMZJDibMK589Bm0imdQV2ghIsyu/i9f98evUAGM6TJMjhkUsEBJen5piAMb5hNJPTA==
X-Received: by 2002:a0c:b25a:: with SMTP id k26mr2815537qve.63.1598905643260;
        Mon, 31 Aug 2020 13:27:23 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id 145sm3095581qkf.18.2020.08.31.13.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 13:27:22 -0700 (PDT)
Date: Mon, 31 Aug 2020 16:27:20 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Usama Arif <usama.arif@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm/scp-firmware: Fix build location
Message-ID: <20200831202719.GB17615@kudzu.us>
References: <20200827173353.17860-1-usama.arif@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200827173353.17860-1-usama.arif@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 27, 2020 at 06:33:53PM +0100, Usama Arif wrote:
> The build location is dependent on whether
> debug or release version of scp is being built.
> 
> Change-Id: I22e0777c316ea59a49a6f178d620a59d24372e00
> Signed-off-by: Usama Arif <usama.arif@arm.com>

Pulled into master.

Thanks,
Jon

> ---
>  meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.6.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.6.0.bb b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.6.0.bb
> index 47b09aa..4de0912 100644
> --- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.6.0.bb
> +++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.6.0.bb
> @@ -58,7 +58,7 @@ do_install() {
>       install -d ${D}/firmware
>       for FW in ${FW_TARGETS}; do
>          for TYPE in ${FW_INSTALL}; do
> -           install -D "${B}/product/${SCP_PLATFORM}/${FW}_${TYPE}/release/bin/${FW}_${TYPE}.bin" "${D}/firmware/"
> +           install -D "${B}/product/${SCP_PLATFORM}/${FW}_${TYPE}/${SCP_BUILD_STR}/bin/${FW}_${TYPE}.bin" "${D}/firmware/"
>          done
>       done
>  }
> -- 
> 2.17.1
> 

> 

