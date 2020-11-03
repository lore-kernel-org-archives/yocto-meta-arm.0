Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web08.4476.1604369558210326540
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 02 Nov 2020 18:12:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=mfBWjlIm;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.194, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f194.google.com with SMTP id a64so10091237qkc.5
        for <meta-arm@lists.yoctoproject.org>; Mon, 02 Nov 2020 18:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wwBsYEkLwO0EmTeLY+k1y0PWGcp/v0NosayoOG3xKvw=;
        b=mfBWjlImBxaJjVs9W9NPC98xAtOi6YyTBo6GA/KwHZ5SAOVSYLoWqJQy2bqDt0krPJ
         B9GWLzdscvWrhzRIfq+A82iWdzKMcbYRuLa5HOtuidLsz3U3Cnldvqb3enItAgozEQQP
         E/ksRins27EdYWDCNzGKXnyiLzQ0BCtkOpW0074cpgPoiSjDrO+l1p4pxv1yXcX4ogzF
         rTFetL+2RRRbu/v48BSA2OcOIQ4wJMuVZ21tCkB5DPAwtl/19uaOFW2imaYCgqtpXJSt
         16nC3mvorpfA7adKtF2ozOSqUXgLN/ujwz9MPZrt4HVTX8kuYh69OF9D7FSOQObcFlys
         y9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wwBsYEkLwO0EmTeLY+k1y0PWGcp/v0NosayoOG3xKvw=;
        b=tQOsiPLGWfxU2fj+77+ZO0ABGlthh5RxplowuMCiP4RzglCKD65XmRKk9v8WXDEVq5
         tIpJ4L8K+0OqLTWdcOGjdGg98eeMXXLG/OY4Ld8apCxKN4ELRzTAXnl3tQR267MJjmfc
         xYyTBUgLEk9BhrNe5ng+xh2um+2f8Clt9tXXoUMV+Kp/0k+GtD4NqRGsvztWN1h02cH4
         dE2UZLZw1LSnLUK75WP6Dxhz4hhdFX+z0cAUQ5aeyfUtyVjwcyfLVsNxD3A/i4HmYT0J
         6Y4S0SHmBgpcRiHz3lsT/1l2kj15mIOFkqkFq5PsOr5z+klySL+765xWT1ZYWYGkI3as
         Bkkg==
X-Gm-Message-State: AOAM533YiiMS1uaySCzKa23Sn24dcsVO6JeHwBm+NfxChY4j0kb6zJKf
	wjdweB/XgdCZ7zQZfir8tpTksZiWvuFHbxbK
X-Google-Smtp-Source: ABdhPJxgGZrWhiCne5SZaFzVJlrPfd4W60vBOmw3F0QRLiX83pPFUYgHJ/iNn9jn1kyItYZ3ASqNng==
X-Received: by 2002:a37:495:: with SMTP id 143mr17578757qke.384.1604369557341;
        Mon, 02 Nov 2020 18:12:37 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id w5sm9248447qkf.31.2020.11.02.18.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 18:12:36 -0800 (PST)
Date: Mon, 2 Nov 2020 21:12:32 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm/optee-test: don't attempt to build with musl
Message-ID: <20201103021231.GE24538@kudzu.us>
References: <20201102160955.2845447-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201102160955.2845447-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 02, 2020 at 04:09:55PM +0000, Ross Burton wrote:
> optee-test doesn't build on musl (or bionic) because libstdc++.a under musl
> depends on libc providing the pthread functions, but TAs are built without
> a libc.
> 
> Until this is fixed upstream (see https://github.com/OP-TEE/optee_test/issues/458)
> simply refuse to build optee-test with musl.
> 
> Change-Id: If73fd43683e19e2943bf54f4027806786fb1dc7d
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Applied to master.

Thanks,
Jon

> ---
>  meta-arm/recipes-security/optee/optee-test.inc | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta-arm/recipes-security/optee/optee-test.inc b/meta-arm/recipes-security/optee/optee-test.inc
> index 467e687..eb11a12 100644
> --- a/meta-arm/recipes-security/optee/optee-test.inc
> +++ b/meta-arm/recipes-security/optee/optee-test.inc
> @@ -8,6 +8,10 @@ LIC_FILES_CHKSUM = "file://${S}/LICENSE.md;md5=daa2bcccc666345ab8940aab1315a4fa"
>  inherit python3native
>  require optee.inc
>  
> +# Linking fails on musl due to C++/threads
> +# https://github.com/OP-TEE/optee_test/issues/458#issuecomment-720540834
> +COMPATIBLE_HOST_libc-musl = 'null'
> +
>  DEPENDS = "optee-client optee-os python3-pycryptodomex-native"
>  
>  SRC_URI = "git://github.com/OP-TEE/optee_test.git \
> -- 
> 2.25.1
> 

> 
> 
> 

