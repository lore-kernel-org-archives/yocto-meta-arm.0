Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web08.1305.1627968354395568282
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 02 Aug 2021 22:25:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=q/X63p2n;
 spf=pass (domain: linaro.org, ip: 209.85.167.43, mailfrom: sumit.garg@linaro.org)
Received: by mail-lf1-f43.google.com with SMTP id h2so37769769lfu.4
        for <meta-arm@lists.yoctoproject.org>; Mon, 02 Aug 2021 22:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WwdD/vQIWM/4U0kmlAMMTo5/7rcjlxPH/ourAF8GriE=;
        b=q/X63p2nhKO2VHDlSw9ZlBMikAwsKydwa389cEpxiD2UH1MK/meDF2ZdED+RJr6ce5
         Y+WqNbAUADLpTkgbK1eRfdBJdXvqau1weSOHsDBKhg7/sxt0GhJUeETYebiaB/Z3Obd2
         QdU2e3dBXcBzU7K2Zzly7goZbCCN0JOcjUDnEHUJu46EdVKoRWgpHB9hnt3Mz7pdNuC1
         /FnaobcWcWsTmKvjVl7glUeEFLDT108mve5MpwqALRF2OMjq6M8johnFw1lwy8wcuscW
         Ehbu3zpBOiGkbk8EdGtVvA6QB5eJp32auv/I5VHqb9hdiwO6Nc+BpYvtGKngKxioSWP9
         0T/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WwdD/vQIWM/4U0kmlAMMTo5/7rcjlxPH/ourAF8GriE=;
        b=fbwiNBJS7ENFjmgbD0AOBumeIhp7GrxEVnQD6lybSrylRuoymkP+oDQzc4Kc6EqNOB
         7568465i7D9eGag1mOVV5nciE3rreMWShvPLwwm3M6x/aCo4N+WADLn63NftReYpyymW
         AU8AnSD4kaxzBR0r8JURZuBxL64W1h7YxUQUE3iiBq9+kif7x3FAsOO3M6xsnkEVXKRL
         80kM1GT4y6kXLC5kXQUFX94A5ntDllirxYuLTjZo0LBBkN57bIGHP9Ycy9if0VMw3VXr
         t2MpmP+monokd/AdujA9ka3N100lqm3+lQ3udMH8TvQKMOG6tnw4cHFlbIDHZ8BVXLZP
         LseA==
X-Gm-Message-State: AOAM530XsrcREWZndS7VM88lEvd1KAIbMt8fRSEF53rt1UB7HtRU+2GR
	oP9d6QOcR1xK6pQhuK5z1WXOvFglLzGDY2mujFGr1w==
X-Google-Smtp-Source: ABdhPJwjwwO2QleLGltgv8h6pJkhH7HV75s4a97JBc5tx+073u/GC2oGkNW8VYP99/iJQmCtfGhCWn/a1eCwVwJcJLU=
X-Received: by 2002:a05:6512:c06:: with SMTP id z6mr8627372lfu.194.1627968352176;
 Mon, 02 Aug 2021 22:25:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210802163550.4391-1-raj.khem@gmail.com>
In-Reply-To: <20210802163550.4391-1-raj.khem@gmail.com>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Tue, 3 Aug 2021 10:55:41 +0530
Message-ID: <CAFA6WYODdz23qfQVWFNb5NFb5EmNv4s_fv4sf9jcGsxOHPWe3Q@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] meta-arm-toolchain: Convert to new override syntax
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Hi Khem,

On Mon, 2 Aug 2021 at 22:05, Khem Raj <raj.khem@gmail.com> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-arm-toolchain/conf/layer.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/layer.conf
> index 04486d4..41305ee 100644
> --- a/meta-arm-toolchain/conf/layer.conf
> +++ b/meta-arm-toolchain/conf/layer.conf
> @@ -18,4 +18,4 @@ LAYERSERIES_COMPAT_arm-toolchain = "hardknott"
>  BB_DANGLINGAPPENDS_WARNONLY = "true"
>
>  # These variables are used for armcompiler license
> -BB_HASHBASE_WHITELIST_append = " ARM_TOOL_VARIANT ARMLMD_LICENSE_FILE LM_LICENSE_FILE"
> +BB_HASHBASE_WHITELIST:append = " ARM_TOOL_VARIANT ARMLMD_LICENSE_FILE LM_LICENSE_FILE"

This only looks like change for one instance of override and there are
many other instances in meta-arm-toolchain. I think the new override
syntax brings more clarity. So I would suggest converting all other
instances of overrides to new syntax as well.

-Sumit

> --
> 2.32.0
>
>
> 
>
