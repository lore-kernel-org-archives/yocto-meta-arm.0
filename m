Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web09.701.1610117309104856277
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 08 Jan 2021 06:48:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=EUVztXs8;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.52, mailfrom: jdmason@kudzu.us)
Received: by mail-io1-f52.google.com with SMTP id t8so10005724iov.8
        for <meta-arm@lists.yoctoproject.org>; Fri, 08 Jan 2021 06:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8pWlVGqWnsSNqxxRj9p8V8xbT4VlXa4cEo0TAGFVJrM=;
        b=EUVztXs8gVGbdJ8BGCVi83ys4XL/aS1kMJysBlxIzJICLOUxakuVjMTHLDPbQbXDPK
         CPo3h0McVl92uW5me+AN+oEPbT75xXI7j4KPOXXX6K/n/IB8MbXtPu8yf0h+h/ZDlI1H
         zaGwtWoBYAtDWX5rqpCyKWa8jYm7upAKiVXj3q//h6L85EEhqPnL3zzdG0UnZZRVIY08
         LmOTy9382xqu6geMv9deURUiZdC6jx8R5F/kaujsm+rnH0SxCzI2jyNJiy3umeYQVa57
         WfYshSYVAxX1fp7eWRv5QUHXz+jSTMP+VK9bjkGSAP4zl7d8BQkYZww4K4WpezFW5W59
         mxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8pWlVGqWnsSNqxxRj9p8V8xbT4VlXa4cEo0TAGFVJrM=;
        b=FWRtOdfwYQCZUJaBDtDllRcTZ24huLbGIYAkTXLS/Lhbxz+0RX1AhQ7MP2cnaA/WwJ
         /DvUq8qwN6PXlDwoHZYICawc8wHWwPBKyJg1KGwTujHclEm2zwIqg4v8g8mtl1cMcscA
         bqT77imW+UAb7TpPwHnc5OptwErSCXzGlfGcDPSLfOGZuNh/DCMYvmhpnTOoRKMFLAtd
         iE0e1o4qm+Q9Tpj2M9QdLZebVNfTyipGHEjoLcUgWmq/ybnDJcVYPOochkHLqOGSBbOA
         C1TS6pqhRdZ44NLb4tNn0lWHPRAqCTmvrPqYVvY6J625VV2+IrjebNUg6AhoJ4tZeuBk
         QRdw==
X-Gm-Message-State: AOAM531A9hamSu36ycyzlxt8OlDmfx4nvcv6ePxC+E8MWgFd83REB3ds
	8NYXCbwa/U2wMcf9CqReHK7k8Q==
X-Google-Smtp-Source: ABdhPJzKJGD3l9CxYN2tEZTMnl7bFlb/TWCCv747NE7xC3zstsCbtEjSom78n8b5Irm8N1JV7n6CZw==
X-Received: by 2002:a02:ce2f:: with SMTP id v15mr3790936jar.44.1610117308618;
        Fri, 08 Jan 2021 06:48:28 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a62f:6d00:10b9:360:420b:282e])
        by smtp.gmail.com with ESMTPSA id u24sm7998078ili.47.2021.01.08.06.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 06:48:28 -0800 (PST)
Date: Fri, 8 Jan 2021 09:48:26 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, jon.mason@arm.com, ross.burton@arm.com,
	denys@ti.com, nicolas.dechesne@linaro.org,
	daniel.thompson@linaro.org
Subject: Re: [meta-arm][PATCH] external-arm-toolchain: Misc. fixup for GCC 10.2 support
Message-ID: <20210108144826.GC29567@kudzu.us>
References: <1610010207-23400-1-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1610010207-23400-1-git-send-email-sumit.garg@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 07, 2021 at 02:33:27PM +0530, Sumit Garg wrote:
> Arm GCC 10.2 prebuilt toolchain comes with ldd and tzselect scripts
> which uses "/usr/bin/bash", so replace this with "/bin/sh" as the
> default shell.
> 
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>

Pulled into master.

Thanks,
Jon

> ---
>  .../external-arm-toolchain/external-arm-toolchain.bb            | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> index b44fd2f..c506c41 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> @@ -115,6 +115,8 @@ do_install() {
>  	rm -rf ${D}${bindir}/gdbserver
>  	sed -i -e 's#/arm/tools/gnu/bash/4.2/rhe6-x86_64##' ${D}${bindir}/tzselect
>  	sed -i -e 's#/arm/tools/gnu/bash/4.2/rhe6-x86_64##' ${D}${bindir}/ldd
> +	sed -i -e 's#/usr/bin/bash#/bin/sh#' ${D}${bindir}/tzselect
> +	sed -i -e 's#/usr/bin/bash#/bin/sh#' ${D}${bindir}/ldd
>  	sed -i -e 's#/bin/bash#/bin/sh#' ${D}${bindir}/tzselect
>  	sed -i -e 's#/bin/bash#/bin/sh#' ${D}${bindir}/ldd
>  
> -- 
> 2.17.1
> 

> 
> 
> 

