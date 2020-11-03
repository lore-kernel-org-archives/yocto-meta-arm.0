Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web08.4467.1604369526375179863
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 02 Nov 2020 18:12:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=vQrPDoLe;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f193.google.com with SMTP id t5so2131213qtp.2
        for <meta-arm@lists.yoctoproject.org>; Mon, 02 Nov 2020 18:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WYzDQwFCodKMOyZSVuh0TYWqzP2n/lhwZfYRnUr9KZs=;
        b=vQrPDoLeIig3G34EJtsDonCcsLqfwA4ZTemgIIBguEx7TM6WEjbxy0DhWtScNwf30V
         joi295tHOQx6d+4nKAmqxXs/KA0sEZB6oJgFpqT5jLQTmIcq0/LxpA/vaITuUmFAo5aa
         HUpIpmXRalONVXYzI+nLctFmwrdPv0gBQRpbwbHjngGCRy0cAnz7WKshl/nDHeLZx+/U
         V14roFk6rkhgLuV8YwiUvx362gXtO+ZCPTDh2XXQd2Gbwdk8S/YhrreTtJYZNA/j4w4E
         FGZrmtwfJiExmPwgUR2pKF0UrZ7UfXXL7YTDwKeNsomWIRrTjHb9OY4BBmIGsYuPYA7p
         ngFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WYzDQwFCodKMOyZSVuh0TYWqzP2n/lhwZfYRnUr9KZs=;
        b=OC8DBChFUxhSaFuPaFg85mbIyuYdQWcAazSXwlkFwWDe12bwCmZKpKpaA+lVX9qnAZ
         suK5n1vaAHXpbp3Ib+oCWibRDbwgv6ikLOqLmMf1NybM/6eZIOV4bngTZfjJkfUP6+W+
         /zXn0dEEBFrMNIkMIzdGKJZJVaexB1K2HgJaqjCTZLD3fxDR+S9JZWDqx6I9nW/ec9JG
         nxUVU4oCOhjTAUntc3rBNNPc+2afN4HydAUCp9TZf2dJZ7I9nOSjOGsuF3d2L/2xJae8
         tKAAKGlBlKV/H6ixAe/MCi0HcIdK8QTVn0sVSX3SGHNEwRaHSvYsd512lClENWSb+ibf
         pNCg==
X-Gm-Message-State: AOAM532Y0GV7UMUjDnu2P8WvcgCffGdm7z+OotD+BZwe8OvFyO0+LPFe
	qHErNIi5n0kMQ8KVDA2kvkW+prX28wypzyVH
X-Google-Smtp-Source: ABdhPJxf8dDFQ0Z/+zJg+0wO8/fqa8YucqWin56HdwpYxqTgNH3URNFnOVxX5FLs4DBBOlugXMCefQ==
X-Received: by 2002:ac8:46cf:: with SMTP id h15mr7012120qto.99.1604369525582;
        Mon, 02 Nov 2020 18:12:05 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id n81sm2538393qke.99.2020.11.02.18.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 18:12:05 -0800 (PST)
Date: Mon, 2 Nov 2020 21:12:00 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm/opencsd: build on 32-bit Arm/x86
Message-ID: <20201103021200.GD24538@kudzu.us>
References: <20201102155147.2845341-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201102155147.2845341-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 02, 2020 at 03:51:47PM +0000, Ross Burton wrote:
> OpenCSD supports 32-bit Arm and x86 too, so extend COMPATIBLE_HOST.
> 
> Change-Id: Icf64b4645c4062e3b660b2bd2f3404bfe6c061b7
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Applied to master.

Thanks,
Jon

> ---
>  meta-arm/recipes-devtools/opencsd/opencsd_0.14.3.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arm/recipes-devtools/opencsd/opencsd_0.14.3.bb b/meta-arm/recipes-devtools/opencsd/opencsd_0.14.3.bb
> index 2121241..bec3dc7 100644
> --- a/meta-arm/recipes-devtools/opencsd/opencsd_0.14.3.bb
> +++ b/meta-arm/recipes-devtools/opencsd/opencsd_0.14.3.bb
> @@ -8,7 +8,7 @@ SRCREV = "957d18219d162f52ebe2426f32a4263ec10f357d"
>  
>  S = "${WORKDIR}/git"
>  
> -COMPATIBLE_HOST = "(x86_64.*|aarch64.*)-linux"
> +COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
>  
>  EXTRA_OEMAKE = "ARCH='${TARGET_ARCH}' \
>                  CROSS_COMPILE='${TARGET_SYS}-' \
> -- 
> 2.25.1
> 

> 
> 
> 

