Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B11DCA0FF9
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 14:12:09 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.16366.1725027128402752755
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 30 Aug 2024 07:12:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=KXYrJRD+;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.45, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6bf6606363fso10258086d6.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 30 Aug 2024 07:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1725027127; x=1725631927; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EjOLbZn8gPwZRyWMEsNotNUjjtbseBtey84ocl9bHJg=;
        b=KXYrJRD+0SxEE2JqB0o/PPlbCww+TonVg9MUZW3CR/1PBZI0G1PWlJgIJJ1OSLVKhO
         Qz7MFESvXXpw3aYsScukGeFtkIxRE6wkl91wR7vTcmbJAxy7nSNPESm8CxgyjuTe0Ove
         eCFHpbBbSPwl+V8/jE2XYNVpyVb2+JHmWTSydIQ/4cYd2lAhrMBy8zrQmpwPT+5XBGi7
         g13qR10KwKs6q0D1Oca5z4uo4sThmGNhv8J8bYr9q+4w5dEsHX8xu+V9mwVNDD/BDUsH
         AMTCx5xDOGzI3P9NbWE2epRnlQrV446Pu2W7WNXuNyWNl7lIsAG4f5w2zGo0vRj8MmKr
         UAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725027127; x=1725631927;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EjOLbZn8gPwZRyWMEsNotNUjjtbseBtey84ocl9bHJg=;
        b=Zn07rs64k92RdcG13on50rTcnb7uNeWixy23krlTZQFpIAmzpoLhVNR1bZe5o0QiDc
         Urtxtj4ThHSC8YcOMwvhv6LXXLxUc1VXsigv94oJPQMuAQC5IJacE5QEdY47UgFHAIWB
         2SJVo1G4TZG1kHKc/fjvq6i83wgIrWsNOlft23mLbO7TskzUEzxV5GXQ8h/d/dLu0b4q
         2P9DZ6RPw8ihGj4ox8vsfuzUm7UAs0ZDwDUYjCVMOHx5LfT9Z5mlV1UZ4zZkm0qhByxs
         SMZj2i1OR01NFUzYwURPXjrDmZb83QCsuuKXC4CD48Bzkj39dTuIaXMnTwO6FC2rxAyF
         uWOA==
X-Gm-Message-State: AOJu0YxDjUCdCfpArzCTGFnyEo+OfB3RA4o00PDYjfCPljRg5XgeDsL3
	7bJ7lkfZDuKG+WUZS3UvvzNQO7lsYeiA8Nbge7tdqcv4I2xlquPqzUU4dxLBcg==
X-Google-Smtp-Source: AGHT+IFKooXOxRXwmlP5Q+3GSgNVp/Mdk96KloSxWWnrvSnU1rDh3otTCPg6dl1s/DQCs/eevgqVBA==
X-Received: by 2002:a0c:eda5:0:b0:6c3:47a5:a5 with SMTP id 6a1803df08f44-6c347a500c4mr20942046d6.57.1725027127136;
        Fri, 30 Aug 2024 07:12:07 -0700 (PDT)
Received: from kudzu.us ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c340c979easm14810046d6.99.2024.08.30.07.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 07:12:06 -0700 (PDT)
Date: Fri, 30 Aug 2024 10:12:05 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Javier Tia <javier.tia@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>, Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH v4 05/13] sbsign.bbclass: Add class to sign binaries
Message-ID: <ZtHTNSrczs4x90TA@kudzu.us>
References: <20240829163209.47945-1-javier.tia@linaro.org>
 <20240829163209.47945-6-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829163209.47945-6-javier.tia@linaro.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 30 Aug 2024 14:12:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6031

On Thu, Aug 29, 2024 at 10:32:01AM -0600, Javier Tia wrote:
> A lot of recipes are using these same steps to sign binaries
> for UEFI secure boot.

Okay, I'm being overly nitpicky here.  But SB means "sign binary",
right?  So this is "sign binary sign"?  I have a mild concern of name
space of "SB" and I think it would generally be more obvious if "sb"
became "signbinary" or something similar.  I don't have very strong
feelings about it.  So feel free to ignore if you disagree.

Also, I think this could be squashed with the previous (as I'm having
to use a local git branch to review since these patches are split too
small).

Thanks,
Jon

> 
> Authored-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> Signed-off-by: Javier Tia <javier.tia@linaro.org>
> ---
>  meta-arm/classes/sbsign.bbclass | 39 +++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 meta-arm/classes/sbsign.bbclass
> 
> diff --git a/meta-arm/classes/sbsign.bbclass b/meta-arm/classes/sbsign.bbclass
> new file mode 100644
> index 00000000..a99c0218
> --- /dev/null
> +++ b/meta-arm/classes/sbsign.bbclass
> @@ -0,0 +1,39 @@
> +# Sign binaries for UEFI secure boot
> +# Usage in recipes:
> +#
> +# Set key and cert files in recipe or machine/distro config:
> +# SBSIGN_KEY = "db.key"
> +# SBSIGN_CERT = "db.crt"
> +#
> +# Set binary to sign per recipe:
> +# SBSIGN_TARGET_BINARY = "${B}/binary_to_sign"
> +#
> +# Then call do_sbsign() in correct stage of the build
> +# do_compile:append() {
> +#     do_sbsign
> +# }
> +
> +DEPENDS += "sbsigntool-native"
> +
> +SBSIGN_KEY ?= "db.key"
> +SBSIGN_CERT ?= "db.crt"
> +SBSIGN_TARGET_BINARY ?= "binary_to_sign"
> +
> +# makes sure changed keys trigger rebuild/re-signing
> +SRC_URI += "\
> +    file://${SBSIGN_KEY} \
> +    file://${SBSIGN_CERT} \
> +"
> +
> +# not adding as task since recipes may need to sign binaries at different
> +# stages. Instead they can call this function when needed by calling this function
> +do_sbsign() {
> +    bbnote "Signing ${PN} binary ${SBSIGN_TARGET_BINARY} with ${SBSIGN_KEY} and ${SBSIGN_CERT}"
> +    ${STAGING_BINDIR_NATIVE}/sbsign \
> +        --key "${UNPACKDIR}/${SBSIGN_KEY}" \
> +        --cert "${UNPACKDIR}/${SBSIGN_CERT}" \
> +        --output  "${SBSIGN_TARGET_BINARY}.signed" \
> +        "${SBSIGN_TARGET_BINARY}"
> +    cp "${SBSIGN_TARGET_BINARY}" "${SBSIGN_TARGET_BINARY}.unsigned"
> +    cp "${SBSIGN_TARGET_BINARY}.signed" "${SBSIGN_TARGET_BINARY}"
> +}
> \ No newline at end of file
> -- 
> 2.46.0
> 
> 

