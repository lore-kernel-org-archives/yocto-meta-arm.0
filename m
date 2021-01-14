Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web12.406.1610652219928236377
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 14 Jan 2021 11:23:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=rnEn6EbJ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f180.google.com with SMTP id z11so9392784qkj.7
        for <meta-arm@lists.yoctoproject.org>; Thu, 14 Jan 2021 11:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qxlpWG3OUjFUMdFfXV3Mb144bfXmNNl3Lxr6xZJ/tcE=;
        b=rnEn6EbJSx39KCw3DB0qaJAnNBfv5ppK5c6pr3/2oHNny7ZIUp6BsWeyq0r6Opv+Mz
         KSmJNL2ZQ94uj/DoQ1iKMeD0AOo3bIwzSObGYkAXFRpCRtuMOwI5W2QRpuDSAB9YJ2BZ
         HrmnZtAeujVHgIY8dIw/AIy+SS9EQZ+29CTVOf9gbK14jq3mVqpT1NaHhAf7vcUp/DPv
         q9tnyDiAu8RJzIa7hFTIPqeYvShwrHAvd/SfU1LDqMxwawXF0qe3Tz0I22RlWzv/48fH
         cQ6vVMMUDu1sF7VVFlFltA7fDkTaInWpgfuIqrnHYB+XSRAh6pfMfrK5pBZDuRn5eLHJ
         Frbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qxlpWG3OUjFUMdFfXV3Mb144bfXmNNl3Lxr6xZJ/tcE=;
        b=suikSLuzUSUaa1H8xMPId0FKq15xYMtPOEqxur3RnSBo3HYlul0INMltIMsSC0/8u6
         YixKENj+gpPC4q/i9bNmTDF62r0u947UQEGt+yx3/gWdYK/78wlqMUyza7pBc9+8FVdx
         +fZPV4CmnvTq8kNbSusGaVa99GpbHjMIFVZw8DnLucAM3rySffB/D10Vn3KQoS9fN5fU
         /rWCP6OFW5KSEROD9R4OIf9Dq9ZLFX2hp4gbVPbfh8v5ESJdK3dGLNp9tIcxoouNiUL/
         0tE1jY+kmyBCdljxsFBs5p3aru+mURwMHdzc+XJOQUNruZzpgnJYq5xTPWFqqV7hxuZZ
         Aozg==
X-Gm-Message-State: AOAM531mauySaXYTgDW4hP9PQ+7zxg9wwVKOww/Q21oVZ1URpzb7laq3
	LyA+pvlxXv10h5Hi9BkLGvlk8A==
X-Google-Smtp-Source: ABdhPJxfqZ0D1tXjwxwZMllihN3iziJUY9O2fUdJfY+byP0LOVZrW9SCid4+zldAPCZZy84nUIAyOA==
X-Received: by 2002:a05:620a:22a5:: with SMTP id p5mr8663203qkh.69.1610652219143;
        Thu, 14 Jan 2021 11:23:39 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a62f:6d00:1d40:95cb:6898:8d5])
        by smtp.gmail.com with ESMTPSA id 184sm3582773qkg.92.2021.01.14.11.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 11:23:38 -0800 (PST)
Date: Thu, 14 Jan 2021 14:23:37 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm/machine: add zephyr machine conf for microbit
Message-ID: <20210114192336.GF511@kudzu.us>
References: <20210112145053.28674-1-jon.mason@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210112145053.28674-1-jon.mason@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 12, 2021 at 09:50:53AM -0500, Jon Mason wrote:
> Zephyr supports QEMU based machine for Cortex M0 (qemu-cortex-m0).  This
> is actually using the BBC Microbit v1 machine in QEMU.  Use this more
> accurate name for the machine conf.  This enables us to verify m0
> tunings.
> 
> NOTE: qemu-cortex-m0's zephyr config has SRAM too small to run
> zephyr-kernel-test-all, but can run zephyr-philosophers and
> zephyr-kernel-test-sleep (and possibly others).
> 
> Change-Id: Ia997a162c10cf1a6b8fea244cb1960f4d4c66adc
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---

Pulled into master.

Thanks,
Jon

>  meta-arm/conf/machine/microbit-v1.conf | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta-arm/conf/machine/microbit-v1.conf
> 
> diff --git a/meta-arm/conf/machine/microbit-v1.conf b/meta-arm/conf/machine/microbit-v1.conf
> new file mode 100644
> index 0000000..c4cc4d5
> --- /dev/null
> +++ b/meta-arm/conf/machine/microbit-v1.conf
> @@ -0,0 +1,20 @@
> +#@TYPE: Machine
> +#@NAME: microbit_v1
> +#@DESCRIPTION: Machine for BBC Microbit v1, Zephyr BOARD qemu_cortex_m0
> +
> +require conf/machine/include/qemu.inc
> +require conf/machine/include/tune-cortex-m0.inc
> +
> +MACHINEOVERRIDES =. "nordic:"
> +
> +# For runqemu
> +QB_SYSTEM_NAME = "qemu-system-arm"
> +QB_MACHINE = "-machine microbit"
> +QB_CPU = "-cpu cortex-m0"
> +QB_OPT_APPEND = "-nographic -vga none"
> +QB_RNG = ""
> +
> +# Zephyr RTOS settings
> +ZEPHYR_BOARD = "qemu_cortex_m0"
> +ZEPHYR_INHERIT_CLASSES += "zephyr-qemuboot"
> +ARCH_qemu-cortex-m0 = "arm"
> -- 
> 2.17.1
> 

> 
> 
> 

