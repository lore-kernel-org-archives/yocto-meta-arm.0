Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.8191.1591095929600353635
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 02 Jun 2020 04:05:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dn7H1H62;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id x13so2969954wrv.4
        for <meta-arm@lists.yoctoproject.org>; Tue, 02 Jun 2020 04:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=8GgVUDNEO2fd+ZtcDhX8kSqg6tzd/JlO5eQ7PBKR01A=;
        b=dn7H1H62GLZlFk8ik/X6l2g3oXJxj5MmLCk98VerDoDmzTWfUDrHQqNfDR7r20gywY
         bn5qlfZW6MilYa7mAtvqSrc+jq+r+zURuGI8cGZwx1jKMxLmlF4FiBsRI2ONR/sCTJ6I
         Ob9fBELVz+9y/Hq4OCJxJo4fM2k5rLlwh0gz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=8GgVUDNEO2fd+ZtcDhX8kSqg6tzd/JlO5eQ7PBKR01A=;
        b=gAkySVq8HdCkS+T2tBOHAHQqS+HBoPlB1C4o+z25dXRxilvyjT5Imi9FobwYrKwR9r
         2fvpVWmlzQTNAX6ia2w92PkMHkcDbzSAEtbmR5iBgVEXUW/sENWHzm3HO/77pWqUeN6N
         QRPIz/zsYedGtRBpF5FCa39ZA4FH+C/ET6reVOmF1WxjjdEDVPoGW54Z2pgUoxnknbfT
         iOHH3IqbNssbcbT/Z3fV8uKvslQvjW9vtEYVf8ArdXVxrqaZEey4kHhjgvD9b1V381jy
         7Yh0ZZLKdB0eh06MzMHY4PmWBRB/UVDXTYw4N/rEQjF4Bt41pkjFUSW44ZEKLNwBn7aw
         k4wg==
X-Gm-Message-State: AOAM530tsgtFmGUE5gBrOJW22ZKH6hshzjud83ULnHbxrPIQvf5E7rgb
	wGwcdzBp4QS8zwpjULG9SuA+Uw==
X-Google-Smtp-Source: ABdhPJwOUEkTFItu0Ink+PH0CegpNUpTRK0Gvf4mMU3Zs2hlvvrtW3FdbLK4qpSZRFqAtGQlF3ZgXg==
X-Received: by 2002:a5d:4385:: with SMTP id i5mr25356221wrq.420.1591095928187;
        Tue, 02 Jun 2020 04:05:28 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id x66sm3020244wmb.40.2020.06.02.04.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 04:05:27 -0700 (PDT)
Message-ID: <dcafa79b533769337a6c0838be19d9c40eb4d9e2.camel@linuxfoundation.org>
Subject: Re: [meta-arm] [PATCH v2] arm-toolchain: merge binary toolchain recipes
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Diego Sueiro <diego.sueiro@arm.com>, meta-arm@lists.yoctoproject.org
Date: Tue, 02 Jun 2020 12:05:26 +0100
In-Reply-To: <9778.1591092987869245648@lists.yoctoproject.org>
References: <8876.1591081059371861619@lists.yoctoproject.org>
	 <9778.1591092987869245648@lists.yoctoproject.org>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-06-02 at 03:16 -0700, Diego Sueiro wrote:
> On Tue, Jun  2, 2020 at 07:57 AM, Diego Sueiro wrote:
> 
> > 
> > > diff --git
> > > a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-
> > > x86host.inc
> > > b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-
> > > x86host.inc
> > > new file mode 100644
> > > index 0000000..332ffab
> > > --- /dev/null
> > > +++
> > > b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-
> > > x86host.inc
> > > @@ -0,0 +1,26 @@
> > > +S = "${WORKDIR}/${BPN}-${PV}"
> > 
> > As @Ross mentioned, this is already the default value for the S
> > variable.
> 
> It seems that the documentation[1] needs to be updated since the S now defaults to "${WORKDIR}/${BP}" [2] :
> 
> [1] - https://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html#var-S
> [2] - http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/conf/bitbake.conf#n372

I'd note that BP = "${BPN}-${PV}" so it is essentially correct.

Cheers,

Richard

