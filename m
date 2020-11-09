Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web09.18163.1604954522650157907
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 09 Nov 2020 12:42:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=icghfAqJ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.67, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f67.google.com with SMTP id ek7so1023781qvb.6
        for <meta-arm@lists.yoctoproject.org>; Mon, 09 Nov 2020 12:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bbDqRdUK+iKNDNvWupJjgOKSfnF74W9ElODdfiP7ois=;
        b=icghfAqJECwsHg5qKbJLsv/KFr/85clbLoNnzW6kSjacvkA5UeYL3ZMTwh7r7paMbF
         kvosuidL3PJmUgfOOlLKcoB2tGVX/qi8canowvpShtqf3EmhuHYOlUOx+Q4DTSCdEZhR
         Lkhy19l3jNzBzCS1NP5/v/eH8TjyAK/PDg76VLA4W0BHE82yP7OKa0pYGDQKtaEKWlDe
         riIAUODn9PzSq7qYM4/R6mZ+K0x1CLwGq5lY/skbYgRipXz2jKJF7pMgR9zmV40czN7W
         wD9yjO2Slxxd6aUrP8jp2jR/TLO2NR/Jqp2wpdLUHq3se9Vc9yE0KM7LmeQAzwp/IZww
         Op9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bbDqRdUK+iKNDNvWupJjgOKSfnF74W9ElODdfiP7ois=;
        b=CZNymOXYVdW7MXUjHWZ40/yw8k5bB4zIvUdeQeLQZRWId9Q9drik+MvhT2vsZWMmzW
         FOqUp2leVxltrOQnHFmqe3QoI44MsBOw0xSWdXM7MjC5qQWz7/wPhDPu80zxwV4NDDgo
         SQMEAty151fADYvoEus5NRTpRtMUhjd+GEH29kMXtVU9UVkDquqbebeH0RsmDdFc3TAu
         /70YRQYFNenSHfeJ6S75JAc2bcuzjTWCiFmoO/N1voZbN8hWJB8KRZbGiqQdFPfC6fBh
         TQogxVY1D1/KPQeR905Xo+SSwTl3/VL9UENvhWNAsrchUFc2IPvu3+uEIg9h5gbzxXeo
         IjTw==
X-Gm-Message-State: AOAM532Es1tD6gqpnHlGtmY9/HZAhdGdBe6sBMQaRS6b2RqO2tbKl3q1
	xEvptkxsiZBq+89Nnvo/a5CFqqTr/7qegg==
X-Google-Smtp-Source: ABdhPJyRQYaZZ3cD8O/LW/Aj9Z5xY1t0h+9Rgjndi6uuaP1P7T/IXKET+p36VsgijklUOm/FOEYVTQ==
X-Received: by 2002:ad4:4512:: with SMTP id k18mr16324670qvu.5.1604954521689;
        Mon, 09 Nov 2020 12:42:01 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:e05c:37c6:4b68:d472])
        by smtp.gmail.com with ESMTPSA id p13sm6555031qti.58.2020.11.09.12.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 12:42:01 -0800 (PST)
Date: Mon, 9 Nov 2020 15:41:59 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm/trusted-firmware-a: fix 2.4 build with OpenSSL
Message-ID: <20201109204159.GF17359@kudzu.us>
References: <20201109131747.4036618-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201109131747.4036618-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 09, 2020 at 01:17:47PM +0000, Ross Burton wrote:
> 2.4 has added support for a global OPENSSL_DIR make option, instead of
> hard-coded /usr into the individual Makefiles.
> 
> The TC0 build is now using a snapshot of TF-A after that change landed,
> so pass OPENSSL_DIR via EXTRA_OEMAKE to fix the build.
> 
> Change-Id: I9e06991d15bb67f983a203ec3a1b1754cc6e2d7e
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Patch pushed to master.

Thanks,
Jon

> ---
>  .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc     | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> index 393da40..f7439c1 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> @@ -112,6 +112,9 @@ DEPENDS += " ${@bb.utils.contains('TFA_UBOOT', '1', 'u-boot', '', d)}"
>  do_compile[depends] += " ${@bb.utils.contains('TFA_UBOOT', '1', 'u-boot:do_deploy', '', d)}"
>  EXTRA_OEMAKE += "${@bb.utils.contains('TFA_UBOOT', '1', 'BL33=${DEPLOY_DIR_IMAGE}/u-boot.bin', '',d)}"
>  
> +# Tell the tools where the native OpenSSL is located
> +EXTRA_OEMAKE += "OPENSSL_DIR=${STAGING_DIR_NATIVE}/${prefix_native}"
> +
>  EXTRA_OEMAKE_append_aarch64_qemuall = " \
>      BL32=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-header_v2.bin \
>      BL32_EXTRA1=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-pager_v2.bin \
> @@ -132,6 +135,7 @@ do_compile() {
>      # These changes are needed to have the native tools compiling and executing properly
>      sed -i '/^LDLIBS/ s,$, \$\{BUILD_LDFLAGS},' ${S}/tools/fiptool/Makefile
>      sed -i '/^INCLUDE_PATHS/ s,$, \$\{BUILD_CFLAGS},' ${S}/tools/fiptool/Makefile
> +    # This can be removed when only TF-A 2.4 onwards is supported
>      sed -i 's^OPENSSL_DIR.*=.*$^OPENSSL_DIR = ${STAGING_DIR_NATIVE}/${prefix_native}^' ${S}/tools/*/Makefile
>  
>      # Currently there are races if you build all the targets at once in parallel
> -- 
> 2.25.1
> 

> 
> 
> 

