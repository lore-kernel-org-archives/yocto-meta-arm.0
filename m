Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64D68CA0FF8
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 14:03:29 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.16017.1725026599210938091
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 30 Aug 2024 07:03:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=x5BUQnky;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.182, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7a7f8b0b7d0so77713885a.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 30 Aug 2024 07:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1725026598; x=1725631398; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gvWz7cHRvUkX2LgYAqpe6m9Qp1+1tVxyAr3U0739lCU=;
        b=x5BUQnkyjRAf03HPTae1BoPyXjzFvK405zucRhreiiI/uX1yUTEwiMqjJ8L/QvMi7D
         U7BDS9WrI/m5M5DbXgPvQCwdrwNrKfIA00IeaAZdfAtZtRyudTFXFPNdrYWBQdik2X11
         kF8kSTyorHzQTjKt6HpRMe/ndIpt0h5x1wT9CAmVElom9RHDzff1g0qVqzs/MS7ZMQYb
         kgj96K98e+HHS5BvvKC/5z/bjM5EAV9vsULrxp+k3QISa4AEpwUu8ju193ZECJaf8CBX
         ii/qFvpBMqFLrGX4pyTTZxBX+QYPqKJTDGRvCJ3e+EzH1mNKfmHs26eetx2hWmk7bD7O
         OxRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725026598; x=1725631398;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gvWz7cHRvUkX2LgYAqpe6m9Qp1+1tVxyAr3U0739lCU=;
        b=U8OlfoqcxPI/G07v3a8L0e5RahLAjCivlJ3qL9TKryhs0x9dVX//M1J7AJdFHW5UlC
         ++9QQM2fq75ufsxidXl49P20bKcJcumYDNfDlPsNbwGk1p2Se5Kr2bqcEnjS/HfM9sWz
         OQ8WlhzzKvN38Qql+/xIWiihP4NWrlNz04gcdCQor5dXNHsLqdZOafu2VN0h95r4FBFY
         XKKwV2gSk1jWk9uoySyf8bBlhMvAYA34blx+fUVRhVCUvVoga9RGZNq/JsMULTWXVgKL
         gV/zBgpGpym134W/nl7qfQaWZDcyi5dQ4R6Celkg0VjUpWfAY3ciN8yHe4tHUdTqfcvV
         Sa0Q==
X-Gm-Message-State: AOJu0YxoQnrawzihZnRYcvXEa9k4t5a3mWqNJlJZC3yGeYUq/Wp8M8/B
	iPUs0yEO7KA/Ti8aCeSIscDRgmhMDf7oVLpvgVWTMZrelW2KpvOko/JyMHwHw7EfiKxaO4BHwtI
	=
X-Google-Smtp-Source: AGHT+IGUc/jXDkezhCLvUHCFTOeSWXJYv1I6cd4ffBrICUtVAI083C3ePv/8rRmVlFnyvYaOeMdl8A==
X-Received: by 2002:a05:620a:28c6:b0:79d:74c3:b5fe with SMTP id af79cd13be357-7a804267b74mr692126485a.66.1725026597974;
        Fri, 30 Aug 2024 07:03:17 -0700 (PDT)
Received: from kudzu.us ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a806d5ff9csm144687885a.116.2024.08.30.07.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 07:03:17 -0700 (PDT)
Date: Fri, 30 Aug 2024 10:03:15 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Javier Tia <javier.tia@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>, Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH v4 04/13] uefi-sb-keys.bbclass: Add class to validate
 UEFI keys
Message-ID: <ZtHRIzwr9roSCkuS@kudzu.us>
References: <20240829163209.47945-1-javier.tia@linaro.org>
 <20240829163209.47945-5-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829163209.47945-5-javier.tia@linaro.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 30 Aug 2024 14:03:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6030

On Thu, Aug 29, 2024 at 10:32:00AM -0600, Javier Tia wrote:
> Without UEFI keys, signing will fail and the OS will not boot.

I think this can be squashed with the previous commit.

Thanks,
Jon

> 
> Signed-off-by: Javier Tia <javier.tia@linaro.org>
> ---
>  meta-arm/classes/uefi-sb-keys.bbclass | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 meta-arm/classes/uefi-sb-keys.bbclass
> 
> diff --git a/meta-arm/classes/uefi-sb-keys.bbclass b/meta-arm/classes/uefi-sb-keys.bbclass
> new file mode 100644
> index 00000000..e800b4c6
> --- /dev/null
> +++ b/meta-arm/classes/uefi-sb-keys.bbclass
> @@ -0,0 +1,24 @@
> +# Validate UEFI keys
> +python __anonymous () {
> +    if d.getVar("UEFI_SB_KEYS_DIR", False) is None:
> +        raise bb.parse.SkipRecipe("UEFI_SB_KEYS_DIR is not set.")
> +
> +    # keys used for UEFI secure boot
> +    uefi_sb_keys = d.getVar("UEFI_SB_KEYS_DIR")
> +
> +    keys_to_check = [
> +        uefi_sb_keys + "/PK.esl",
> +        uefi_sb_keys + "/KEK.esl",
> +        uefi_sb_keys + "/dbx.esl",
> +        uefi_sb_keys + "/db.esl",
> +        uefi_sb_keys + "/db.key",
> +        uefi_sb_keys + "/db.crt",
> +    ]
> +
> +    missing_keys = [f for f in keys_to_check if not os.path.exists(f)]
> +
> +    if missing_keys:
> +        raise bb.parse.SkipRecipe("Required missing keys: %s" % (", ".join(missing_keys), )
> +            + ".\nRun %s/gen_uefi_keys.sh to generate missing keys." % uefi_sb_keys)
> +
> +}
> -- 
> 2.46.0
> 
> 

