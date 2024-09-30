Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24336CE8349
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 14:01:02 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.55553.1727704859037060710
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 30 Sep 2024 07:00:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=xbpHPwyr;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7a9a23fc16fso450635885a.2
        for <meta-arm@lists.yoctoproject.org>; Mon, 30 Sep 2024 07:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1727704858; x=1728309658; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AQDMKBadMGiHdyZgezUtqEHMSP4DajEwyQr60SXlCkk=;
        b=xbpHPwyrNbmubyWMeTskJybKyIzsw8DpFdSZSglsg3s7+iaiB9PCb2dBSqIMQpcyDk
         CEpMpjakI3mvKbvljlHY2lMmVbUUIGs61GFcVtB8MGCPlwSJyDFlcX9nwBSKe7uUzOSS
         q/MWjvK+HezypPGIXV4fIUiS1f4/tZhPfyq4bvQUyQi5Psg0w+/Fxy+mmy8Atjc46R/+
         Ra690+qpVEhjneikd3LME3+FA/fUIrjiPaCVaqEp8ZjApSikI2Xakw10XRZYsrn0NDhs
         G73BAkJjpQwuAie+BpoLDbCjiPOIp/+X2fv+FFJf3OQU4/cCccKSIiAEaMOFDnWskFdr
         4kng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727704858; x=1728309658;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AQDMKBadMGiHdyZgezUtqEHMSP4DajEwyQr60SXlCkk=;
        b=upKbmreckTQrKfGE0gSQfsb9s+Uv0qbcjyFWUVBtSznmcHhEhetMeoUrgfc2pyRHit
         2Xw1uSSnZNk2whetUsmj0+ixqtkVddHdvL+Bf/kDvs4cG75ZURSdwcpA9kcHAtQKrZPM
         f60a7qlUFUSyjVL/Fw1+d9ZNPFQxiq0cbssZWu/rt18VLpCPmntuRbhfg/9p20xIp8Hi
         OcEFcQ1f6o4umTZu9X1jdp7DTZVb3AUI40Kc5ZgNsAdouKp2DoryVWV4J3BBohCbNnUU
         4jgCwcmedAVCMC0LzRifXBAzLjhko1MEGukit5qwlBJAEGn3RorbyE8qYOMYCgNOu90O
         C1zQ==
X-Gm-Message-State: AOJu0Ywu2c67bjDZVebraQpwAP9evpD8oX9ZbUtfnoWmKlESmqZt9fBI
	jVg88wsAeolA8HeUuWv4Qp/thb9t51BzVEtL/6YEukaoEgNmfP+cXzjCklVUAw==
X-Google-Smtp-Source: AGHT+IEMls+wvuDi48/umbeOKvzKngoluKXqC/H5rsNVzRwkcGpWLDjmp6B36EoQkuZhhCVRgLfLlA==
X-Received: by 2002:a05:620a:2956:b0:7a9:c146:a9e9 with SMTP id af79cd13be357-7ae3783b6d1mr2169407985a.15.1727704856216;
        Mon, 30 Sep 2024 07:00:56 -0700 (PDT)
Received: from kudzu.us ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ae377bc898sm419019885a.8.2024.09.30.07.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 07:00:55 -0700 (PDT)
Date: Mon, 30 Sep 2024 10:00:54 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Adrian DC <radian.dc@gmail.com>
Cc: meta-arm@lists.yoctoproject.org, Javier Tia <javier.tia@linaro.org>,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] trusted-firmware-a: fix build error when using ccache
Message-ID: <ZvqvFhYoRXQ9RQ4H@kudzu.us>
References: <20240928155436.1145975-1-radian.dc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240928155436.1145975-1-radian.dc@gmail.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 30 Sep 2024 14:01:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6139

On Sat, Sep 28, 2024 at 05:54:36PM +0200, Adrian DC wrote:
> From: Javier Tia <javier.tia@linaro.org>
> 
> When ccache is enabled trusted-firmware-a recipe fails with this
> error message:
> 
>     make: *** No rule to make target 'aarch64-poky-linux-gcc'. Stop.
> 
> ccache prefix CC variable with 'ccache' word before compiler. Because
> there are no quotes assigned to CC, only 'ccache' is assigned. The
> compiler becomes a make target, producing the build error.
> 
> Add single quotes to LD is a good measure to prevent this kind of error.
> 
> Signed-off-by: Javier Tia <javier.tia@linaro.org>
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> Signed-off-by: Adrian DC <radian.dc@gmail.com>

I have questions about this patch's origins, given the above s-o-b's.
Signed-off-by's state an authorship or handling (see Developer’s
Certificate of Origin).  Since I have not seen this patch, I should
not be listed.  It's on me to add my s-o-b.  Also, the ordering tends
to matter, as each person handling the patch adds their s-o-b at the
end of the patch.  So, you should be second, since you are taking this
from Javier and submitting it for him (nd I would be last since
I'mtaking it from you).

Also, this feels like it needs a "Fixes:" line.  So, I know how far to
pull this back in the stable branches.

Finally, I find it weird that Javier isn't submitting this himself.
Javier appears to be the author, and it includes his Linaro emaila
ddress, and you are sending it from a gmail account.  Are you
co-authors?  Are you sending it with his approval because he is
busy/vacationing/ill?

Overall the patch is fine and I would normally include it, but this is
weird to me.  If Javier acks it to confirm his authoer, then I'll move
my s-o-b to the end and include it.

Thanks,
Jon


> ---
>  .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc     | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> index 2e3b50c5..5d3da59b 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> @@ -101,9 +101,9 @@ def remove_options_tail (in_string):
>      from itertools import takewhile
>      return ' '.join(takewhile(lambda x: not x.startswith('-'), in_string.split(' ')))
>  
> -EXTRA_OEMAKE += "LD=${@remove_options_tail(d.getVar('LD'))}"
> +EXTRA_OEMAKE += "LD='${@remove_options_tail(d.getVar('LD'))}'"
>  
> -EXTRA_OEMAKE += "CC=${@remove_options_tail(d.getVar('CC'))}"
> +EXTRA_OEMAKE += "CC='${@remove_options_tail(d.getVar('CC'))}'"
>  
>  # Verbose builds, no -Werror
>  EXTRA_OEMAKE += "V=1 E=0"
> -- 
> 2.43.0
> 
> 

