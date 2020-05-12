Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web10.5454.1589243085237175841
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 May 2020 17:24:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=fVQ4MXyz;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f193.google.com with SMTP id 4so9709582qtb.4
        for <meta-arm@lists.yoctoproject.org>; Mon, 11 May 2020 17:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gur/FIAB6ZLc3DgM3h6yDTddh8MEFhLNAlSQw7QdS7w=;
        b=fVQ4MXyzqEiSDSzHUtgWSnBLlSnybD3fgtApyzTmU9m3jlxCgSuM779J7fJdJBPJOb
         3NXtHFXVnzQlyUHgBPt5f5RWWAxB1KuhYn1DnniJ+eH173LfzTiduSMu+eMUipTWijZ7
         rjxj2ZJpdgjH1EmwQ5Kr/e4LZhazBd2pZWDBgTHRMQ3WcNn3qNmNRGPjKHLFeWYH2J6y
         V6A/vEaVfONe+ouw4M1ZF/87tauPTpLsPvpb/+UPiotiaYlCtJHsQLYFSJJcOaL1orFV
         1oFILn7+PjtT30oqxsqrBgADiveborbd/a6oNFg5ddFj2xrv9zlFFvyaDkwu8wQvgW5M
         MLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gur/FIAB6ZLc3DgM3h6yDTddh8MEFhLNAlSQw7QdS7w=;
        b=GYKhIROqzO91rcuQFmy/bF48w3Vyxp0UmQJW7Gap9L5lFzZOH1uDhQSt3MqZn+seRh
         ux/9qM4+0a1jCec9zGAnrYjSwLfFECh5NyLzgS+XztU7NPdEuVoSuX3z0U8lt9Sw88kF
         9lcNfMy7ewj+ShNxWfcAY0poPPbA6BU//RY0/AS/G6kxUC+T3GUTXwSUKR+FRYV/k5HO
         GE3QY0D0bX5Ohdac3QZZnzW+HPZH95BSKUSHqHf9Qi/NfcyuqnAool5RWn6WLpUTqT83
         a1S/W60lm7o4KLohlDJyib9JXSGUSztk1ZvzAX28O6KoSxS4gSwhYovfS0LGONNeiR0L
         mBUQ==
X-Gm-Message-State: AOAM533YOaAjTAp2dtaS+4BOp+iYUoCPMDxjqaCNERxWpusUBvACXWgO
	BIm3WnwU3v0xb2+TsNxRVUU1DA==
X-Google-Smtp-Source: ABdhPJwvfvCwwVrCf21fWWJ09LPZZBnM5S61n8Ovg/s1VqxF6Bdt43mrK7xT5Knf4Huzk7K4zGu7Tw==
X-Received: by 2002:ac8:1967:: with SMTP id g36mr699447qtk.332.1589243084144;
        Mon, 11 May 2020 17:24:44 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:a1b5:1e25:173e:a7bd])
        by smtp.gmail.com with ESMTPSA id 124sm9680515qkl.76.2020.05.11.17.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 17:24:43 -0700 (PDT)
Date: Mon, 11 May 2020 20:24:42 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm][PATCH 3/3] trusted-firmware-a: Add recipe for version 2.3
Message-ID: <20200512002441.GA9222@kudzu.us>
References: <20200511142604.11860-1-JPEWhacker@gmail.com>
 <20200511142604.11860-4-JPEWhacker@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200511142604.11860-4-JPEWhacker@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 11, 2020 at 09:26:04AM -0500, Joshua Watt wrote:
> Adds a recipe for the 2.3 version of TF-A.
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  .../trusted-firmware-a_2.3.bb                 | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
> 
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
> new file mode 100644
> index 0000000..0b66d5e
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
> @@ -0,0 +1,25 @@
> +LIC_FILES_CHKSUM = "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89"
> +
> +SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa"
> +SRCREV_FORMAT = "tfa"
> +# Trusted firmware-A 2.3
> +SRCREV_tfa = "8ff55a9e14a23d7c7f89f52465bcc6307850aa33"
> +
> +#
> +# mbed TLS source
> +# Those are used in trusted-firmware-a.inc if TFA_MBEDTLS is set to 1
> +#
> +
> +LIC_FILES_CHKSUM_MBEDTLS += " \
> +    file://mbedtls/apache-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57 \
> +    file://mbedtls/LICENSE;md5=302d50a6369f5f22efdb674db908167a \
> +    "
> +
> +SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;destsuffix=git/mbedtls"
> +# mbed TLS v2.16.2
> +SRCREV_mbedtls = "d81c11b8ab61fd5b2da8133aa73c5fe33a0633eb"

As Diego pointed out to me in an internal review of the patch I just
sent out, this needs to be v2.18, per the MBED TLS docs.  Assuming my
patch is acceptable, let's use that one instead of this one (also it
adds v2.2 and does some mild code reorg).  :)

Thanks,
Jon

> +
> +S = "${WORKDIR}/git"
> +
> +require trusted-firmware-a.inc
> +
> -- 
> 2.17.1
> 

> 

